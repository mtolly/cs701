# The default target builds the plugin
plugin:
	make -C lib/p4

.PRECIOUS: %.bc
.PRECIOUS: %.exe

%.bc:	%.c
	clang -emit-llvm -O0 -c $*.c -o $*.bc
	opt -mem2reg $*.bc > $*.ssa
	mv $*.ssa $*.bc

%.reg: %.bc
	llc -load Debug/lib/P4.so -regalloc=gc $*.bc
#	gcc $*.s -o $*.exe

clean:
	make -C lib/p4 clean
	rm -f *.bc *.ll *.s *.exe *~
