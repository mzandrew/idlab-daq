/*****************************************************************************
**                                                                          **
**  Name:   ezkitBF5xx_initcode EXAMPLE                                     **
**                                                                          **
******************************************************************************

(C) Copyright 2007-2009 - Analog Devices, Inc.  All rights reserved.

Project Name:   ezkitBF5xx_initcode

Version:        v5.0

Last Modified:  02/09/09 ap-muc

Tested
Software:       VisualDSP++ 5.0.6.0 (Update 6)

Supported
Software:       VisualDSP++ 5.0.5.0 (Update 5 and above)

Tested
Hardware:       ADSP-BF518F EZ-Board Rev. 0.1 Silicon Rev. 0.0
                ADSP-BF526 EZ-Board Rev. 0.1 Silicon Rev. 0.0
                ADSP-BF527 EZ-KIT Lite Rev. 1.4 Silicon Rev. 0.0
                ADSP-BF527 EZ-KIT Lite Rev. 1.4 Silicon Rev. 0.2
                ADSP-BF548 EZ-KIT Lite Rev. 1.2 Silicon Rev. 0.0
                ADSP-BF548 EZ-KIT Lite Rev. 1.3 Silicon Rev. 0.1
                ADSP-BF548 EZ-KIT Lite Rev. 1.4 Silicon Rev. 0.2

Supported
Plattforms:     ADSP-BF518F EZ-Board (preliminary settings !!!)
                ADSP-BF526 EZ-Board (preliminary settings !!!)
                ADSP-BF527 EZ-KIT Lite
                ADSP-BF548 EZ-KIT Lite

Connections:    ADDS-HPUSB-ICE

Project
Properties:     Compile : Preprocessor : Additional include directories -> ..\src\
                Link : LDF Preprocessing : Additional include directories -> ..\src\

Hardware
Settings:       default

Purpose:        General Initialization example for ADSP-BF5xx EZ-KIT Lite
                Included are:
                - PLL Settings (optimized for high speed)
                - Voltage Regulator Settings (ADSP-BF51x & ADSP-BF526/4/2 have no internal voltage regulator)
                - EBIU settings for the EZ-KIT Lite (Asynchronous and DDR SDRAM memory)
                - Bit Rate handler for Mode 'Boot from UART host (slave mode)' (Applies to: ADSP-BF518F EZ-Board, ADSP-BF526 EZ-Board, ADSP-BF527 EZ-KIT Lite & ADSP-BF548 EZ-KIT Lite)

Restrictions:   - Wait states for async flash interface are not optimized yet for some examples. Default/Save settings are still included

*****************************************************************************/

/*****************************************************************************
 Include Files
******************************************************************************/

#include "system.h"
#include "UART.h"
#if defined __ADSPBF548__
    #include "NOR_FLASH.h"
#endif

/****************************************************************************
 Main Program
*****************************************************************************/

section ("L1_code")

#if defined __USEBFSYSCONTROL__
    void initcode(ADI_BOOT_DATA* pBS)
#else
    void initcode(void)
