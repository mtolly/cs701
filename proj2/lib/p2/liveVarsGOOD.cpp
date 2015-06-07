//===--------------- liveVars.cpp - Project 1 for CS 701 ---------------===//
//                               Michael Tolly
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file is a skeleton of an implementation for the liveVars
// pass of Univ. Wisconsin-Madison's CS 701 Project 2.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "liveVars"
#include "llvm/Pass.h"
#include "llvm/Module.h"
#include "llvm/Function.h"
#include "llvm/BasicBlock.h"
#include "llvm/Instruction.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/CFG.h"
#include <iostream>
#include <vector>
#include <map>
#include <set>
using namespace llvm;

typedef std::set<Instruction*>* InstSet;

namespace {
  class liveVars : public FunctionPass {
    public:
    static char ID; // Pass identification, replacement for typeid
    liveVars() : FunctionPass(ID) {}
    
    //**********************************************************************
    // runOnFunction
    //**********************************************************************
    virtual bool runOnFunction(Function &F) {
      std::set<BasicBlock*> bb_work;
      std::map<BasicBlock*, InstSet> bb_liveBefore;
      std::map<BasicBlock*, InstSet> bb_liveAfter;
      std::map<Instruction*, InstSet> inst_liveBefore;
      std::map<Instruction*, InstSet> inst_liveAfter;
      Function::iterator fit;
      BasicBlock::iterator bbit;

      // Iterate through BBs. Add them to the worklist,
      // and initialize each one with empty before/after sets.
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          bb_work.insert(bb);
          InstSet liveBefore = new std::set<Instruction*>();
          bb_liveBefore.insert(std::pair<BasicBlock*, InstSet>(bb, liveBefore));
          InstSet liveAfter = new std::set<Instruction*>();
          bb_liveAfter.insert(std::pair<BasicBlock*, InstSet>(bb, liveAfter));
      }

      // Next, iterate through the worklist. Continually "pop" an element
      // off the front of the set.
      while (!( bb_work.empty() ))
      {
          BasicBlock *bb = *( bb_work.begin() );
          bb_work.erase(bb);

          InstSet gen = genSet(bb);
          InstSet kill = killSet(bb);

          // compute new liveAfter by MEET of all successor's liveBefores
          InstSet liveAfter = bbLiveAfter(bb, bb_liveBefore);
          delete bb_liveAfter[bb];
          bb_liveAfter[bb] = liveAfter;
          
          // compute new liveBefore by applying GEN and KILL to liveAfter
          InstSet liveBefore = bb_liveBefore[bb];
          InstSet newLiveBefore = applyGenKill(liveAfter, gen, kill);
          if (&liveBefore != &newLiveBefore)
          {
              delete liveBefore;
              bb_liveBefore[bb] = newLiveBefore;
              // add bb's predecessors to the worklist
              for (pred_iterator pit = pred_begin(bb); pit != pred_end(bb); pit++) {
                  bb_work.insert(*pit);
              }
          }
          else
          {
              delete newLiveBefore;
          }

          delete gen;
          delete kill;
      }

      // Now, compute the liveBefore and liveAfter sets for each instruction.
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          bbit = bb->end();
          bool block_ender = true;
          Instruction *this_inst, *succ_inst;
          do {
              bbit--;
              succ_inst = this_inst;
              this_inst = &*bbit;
            
              inst_liveAfter[this_inst] = new std::set<Instruction*>();
              if (block_ender) {
                  block_ender = false;
                  // For the last inst in a BB, copy the liveAfter of the BB.
                  *(inst_liveAfter[this_inst]) = *(bb_liveAfter[bb]);
              }
              else {
                  // Otherwise, copy the liveBefore of the succeeding instruction.
                  *(inst_liveAfter[this_inst]) = *(inst_liveBefore[succ_inst]);
              }

              inst_liveBefore[this_inst] = instLiveBefore(this_inst, inst_liveAfter);
          } while (bbit != bb->begin());
      }

