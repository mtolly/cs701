//===-- Gcra.cpp - Graph-coloring Register Allocator --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===--------------------------------------------------------------------===//
//
// This file does Graph-coloring Register Allocation, for CS 701 Project 4.
//
//===--------------------------------------------------------------------===//

#define DEBUG_TYPE "gcra"
#include "flags.h"
#include <map>
#include "RDfact.h"
#include <stack>
#include <queue>
#include <iostream>
#include <list>
#include <utility>

#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/MachineFunctionPass.h"

using namespace llvm;

typedef map<const MachineBasicBlock *, set<unsigned>*> BBtoRegMap;
typedef map<const MachineInstr      *, set<unsigned>*> InstrToRegMap;
typedef map<const MachineBasicBlock *, set<RDfact *>*> BBtoRDfactMap;
typedef map<const MachineInstr      *, set<RDfact *>*> InstrToRDfactMap;

// the usual form of a live range
struct Range {
  unsigned reg;
  set<const MachineInstr *> *insts;
  bool hascall;
};

// a live range for printing, where instructions are in the form of numbers
struct RangePrint {
  unsigned reg;
  set<unsigned> *instnums;
};

// compare two live ranges, by first comparing register number and then
// lexicographically comparing the instruction number sets
bool rangeCompare( RangePrint &x, RangePrint &y ) {
  if (x.reg < y.reg) return true;
  if (y.reg < x.reg) return false;
  set<unsigned>::iterator xit, yit;
  for ( xit = x.instnums->begin(), yit = y.instnums->begin()
      ; xit != x.instnums->end() && yit != y.instnums->end()
      ; xit++, yit++ ) {
    if (*xit < *yit) return true;
    if (*xit > *yit) return false;
  }
  return xit == x.instnums->end();
}

bool interferenceCompare( pair<RangePrint, list<RangePrint> *> &x
                        , pair<RangePrint, list<RangePrint> *> &y ) {
  return rangeCompare(x.first, y.first);
}

namespace {
  class Gcra : public MachineFunctionPass {
  private:
    static const bool DEBUG = true;
    static const bool DEBUG_AVAIL = true;

#ifdef PRINTLIVE
    static const bool PRINT_LIVE = true;
#else
    static const bool PRINT_LIVE = false;
#endif

#ifdef PRINTRD
    static const bool PRINT_RD = true;
#else
    static const bool PRINT_RD = false;
#endif

#ifdef PRINTRANGES
    static const bool PRINT_RANGES = true;
#else
    static const bool PRINT_RANGES = false;
#endif

#ifdef PRINTGRAPH
    static const bool PRINT_GRAPH = true;
#else
    static const bool PRINT_GRAPH = false;
#endif

    // vreg -> avail pregs for that vreg
    map<unsigned, set<unsigned> *> vregToAvailPregSetMap;

    set<RDfact *> RDfactSet;
    
    map<MachineInstr *, unsigned> InstrToNumMap;
    
    BBtoRegMap liveBeforeMap;
    BBtoRegMap liveAfterMap;
    BBtoRegMap liveVarsGenMap;
    BBtoRegMap liveVarsKillMap;
    InstrToRegMap insLiveBeforeMap;
    InstrToRegMap insLiveAfterMap;
    
    BBtoRDfactMap RDbeforeMap;
    BBtoRDfactMap RDafterMap;
    BBtoRDfactMap RDgenMap;
    BBtoRDfactMap RDkillMap;
    InstrToRDfactMap insRDbeforeMap;
    InstrToRDfactMap insRDafterMap;

    MachineRegisterInfo *MRI;
    
    list<Range> physRanges;
    list<Range> virtRanges;
    
    map<Range *, set<Range *> *> interference;
    
    list<Range *> colorStack;
    map<Range *, unsigned> colors;
    
  public:
    static char ID; // Pass identification, replacement for typeid
    
    //**********************************************************************
    // constructor
    //**********************************************************************
    Gcra() : MachineFunctionPass(ID) {
    }
    
    //**********************************************************************
    // runOnMachineFunction
    //
    //**********************************************************************
    bool runOnMachineFunction(MachineFunction &Fn) {
      if (DEBUG || PRINT_LIVE || PRINT_RD) {
        cerr << "START FUNCTION " << Fn.getFunction()->getName().str() << "\n";
      }

      // INITIALIZE FOR EACH FN
      RDfactSet.clear();
      RDbeforeMap.clear();
      RDafterMap.clear();
      InstrToNumMap.clear();
      liveBeforeMap.clear();
      liveAfterMap.clear();
      liveVarsGenMap.clear();
      liveVarsKillMap.clear();
      insLiveBeforeMap.clear();
      insLiveAfterMap.clear();
      
      RDbeforeMap.clear();
      RDafterMap.clear();
      RDgenMap.clear();
      RDkillMap.clear();
      insRDbeforeMap.clear();
      insRDafterMap.clear();
      
      physRanges.clear();
      virtRanges.clear();
      
      interference.clear();
      
      colorStack.clear();
      colors.clear();
      
      // STEP 1: get sets of regs, set of defs, set of RDfacts,
      //         instruction-to-number map
      if (! doInit(Fn)) {
        // no virtual registers in this function -- not much to do
        MRI->clearVirtRegs();
        return 0;
      }

      if (DEBUG) {
        printInstructions(Fn);
      }

      // STEP 2: live analysis for all registers (fill in globals
      //         liveBeforeMap and liveAfterMap for blocks, and
      //         globals insLiveBeforeMap and insLiveAfterMapfor
      //         instructions)
      if (DEBUG) {
        cerr << "START LIVE ANALYSIS\n";
      }
      doLiveAnalysis(Fn);
      if (PRINT_LIVE) {
        printLiveResults(Fn);
      }
      
      // STEP 3: reaching defs analysis (fill in globals RDbeforeMap and
      //         RDafterMap for blocks, and globals insRDbeforeMap and
      //         insRDafterMap for instructions)
      if (DEBUG) {
        cerr << "\nSTART REACHING DEFS ANALYSIS\n";
      }
      doReachingDefsAnalysis(Fn);
      if (PRINT_RD) {
        printRDResults(Fn);
      }
      
      // STEP 4: make initial live ranges
      
      if (DEBUG) {
        cerr << "\nSTART INITIAL LIVE RANGES\n";
      }
      doInitialLive(Fn);
      if (PRINT_RANGES) {
        printInitialLive(Fn);
      }
      
      // STEP 5: from initial live ranges, make final live ranges
      
      if (DEBUG) {
        cerr << "\nSTART FINAL LIVE RANGES\n";
      }
      doFinalLive();
      if (PRINT_RANGES) {
        printFinalLive(Fn);
      }
      
      // STEP 6: make interference graph
      
      if (DEBUG) {
        cerr << "\nSTART INTERFERENCE GRAPH\n";
      }
      doInterference();
      if (PRINT_GRAPH) {
        printInterference(Fn);
      }
      
      // STEP 7: color interference graph
      if (DEBUG) {
        cerr << "\nSTART GRAPH COLORING\n";
      }
      pushColorStack();
      popColorStack(Fn);
      
      // STEP 8: replace the virtual registers with physical ones
      if (DEBUG) {
        cerr << "\nSTART REGISTER REPLACEMENT\n";
      }
      doReplaceRegisters(Fn);
      
      if (DEBUG) cerr << "\nDONE!\n";
      // exit(0); // prevent coredump until reg alloc is implemented
      MRI->clearVirtRegs();
      return true;
    }
    
