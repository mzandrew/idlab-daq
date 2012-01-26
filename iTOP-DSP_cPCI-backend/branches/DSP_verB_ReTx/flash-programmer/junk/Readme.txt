
R e a d m e . t x t 

ADSP-BF561 EZ-KIT Flash Programmer Driver
-- ST. M29W640DT --

Date Created:	11/16/06
_____________________________________________________________________

C o n t e n t s 

I.    Overview
II.   Required Hardware
III.  Deliverables

NOTE:
If you take a look at the schematics for the ADSP-BF561 EZ-KIT A1-A21 
of the flash is connected to A2-A22 of the DSP because A0 and A1 do 
not exist on the DSP. Because of this whenever we put an 8 bit command 
on the bus it actually is a 16 bit command when it gets to the 
connection with the flash. So if we put a 0xAAA on the bus the flash 
sees that as 0x554 and if we put an 0x554 on the bus the flash sees 
that as a 0x2AA.

We use 0x554 because if we use a 0x555 we will trigger a misaligned access 
exception in EXCAUSE since only 16 bit writes are supported to ASYNC memory.

This is also the same reasoning as to why when loading the driver in the 
flash programmer, you will see a sector map that uses the 8 bit address 
ranges. When these addresses are placed on the bus, they are shifted, 
and are actually seen as 16-bit addresses.


I. Overview

The flash programmer driver is an example that demonstrates the use
of flash driver to implement new algorithms, modify existing ones, 
or add support for a new flash device/DSP combination. After creating 
the flash driver, you must load it onto the DSP using the ADI Flash 
Programmer utility.The Flash Programmer is installed with VisualDSP++ 
and is accessible from the "Tools" pull-down menu

The program includes all the source code for the top-end dxe and the 
flash specific library. The library adheres to the ADI Driver Model 
which is new in VDSP++ 4.0 and has a straight-forward API and powerful 
support libraries that simplify the process of creating custom drivers 
and applications.


II. Required Hardware 

The harware requirements of the flash driver example are:

 * Blackfin ADSP-BF561 EZ-KIT Lite evaluation system
 * High-Performance PCI Emulator, HP-USB ICE, or Blackfin ADSP-BF561 
   EZ-KIT Lite evaluation system (using supplied USB debug agent)


III. Deliverables

All the flash driver examples ship pre-built but you can rebuild them
yourself.  The source files for both the top-end dxe and the flash 
specific library are included in the diresctory structure shown below:


+---Blackfin
    +---Examples
    ¦   +---ADSP-BF561 EZ-KIT Lite
    ¦   ¦   +---Flash Programmer 	[Top-end dxe]
    ¦	¦	BF561EzFlashDriver.dpj
    ¦	¦	BF561EzFlashDriver.dxe
    ¦	¦	main.c
    ¦	+---include
    ¦		+---drivers
    ¦	   	    +---flash
    ¦	       		adi_m29w64d.h
    ¦	           	Errors.h
    ¦	           	util.h
    ¦           	adi_flash.h    
    +---lib
    	+---src
    	    +---drivers
    	        +---flash
    	            +---M29W64D 	[Flash specific library]
                            adi_m29w64d.c
                            M29W64D_BF561.dpj

        
           
     
     
_____________________________________________________________________
		
