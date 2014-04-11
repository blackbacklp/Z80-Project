include 'header.asm'

init_memory:
    LD IX, CHACHE_RAM

    LD (IX), 00h
    INC IX
    JP nc, init_memory

    LD IX, MEM_IRQ
    LD (IX), 00h
    LD (IX+1), 00h

    LD IX, MEM_NMI
    LD (IX), 00h
    LD (IX+1), 00h

    LD IX, MEM_RST
    LD (IX), 00h
    LD (IX+1), 00h

    LD (IDE_SESIZE), IDE_512
    RET

init_UART:

    LD A, 01100110
    OUT (SIO_IMR), A
    RET

init_SID:

    LD A, 00000000b
    OUT (SID_V1_ATDL), A
    LD A, 11110000b
    OUT (SID_V1_SURE), A
    OUT (SID_V1_MODE), SID_FM_SQUA
    LD A, 9
    OUT (SID_V1_FRL), A
    LD A, 196
    OUT (SID_V1_FRH), A
    LD A, 0
    CALL waitA
    RET

waitA:
    INC A
    NOP
    NOP
    JP nc, waitA
    LD A, 0
    OUT (SID_V1_FRL), A
    LD A, 0
    OUT (SID_V1_FRH), A
    RET



init_keyboardController:
    LD A, A8h
    OUT (PS2_COMM), A   ;tastatur aktiviren

    LD A, A9h
    OUT (PS2_COMM), A   
    IN A, (PS2_STAT)
    ADD FF
    JR C , $+7
    LD HL,  KEYB_STAT
    SET 0, HL
    JR $+2
    RESET 0, HL

    LD A, AAh
    OUT (PS2_COMM), A
    IN A, (PS2_STAT)
    DEC 54h
    JR Z , $+7
    LD HL,  KEYB_STAT
    SET 1, HL
    JR $+2
    RESET 1, HL

    LD A, ABh
    OUT (PS2_COMM), A
    IN A, (PS2_STAT)
    ADD FF
    JR C , $+7
    LD HL,  KEYB_STAT
    SET 2, HL
    JR $+2
    RESET 2, HL
    RET

init_INT:
    ID
    IM2
    LD I, 45h
    LD A, 00h
    OUT (IR_CTC), A
    LD A, 40h
    OUT (IR_SIO), A
    LD A, 80h
    OUT (IR_IO), A
    LD A, B0h
    OUT (IR_PS2), A
    IE
    

