//===--------------- printCode.cpp - Project 1 for CS 701 ---------------===//
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

#define DEBUG_TYPE "printCode"
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
using namespace llvm;

namespace {
  class printCode : public FunctionPass {
    public:
    static char ID; // Pass identification, replacement for typeid
    printCode() : FunctionPass(ID) {}
    
    //**********************************************************************
    // runOnFunction
    //**********************************************************************
    virtual bool runOnFunction(Function &F) {
      // print fn name
      std::cerr << "FUNCTION " << F.getName().str() << "\n";
      
      static int bb_number = 1;
      static int inst_number = 1;
      std::map<BasicBlock*, int> bb_map;
      std::map<Instruction*, int> inst_map;
      Function::iterator fit;
      BasicBlock::iterator bbit;
      
      // First, iterate to assign numbers to each BasicBlock and Instruction
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          bb_map.insert(std::pair<BasicBlock*, int>(bb, bb_number));
          bb_number++;
        
          for (bbit = bb->begin(); bbit != bb->end(); bbit++)
          {
              Instruction *inst = &*bbit;
              inst_map.insert(std::pair<Instruction*, int>(inst, inst_number));
              inst_number++;
          }
      }
      
      // Then, iterate to print out each BB/Inst with its number
      for (fit = F.begin(); fit != F.end(); fit++)
      {
          BasicBlock *bb = &*fit;
          std::cerr << "\n" << "BASIC BLOCK " << bb_map[bb] << "\n";
          
          for (bbit = bb->begin(); bbit != bb->end(); bbit++)
          {
              Instruction *inst = &*bbit;
              int num = inst_map[inst];
              const char *opcodeName = inst->getOpcodeName();
              
              std::cerr << "%" << num << ": "  << opcodeName;
              
              User::op_iterator opit;
              for (opit = inst->op_begin(); opit != inst->op_end(); opit++)
              {
                  Use *u = &*opit;
                  Value *v = u->get();
                  if (isa<Instruction>(u))
                      std::cerr << " %" << inst_map[(Instruction*) v];
                  else if (v->hasName())
                      std::cerr << " " << v->getName().str();
                  else
                      std::cerr << " XXX";
              }
              
              std::cerr << "\n";
          }
      }
      std::cerr << "\n";

      return false;  // because we have NOT changed this function
    }

    //**********************************************************************
    // print (do not change this method)
    //
    // If this pass is run with -f -analyze, this method will be called
    // after each call to runOnFunction.
    //**********************************************************************
    virtual void print(std::ostream &O, const Module *M) const {
        O << "This is printCode.\n";
    }

    //**********************************************************************
    // getAnalysisUsage
    //**********************************************************************

    // We don't modify the program, so we preserve all analyses
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      AU.setPreservesAll();
    };

  };
  char printCode::ID = 0;

  // register the printCode class: 
  //  - give it a command-line argument (printCode)
  //  - a name ("print code")
  //  - a flag saying that we don't modify the CFG
  //  - a flag saying this is not an analysis pass
  RegisterPass<printCode> X("printCode", "print code",
			   true, false);
}
