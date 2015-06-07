//===----------------- loopInv.cpp - Project 3 for CS 701 -----------------===//
//                               Michael Tolly
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "loopInv"
#include "llvm/Pass.h"
#include "llvm/Module.h"
#include "llvm/Function.h"
#include "llvm/BasicBlock.h"
#include "llvm/Instruction.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Support/CFG.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <iostream>
#include <vector>
#include <list>
#include <map>
#include <set>

#include "flags.h"
#ifdef PRINTDOM
  static const bool PRINT_DOM = true;
#else
  static const bool PRINT_DOM = false;
#endif
#ifdef PRINTMERGE
  static const bool PRINT_MERGE = true;
#else
  static const bool PRINT_MERGE = false;
#endif
#ifdef PRINTLOOPS
  static const bool PRINT_LOOPS = true;
#else
  static const bool PRINT_LOOPS = false;
#endif
#ifdef PRINTPRE
  static const bool PRINT_PRE = true;
#else
  static const bool PRINT_PRE = false;
#endif
#ifdef PRINTMOVING
  static const bool PRINT_MOVING = true;
#else
  static const bool PRINT_MOVING = false;
#endif

using namespace llvm;

typedef std::set<BasicBlock*> BBSet;

STATISTIC(MovedInstructions, "Number of loop-invariant instructions moved");

namespace
{
  struct NaturalLoop
  {
    BasicBlock *header;
    BBSet *body;
  };
  
  std::map<BasicBlock*, int> *global_bb_map;
  std::map<Instruction*, int> *global_inst_map;
  
  bool compareLoops(NaturalLoop x, NaturalLoop y)
  {
    int xsize = x.body->size();
    int ysize = y.body->size();
    if (xsize != ysize)
      return xsize > ysize;
    else
      return (*global_bb_map)[x.header] < (*global_bb_map)[y.header];
  }

  class loopInv : public FunctionPass
  {
    public:
    static char ID; // Pass identification, replacement for typeid
    loopInv() : FunctionPass(ID) {}
    