    virtual void getAnalysisUsage(AnalysisUsage &AU) const {
      // Eliminate PHI nodes before we get the CFG.
      // This works by inserting copies into predecessor blocks.
      // So the code is no longer in SSA form.
      AU.addRequiredID(PHIEliminationID); 
      // This pass used to be required.  Including it now causes
      // a runtime error.
      //      AU.addRequiredID(TwoAddressInstructionPassID);
      MachineFunctionPass::getAnalysisUsage(AU);
    }
    
  private:
    //**********************************************************************
    // doInit
    //
    // fill in
    //  RDfactSet:     set of all reaching-def facts in this function
    //                 i.e., the universe of facts for reaching-defs
    //                       analysis
    //  InstrToNumMap: map from instruction to unique # (for debugging)
    //  vregToAvailPregSetMap
    //                 map from each vreg used in this fn to its available
    //                 set of pregs (taking into account the "allocation
    //                 order" and the "reserved regs" and not putting any
    //                 preg that occurs in this fn -- or any of its aliases --
    //                 in an available set)
    //
    // Return T iff there are vregs in this fn
    //**********************************************************************
    bool doInit(MachineFunction &Fn) {
      bool yesVregs = false;
      set<unsigned> usedPregSet;   // pregs that occur in this fn
      set<unsigned> vregSet;       // vregs defined in this fn
      MRI = &Fn.getRegInfo();
      const TargetRegisterInfo *TRI = Fn.getTarget().getRegisterInfo();
      
      // iterate over all basic blocks, all instructions in a block,
      // all operands in an instruction
      int insNum = 1;
      for (MachineFunction::iterator MFIt = Fn.begin(), MFendIt = Fn.end();
           MFIt != MFendIt; MFIt++) {
        for (MachineBasicBlock::iterator MBBIt = MFIt->begin(),
               MBBendIt = MFIt->end(); MBBIt != MBBendIt; MBBIt++) {
          //*MBBIt is a MachineInstr
          InstrToNumMap[MBBIt] = insNum;
          insNum++;
          int numOp = MBBIt->getNumOperands();
          for (int i = 0; i < numOp; i++) {
            MachineOperand &MOp = MBBIt->getOperand(i);  
            if (MOp.isReg() && MOp.getReg()) {
              unsigned reg = MOp.getReg();
              // Here if this operand is
              //  (a) a register
              //  (b) not special reg 0
              // Add it to vregSet or usedPregSet depending on whether
              // it is a vreg or a preg; if a preg, also add all aliases
              if (TargetRegisterInfo::isVirtualRegister(reg)) {
                vregSet.insert(reg);
                yesVregs = true;  // found a vreg!
              } else {
                usedPregSet.insert(reg);
                addAliases(&usedPregSet, reg, TRI);
              }
              if (MOp.isDef()) {
                RDfactSet.insert(new RDfact(reg, MBBIt));
              } // end a def of a reg
            } // end operand is a register
          } // end for each operand
        } // end iterate over all instructions in 1 basic block
      } // end iterate over all basic blocks in this fn
      
      // iterate over set of vreg in this fn
      // for each, get its available set of pregs, taking into account
      // the "allocation order" and the "reserved regs" and the
      // set of pregs already used in this fn
      BitVector reservedRegs = TRI->getReservedRegs(Fn);
      for (set<unsigned>::iterator it = vregSet.begin();
           it != vregSet.end(); it++) {
        unsigned vreg = *it;
        set<unsigned> *availPregSet = new set<unsigned>();
        vregToAvailPregSetMap[vreg] = availPregSet;
        unsigned preg;
        int vregClass = MRI->getRegClass(vreg)->getID();
        const TargetRegisterClass *trc = TRI->getRegClass(vregClass);
        ArrayRef<uint16_t> rawOrder = trc->getRawAllocationOrder(Fn);
        ArrayRef<uint16_t>::iterator rItr = rawOrder.begin();
        while (rItr != rawOrder.end()) {
          while (rItr != rawOrder.end() && reservedRegs.test(*rItr) ||
                 usedPregSet.count(*rItr) != 0) {
            ++rItr;
          }
          if (rItr != rawOrder.end()) {
            preg = *rItr;
            availPregSet->insert(preg);
            ++rItr;
          }
        } // end iterate over rawOrder

        if (DEBUG_AVAIL) {
          cerr << "Avail set for vreg ";
          printReg(vreg);
          cerr << ": ";
          printRegSet(availPregSet);
        } // end if DEBUG_VREG
      } // end iterate over all vregs in this fn

      return yesVregs;
    } // end doInit

    //**********************************************************************
    // addAliases
    //
    // given: S         ptr to set of registers
    //        reg       (unsigned) one reg
    //        TRI       TargetRegisterInfo
    //
    // do: add all aliases of reg to S (only a preg has aliases)
    //**********************************************************************
    void addAliases(set<unsigned> *S, unsigned reg,
                    const TargetRegisterInfo *TRI) {
      if (TargetRegisterInfo::isPhysicalRegister(reg)) {
        const uint16_t *aliasSet = TRI->getAliasSet(reg);
        while (aliasSet != NULL && *aliasSet != 0) {
          S->insert(*aliasSet);
          aliasSet++;
        }
      }      
    }
    
    //**********************************************************************
    // doLiveAnalysis
    //**********************************************************************
    void doLiveAnalysis(MachineFunction &Fn) {
      // initialize live maps to empty
      liveBeforeMap.clear();
      liveAfterMap.clear();
      liveVarsGenMap.clear();
      liveVarsKillMap.clear();
      insLiveBeforeMap.clear();
      insLiveAfterMap.clear();
      
      analyzeBasicBlocksLiveVars(Fn);
      analyzeInstructionsLiveVars(Fn);
    }
    
    //**********************************************************************
    // doReachingDefsAnalysis
    //**********************************************************************
    void doReachingDefsAnalysis(MachineFunction &Fn) {
      analyzeBasicBlocksRDefs(Fn);
      analyzeInstructionsRDefs(Fn);
    }
    
    //**********************************************************************
    // analyzeBasicBlocksLiveVars
    //
    // iterate over all basic blocks bb
    //    bb.gen = all upwards-exposed uses in bb
    //    bb.kill = all defs in bb
    //    put bb on the worklist
    //**********************************************************************
    void analyzeBasicBlocksLiveVars(MachineFunction &Fn) {
      
      // initialize all before/after/gen/kill sets and
      // put all basic blocks on the worklist
      set<MachineBasicBlock *> worklist;
      for (MachineFunction::iterator MFIt = Fn.begin(), MFendIt = Fn.end();
           MFIt != MFendIt; MFIt++) {
        liveBeforeMap[MFIt] = new set<unsigned>();
        liveAfterMap[MFIt] = new set<unsigned>();
        liveVarsGenMap[MFIt] = getUpwardsExposedUses(MFIt);
        liveVarsKillMap[MFIt] = getAllDefs(MFIt);
        worklist.insert(MFIt);
      }
      
      // while the worklist is not empty {
      //   remove one basic block bb
      //   compute new bb.liveAfter = union of liveBefore's of all successors
      //   replace old liveAfter with new one
      //   compute new bb.liveBefore = (bb.liveAfter - bb.kill) union bb.gen
      //   if bb.liveBefore changed {
      //      replace old liveBefore with new one
      //      add all of bb's predecessors to the worklist
      //   }
      // }
      while (! worklist.empty()) {
        // remove one basic block and compute its new liveAfter set
        set<MachineBasicBlock *>::iterator oneBB = worklist.begin();
        MachineBasicBlock *bb = *oneBB;
        worklist.erase(bb);
        
        set<unsigned> *newLiveAfter = computeLiveAfter(bb);
        
        // update the liveAfter map
        liveAfterMap.erase(bb);
        liveAfterMap[bb] = newLiveAfter;
        // compute its new liveBefore, see if it has changed (it can only
        // get bigger)
        set<unsigned> *newLiveBefore = computeLiveBefore(bb);
        set<unsigned> *oldLiveBefore = liveBeforeMap[bb];
        if (newLiveBefore->size() > oldLiveBefore->size()) {
          // update the liveBefore map and put all preds of bb on worklist
          liveBeforeMap.erase(bb);
          liveBeforeMap[bb] = newLiveBefore;
          for (MachineBasicBlock::pred_iterator PI = bb->pred_begin(),
                 E = bb->pred_end();
               PI != E; PI++) {
            worklist.insert(*PI);
          }
        }
      }
    }
    
