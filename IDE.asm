IDE_LB      equ 4000h
IDE_HB      equ 4001h
IDE_CACHE   equ 4000h
IDE_ID      equ 41FFh

IDE_BANK    equ 0000001b

IDE_DEVICE  equ 7FD0h
IDE_SEKTOR1 equ 7FD2h
IDE_SEKTOR2 equ 7FD4h
IDE_SEKTOR3 equ 7FD6h
IDE_SEKTOR4 equ 7FD8h

IDE_SESIZE  equ 7FFEh

REG_DP      equ 4000h
REG_EC      equ 4001h
REG_SECTORS equ 4002h
REG_LBA0    equ 4003h
REG_LBA1    equ 4004h
REG_LBA2    equ 4005h
REG_LBA3    equ 4006h
REG_STATUS  equ 4007h

CMD_ID      equ ECh
CMD_RD      equ 20h

IDE_INIT:
; ide_INIT fetches the 0.5KB DEVICE INFORMATION 
    IN B, (MMU_BREG)
    LD (K), A
    LD A, MMU_BANK_A
    OUT (MMU_BREG), A

    LD (IDE_SESIZE), 512

    LD A, 0
    IN A, (REG_STATUS)
    BIT 7,A
    JR nz, $-3

    LD A, 0
    IN A, (REG_STATUS)
    BIT 6,A
    JR z, $-3

    OUT (REG_STATUS), CMD_ID

    LD A, 0
    IN A, (REG_STATUS)
    BIT 7,A
    JR nz, $-3

    LD A, 0
    IN A, (REG_STATUS)
    BIT 6,A
    JR z, $-3

    LD A, 00h

    LD IX, IDE_ID
    IN B, (IDE_LB)
    IN C, (IDE_HB)
    LD (IX+A), BC

    ADD A, 2
    JR nc, $-4

    LD A, 00h


    LD IX, IDE_ID
    ADD IX, 255
    IN B, (IDE_LB)
    IN C, (IDE_HB)
    LD (IX+A), BC

    ADD A, 2
    JR nc, $-4

    LD A, (K)
    OUT (MMU_BREG), A
    RET



; IDE READ FUNCTION WILL BE UPDATED LATER
IDE_READ:
    PUSH A
    PUSH BC
    PUSH IX
    LD A, 0
    IN A, (REG_STATUS)
    BIT 7,A
    JRNZ IDE_INIT
    CALL SUB_0

SUB_0:
    LD A, 0
    IN A, (REG_STATUS)
    BIT 6,A
    JRNZ SUB_1
    CALL SUB_0

SUB_1:

    OUT (REG_SECTORS), 1
    OUT (REG_LBA0), IDE_SEKTOR1
    OUT (REG_LBA1), IDE_SEKTOR2
    OUT (REG_LBA2), IDE_SEKTOR3
    OUT (REG_LBA3), IDE_SEKTOR4
    OUT (REG_STATUS), CMD_RD
    LD A, 0
    IN A, (REG_STATUS)
    BIT 7,A
    JRNZ SUB_2
    CALL SUB_2
SUB_2:
    LD A, 0
    IN A, (REG_STATUS)
    BIT 6,A
    JRNZ SUB_3
    CALL SUB_2

SUB_3:
    LD A, 00h
    CALL SUB_4
SUB_4:
    LD IX, IDE_CACHE
    IN B, (IDE_LB)
    IN C, (IDE_HB)
    LD (IX+A), BC

    ADD A, 2
    JP nc, SUB_4
    POP A
    POP BC
    POP IX
    OUT (MMU_BREG), BC
    RET


