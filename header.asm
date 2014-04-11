;BANK MMU

MMU_BANK_A  equ 00000000b
MMU_BANK_B  equ 00000001b
MMU_BANK_C  equ 00000010b
MMU_BANK_D  equ 00000011b
MMU_BANK_E  equ 00000100b
MMU_BANK_F  equ 00000101b
MMU_BANK_G  equ 00000110b
MMU_BANK_H  equ 00000111b

;IDE Sektroengröße
IDE_512     equ 1FFh
IDE_1K      equ 2FFh


;IR_LATCHES
IR_CTC  equ F000h
IR_SIO  equ F001h
IR_PS2  equ F002h
IR_IO   equ F003h


;SPEICHER UND I/O Adressen

BOOT_ROM    equ 0000h
PRG_CACH    equ 3000h
IDE_ID      equ 4000h
IDE_CACHE   equ 4200h
MEMORY      equ 8000h
KEYB_STAT   equ 4400h


MEM_IRQ     equ 7FF0h
MEM_NMI     equ 7FF3h
MEM_RST     equ 7FF7h

MEM_SEC     equ 7FE0h
MEM_MIN     equ 7FE1h
MEM_HR      equ 7FE2h

IDE_SESIZE  equ 7FFEh

IRQ_MANAGE  equ 0001h

MMU_BREG    equ f000h

;XR68C681
SIO_A_MODE  equ 1000h
SIO_A_RX    equ 1003h
SIO_A_TX    equ 1003h
SIO_A_COM   equ 1002h
SIO_A_CLOCK equ 1001h
SIO_B_MODE  equ 1008h
SIO_B_RX    equ 100Bh
SIO_B_TX    equ 100Bh
SIO_B_COM   equ 100Ah
SIO_B_CLOCK equ 1009h
SIO_IP      equ 100Dh
SIO_OPCR    equ 100Dh
SIO_IMR     equ 1005h
SIO_ISR     equ 1005h
SIO_AUX     equ 1004h

;RTC-72421
RTC_SEC_1   equ 2000h
RTC_SEC_10  equ 2001h
RTC_MIN_1   equ 2002h
RTC_MIN_10  equ 2003h
RTC_HR_1    equ 2004h
RTC_PAM     equ 2005h
RTC_DAY_1   equ 2006h
RTC_DAY_10  equ 2007h
RTC_MON_1   equ 2008h
RTC_MON_10  equ 2009h
RTC_YR_1    equ 200Ah
RTC_YR_10   equ 200Bh
RTC_WEK     equ 200Ch

;VT82C42
PS2_STAT    equ 3001h ;read-only
PS2_COMM    equ 3001h ;write-only

;MOS6581
SID_FM_NOIS equ 0000001b
SID_FM_SQUA equ 0000010b
SID_FM_SAW  equ 0000100b
SID_FM_TRI  equ 0001000b

SID_V1_FRL  equ 3000h   ;Frequenz low-byte
SID_V1_FRH  equ 3001h   ;Frequenz high-byte
SID_V1_PWL  equ 3002h   ;PW low-byte
SID_V1_PWH  equ 3003h   ;PW high-byte
SID_V1_CONT equ 3004h   ;Steuerregister
SID_V1_ATDL equ 3005h   ;Attack/Decay
SID_V1_SURE equ 3006h   ;Sustain/release

SID_V2_FRL  equ 3007h   ;Frequenz low-byte
SID_V2_FRH  equ 3008h   ;Frequenz high-byte
SID_V2_PWL  equ 3009h   ;PW low-byte
SID_V2_PWH  equ 300Ah   ;PW high-byte
SID_V2_CONT equ 300Bh   ;Steuerregister
SID_V2_ATDL equ 300Ch   ;Attack/Decay
SID_V2_SURE equ 300Dh   ;Sustain/release

SID_V3_FRL  equ 300Eh   ;Frequenz low-byte
SID_V3_FRH  equ 300Fh   ;Frequenz high-byte
SID_V3_PWL  equ 3010h   ;PW low-byte
SID_V3_PWH  equ 3011h   ;PW high-byte
SID_V3_CONT equ 3012h   ;Steuerregister
SID_V3_ATDL equ 3013h   ;Attack/Decay
SID_V3_SURE equ 3014h   ;Sustain/release

SID_FL_MODE equ 3018h   ;Modus / Lautstärke
SID_FL_VUFI equ 3017h   ;Auflösung / Filter

CHAR_ESC    equ 1Bh
CHAR_CSI    equ 133
CHAR_AS0    equ