    //**********************************************************************
    // analyzeBasicBlocksRDefs
    //**********************************************************************
    void analyzeBasicBlocksRDefs(MachineFunction &Fn) {
      // iterate over all basic blocks bb computing
      //    bb.gen = for each reg v defined in bb at inst: the RDfact
      //             (v, inst)
      //    bb.kill = all dataflow facts with reg v
      // also put bb on the worklist
      
      set<MachineBasicBlock *> worklist;
      for (MachineFunction::iterator MFIt = Fn.begin(), MFendIt = Fn.end();
           MFIt != MFendIt; MFIt++) {
        RDbeforeMap[MFIt] = new set<RDfact *>();
        RDafterMap[MFIt] = new set<RDfact *>();
        RDgenMap[MFIt] = getRDgen(MFIt);
        RDkillMap[MFIt] = getRDkill(MFIt);
        worklist.insert(MFIt);
      }
      
      // while the worklist is not empty {
      //   remove one basic block bb
      //   compute new bb.RDbefore = union of RDafter's of all preds
      //   replace old RDbefore with new one
      //   compute new bb.RDafter = (bb.RDbefore - bb.RDkill) union
      //                              bb.RDgen
      //   if bb.RDafter changed {
      //      replace old RDbefore with new one
      //      add all of bb's succs to the worklist
      //   }
      // }
      while (! worklist.empty()) {
        // remove one basic block and compute its new RDbefore set
        set<MachineBasicBlock *>::iterator oneBB = worklist.begin();
        MachineBasicBlock *bb = *oneBB;
        worklist.erase(bb);
        
        set<RDfact *> *newRDbefore = computeRDbefore(bb);
        
        // update the RDbefore map
        RDbeforeMap.erase(bb);
        RDbeforeMap[bb] = newRDbefore;
        // compute its new RDafter, see if it has changed (it can only
        // get bigger)
        set<RDfact *> *newRDafter = computeRDafter(bb);
        set<RDfact *> *oldRDafter = RDafterMap[bb];
        if (newRDafter->size() > oldRDafter->size()) {
          // update the RDafter map and put all succs of bb on worklist
          RDafterMap.erase(bb);
          RDafterMap[bb] = newRDafter;
          for (MachineBasicBlock::succ_iterator PI = bb->succ_begin(),
                 E = bb->succ_end();
               PI != E; PI++) {
            worklist.insert(*PI);
          }
        }
      }
    }
    
    // **********************************************************************
    // computeLiveBefore
    //
    // given: bb          ptr to a MachineBasicBlock 
    //
    // do:    compute and return bb's current LiveBefore set:
    //          (bb.liveAfter - bb.kill) union bb.gen
    // **********************************************************************
    set<unsigned> *computeLiveBefore(MachineBasicBlock *bb) {
      return regSetUnion(regSetSubtract(liveAfterMap[bb],
                                        liveVarsKillMap[bb]
                                        ),
                         liveVarsGenMap[bb]
                         );
    }
    
    
    // **********************************************************************
    // computeLiveAfter
    //
    // given: bb  ptr to a MachineBasicBlock 
    //
    // do:    compute and return bb's current LiveAfter set: the union
    //        of the LiveBefore sets of all of bb's CFG successors
    // **********************************************************************
    set<unsigned> *computeLiveAfter(MachineBasicBlock *bb) {
      set<unsigned> *result = new set<unsigned>();
      for (MachineBasicBlock::succ_iterator SI = bb->succ_begin();
           SI != bb->succ_end(); SI++) {
        MachineBasicBlock *oneSucc = *SI;
        result = regSetUnion(result, liveBeforeMap[oneSucc]);
      }
      
      return result;
    }
    
    
    // **********************************************************************
    // computeRDbefore
    //
    // given: bb  ptr to a MachineBasicBlock 
    //
    // do:    compute and return bb's current RDbefore set: the union
    //        of the RDafter sets of all of bb's CFG preds
    // **********************************************************************
    set<RDfact *> *computeRDbefore(MachineBasicBlock *bb) {
      set<RDfact *> *result = new set<RDfact *>();
      for (MachineBasicBlock::pred_iterator SI = bb->pred_begin();
           SI != bb->pred_end(); SI++) {
        MachineBasicBlock *onePred = *SI;
        result = RDsetUnion(result, RDafterMap[onePred]);
      }
      
      return result;
    }
    
    // **********************************************************************
    // computeRDafter
    //
    // given: bb          ptr to a MachineBasicBlock 
    //
    // do:    compute and return bb's current RDafter set:
    //          (bb.RDbefore - bb.kill) union bb.gen
    // **********************************************************************
    set<RDfact *> *computeRDafter(MachineBasicBlock *bb) {
      return RDsetUnion(RDsetSubtract(RDbeforeMap[bb],
                                      RDkillMap[bb]
                                      ),
                        RDgenMap[bb]
                        );
    }
    
    // **********************************************************************
    // regSetUnion
    //
    // given: S1, S2          ptrs to sets of regs
    // do:    return a ptr to (*S1 union *S2)
    // **********************************************************************
    set<unsigned> *regSetUnion(set<unsigned> *S1, set<unsigned> *S2) {
      set<unsigned> *result = new set<unsigned>();
      // iterate over S1
      for (set<unsigned>::iterator oneRegPtr = S1->begin();
           oneRegPtr != S1->end();
           oneRegPtr++) {
        result->insert(*oneRegPtr);
      }
      
      // iterate over S2
      for (set<unsigned>::iterator oneRegPtr = S2->begin();
           oneRegPtr != S2->end();
           oneRegPtr++) {
        result->insert(*oneRegPtr);
      }
      
      return result;
    }
    
    // **********************************************************************
    // RDsetUnion
    //
    // given: S1, S2          ptrs to sets of ptrs to RDfacts
    // do:    return a ptr to (*S1 union *S2)
    // **********************************************************************
    set<RDfact *> *RDsetUnion(set<RDfact *> *S1, set<RDfact *> *S2) {
      set<RDfact *> *result = new set<RDfact *>();
      // iterate over S1
      for (set<RDfact *>::iterator oneRDfact = S1->begin();
           oneRDfact != S1->end();
           oneRDfact++) {
        result->insert(*oneRDfact);
      }
      
      // iterate over S2
      for (set<RDfact *>::iterator oneRDfact = S2->begin();
           oneRDfact != S2->end();
           oneRDfact++) {
        result->insert(*oneRDfact);
      }
      
      return result;
    }
    
