DEBUG = ../../Debug/lib
OBJS = Gcra.o RDfact.o

$(DEBUG)/P4.so: $(OBJS)
	mkdir -p $(DEBUG)
	g++ $(OBJS) -shared -o $@ -fPIC

Gcra.o: Gcra.cpp RDfact.h 
	g++ -c `llvm-config --cxxflags` -g -fPIC $< -o Gcra.o

RDfact.o: RDfact.cpp RDfact.h
	g++ -c `llvm-config --cxxflags` -g -fPIC $< -o RDfact.o

clean:
	rm -f $(DEBUG)/P4.so $(OBJS)
