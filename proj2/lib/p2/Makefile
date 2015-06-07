DEBUG = ../../Debug/lib
OBJS = liveVars.o

$(DEBUG)/P2.so: $(OBJS)
	mkdir -p $(DEBUG)
	g++ $(OBJS) -shared -o $@ -fPIC

%.o: %.cpp
	g++ -c `llvm-config --cppflags` -g -fPIC $< -o $@

clean:
	rm -f $(DEBUG)/P2.so $(OBJS)