#endif
{
    u16 uwIMASK_reg = 0;
    u32 udUART_BIT_RATE = 0;
    u16 uwUARTx_MCR = 0;
    u16 *pTmp = 0;


    /************************************************
    * System Interrupt Wakeup Registers (SIC_IWRx)  *
    * Required for PLL_CTL and VR_CTL configuration *
    * Processor idle and wake up after PLL_LOCKCNT  *
    * expired.Reset = 0xFFFF FFFF                   *
    * disable all other interrupt sources in the    *
    * meantime to disable unwanted wake up events   *
    ************************************************/

    #if defined __ADSPBF54x__
        *pSIC_IWR2 = IWR_DISABLE_ALL;
        *pSIC_IWR1 = IWR_DISABLE_ALL;
    #elif defined (__ADSPBF51x__) || defined (__ADSPBF52x__)
        *pSIC_IWR1 = IWR1_DISABLE_ALL;
    #endif
    *pSIC_IWR0 = IRQ_PLL_WAKEUP;


    #if defined __ACTIVATE_DPM__

        /****************************************
         Mode 'Boot from UART host (slave mode)'
         Save current BIT RATE value
        ****************************************/

        #if defined __ADSPBF51x__
            if ( (*pSYSCR & BMODE) == BMODE_UART0HOST ) udUART_BIT_RATE = uart_get_bitrate();
        #endif

        #if defined __ADSPBF52x__
            if ( ( (*pSYSCR & BMODE) == BMODE_UART0HOST ) || ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) ) udUART_BIT_RATE = uart_get_bitrate();
        #endif

        #if defined __ADSPBF54x__
            if ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) udUART_BIT_RATE = uart_get_bitrate();
        #endif


        /****************************************
         Force transfer stop before changing PLL 
        ****************************************/

        #if defined __ADSPBF54x__
            if ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) uwUARTx_MCR = uart_check_buffer(udUART_BIT_RATE);
        #endif


        /***************************************
         Description:   Dynamic Power Managment
        ***************************************/

        if ( verify_clocks(0,0,0) == NO_ERR ) { full_on(); }
        else { asm("EMUEXCPT;"); while(1); }


        /*******************************************************
         Mode 'Boot from UART host (slave mode)'
         Update UART Divisor latch register UART_DLH & UART_DLL
         accroding to new system clock frequency
        *******************************************************/

        #if defined __ADSPBF51x__
            if ( (*pSYSCR & BMODE) == BMODE_UART0HOST ) uart_set_bitrate(udUART_BIT_RATE);
        #endif

        #if defined __ADSPBF52x__
            if ( ( (*pSYSCR & BMODE) == BMODE_UART0HOST ) || ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) ) uart_set_bitrate(udUART_BIT_RATE);
        #endif

        #if defined __ADSPBF54x__
            if ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) uart_set_bitrate(udUART_BIT_RATE);
        #endif


        /************************************
         Restore UART Modem Control Register 
        ************************************/

        #if defined __ADSPBF54x__
            if ( (*pSYSCR & BMODE) == BMODE_UART1HOST ) *pUART1_MCR = uwUARTx_MCR;
        #endif

    #endif /* __ACTIVATE_DPM__ */


    /*****************************************************************************
     Description:   Configure EBIU
    ******************************************************************************/


    /*****************************************************************************
     Description:   Configure and enable Asynchronous memory & Flash Mode
    ******************************************************************************/


    /**********************************************
    * Asynchronous Memory Bank Control 0 Register *
    **********************************************/

    *pEBIU_AMBCTL0 = EBIU_AMBCTL0_VAL;


    /**********************************************
    * Asynchronous Memory Bank Control 1 Register *
    **********************************************/

    *pEBIU_AMBCTL1 = EBIU_AMBCTL1_VAL;


    /*******************************
    * Memory Mode Control Register *
    *******************************/

    /**********************************************
    * Asynchronous Memory Global Control Register *
    ***********************************************/

    #if defined (__ADSPBF51x__) || defined (__ADSPBF52x__)
        *pEBIU_AMGCTL = EBIU_AMGCTL_VAL;
    #endif


    /*****************************************
    * Configure FLASH Mode                   *
    * Choose ONE of the following options    *
    *****************************************/

    #if defined __ADSPBF54x__
        SetToAsyncMode(); /* default mode */
