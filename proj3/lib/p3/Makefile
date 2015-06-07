DEBUG = ../../Debug/lib
OBJS = loopInv.o

$(DEBUG)/P3.so: $(OBJS)
	mkdir -p $(DEBUG)
	g++ $(OBJS) -shared -o $@ -fPIC

%.o: %.cpp
	g++ -c `llvm-config --cppflags` -g -fPIC $< -o $@

clean:
	rm -f $(DEBUG)/P3.so $(OBJS)
