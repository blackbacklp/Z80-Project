include 'header.asm'
include 'boot.asm'
include 'IDE.asm'

call init_System


init_System:

    OUT (MMU_BREG), MMU_BANK_A ; Memory Bank A

    call init_memory
    call init_SID
    call init_IDE
    jp startup

SUB_SWBANK:
    LD A, 7FFFh
    RLA
    LD MMU_BREG, A
SUB_BANK0:
    LD MMU_BREG, 00000001b
    RET
SUB_BANK1:
    LD MMU_BREG, 00000010b
    RET
SUB_BANK2:
    LD MMU_BREG, 00000100b
    RET
SUB_BANK3:
    LD MMU_BREG, 00001000b
    RET
SUB_BANK4:
    LD MMU_BREG, 00010000b
    RET
SUB_BANK5:
    LD MMU_BREG, 00100000b
    RET
SUB_BANK6:
    LD MMU_BREG, 01000000b
    RET
SUB_BANK7:
    LD MMU_BREG, 10000000b
    RET


startup:
    ;init SIO Intrrupt
    LD A, 01100110
    OUT (SIO_IMR), A

    ;init SIO Clock
    LD A, 0Ah
    OUT (SIO_A_COM), A
    LD A, 08h
    OUT (SIO_A_COM), A
    LD A, 10000000b
    OUT (SIO_AUX), A
    LD A, 88h
    OUT (SIO_A_CLOCK), A

    


