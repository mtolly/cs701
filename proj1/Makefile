# Retain intermediate bitcode files
.PRECIOUS: %.bc

# The default target builds the plugin
plugin:
	make -C lib/p1

# create .bc from source
%.bc:	%.c
	clang -emit-llvm -O0 -c $*.c -o $*.bc

# create human-readable assembly (.ll) from .bc
%.ll: %.bc
	llvm-dis -f $^

# create executable from .bc
%.exe: %.bc
	llc $^
	gcc $*.s -o $*.exe

# create bitcode optimized to keep vars in registers
%.mem2reg: %.bc
	opt -mem2reg $^ -o $*.mem2reg
	mv $*.mem2reg $*.bc

# run printCode on a .bc file
%.printCode: %.bc plugin
	opt -load Debug/lib/P1.so -printCode $*.bc > /dev/null

# run optLoads on a .bc file, creating a new .bc file
%.optLoads: %.bc plugin
	opt -load Debug/lib/P1.so -optLoads $*.bc -o $*.optLoads
	mv $*.optLoads $*.bc

# run mem2reg then sameRhs on a .c file, creating a .bc file
%.sameRhs: %.bc plugin
	opt -mem2reg $*.bc -o $*.mem2reg
	mv $*.mem2reg $*.bc
	opt -load Debug/lib/P1.so -sameRhs $*.bc -o $*.sameRhs
	mv $*.sameRhs $*.bc

# clean up generated files
clean:
	make -C lib/p1 clean
	rm -f *.bc *.exe *.ll *.s