    // **********************************************************************
    // regSetSubtract
    //
    // given: S1, S2          ptrs to sets of regs
    // do:    return a ptr to (*S1 - *S2)
    //
    // **********************************************************************
    set<unsigned> *regSetSubtract(set<unsigned> *S1, set<unsigned> *S2) {
      set<unsigned> *result = new set<unsigned>();
      // iterate over S1; for each element, if it is NOT in S2, then
      // add it to the result
      for (set<unsigned>::iterator S1RegPtr = S1->begin();
           S1RegPtr != S1->end();
           S1RegPtr++) {
        if (S2->count(*S1RegPtr) == 0) {
          result->insert(*S1RegPtr);
        }
      }
      
      return result;
    }
    /*
    set<unsigned> *regSetSubtract(set<unsigned> *S1, set<unsigned> *S2) {
      set<unsigned> *result = new set<unsigned>();
      // iterate over S1; for each element, if it is NOT in S2, then
      // add it to the result
      for (set<unsigned>::iterator S1It = S1->begin();
           S1It != S1->end();
           S1It++) {
           
        unsigned reg1 = *S1It;
        bool found = false;
        set<unsigned>::iterator S2It = S2->begin();
        while (!found && S2It != S2->end()) {
          unsigned reg2 = *S2It;
          if (reg1 == reg2) found = true;
          S2It++;
        }
        if (!found) result->insert(reg1);
      } // end iterate over S1
      return result;
    }
    */
    
    // **********************************************************************
    // RDsetSubtract
    //
    // given: S1, S2          ptrs to sets of RDfact ptrs
    // do:    return a ptr to (*S1 - *S2)
    //
    // **********************************************************************
    set<RDfact *> *RDsetSubtract(set<RDfact *> *S1, set<RDfact *> *S2) {
      set<RDfact *> *result = new set<RDfact *>();
      // iterate over S1; for each element, if it is NOT in S2, then
      // add it to the result
      for (set<RDfact *>::iterator S1RegPtr = S1->begin();
           S1RegPtr != S1->end();
           S1RegPtr++) {
        if (S2->count(*S1RegPtr) == 0) {
          result->insert(*S1RegPtr);
        }
      }
      
      return result;
    }
    /*
    set<RDfact *> *RDsetSubtract(set<RDfact *> *S1, set<RDfact *> *S2) {
      set<RDfact *> *result = new set<RDfact *>();
      // iterate over S1; for each element, if it is NOT in S2, then
      // add it to the result
      for (set<RDfact *>::iterator S1It = S1->begin();
           S1It != S1->end();
           S1It++) {
        RDfact *fact1 = *S1It;
        bool found = false;
        set<RDfact *>::iterator S2It = S2->begin();
        while (!found && S2It != S2->end()) {
          RDfact *fact2 = *S2It;
          if (fact1->getReg() == fact2->getReg() &&
              fact1->getInstr() == fact2->getInstr()) found = true;
          S2It++;
        }
        if (!found) result->insert(fact1);
      } // end iterate over S1
      return result;
    }
    */

    //**********************************************************************
    // analyzeInstructionsLiveVars
    //
    // do live-var analysis at the instruction level:
    //   iterate over all basic blocks
    //   for each, iterate backwards over instructions, propagating
    //             live-var info:
    //     for each instruction inst
    //             live-before = (live-after - kill) union gen
    //     where kill is the defined reg of inst (if any) and
    //           gen is all reg-use operands of inst
    //**********************************************************************
    void analyzeInstructionsLiveVars(MachineFunction &Fn) {
      for (MachineFunction::iterator bb = Fn.begin(), bbe = Fn.end(); 
           bb != bbe; bb++) {
        // no reverse iterator and recursion doesn't work,
        // so create vector of instructions for backward traversal
        vector<MachineInstr *> instVector;
        for (MachineBasicBlock::iterator inIt = bb->begin();
             inIt != bb->end();
             inIt++) {
          instVector.push_back(inIt);
        }
        
        liveForInstr(instVector, liveAfterMap[bb]);
      }
    }
    
    //**********************************************************************
    // analyzeInstructionsRDefs
    //
    // given reaching-defs before and after facts for basic block,
    // compute before/after facts for each instruction in each basic block
    //
    // for one instruction: RDafter = (RDbefore - kill) union gen
    // where kill is all dataflow facts with the regs that are defined
    // by this instruction (if any), and gen is the set of facts (reg, inst)
    // for all regs defined by this instruction (if any)
    //**********************************************************************
    void analyzeInstructionsRDefs(MachineFunction &Fn) {
      // iterate over all basic blocks in this function
      for (MachineFunction::iterator bb = Fn.begin(), bbe = Fn.end(); 
           bb != bbe; bb++) {
        set<RDfact *> *RDbefore = RDbeforeMap[bb];
        // iterate over all instructions in this basic block
        for (MachineBasicBlock::iterator inIt = bb->begin();
             inIt != bb->end();
             inIt++) {
          insRDbeforeMap[inIt] = RDbefore;
          set<RDfact *> *kill = new set<RDfact *>();
          set<RDfact *> *gen = new set<RDfact *>();
          set<unsigned> *regDefs = getOneInstrRegDefs(inIt);
          // if at least one reg was defined
          // then compute gen and kill sets for this instruction
          if (regDefs->size() > 0) {
            for (set<unsigned>::iterator regIt = regDefs->begin();
                 regIt != regDefs->end(); regIt++) {
              unsigned oneDef = *regIt;
              gen->insert(new RDfact(oneDef, inIt));
              // iterate over all RDfacts, see which are killed
              for (set<RDfact *>::iterator IT = RDfactSet.begin();
                   IT != RDfactSet.end(); IT++) {
                RDfact *oneRDfact = *IT;
                unsigned oneReg = oneRDfact->getReg();
                if (oneReg == oneDef) {
                  kill->insert(oneRDfact);
                }
              } // end iterate over all RDfacts to compute kill
            } // end iterate over set of regs defined by one instruction

            // we've now defined the gen and kill sets so we can
            // compute the "after" fact for this instruction
            set<RDfact *> *RDafter = RDsetUnion(RDsetSubtract(RDbefore, kill),
                                                gen);
            insRDafterMap[inIt] = RDafter;
            RDbefore = RDafter;
          } else {
            // this instruction doesn't define any reg
            insRDafterMap[inIt] = RDbefore;
          }
        } // end iterate over all instructions in 1 basic block
      } // end iterate over all basic blocks
    }
    