    //**********************************************************************
    // runOnFunction
    //**********************************************************************
    virtual bool runOnFunction(Function &F)
    {
      // print fn name
      if (PRINT_DOM || PRINT_LOOPS)
      {
        std::cerr << "FUNCTION " << F.getName().str() << "\n";
      }
    
      // STEP 1: BASIC BLOCK AND INSTRUCTION MAPS
      
      static int bb_number = 1;
      static int inst_number = 1;
      std::map<BasicBlock*, int> bb_map;
      std::map<Instruction*, int> inst_map;
      
      // iterate to assign numbers to each BasicBlock and Instruction
      for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
      {
        BasicBlock *bb = &*fit;
        bb_map[bb] = bb_number;
        bb_number++;
      
        for (BasicBlock::iterator bbit = bb->begin(); bbit != bb->end(); bbit++)
        {
          Instruction *inst = &*bbit;
          inst_map[inst] = inst_number;
          inst_number++;
        }
      }
      
      global_bb_map = &bb_map;
      global_inst_map = &inst_map;
      
      // STEP 2: DOMINATORS ANALYSIS
      
      // A key is dominated by each node in its value-set.
      std::map<BasicBlock*, BBSet*> domBefore, domAfter;
      
      // Initialize each n.before to empty, and each n.after to a set of all the blocks.
      BBSet allBlocks;
      for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
      {
        BasicBlock *bb = &*fit;
        allBlocks.insert(bb);
      }
      for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
      {
        BasicBlock *bb = &*fit;
        domBefore[bb] = new BBSet();
        BBSet *after = new BBSet();
        *after = allBlocks;
        domAfter[bb] = after;
      }
      
      // Initialize the worklist with the entry block
      BBSet worklist;
      worklist.insert(&*(F.begin()));
      
      // Iterative algorithm go!
      while (!(worklist.empty()))
      {
        // remove node n from worklist
        BasicBlock *n = *(worklist.begin());
        worklist.erase(n);
        // By removing n from allBlocks we mark it as visited.
        allBlocks.erase(n);
        
        // combine all predecessor's afters into n.before
        BBSet *nBefore = new BBSet();
        bool firstPred = true;
        for (pred_iterator it = pred_begin(n); it != pred_end(n); it++)
        {
          BBSet *predAfter = domAfter[*it];
          if (firstPred)
          {
            *nBefore = *predAfter;
          }
          else
          {
            // n.before = n.before `intersect` pred.after
            BBSet *temp = bbSetIntersect(nBefore, predAfter);
            *nBefore = *temp;
            delete temp;
          }
          firstPred = false;
        }
        BBSet *nBeforeOld = domBefore[n];
        domBefore[n] = nBefore;
        delete nBeforeOld;
        
        // add n to n.before to get n.after
        BBSet *nAfter = new BBSet();
        *nAfter = *nBefore;
        nAfter->insert(n);
        
        // if n.after has changed, put n's successors onto worklist
        BBSet *nAfterOld = domAfter[n];
        if (*nAfter != *nAfterOld)
        {
          domAfter[n] = nAfter;
          delete nAfterOld;
          for (succ_iterator it = succ_begin(n); it != succ_end(n); it++)
          {
            worklist.insert(*it);
          }
        }
        else
        {
          delete nAfter;
        }
      }
      
      // allBlocks should now only contain the blocks which aren't reachable,
      // so replace each n.after with empty set.
      for (BBSet::iterator it = allBlocks.begin(); it != allBlocks.end(); it++)
      {
        BasicBlock *bb = *it;
        BBSet *bbAfterOld = domAfter[bb];
        domAfter[bb] = new BBSet();
        delete bbAfterOld;
      }
      
      // Print diagnostics if requested.
      if (PRINT_DOM)
      {
        for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
        {
          BasicBlock *bb = &*fit;
          std::cerr << "BASIC BLOCK " << bb_map[bb];
          
          std::cerr << "  DOM-Before: { ";
          BBSet *bef = domBefore[bb];
          for (BBSet::iterator it = bef->begin(); it != bef->end(); it++)
          {
            std::cerr << bb_map[*it] << " ";
          }
          
          std::cerr << "}  DOM-After: { ";
          BBSet *aft = domAfter[bb];
          for (BBSet::iterator it = aft->begin(); it != aft->end(); it++)
          {
            std::cerr << bb_map[*it] << " ";
          }
          
          std::cerr << "}\n";
        }
      }
      
      // STEP 3: DEPTH FIRST SEARCH TO FIND BACKEDGES
      
      std::map<BasicBlock*, BBSet*> backedges;
      for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
      {
        BasicBlock *bb = &*fit;
        backedges[bb] = new BBSet();
      }
      // in markings:
      // - no mapping means unmarked
      // - false mapping means in progress
      // - true mapping means done
      std::map<BasicBlock*, bool> markings;
      dfs(&*(F.begin()), backedges, markings);
      
      // STEP 4: FIND NATURAL LOOPS
      
      std::list<NaturalLoop> loops;
      for ( std::map<BasicBlock*, BBSet*>::iterator it = backedges.begin()
          ; it != backedges.end(); it++ )
      {
        BasicBlock *fromBlock = it->first;
        BBSet *toAll = it->second;
        for (BBSet::iterator it2 = toAll->begin(); it2 != toAll->end(); it2++)
        {
          BasicBlock *toBlock = *it2;
          // Make sure that toBlock dominates fromBlock.
          BBSet *domFrom = domAfter[fromBlock];
          if (domFrom->find(toBlock) != domFrom->end())
          {
            NaturalLoop loop = findLoop(fromBlock, toBlock);
            loops.push_back(loop);
          }
        }
      }
      
      // STEP 5: COMBINE LOOPS WITH SAME HEADER
      
      combineLoops(loops, bb_map);
      
      // STEP 6: SORT BY SIZE, THEN HEADER BLOCK NUMBER
      
      loops.sort(compareLoops);
      
      if (PRINT_LOOPS)
      {
        std::cerr << "LOOPS\n";
        for (std::list<NaturalLoop>::iterator it = loops.begin(); it != loops.end(); it++)
        {
          NaturalLoop loop = *it;
          std::cerr << "Head: " << bb_map[loop.header] << " Body: { ";
          BBSet *body = loop.body;
          // Put the body block numbers into a list, sort them before printing.
          std::list<int> bodyNums;
          for (BBSet::iterator bit = body->begin(); bit != body->end(); bit++)
          {
            bodyNums.push_back(bb_map[*bit]);
          }
          bodyNums.sort();
          for (std::list<int>::iterator lit = bodyNums.begin(); lit != bodyNums.end(); lit++)
          {
            std::cerr << *lit << " ";
          }
          std::cerr << "}\n";
        }
      }
      
      // STEP 7: MOVE LOOP-INVARIANT INSTRUCTIONS OUT OF LOOPS
      
      bool changed = false;
      for (std::list<NaturalLoop>::iterator it = loops.begin(); it != loops.end(); it++)
      {
        NaturalLoop loop = *it;
        if (checkBlock(loop.header, loop))
          changed = true;
        for (BBSet::iterator bit = loop.body->begin(); bit != loop.body->end(); bit++)
        {
          if (checkBlock(*bit, loop))
            changed = true;
        }
      }
      
      if (PRINT_DOM || PRINT_LOOPS)
      {
        std::cerr << "\n";
      }
      
      // Finally, cleanup.
      for (Function::iterator fit = F.begin(); fit != F.end(); fit++)
      {
        BasicBlock *bb = &*fit;
        delete domBefore[bb];
        delete domAfter[bb];
        if (backedges.find(bb) != backedges.end())
          delete backedges[bb];
      }
      for (std::list<NaturalLoop>::iterator it = loops.begin(); it != loops.end(); it++)
      {
        delete (*it).body;
      }
      
      return changed;
    }
    
