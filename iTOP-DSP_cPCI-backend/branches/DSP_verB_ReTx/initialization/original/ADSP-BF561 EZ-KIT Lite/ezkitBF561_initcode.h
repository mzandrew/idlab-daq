/****************************************************************************
 Include Section
*****************************************************************************/

/*****************************************************************************
 Symbolic constants / definitions
******************************************************************************/

#define PLL_WAKEUP_IRQ          0x00000001          /* PLL Wakeup Interrupt Request */
#define IRQ_PLL_WAKEUP          0x00000001          /* PLL Wakeup Interrupt Request */
#define SYSCR                   SICA_SYSCR          /* System Reset Configuration register for Core A */
#define SIC_IWR0                SICA_IWR0           /* SIC Interrupt Wakeup-Enable register 0 */
#define SIC_IWR1                SICA_IWR1           /* SIC Interrupt Wakeup-Enable register 1 */

/*****************************************************************************
 Dynamic Power Managment
*****************************************************************************/

/*************************************************
* To activate PLL and Voltage Regulator settings *
* uncomment the following definition             *
*************************************************/

//#define __ACTIVATE_DPM__


/********************************
* PLL Control Register Value    *
* Reset = 0x1400                *
* ADSP-BF561 EZ-KIT Lite:       *
* CLKIN = 30MHz                 *
* MSEL = 17                     *
* --> VCO = 30MHz x 17 = 510MHz *
********************************/

#define PLL_CTL_VAL             (\
                               nBYPASS          |   /* Bypass the PLL */\
                               nOUT_DELAY       |   /* Add 200ps Delay To EBIU Output Signals */\
                               nIN_DELAY        |   /* Add 200ps Delay To EBIU Input Latches */\
                               nPDWN            |   /* Enter Deep Sleep Mode */\
                               nSTOPCK          |   /* Core Clock Off */\
                               nPLL_OFF         |   /* PLL Not Powered */\
                               nPLL_CLKIN_DIV2  |   /* Pass CLKIN/2 to PLL */\
                                SET_MSEL(17)    |   /* Set MSEL = 0-63 --> VCO = CLKIN*MSEL */\
                                0)

#define CLKIN_Hz                 30000000           /* CLKIN [Hz] */
#define VCO_MAX_Hz              600000000           /* VCO [Hz] */
#define VCO_MIN_Hz               50000000           /* VCO [Hz] */


/***********************************
* PLL Divide Register Value        *
* Reset = 0x0005                   *
* ADSP-BF561 EZ-KIT Lite:          *
* CSEL = 1                         *
* --> CCLK = VCO / CSEL            *
* --> CCLK = 510MHz / 1 = 510MHz   *
* SSEL = 4                         *
* --> SCLK = VCO / SSEL            *
* --> SCLK = 510MHz / 4 = 127.5MHz *
***********************************/

#define PLL_DIV_VAL             (\
                                SET_SSEL(4)     |   /* Set SSEL = 1-15 --> SCLK = VCO/SSEL */\
                                CCLK_DIV1       |   /* CCLK = VCO / 1 */\
                                0)

#define CCLK_MAX_Hz             VCO_MAX_Hz          /* Maximum Core Clock [Hz] */
#define SCLK_MAX_Hz             133000000           /* Maximum System Clock [Hz] */


/********************************
* PLL Lock Count Register Value *
* Reset = 0x0200                *
********************************/

#define PLL_LOCKCNT_VAL         0x0200


/****************************
* PLL Status Register Value *
* Reset = 0x00A2            *
****************************/

#define PLL_STAT_VAL            (\
                                VSTAT               |   /* Voltage Regulator Status: Regulator at programmed voltage */\
                               nCORE_IDLE           |   \
                                PLL_LOCKED          |   /* PLL Locked Status */\
                               nSLEEP               |   \
                               nDEEP_SLEEP          |   \
                               nACTIVE_PLLDISABLED  |   /* Active Mode With PLL Disabled */\
                                FULL_ON             |   /* Full-On Mode */\
                               nACTIVE_PLLENABLED   |   /* Active Mode With PLL Enabled */\
                                0)


/*******************************************
* Voltage Regulator Control Register Value *
* Reset = 0x00DB                           *
*******************************************/

#define VR_CTL_VAL              (\
                               nSCKELOW         |   /* Do Not Drive SCKE High During Reset After Hibernate */\
                               nWAKE            |   /* Enable RTC/Reset Wakeup From Hibernate */\
                                VLEV_125        |   /* VLEV = 1.25 V (-5% - +10% Accuracy) */\
                                GAIN_20         |   /* GAIN = 20 */\
                                FREQ_1000       |   /* Switching Frequency Is 1 MHz */\
                                 0)


/*****************************************************************************
 EBIU: Asynchronous Memory
*****************************************************************************/


/****************************************************
* Asynchronous Memory Global Control Register Value *
* Reset = 0x00F2                                    *
* ADSP-BF561-proc.xml = 0x00FF                      *
* --> Enabling all four Async Banks and Clock Out   *
****************************************************/

#define EBIU_AMGCTL_VAL         (\
                               nCDPRIO          |   /* Core/DMA Priority */\
                                B0_PEN          |   /* Enable 16-bit packing Bank 0 */\
                                B1_PEN          |   /* Enable 16-bit packing Bank 1 */\
                                B2_PEN          |   /* Enable 16-bit packing Bank 2 */\
                                B3_PEN          |   /* Enable 16-bit packing Bank 3 */\
                                AMCKEN          |   /* Enable CLKOUT */\
                                AMBEN_ALL       |   /* 4MB Asynchronous Memory */\
                                0)