    // **********************************************************************
    // getUpwardsExposedUses
    //
    // given: bb      ptr to a basic block
    // do:    return a ptr to the set of regs that are used before
    //        being defined in bb
    // **********************************************************************
    set<unsigned> *getUpwardsExposedUses(MachineBasicBlock *bb) {
      set<unsigned> *result = new set<unsigned>();
      set<unsigned> *defs = new set<unsigned>();
      for (MachineBasicBlock::iterator instruct = bb->begin(),
             instructEnd = bb->end(); instruct != instructEnd; instruct++) {
        set<unsigned> *uses = getOneInstrRegUses(instruct);
        set<unsigned> *upUses = regSetSubtract(uses, defs);
        result = regSetUnion(result, upUses);
        set<unsigned> *defSet = getOneInstrRegDefs(instruct);
        for (set<unsigned>::iterator IT = defSet->begin();
             IT != defSet->end(); IT++) {
          unsigned oneDef = *IT;
          defs->insert(oneDef);
        }
      } // end iterate over all instrutions in this basic block
      
      return result;
    }
    
    
    // **********************************************************************
    // getRDgen
    //
    // given: bb      ptr to a basic block
    // do:    return a set of reaching-def facts: the ones that occur in bb
    // **********************************************************************
    set<RDfact *> *getRDgen(MachineBasicBlock *bb) {
      set<RDfact *> *result = new set<RDfact *>();
      for (MachineBasicBlock::iterator instruct = bb->begin(),
             instructEnd = bb->end(); instruct != instructEnd; instruct++) {
        set<unsigned> *defSet = getOneInstrRegDefs(instruct);
        for (set<unsigned>::iterator IT = defSet->begin();
             IT != defSet->end(); IT++) {
          unsigned oneDef = *IT;
          result->insert(new RDfact(oneDef, instruct));
        }
      } // end iterate over all instructions in this basic block
      
      return result;
    }
    
    // **********************************************************************
    // getRDkill
    //
    // given: bb      ptr to a basic block
    // do:    return a set of reaching-def facts: the ones whose reg
    //        component is defined in bb
    // **********************************************************************
    set<RDfact *> *getRDkill(MachineBasicBlock *bb) {
      set<RDfact *> *result = new set<RDfact *>();
      for (MachineBasicBlock::iterator instruct = bb->begin(),
             instructEnd = bb->end(); instruct != instructEnd; instruct++) {
        set<unsigned> *defSet = getOneInstrRegDefs(instruct);
        for (set<unsigned>::iterator IT = defSet->begin();
             IT != defSet->end(); IT++) {
          unsigned oneDef = *IT;
          for (set<RDfact *>::iterator IT = RDfactSet.begin();
               IT != RDfactSet.end(); IT++) {
            RDfact *oneRDfact = *IT;
            unsigned oneReg = oneRDfact->getReg();
            if (oneReg == oneDef) {
              result->insert(oneRDfact);
            }
          } // end iterate over all RDfacts in the whole fn
        } // end iterate over all defs in this instruction
      } // end iterate over all instructions in this basic block
      
      return result;
    }
    
    //**********************************************************************
    // getOneInstrRegUses
    //
    // return the set of registers (virtual or physical) used by the
    // given instruction
    //**********************************************************************
    set<unsigned> *getOneInstrRegUses(MachineInstr *instruct) {
      set<unsigned> *result = new set<unsigned>();
      unsigned numOperands = instruct->getNumOperands();
      for (unsigned n=0; n<numOperands; n++) {
        MachineOperand MOp = instruct->getOperand(n);
        if (MOp.isReg() && MOp.getReg() && MOp.isUse()) {
          unsigned reg = MOp.getReg();
          result->insert(reg);
        }
      } // end for each operand of current instruction
      return result;
    }
    
    //**********************************************************************
    // getOneInstrRegDefs
    //
    // return a ptr to a set of the registers defined by this instruction
    //**********************************************************************
    set<unsigned> *getOneInstrRegDefs(MachineInstr *instruct) {
      set<unsigned> *result = new set<unsigned>();
      unsigned numOperands = instruct->getNumOperands();
      for (unsigned n=0; n<numOperands; n++) {
        MachineOperand MOp = instruct->getOperand(n);
        if (MOp.isReg() && MOp.getReg() && MOp.isDef()) {
          unsigned reg = MOp.getReg();
          result->insert(reg);
        }
      } // end for each operand of current instruction
      return result;
    }
    
    // **********************************************************************
    // getAllDefs
    //
    // given: bb      ptr to a basic block
    // do:    return the set of regs that are defined in bb
    // **********************************************************************
    set<unsigned> *getAllDefs(MachineBasicBlock *bb) {
      set<unsigned> *result = new set<unsigned>();
      
      // iterate over all instructions in bb
      //   for each operand that is a non-zero reg:
      //     if it is a def then add it to the result set
      // return result
      // 
      for (MachineBasicBlock::iterator instruct = bb->begin(),
             instructEnd = bb->end(); instruct != instructEnd; instruct++) {
        unsigned numOperands = instruct->getNumOperands();
        for (unsigned n=0; n<numOperands; n++) {
          MachineOperand MOp = instruct->getOperand(n);
          if (MOp.isReg() && MOp.getReg() && MOp.isDef()) {
            result->insert(MOp.getReg());
          }
        } // end for each operand of current instruction
      } // end iterate over all instrutions in this basic block
      return result;
    }
    
    // **********************************************************************
    // liveForInstr
    //
    // given: instVector vector of ptrs to Instructions for one basic block
    //        liveAfter  live after set for the *last* instruction in the block
    //
    // do:    compute and set liveAfter and liveBefore for each instruction
    //        liveAfter = liveBefore of next instruction
    //        liveBefore = (liveAfter - kill) union gen
    // **********************************************************************
    void liveForInstr(vector<MachineInstr *>instVector,
                      set<unsigned> *liveAfter) {
      while (instVector.size() > 0) {
        MachineInstr *oneInstr = instVector.back();
        instVector.pop_back();
        insLiveAfterMap[oneInstr] = liveAfter;
        
        // create liveBefore for this instruction
        // (which is also liveAfter for the previous one in the block)
        //   remove the reg defined here (if any) from the set
        //   then add all used reg operands
        
        set<unsigned> *liveBefore;
        set<unsigned> *gen = getOneInstrRegUses(oneInstr);
        set<unsigned> *kill = getOneInstrRegDefs(oneInstr);
        if (kill->size() != 0) {
          liveBefore = regSetUnion(regSetSubtract(liveAfter, kill), gen);
        } else {
          liveBefore = regSetUnion(liveAfter, gen);
        }
        
        // add this instruction's liveBefore set to the map
        // and prepare for the next iteration of the loop
        insLiveBeforeMap[oneInstr] = liveBefore;
        liveAfter = liveBefore;
      } // end while
    }
    
    // **********************************************************************
    // printInstructions
    // **********************************************************************
    void printInstructions(MachineFunction &F) {
      cerr << "MACHINE INSTRUCTIONS\n";
      // iterate over all basic blocks
      for (MachineFunction::iterator bb = F.begin(); bb != F.end(); bb++) {
        cerr << "Basic Block " << bb->getNumber() << "\n";
        // iterate over instructions, printing each
        for (MachineBasicBlock::iterator inIt = bb->begin(), ine = bb->end();
             inIt != ine; inIt++) {
          MachineInstr *oneI = inIt;
          cerr << "%" << InstrToNumMap[oneI] << ": ";
          oneI->dump();
        }
      }
      cerr << "\n";
    }

