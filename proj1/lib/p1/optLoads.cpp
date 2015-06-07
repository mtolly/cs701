//===--------------- optLoads.cpp - Project 1 for CS 701 ---------------===//
//                               Michael Tolly
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file is a skeleton of an implementation for the printCode
// pass of Univ. Wisconsin-Madison's CS 701 Project 1.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "optLoads"
#include "llvm/Pass.h"
#include "llvm/Module.h"
#include "llvm/Function.h"
#include "llvm/BasicBlock.h"
#include "llvm/Instruction.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Statistic.h"
#include <iostream>
#include <vector>
#include <map>
#include <list>
using namespace llvm;

namespace {
  class optLoads : public FunctionPass {
    public:
    static char ID; // Pass identification, replacement for typeid
    optLoads() : FunctionPass(ID) {}
    
    //**********************************************************************
    // runOnFunction
    //**********************************************************************
    virtual bool runOnFunction(Function &F) {
      static int inst_number = 1;
      std::map<Instruction*, int> inst_map;
      Function::iterator fit;
      BasicBlock::iterator bbit;
      
      // First, iterate to assign numbers to each Instruction
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          for (bbit = bb->begin(); bbit != bb->end(); bbit++)
          {
              Instruction *inst = &*bbit;
              inst_map.insert(std::pair<Instruction*, int>(inst, inst_number));
              inst_number++;
          }
      }
      
      // Then, iterate to find stores immediately followed by loads
      Instruction *this_inst, *prev_inst;
      std::list<Instruction*> useless;
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          for (bbit = bb->begin(); bbit != bb->end(); bbit++)
          {
              prev_inst = this_inst;
              this_inst = &*bbit;
              
              User::op_iterator opit;
              Use *stored, *store_to, *load_from;
              // if prev is a store and this is a load,
              if (prev_inst->getOpcode() == 28 && this_inst->getOpcode() == 27)
              {
                  opit = prev_inst->op_begin();
                  stored = &*opit; // first operand of store
                  opit++;
                  store_to = &*opit; // second operand of store
                  opit = this_inst->op_begin();
                  load_from = &*opit; // only operand of load
                  
                  if (store_to->get() == load_from->get())
                  {
                      std::cerr << "%" << inst_map[this_inst] << " is a useless load\n";
                      useless.push_back(this_inst);
                      this_inst->replaceAllUsesWith(stored->get());
                  }
              }
          }
      }
      
      std::list<Instruction*>::iterator lit;
      for (lit = useless.begin(); lit != useless.end(); lit++)
      {
          (*lit)->eraseFromParent();
      }

      return !(useless.empty()); // we modified the function if there are any useless loads
    }

    //**********************************************************************
    // print (do not change this method)
    //
    // If this pass is run with -f -analyze, this method will be called
    // after each call to runOnFunction.
    //**********************************************************************
    virtual void print(std::ostream &O, const Module *M) const {
        O << "This is optLoads.\n";
    }

    //**********************************************************************
    // getAnalysisUsage
    //**********************************************************************

    // We don't modify the program, so we preserve all analyses
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      // AU.setPreservesAll();
    };

  };
  char optLoads::ID = 0;

  // register the optLoads class: 
  //  - give it a command-line argument (optLoads)
  //  - a name ("optimize unnecessary loads")
  //  - a flag saying that we do modify the CFG
  //  - a flag saying this is not an analysis pass
  RegisterPass<optLoads> X("optLoads", "optimize unnecessary loads",
			   false, false);
}