      // Finally, look for useless assignments, which:
      // 1. Assign to a pseudo register
      // 2. That pseudo register is not in the inst's liveAfter set
      InstSet useless = new std::set<Instruction*>();
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          for (bbit = bb->begin(); bbit != bb->end(); bbit++) {
              Instruction *inst = &*bbit;
              if (isAssignment(inst)) {
                  std::set<Instruction*>::iterator findInst = inst_liveAfter[inst]->find(inst);
                  if (findInst == inst_liveAfter[inst]->end())
                      useless->insert(inst);
              }
          }
      }

      // Delete the useless assignments!
      for (std::set<Instruction*>::iterator it = useless->begin(); it != useless->end(); it++) {
          (*it)->eraseFromParent();
      }

      return false;  // because we have NOT changed this function
    }

    virtual bool isAssignment(Instruction *inst) {
      unsigned opcode = inst->getOpcode();
      return ( inst->isBinaryOp()
            || inst->isCast()
            || inst->isShift()
            || opcode == 26 // Alloca
            || opcode == 27 // Load
            || opcode == 29 // GetElementPtr
            || opcode == 49 // Select
            || opcode == 53 // ExtractElement
            || opcode == 56 // ExtractValue
            || opcode == 45 // ICmp
            || opcode == 46 // FCmp
             );
    }

    // Returns a new set: the liveBefore of an instruction.
    virtual InstSet instLiveBefore(Instruction* inst, std::map<Instruction*, InstSet> &liveAfter) {
      InstSet liveBefore = new std::set<Instruction*>();
      // Start with the liveAfter of inst
      *liveBefore = *(liveAfter[inst]);
      // Remove inst itself (the KILL set)
      liveBefore->erase(inst);
      // Add the Instruction operands of inst (the GEN set)
      User::op_iterator opit;
      for (opit = inst->op_begin(); opit != inst->op_end(); opit++)
      {
          Use *use = &*opit;
          Value *used_val = use->get();
          Instruction *used_inst = dynamic_cast<Instruction*>(used_val);
          if (used_inst != NULL) {
              liveBefore->insert(used_inst);
          }
      }

      return liveBefore;
    }

    // Returns a new set: the liveAfter of a basic block.
    virtual InstSet bbLiveAfter(BasicBlock* bb, std::map<BasicBlock*, InstSet> &liveBefore) {
      InstSet liveAfter = new std::set<Instruction*>();
      for (succ_iterator sit = succ_begin(bb); sit != succ_end(bb); sit++) {
          InstSet liveBefore_bb = liveBefore[*sit];
          std::set<Instruction*>::iterator it;
          for (it = liveBefore_bb->begin(); it != liveBefore_bb->end(); it++) {
              liveAfter->insert(*it);
          }
      }
      return liveAfter;
    }

    // Returns a new set: (input - kill) + gen
    virtual InstSet applyGenKill(InstSet input, InstSet gen, InstSet kill) {
      InstSet result = new std::set<Instruction*>();
      std::set<Instruction*>::iterator it;
      for (it = input->begin(); it != input->end(); it++) {
          result->insert(*it);
      }
      for (it = kill->begin(); it != kill->end(); it++) {
          result->erase(*it);
      }
      for (it = gen->begin(); it != gen->end(); it++) {
          result->insert(*it);
      }
      return result;
    }

    // Returns a new set: the gen set of a basic block.
    virtual InstSet genSet(BasicBlock* bb) {
      InstSet gen = new std::set<Instruction*>();
      BasicBlock::iterator bbit;

      // Find uses in bb which are instructions that haven't been defined yet.
      InstSet defined = new std::set<Instruction*>();
      for (bbit = bb->begin(); bbit != bb->end(); bbit++)
      {
          Instruction *inst = &*bbit;
          User::op_iterator opit;
          for (opit = inst->op_begin(); opit != inst->op_end(); opit++)
          {
              Use *use = &*opit;
              Value *used_val = use->get();
              Instruction *used_inst = dynamic_cast<Instruction*>(used_val);
              if (used_inst != NULL) {
                  if ( defined->find(used_inst) == defined->end() ) {
                      // Instruction hasn't been defined yet
                      gen->insert(used_inst);
                  }
              }
          }
          defined->insert(inst);
      }
      delete defined;
      
      return gen;
    }

    // Returns a new set: the kill set of a basic block.
    virtual std::set<Instruction*>* killSet(BasicBlock* bb) {
      InstSet kill = new std::set<Instruction*>();
      for (BasicBlock::iterator bbit = bb->begin(); bbit != bb->end(); bbit++) {
          kill->insert(&*bbit);
      }
      return kill;
    }

    //**********************************************************************
    // print (do not change this method)
    //
    // If this pass is run with -f -analyze, this method will be called
    // after each call to runOnFunction.
    //**********************************************************************
    virtual void print(std::ostream &O, const Module *M) const {
        O << "This is liveVars.\n";
    }

    //**********************************************************************
    // getAnalysisUsage
    //**********************************************************************

    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
    };

  };
  char liveVars::ID = 0;

  // register the liveVars class: 
  //  - give it a command-line argument (liveVars)
  //  - a name
  //  - a flag saying that we do modify the CFG
  //  - a flag saying this is an analysis pass
  RegisterPass<liveVars> X("liveVars", "Live vars analysis",
			   false, true);
}
