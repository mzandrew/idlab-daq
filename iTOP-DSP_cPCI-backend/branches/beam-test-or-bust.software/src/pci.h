
char* device_name;   // note: this will point to an argv c-string or a stack variable from main() e.g. DO NOT FREE THIS VARIABLE
char default_device_name[15] = "/dev/altixpci0";	// PCI file handle
stdPCI pci;

