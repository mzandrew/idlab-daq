all : work/copper-local-bus-test

work/copper-local-bus-test.o : copper-local-bus-test.c ;
	gcc -o $@ $< -c

work/find_pci_path.o : find_pci_path.c ;
	gcc -o $@ $< -c

work/copper-local-bus-test : work/copper-local-bus-test.o work/find_pci_path.o