/****************************************************
* Asynchronous Memory Bank Control 0 Register Value *
* Reset = 0xFFC2 FFC2                               *
****************************************************/

#define EBIU_AMBCTL0_VAL        (\
                                B1WAT_15        |   /* B1 Write Access Time = 15 cycles */\
                                B1RAT_15        |   /* B1 Read Access Time = 15 cycles */\
                                B1HT_3          |   /* B1 Hold Time (nRead/Write to nAOE) = 3 cycles */\
                                B1RDYPOL        |   /* B1 RDY Active High */\
                                B0WAT_15        |   /* B0 Write Access Time = 15 cycles */\
                                B0RAT_15        |   /* B0 Read Access Time = 15 cycles */\
                                B0HT_3          |   /* B0 Hold Time (nRead/Write to nAOE) = 3 cycles */\
                                B0RDYPOL        |   /* B0 RDY Active High */\
                                0)


/****************************************************
* Asynchronous Memory Bank Control 1 Register Value *
* Reset = 0xFFC2 FFC2                               *
****************************************************/

#define EBIU_AMBCTL1_VAL        (\
                                B3WAT_15        |   /* B3 Write Access Time = 15 cycles */\
                                B3RAT_15        |   /* B3 Read Access Time = 15 cycles */\
                                B3HT_3          |   /* B3 Hold Time (nRead/Write to nAOE) = 3 cycles */\
                                B3RDYPOL        |   /* B3 RDY Active High */\
                                B2WAT_15        |   /* B2 Write Access Time = 15 cycles */\
                                B2RAT_15        |   /* B2 Read Access Time = 15 cycles */\
                                B2HT_3          |   /* B2 Hold Time (nRead/Write to nAOE) = 3 cycles */\
                                B2RDYPOL        |   /* B2 RDY Active High */\
                                0)


/*****************************************************************************
 EBIU: SDRAM Memory

       SDRAM Setup according to ADSP-BF561 EZ-KIT Lite

       SDRAM Device = MT48LC16M16A2P-75
 
       NRA  = 8192
       tRef = 64ms
       tRAS = 44ns
       tRP  = 20ns

       always round up tRAS and tRP values
       RDIV = ( ( SCLK[MHz] * tREF[ms] ) / NRA ) - ( tRAS + tRP ) [clock cycles]
 
       Note: with a 30MHz crystal the default SCLK rate is 60MHz on the EZ-KIT Lite.
*****************************************************************************/


/********************************************
* SDRAM Refresh Rate Control Register Value *
* Reset = 0x081A                            *
* ADSP-BF561-proc.xml = 0x01D0              *
* here = 0x03DA, SCLK @ 127.5MHz            *
* Hint: The refresh rate is calculated at   *
* runtime in the current implementation.    *
* Uncomment the definition below to set     *
* a fixed pre-defined value                 *
********************************************/

//#define EBIU_SDRRC_VAL          0x03DA

#define NRA                     8192                /* [int] */
#define tREF                    64                  /* [ms] */


/*********************************************
* SDRAM Memory Global Control Register Value *
* Reset = 0xE008 8849                        *
* ADSP-BF561-proc.xml = 0x0091 998D          *
* here = 0x0099 998D                         *
* Additional Requirement:                    *
* tRAS + tRP >= max(tRC,tRFC,tXSR)           *
* EBIU internal calculation:                 *
* tRC = tRAS + tRP                           *
* tRFC = tRC                                 *
* tXSR = tRC                                 *
*********************************************/

#define EBIU_SDGCTL_VAL         (\
                               nCDDBG           |   /* Tristate SDRAM Controls During Bus Grant */\
                               nTCSR            |   /* Temp-Compensated Self-Refresh Value (85/45* Deg C) */\
                               nEMREN           |   /* Extended Mode Register Enable */\
                               nFBBRW           |   /* Enable Fast Back-To-Back Read To Write */\
                               nEBUFE           |   /* Enable External Buffering Timing */\
                               nSRFS            |   /* Enable SDRAM Self-Refresh Mode */\
                               nPSM             |   /* Power-Up Sequence (Mode Register Before/After* Refresh) */\
                               nPUPSD           |   /* Power-Up Start Delay (15 SCLK Cycles Delay) */\
                                SCTLE           |   /* Enable SDRAM Signals */\
                                PSS             |   /* Enable Power-Up Sequence on Next SDRAM Access */\
                                TWR_2           |   /* SDRAM tWR = 2 cycle */\
                                TRCD_3          |   /* SDRAM tRCD = 3 cycles */\
                                TRP_3           |   /* SDRAM tRP = 3 cycles */\
                                TRAS_7          |   /* SDRAM tRAS = 7 cycles */\
                                PASR_ALL        |   /* All 4 SDRAM Banks Refreshed In Self-Refresh */\
                                CL_3            |   /* SDRAM CAS Latency = 3 cycles */\
                                0)


/*******************************************
* SDRAM Memory Bank Control Register Value *
* Reset = 0x0000 0000                      *
* ADSP-BF561-proc.xml = 0x0000 0015        *
* here = 0x0025                            *
*******************************************/

#define EBIU_SDBCTL_VAL         (\
                                EB0_E           |   /* Enable SDRAM External Bank */\
                                EB0_SZ_64       |   /* SDRAM External Bank Size = 64MB */\
                                EB0_CAW_9       |   /* SDRAM External Bank Column Address Width = 9 Bits */\
                                0)


/****************************************************************************
 EOF
*****************************************************************************/