    // **********************************************************************
    // printLiveResults
    //
    // given: MachineFunction F
    //
    // do:    for each basic block in F {
    //           print fn name, bb number, liveBefore and After sets
    //           for each instruction, print instruction num, liveBefore and
    //               liveAfter
    //        }
    // 
    // **********************************************************************
    void printLiveResults(MachineFunction &F) {
      cerr << "\nLIVE VARS\n";
      
      // iterate over all basic blocks
      for (MachineFunction::iterator bb = F.begin(); bb != F.end(); bb++) {
        // print number of basic block
        cerr << "BASIC BLOCK #" << bb->getNumber() << "\n";
        // print live before and after sets
        cerr << "  L-Before: ";
        printRegSet(liveBeforeMap[bb]);
        cerr << "  L-After: ";
        printRegSet(liveAfterMap[bb]);
        cerr << "\n";
        
        // iterate over instructions, printing each live set
        // (note that liveAfter of one instruction is liveBefore of the next one)
        for (MachineBasicBlock::iterator inIt = bb->begin(), ine = bb->end();
             inIt != ine; inIt++) {
          cerr << "%" << InstrToNumMap[inIt] << ": ";
          cerr << "\tL-Before: ";
          printRegSet(insLiveBeforeMap[inIt]);
          cerr << "\tL-After: ";
          printRegSet(insLiveAfterMap[inIt]);
        }
      }
    }
    
    // **********************************************************************
    // printRDResults
    //
    // given: MachineFunction F
    //
    // do:    for each basic block in F {
    //           print fn name, bb number, RDBefore and After sets
    //           for each instruction, print instruction num, RDBefore and
    //               RDAfter
    //        }
    // 
    // **********************************************************************
    void printRDResults(MachineFunction &F) {
      cerr << "\nREACHING DEFS\n";
      
      // iterate over all basic blocks
      for (MachineFunction::iterator bb = F.begin(); bb != F.end(); bb++) {
        // print number of basic block
        cerr << "BASIC BLOCK #" << bb->getNumber() << "\n";
        // print RD before and after sets
        cerr << "  RD-Before: ";
        printRDSet(RDbeforeMap[bb]);
        cerr << "  RD-After: ";
        printRDSet(RDafterMap[bb]);
        cerr << "\n";
        
        // iterate over instructions, printing each RD set
        // (note that RDAfter of one instruction is RDBefore of the next one)
        for (MachineBasicBlock::iterator inIt = bb->begin(), ine = bb->end();
             inIt != ine; inIt++) {
          cerr << "%" << InstrToNumMap[inIt] << ": ";
          cerr << "\tRD-Before: ";
          printRDSet(insRDbeforeMap[inIt]);
          cerr << "\tRD-After: ";
          printRDSet(insRDafterMap[inIt]);
          cerr << "\n";
        }
      }
    }
    
    // **********************************************************************
    // printRegSet
    //
    // given: S      ptr to set of regs (unsigned)
    // do:    print the set
    // ********************************************************************
    void printRegSet(set<unsigned> *S) {
      cerr << "{";
      for (set<unsigned>::iterator IT = S->begin(); IT != S->end(); IT++) {
        unsigned reg = *IT;
        cerr << " " << reg;
      }
      cerr << " }\n";
    }
    
    // **********************************************************************
    // printReg
    //
    // given: unsigned           vreg or preg
    //
    // do: print R for physical, % for virtual, followed by reg number
    //
    // NOTE: To print virtual-reg index use:
    //           TargetRegisterInfo::virtReg2Index(reg)
    // **********************************************************************
    void printReg(unsigned reg) {
      if (TargetRegisterInfo::isPhysicalRegister(reg)) {
        cerr << "R" << reg;
      } else {
        cerr << "%" << reg;
      }
    }
    
    // **********************************************************************
    // printRDSet
    //
    // given: S      ptr to set of RDfact
    // do:    print the set
    // **********************************************************************
    void printRDSet(set<RDfact *> *S) {
      cerr << "{";
      for (set<RDfact *>::iterator IT = S->begin(); IT != S->end(); IT++) {
        RDfact *oneRDfact = *IT;
        MachineInstr *oneIns = oneRDfact->getInstr();
        cerr << "(" << oneRDfact->getReg() << ", %"
             << InstrToNumMap[oneIns] << ") ";
      }
      cerr << " }\n";
    }
    
    //**********************************************************************
    // printRegSet
    //**********************************************************************
    void printRegSet(set<unsigned> S) {
      for (set<unsigned>::iterator IT = S.begin(); IT != S.end(); IT++) {
        unsigned reg = *IT;
        cerr << reg << " ";
      }
    }
    
    //
    // MY CODE STARTS HERE
    //
    
    void doInitialLive(MachineFunction &Fn) {
      for (MachineFunction::iterator MFIt = Fn.begin(); MFIt != Fn.end(); MFIt++) {
        for (MachineBasicBlock::iterator MBBIt = MFIt->begin(); MBBIt != MFIt->end(); MBBIt++) {
          int numOp = MBBIt->getNumOperands();
          for (int i = 0; i < numOp; i++) {
            MachineOperand MOp = MBBIt->getOperand(i);
            if (MOp.isReg() && MOp.getReg() && MOp.isDef()) {
              // MOp is a definition
              
              unsigned reg = MOp.getReg();
              set<const MachineInstr *> *range = new set<const MachineInstr *>();
              // For each CFG node D that defines variable x, the initial live range for D consists of: 
              // ( <x>, <{D} union {N | x in N.live-before and D in N.reaching-defs-before}> ) 
              // Note: the live range is a pair: the variable defined at D, and the set of nodes in the range.
              
              // insert D
              const MachineInstr *nodeD = &*MBBIt;
              unsigned numberD = InstrToNumMap[const_cast<MachineInstr *>(nodeD)];
              range->insert(nodeD);
              
              // insert {N | x in N.live-before and D in N.reaching-defs-before}
              bool hascall = false;
              for (MachineFunction::iterator MFIt2 = Fn.begin(); MFIt2 != Fn.end(); MFIt2++) {
                for (MachineBasicBlock::iterator MBBIt2 = MFIt2->begin(); MBBIt2 != MFIt2->end(); MBBIt2++) {
                  MachineInstr *nodeN = &*MBBIt2;
                  const MCInstrDesc &MCID = nodeN->getDesc();
                  hascall = hascall || MCID.isCall();
                  unsigned numberN = InstrToNumMap[const_cast<MachineInstr *>(nodeN)];
                  set<unsigned> *live = insLiveBeforeMap[nodeN];
                  set<RDfact *> *reaching = insRDbeforeMap[nodeN];
                  if (live->find(reg) != live->end()) {
                    for (set<RDfact *>::iterator RDIt = reaching->begin(); RDIt != reaching->end(); RDIt++) {
                      if ((*RDIt)->getInstr() == nodeD) {
                        range->insert(nodeN);
                        break;
                      }
                    }
                  }
                }
              }
              
              Range r = {reg, range, hascall};
              if (TargetRegisterInfo::isPhysicalRegister(reg))
                physRanges.push_back(r);
              else
                virtRanges.push_back(r);
              
            }
          }
        }
      }
    }
    
    // Edit the initial ranges by collapsing overlapping ranges of the same register.
    void doFinalLive() {
      list<Range>::iterator xit, yit;
    restartPhys:
      for (xit = physRanges.begin(); xit != physRanges.end(); xit++) {
        for (yit = physRanges.begin(); yit != physRanges.end(); yit++) {
          if (xit != yit && (*xit).reg == (*yit).reg && isOverlap(*xit, *yit)) {
            Range r = rangeUnion(*xit, *yit);
            physRanges.erase(xit);
            physRanges.erase(yit);
            physRanges.push_back(r);
            goto restartPhys;
          }
        }
      }
    restartVirt:
      for (xit = virtRanges.begin(); xit != virtRanges.end(); xit++) {
        for (yit = virtRanges.begin(); yit != virtRanges.end(); yit++) {
          if (xit != yit && (*xit).reg == (*yit).reg && isOverlap(*xit, *yit)) {
            Range r = rangeUnion(*xit, *yit);
            virtRanges.erase(xit);
            virtRanges.erase(yit);
            virtRanges.push_back(r);
            goto restartVirt;
          }
        }
      }
    }
    
