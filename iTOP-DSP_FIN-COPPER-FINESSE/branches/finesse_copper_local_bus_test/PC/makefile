# 2010 mza
# 2012-12-24 updated by mza

default :
	if [ ! -e bin  ]; then mkdir bin ; fi
	if [ ! -e src  ]; then mkdir src ; fi
	if [ ! -e work ]; then mkdir work; fi
	$(MAKE) all

all : bin/copper-local-bus-test bin/finesse-ii-jigu-test 

work/copper-local-bus-test.o : src/copper-local-bus-test.c ;
	gcc -o $@ $< -c

work/finesse-ii-jigu-test.o : src/finesse-ii-jigu-test.c ;
	gcc -o $@ $< -c

work/find_pci_path.o : src/find_pci_path.c ;
	gcc -o $@ $< -c

bin/copper-local-bus-test : work/copper-local-bus-test.o work/find_pci_path.o
	gcc -o $@ $^

bin/finesse-ii-jigu-test : work/finesse-ii-jigu-test.o work/find_pci_path.o
	gcc -o $@ $^