//        SetToFlashMode();
//        SetToPageMode();
//        SetToBurstMode();
    #endif


    #if defined (__ADSPBF51x__) || defined (__ADSPBF52x__)
    /*****************************************************************************
     Description:   Configure and enable SDRAM

     1. Ensure the clock to the SDRAM is stable after the power has stabilized
        for the proper amount of time (typically 100 us).
     2. Write to the SDRAM refresh rate control register (EBIU_SDRRC).
     3. Write to the SDRAM memory bank control register (EBIU_SDBCTL).
     4. Write to and SDRAM memory global control register (EBIU_SDGCTL).
     5. Perform SDRAM access.
    ******************************************************************************/

    /********************************
    * SDRAM Control Status Register *
    ********************************/

    while( (*pEBIU_SDSTAT & SDCI) != SDCI ){}

    /* clear SDRAM EAB sticky error status (W1C) */
    *pEBIU_SDSTAT |= SDEASE;


    /****************************************************************************
    * SDRAM Refresh Rate Control Register                                       *
    * RDIV has always to be re-calculated according to the actual system clock  *
    * You can either use the pre-defined value that fits to the PLL settings or *
    * call get_rdiv() to calculate RDIV 'on the fly'                            *
    ****************************************************************************/

    #if defined EBIU_SDRRC_VAL
        *pEBIU_SDRRC = EBIU_SDRRC_VAL;
    #else
        *pEBIU_SDRRC = get_rdiv();
    #endif


    /*************************************
    * SDRAM Memory Bank Control Register *
    **************************************/

    *pEBIU_SDBCTL = EBIU_SDBCTL_VAL;


    /***************************************
    * SDRAM Memory Global Control Register *
    ***************************************/

    *pEBIU_SDGCTL = EBIU_SDGCTL_VAL;


    /******************************
    * Finalize SDC initialization *
    ******************************/

    pTmp = (u16*) 0x0;
    *pTmp = 0xBEEF;

    while( (*pEBIU_SDSTAT & SDRS) == SDRS ){}


    #endif


    #if defined __ADSPBF54x__
    /*****************************************************************************
     Description:   Configure and enable DDR SDRAM
    ******************************************************************************/

    /******************************************************************************************************
     IMPORTANT:
     According to general DDR-SDRAM specification, a frequency of at least 83MHz is necessary !
     Therefore the PLL has to be set before releasing the DDR controller from reset !
     Do not modify reserved bits in this registers!
    ******************************************************************************************************/

    /*****************************************************************************************************************
     Programming Model:
     Access to the DDR controller registers ONLY can be made after releasing the DDR controller soft reset bit in the
     reset control register by writing a 1 in bit[0] in the register.
     The user may write to the DDR control registers as long as the controller is not accessing memory devices.
     Otherwise, the controller responds to any writes to its registers after it finishes any ongoing memory accesses.
    *****************************************************************************************************************/

    /*************************
    * Reset Control Register *
    **************************/

    *pEBIU_RSTCTL |= DDRSRESET;     /* release the DDR controller from reset as per spec */


    /****************************
    * Memory Control 0 Register *
    ****************************/

    *pEBIU_DDRCTL0 = EBIU_DDRCTL0_VAL;


    /****************************
    * Memory Control 1 Register *
    ****************************/

    *pEBIU_DDRCTL1 = EBIU_DDRCTL1_VAL;


    /****************************
    * Memory Control 2 Register *
    ****************************/

    *pEBIU_DDRCTL2 = EBIU_DDRCTL2_VAL;

    #endif


    /*********************************************
    * Restore System Interrupt Wakeup Registers  *
    *********************************************/

    #if defined (__ADSPBF51x__) || defined (__ADSPBF52x__)
        *pSIC_IWR0 = IWR0_ENABLE_ALL;
        *pSIC_IWR1 = IWR1_ENABLE_ALL;
    #elif __ADSPBF54x__
        *pSIC_IWR0 = IWR_ENABLE_ALL;
        *pSIC_IWR1 = IWR_ENABLE_ALL;
        *pSIC_IWR2 = IWR_ENABLE_ALL;
    #endif


    /* When Compiler Optimization is active, hardware loops are setup for a while loop */
    /* The Loop Count Registers (LC0/LC1) are not necessarily cleared */
    sysreg_write(reg_LC0,0);
    sysreg_write(reg_LC1,0);
}


/****************************************************************************
 EOF
*****************************************************************************/