    // True if x and y have a non-empty intersection of instruction sets.
    bool isOverlap(Range &x, Range &y) {
      set<const MachineInstr *>::iterator it;
      for (it = x.insts->begin(); it != x.insts->end(); it++) {
        const MachineInstr *mi = *it;
        if (y.insts->find(mi) != y.insts->end()) {
          return true;
        }
      }
      return false;
    }
    
    Range rangeUnion(Range &x, Range &y) {
      set<const MachineInstr *> *insts = new set<const MachineInstr *>();
      set<const MachineInstr *>::iterator it;
      for (it = x.insts->begin(); it != x.insts->end(); it++) {
        insts->insert(*it);
      }
      for (it = y.insts->begin(); it != y.insts->end(); it++) {
        insts->insert(*it);
      }
      Range r = {x.reg, insts, x.hascall || y.hascall};
      return r;
    }
    
    void printInitialLive(MachineFunction &Fn) {
      cerr << "INITIAL LIVE RANGES FOR FUNCTION " << Fn.getFunction()->getName().str() << "\n";
      cerr << "\nPhysical Registers\n";
      printRanges(physRanges);
      cerr << "\nVirtual Registers\n";
      printRanges(virtRanges);
    }
    
    void printFinalLive(MachineFunction &Fn) {
      cerr << "FINAL LIVE RANGES FOR FUNCTION " << Fn.getFunction()->getName().str() << "\n";
      cerr << "\nPhysical Registers\n";
      printRanges(physRanges);
      cerr << "\nVirtual Registers\n";
      printRanges(virtRanges);
    }
    
    void printRanges(list<Range> &ranges) {
      // First, replace the machine instruction set with a set of instruction numbers
      list<RangePrint> nums;
      for (list<Range>::iterator LIt = ranges.begin(); LIt != ranges.end(); LIt++) {
        Range range = *LIt;
        set<unsigned> *insts = new set<unsigned>;
        set<const MachineInstr *>::iterator SIt;
        for (SIt = range.insts->begin(); SIt != range.insts->end(); SIt++) {
          insts->insert(InstrToNumMap[const_cast<MachineInstr *>(*SIt)]);
        }
        RangePrint rp = {range.reg, insts};
        nums.push_back(rp);
      }
      // Sort by register number, then the instruction set lexicographically
      nums.sort(rangeCompare);
      // Finally we can print.
      list<RangePrint>::iterator LIt;
      for (LIt = nums.begin(); LIt != nums.end(); LIt++) {
        RangePrint rp = *LIt;
        printReg(rp.reg);
        cerr << ": { ";
        set<unsigned>::iterator SIt;
        for (SIt = rp.instnums->begin(); SIt != rp.instnums->end(); SIt++) {
          cerr << "%" << *SIt << " ";
        }
        cerr << "}\n";
      }
    }
    
    void doInterference() {
      list<Range>::iterator x, y;
      for (x = physRanges.begin(); x != physRanges.end(); x++) {
        set<Range *> *conflicts = new set<Range *>();
        for (y = physRanges.begin(); y != physRanges.end(); y++) {
          if (x != y && isOverlap(*x, *y)) {
            conflicts->insert(&*y);
          }
        }
        for (y = virtRanges.begin(); y != virtRanges.end(); y++) {
          if (x != y && isOverlap(*x, *y)) {
            conflicts->insert(&*y);
          }
        }
        interference[&*x] = conflicts;
      }
      for (x = virtRanges.begin(); x != virtRanges.end(); x++) {
        set<Range *> *conflicts = new set<Range *>();
        for (y = physRanges.begin(); y != physRanges.end(); y++) {
          if (x != y && isOverlap(*x, *y)) {
            conflicts->insert(&*y);
          }
        }
        for (y = virtRanges.begin(); y != virtRanges.end(); y++) {
          if (x != y && isOverlap(*x, *y)) {
            conflicts->insert(&*y);
          }
        }
        interference[&*x] = conflicts;
      }
    }
    
    RangePrint toRangePrint(Range *x) {
      set<unsigned> *insts = new set<unsigned>;
      set<const MachineInstr *>::iterator SIt;
      for (SIt = x->insts->begin(); SIt != x->insts->end(); SIt++) {
        insts->insert(InstrToNumMap[const_cast<MachineInstr *>(*SIt)]);
      }
      RangePrint rp = {x->reg, insts};
      return rp;
    }
    
    void printInterference(MachineFunction &Fn) {
      cerr << "INTERFERENCE GRAPH FOR FUNCTION " << Fn.getFunction()->getName().str() << "\n";
      
      list< pair<RangePrint, list<RangePrint> *> > phys, virt;
      map<Range *, set<Range *> *>::iterator it;
      for (it = interference.begin(); it != interference.end(); it++) {
        RangePrint lhs = toRangePrint(it->first);
        list<RangePrint> *rps = new list<RangePrint>();
        set<Range *> *conflicts = it->second;
        set<Range *>::iterator sit;
        for (sit = conflicts->begin(); sit != conflicts->end(); sit++) {
          Range *con = *sit;
          RangePrint rp = toRangePrint(con);
          rps->push_back(rp);
        }
        rps->sort(rangeCompare);
        pair<RangePrint, list<RangePrint> *> p;
        p.first = lhs;
        p.second = rps;
        if (TargetRegisterInfo::isVirtualRegister(it->first->reg))
          virt.push_back(p);
        else
          phys.push_back(p);
      }
      phys.sort(interferenceCompare);
      virt.sort(interferenceCompare);
      
      list< pair<RangePrint, list<RangePrint> *> >::iterator it2;
      cerr << "\nPhysical Registers\n";
      for (it2 = phys.begin(); it2 != phys.end(); it2++) {
        printReg(it2->first.reg);
        list<RangePrint> *rps = it2->second;
        cerr << "'s neighbors: { ";
        list<RangePrint>::iterator lit;
        for (lit = rps->begin(); lit != rps->end(); lit++) {
          RangePrint rp = *lit;
          printReg(rp.reg);
          cerr << " ";
        }
        cerr << "}\n";
      }
      cerr << "\nVirtual Registers\n";
      for (it2 = virt.begin(); it2 != virt.end(); it2++) {
        printReg(it2->first.reg);
        list<RangePrint> *rps = it2->second;
        cerr << "'s neighbors: { ";
        list<RangePrint>::iterator lit;
        for (lit = rps->begin(); lit != rps->end(); lit++) {
          RangePrint rp = *lit;
          printReg(rp.reg);
          cerr << " ";
        }
        cerr << "}\n";
      }
    }
    
