void MainWND::USB_SYNC(bool ENABLE) {
    stdUSB in; in.createHandles();
    if(ENABLE != false) { in.sendData((unsigned int)0x00010001);//enable USB_SYNC
    } else {              in.sendData((unsigned int)0x00000001);//disable USB_SYNC }
    in.freeHandles();
}
void MainWND::SOFT_TRIG() {
    stdUSB in; in.createHandles();
    in.sendData((unsigned int)0x00000002);//software trigger
    in.freeHandles();
}
void MainWND::W_EN(bool ENABLE) {
    stdUSB in; in.createHandles();
    if(ENABLE != false) { in.sendData((unsigned int)0x00010003);//enable USB_SYNC
    } else {              in.sendData((unsigned int)0x00000003);//disable USB_SYNC }
    in.freeHandles();
}
void MainWND::WADDR(unsigned int W_ADDR) {
    stdUSB in; in.createHandles();
    const unsigned int mask = 0x00000004;
    unsigned int ManualData;
    ManualData = (W_ADDR << 16) | mask;
    in.sendData(ManualData);
    in.freeHandles();
}
void MainWND::WRITE_RAM(unsigned int ADC0, unsigned int ADC1) {
    static unsigned short int counter = 0;
    static unsigned int a = 0;
    stdUSB in; in.createHandles();
    const unsigned int mask = 0x00000005;
    unsigned int ManualData;
    ManualData = (ADC0 << 20) | (ADC1 << 8) | mask;
    a = ADC0;
    counter++;
    in.sendData(ManualData);
    in.freeHandles();
}
void MainWND::W_STRB() {
    stdUSB in;
    in.createHandles();
    in.sendData((unsigned int)0x00000006);//software trigger
    in.freeHandles();
}
void MainWND::TX_LENGTH(unsigned int LENGTH) {
    stdUSB in;
    in.createHandles();
    const unsigned int mask = 0x00000007;
    unsigned int ManualData;
    ManualData = (LENGTH << 16) | mask;
    in.sendData(ManualData);
    in.freeHandles();
}