    // Check for any loop-invariant instructions in the block,
    // and move them to the loop's preheader.
    virtual bool checkBlock(BasicBlock *bb, NaturalLoop loop)
    {
      std::list<Instruction*> moving;
      for (BasicBlock::iterator bbit = bb->begin(); bbit != bb->end(); bbit++)
      {
        Instruction *inst = &*bbit;
        if (safeToMove(inst, loop))
        {
          moving.push_back(inst);
        }
      }
      if (!(moving.empty()))
      {
        BasicBlock *preheader = getPreheader(loop.header);
        for (std::list<Instruction*>::iterator it = moving.begin(); it != moving.end(); it++)
        {
          Instruction *inst = *it;
          inst->removeFromParent();
          preheader->getInstList().insert(preheader->getTerminator(), inst);
          if (PRINT_MOVING)
          {
            std::cerr << "moving instruction %" << (*global_inst_map)[inst] << "\n";
          }
          MovedInstructions++;
        }
      }
      return !(moving.empty());
    }
    
    // If the block has a single predecessor, returns that predecessor.
    // Otherwise, makes a new preheader block and returns it.
    virtual BasicBlock *getPreheader(BasicBlock *bb)
    {
      int n = 0;
      for (pred_iterator it = pred_begin(bb); it != pred_end(bb); it++)
      {
        n += 1;
        if (n > 1) break;
      }
      if (n == 1)
        return *(pred_begin(bb));
      else
        return makePreheader(bb);
    }
    
    // Make a new preheader block.
    virtual BasicBlock *makePreheader(BasicBlock *bb)
    {
      if (PRINT_PRE)
      {
        std::cerr << "adding preheader for loop with header " << (*global_bb_map)[bb] << "\n";
      }
      // Make a vector of all the block's predecessors
      std::vector<BasicBlock*> preds;
      for (pred_iterator it = pred_begin(bb); it != pred_end(bb); it++)
      {
        preds.push_back(*it);
      }
      return SplitBlockPredecessors(bb, ArrayRef<BasicBlock*>(preds), "_pre", this);
    }
    
    virtual bool safeToMove(Instruction *inst, NaturalLoop loop)
    {
      //std::cerr << "Instruction " << (*global_inst_map)[inst] << " has opcode "
      //  << inst->getOpcode() << "\n";
      // First, check that all operands are literals, or defined outside the loop.
      User::op_iterator opit;
      for (opit = inst->op_begin(); opit != inst->op_end(); opit++)
      {
        Use *u = &*opit;
        Value *v = u->get();
        if (isa<Instruction>(u))
        {
          // return false if op's instruction is inside the loop header or body
          Instruction *opinst = (Instruction*) v;
          BasicBlock *opparent = opinst->getParent();
          if (opparent == loop.header) // instruction in loop header, not ok
            return false;
          for (BBSet::iterator it = loop.body->begin(); it != loop.body->end(); it++)
          {
            if (opparent == *it) // instruction in loop body, not ok
              return false;
          }
          // instruction outside of the loop, ok
        }
        else if (isa<Constant>(u)) ; // ok
        else if (isa<Argument>(u)) ; // ok
        else
        {
          return false; // not an instruction or literal
        }
      }
      
      // Then make sure the operation is of a type that is ok to move.
      unsigned opcode = inst->getOpcode();
      if (inst->isTerminator()) return false; // block terminator
      if (26 <= opcode && opcode <= 32) return false; // memory operation
      if (14 <= opcode && opcode <= 19) return false; // div or remainder
      if (opcode == 5 || opcode == 48) return false; // call or invoke
      if (opcode == 47) return false; // phi
      return true;
    }
    