    // Fill the to-be-colored stack with all the physical and virtual live ranges.
    void pushColorStack() {
      set<Range *> toPush;
      list<Range>::iterator it;
      for (it = physRanges.begin(); it != physRanges.end(); it++)
        toPush.insert(&*it);
      for (it = virtRanges.begin(); it != virtRanges.end(); it++)
        toPush.insert(&*it);
      
      set<Range *>::iterator sit;
    easy: // find nodes that have more register options than unstacked neighbors
      for (sit = toPush.begin(); sit != toPush.end(); sit++) {
        Range *x = *sit;
        if (isEasy(x)) {
          colorStack.push_back(x);
          toPush.erase(sit);
          goto easy;
        }
      }
      if (toPush.empty()) return;
    hard: // find the node that has the most unstacked neighbors
      int bestNum = -1;
      set<Range *>::iterator bestIt;
      for (sit = toPush.begin(); sit != toPush.end(); sit++) {
        Range *x = *sit;
        int unstacked = unstackedNeighbors(x);
        if (unstacked > bestNum) {
          bestIt = sit;
          bestNum = unstacked;
        }
      }
      colorStack.push_back(*bestIt);
      toPush.erase(bestIt);
      goto easy;
    }
    
    // Pop nodes starting from the stack top (list end), assigning each one a color.
    void popColorStack(MachineFunction &Fn) {
      while (!(colorStack.empty())) {
        Range *x = colorStack.back();
        colorStack.pop_back();
        colors[x] = pickColor(x, Fn);
      }
    }
    
    // Returns a physical register for the given range, or if there is no
    // possible register, prints an error message and quits.
    unsigned pickColor(Range *x, MachineFunction &Fn) {
      if (TargetRegisterInfo::isPhysicalRegister(x->reg)) {
        return x->reg;
      }
      
      // first, get the set of pregs and aliases already given to neighbors
      set<unsigned> conflicts;
      set<Range *> *neighbors = interference[x];
      for (set<Range *>::iterator it = neighbors->begin(); it != neighbors->end(); it++) {
        Range *y = *it;
        map<Range *, unsigned>::iterator found = colors.find(y);
        if (found != colors.end()) {
          conflicts.insert(found->second);
          addAliases(&conflicts, found->second, Fn.getTarget().getRegisterInfo());
        }
      }
      
      // next, go through possibilities and pick one s.t. the register and its
      // aliases has an empty intersection with conflicts
      set<unsigned> *pregs = vregToAvailPregSetMap[x->reg];
      for (set<unsigned>::iterator it = pregs->begin(); it != pregs->end(); it++) {
        unsigned preg = *it;
        set<unsigned> aliases;
        aliases.insert(preg);
        addAliases(&aliases, preg, Fn.getTarget().getRegisterInfo());
        if (!(isIntersecting(aliases, conflicts))) {
          if (DEBUG) cerr << "Picking " << preg << " for " << x->reg << "\n";
          return preg;
        }
      }
      
      cerr << "ERROR: couldn't assign a physical register\n";
      exit(0);
    }
    
    // True if the two sets have a non-empty intersection
    bool isIntersecting(set<unsigned> &x, set<unsigned> &y) {
      set<unsigned>::iterator xit, yit;
      for (xit = x.begin(); xit != x.end(); xit++) {
        for (yit = y.begin(); yit != y.end(); yit++) {
          if (*xit == *yit) return true;
        }
      }
      return false;
    }
    
    // True if the given range is on the to-be-colored stack.
    bool isStacked(Range *x) {
      for (list<Range *>::iterator it = colorStack.begin(); it != colorStack.end(); it++) {
        if (*it == x) return true;
      }
      return false;
    }
    
    bool isEasy(Range *x) {
      return TargetRegisterInfo::isVirtualRegister(x->reg)
        && unstackedNeighbors(x) < vregToAvailPregSetMap[x->reg]->size();
    }
    
    // Returns the number of unstacked neighbors of a range node.
    // All neighbor ranges of the same physical register are counted as one neighbor.
    int unstackedNeighbors(Range *x) {
      int count = 0;
      set<Range *> *neighbors = interference[x];
      set<unsigned> physNeighbors;
      set<Range *>::iterator it;
      for (it = neighbors->begin(); it != neighbors->end(); it++) {
        Range *y = *it;
        if (! isStacked(y)) {
          unsigned reg = y->reg;
          if (TargetRegisterInfo::isPhysicalRegister(reg)) {
            if (physNeighbors.find(reg) == physNeighbors.end()) {
              physNeighbors.insert(reg);
              count++;
            }
          }
          else count++;
        }
      }
      return count;
    }
    
    void doReplaceRegisters(MachineFunction &Fn) {
      const TargetRegisterInfo *TRI = Fn.getTarget().getRegisterInfo();
      const TargetInstrInfo *TII = Fn.getTarget().getInstrInfo();
      
      for (MachineFunction::iterator MFIt = Fn.begin(); MFIt != Fn.end(); MFIt++) {
        for (MachineBasicBlock::iterator MBBIt = MFIt->begin(); MBBIt != MFIt->end(); MBBIt++) {
          MachineInstr *inst = &*MBBIt;
          for (int i = 0; i < inst->getNumOperands(); i++) {
            MachineOperand MOp = MBBIt->getOperand(i);
            if (MOp.isReg() && MOp.getReg()) {
              unsigned reg = MOp.getReg();
              if (TargetRegisterInfo::isVirtualRegister(reg)) {
                MOp.substPhysReg(colors[getVirtRange(reg, inst)], *TRI);
              }
            }
          }
        }
      }
      
      // add code to save and restore registers across function calls
      if (DEBUG) cerr << "START FUNCTION CALL REGISTER SAVING\n";
      for (list<Range>::iterator it = virtRanges.begin(); it != virtRanges.end(); it++) {
        Range *r = &*it;
        if (r->hascall) {
          // allocate stack space to save value
          if (DEBUG) cerr << "  Allocating stack space\n";
          MachineRegisterInfo &MRI = Fn.getRegInfo();
          const TargetRegisterClass *RC = MRI.getRegClass(colors[r]);
          int frameIndex = Fn.getFrameInfo()->CreateSpillStackObject(RC->getSize(), RC->getAlignment());
          // for each call instruction, add code before and after
          if (DEBUG) cerr << "  Adding save/restore code\n";
          set<const MachineInstr *>::iterator sit;
          for (sit = r->insts->begin(); sit != r->insts->end(); sit++) {
            MachineInstr *mi = const_cast<MachineInstr *>(*sit);
            const MCInstrDesc &MCID = mi->getDesc();
            if (MCID.isCall()) {
              MachineBasicBlock *MBB = const_cast<MachineBasicBlock *>(mi->getParent());
              TII->storeRegToStackSlot(*MBB, mi, colors[r], true, frameIndex, RC, TRI);
              MachineBasicBlock::iterator IT = mi;
              IT++;
              TII->loadRegFromStackSlot(*MBB, IT, colors[r], frameIndex, RC, TRI);
            }
          }
          if (DEBUG) cerr << "  Saved a register!\n";
        }
      }
    }
    
    // Finds the live range that defines the given virtual register, and includes
    // the given instruction.
    Range *getVirtRange(unsigned reg, MachineInstr *inst) {
      const MachineInstr *cinst = const_cast<MachineInstr *>(inst);
      for (list<Range>::iterator it = virtRanges.begin(); it != virtRanges.end(); it++) {
        Range *r = &*it;
        set<const MachineInstr *> *insts = r->insts;
        if (r->reg == reg && insts->find(cinst) != insts->end()) {
          return r;
        }
      }
      cerr << "ERROR: tried to get non-existent virtual range";
      exit(0);
    }
    
  };
  
  // The library-inclusion mechanism requires the following:
  char Gcra::ID = 0;
  
  FunctionPass *createGcra() { return new Gcra(); }
  
  static RegisterRegAlloc register_gcra("gc",
                                        "graph-coloring register allocator",
                                        createGcra);
}