    // Looks through the loop list, to find and merge duplicate loops
    virtual void combineLoops
      ( std::list<NaturalLoop> &loops
      , std::map<BasicBlock*, int> &bb_map )
    {
      for ( std::list<NaturalLoop>::iterator start = loops.begin()
          ; start != loops.end(); start++ )
      {
        BasicBlock *header = start->header;
        std::list< std::list<NaturalLoop>::iterator > dupes;
        
        std::list<NaturalLoop>::iterator start1 = start;
        start1++;
        for ( std::list<NaturalLoop>::iterator it = start1; it != loops.end(); it++ )
        {
          if (it->header == header)
            dupes.push_back(it);
        }
        
        int len = dupes.size();
        if (len != 0)
        {
          // Print diagnostics, if requested
          if (PRINT_MERGE)
          {
            std::cerr << "merging " << (len + 1) << " loops with header " <<
              bb_map[header] << "\n";
          }
          for ( std::list< std::list<NaturalLoop>::iterator >::iterator it = dupes.begin()
              ; it != dupes.end(); it++ )
          {
            mergeLoops(*start, **it);
            loops.erase(*it);
          }
        }
      }
    }
    
    // Merges the second loop into the first one. Modifies x's body set,
    // and frees y's body set.
    virtual void mergeLoops(NaturalLoop x, NaturalLoop y)
    {
      for (BBSet::iterator it = y.body->begin(); it != y.body->end(); it++)
      {
        x.body->insert(*it);
      }
      delete y.body;
    }
    
    // Backedge goes from fromBlock to toBlock, so toBlock is the loop header.
    virtual NaturalLoop findLoop(BasicBlock *fromBlock, BasicBlock *toBlock)
    {
      NaturalLoop loop;
      loop.header = toBlock;
      loop.body = new BBSet();
      loop.body->insert(toBlock);
      findLoopBody(fromBlock, loop.body);
      loop.body->erase(toBlock); // the header shouldn't actually be in the body
      return loop;
    }
    
    // Backwards DFS, adding all nodes found to the body
    virtual void findLoopBody(BasicBlock *node, BBSet *body)
    {
      body->insert(node);
      for (pred_iterator it = pred_begin(node); it != pred_end(node); it++)
      {
        BasicBlock *pred = *it;
        if (body->find(pred) == body->end()) // pred is unmarked
        {
          findLoopBody(pred, body);
        }
        // else, pred is already marked, do nothing
      }
    }
    
    virtual void dfs( BasicBlock *node
                    , std::map<BasicBlock*, BBSet*> &backedges
                    , std::map<BasicBlock*, bool> &markings )
    {
      markings[node] = false; // node is in progress
      for (succ_iterator it = succ_begin(node); it != succ_end(node); it++)
      {
        BasicBlock *succ = *it;
        if (markings.find(succ) == markings.end()) // succ is unmarked
        {
          dfs(succ, backedges, markings);
        }
        else if (!(markings[succ])) // succ is in progress
        {
          backedges[node]->insert(succ);
        }
        // else, succ is done, do nothing.
      }
      markings[node] = true; // node is done
    }
    
    // Returns a new set which is the intersection of two sets.
    virtual BBSet *bbSetIntersect(BBSet *x, BBSet *y)
    {
      BBSet *result = new BBSet();
      for (BBSet::iterator it = x->begin(); it != x->end(); it++)
      {
        BasicBlock *val = *it;
        if (y->find(val) != y->end())
        {
          result->insert(val);
        }
      }
      return result;
    }

    //**********************************************************************
    // print (do not change this method)
    //
    // If this pass is run with -f -analyze, this method will be called
    // after each call to runOnFunction.
    //**********************************************************************
    virtual void print(std::ostream &O, const Module *M) const
    {
      O << "This is loopInv.\n";
    }

    //**********************************************************************
    // getAnalysisUsage
    //**********************************************************************

    // We don't modify the program, so we preserve all analyses
    virtual void getAnalysisUsage(AnalysisUsage &AU) const
    {
      AU.setPreservesAll();
    }
  };
  char loopInv::ID = 0;

  // register the loopInv class:
  //  - give it a command-line argument
  //  - a name
  //  - a flag: true if we don't modify the CFG
  //  - a flag: true if this is an analysis pass
  RegisterPass<loopInv> X("loopInv", "loop-invariant code",
    false, false);
}
