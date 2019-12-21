opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6446"

opt pagewidth 120

	opt pm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcdinit
	FNCALL	_main,_lcddata
	FNCALL	_main,_scan_key
	FNCALL	_main,_get_num
	FNCALL	_main,_lcdcmd
	FNCALL	_main,___awtoft
	FNCALL	_main,_disp_num
	FNCALL	_main,___wmul
	FNCALL	_main,___ftdiv
	FNCALL	_disp_num,___ftmul
	FNCALL	_disp_num,___fttol
	FNCALL	_disp_num,___wmul
	FNCALL	_disp_num,_lcddata
	FNCALL	_disp_num,___awdiv
	FNCALL	_disp_num,___bmul
	FNCALL	_disp_num,___awmod
	FNCALL	_disp_num,_lcdcmd
	FNCALL	_scan_key,_lcddata
	FNCALL	_lcdinit,_lcdcmd
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNROOT	_main
	global	_s
	global	_s2
	global	_s1
	global	_s3
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	24

;initializer for _s
	retlw	045h
	retlw	04Eh
	retlw	054h
	retlw	045h
	retlw	052h
	retlw	020h
	retlw	031h
	retlw	020h
	retlw	04Eh
	retlw	04Fh
	retlw	03Dh
	retlw	020h
	retlw	0
	line	26

;initializer for _s2
	retlw	04Fh
	retlw	050h
	retlw	045h
	retlw	052h
	retlw	041h
	retlw	054h
	retlw	04Fh
	retlw	052h
	retlw	020h
	retlw	03Dh
	retlw	020h
	retlw	0
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	line	25

;initializer for _s1
	retlw	045h
	retlw	04Eh
	retlw	054h
	retlw	045h
	retlw	052h
	retlw	020h
	retlw	032h
	retlw	020h
	retlw	04Eh
	retlw	04Fh
	retlw	03Dh
	retlw	020h
	retlw	0
	line	27

;initializer for _s3
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	052h
	retlw	045h
	retlw	053h
	retlw	055h
	retlw	04Ch
	retlw	054h
	retlw	02Ah
	retlw	02Ah
	retlw	02Ah
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_RD6
_RD6	set	70
	global	_RD7
_RD7	set	71
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISD6
_TRISD6	set	1094
	global	_TRISD7
_TRISD7	set	1095
	file	"calculator with PIC16f877.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	24
_s:
       ds      13

psect	dataBANK0
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	26
_s2:
       ds      12

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	25
_s1:
       ds      13

psect	dataBANK1
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	27
_s3:
       ds      13

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+26)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+25)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcdcmd
?_lcdcmd:	; 0 bytes @ 0x0
	global	??_lcdcmd
??_lcdcmd:	; 0 bytes @ 0x0
	global	?_lcddata
?_lcddata:	; 0 bytes @ 0x0
	global	??_lcddata
??_lcddata:	; 0 bytes @ 0x0
	global	?_lcdinit
?_lcdinit:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_scan_key
?_scan_key:	; 1 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?_get_num
?_get_num:	; 2 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	ds	1
	global	??_get_num
??_get_num:	; 0 bytes @ 0x2
	global	get_num@ch
get_num@ch:	; 1 bytes @ 0x2
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	lcdcmd@value
lcdcmd@value:	; 1 bytes @ 0x3
	global	lcddata@value
lcddata@value:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	??_scan_key
??_scan_key:	; 0 bytes @ 0x4
	global	??_lcdinit
??_lcdinit:	; 0 bytes @ 0x4
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	scan_key@d
scan_key@d:	; 1 bytes @ 0x7
	ds	1
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	scan_key@c
scan_key@c:	; 1 bytes @ 0x8
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	ds	3
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0xB
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0xB
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x0
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x0
	ds	3
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x3
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x3
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x4
	ds	2
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x6
	ds	2
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x8
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x9
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x9
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x9
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0xA
	ds	2
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xC
	ds	1
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0xD
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0xE
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0xF
	ds	3
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x12
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x13
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x16
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x17
	ds	1
	global	?_disp_num
?_disp_num:	; 0 bytes @ 0x18
	global	disp_num@num
disp_num@num:	; 3 bytes @ 0x18
	ds	3
	global	??_disp_num
??_disp_num:	; 0 bytes @ 0x1B
	ds	3
	global	disp_num@j
disp_num@j:	; 2 bytes @ 0x1E
	ds	2
	global	disp_num@UnitDigit
disp_num@UnitDigit:	; 1 bytes @ 0x20
	ds	1
	global	disp_num@decimal
disp_num@decimal:	; 1 bytes @ 0x21
	ds	1
	global	disp_num@TenthDigit
disp_num@TenthDigit:	; 1 bytes @ 0x22
	ds	1
	global	disp_num@numb
disp_num@numb:	; 2 bytes @ 0x23
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x25
	ds	3
	global	main@ke
main@ke:	; 1 bytes @ 0x28
	ds	1
	global	main@key
main@key:	; 1 bytes @ 0x29
	ds	1
	global	main@key1
main@key1:	; 1 bytes @ 0x2A
	ds	1
	global	main@k2
main@k2:	; 2 bytes @ 0x2B
	ds	2
	global	main@k1
main@k1:	; 2 bytes @ 0x2D
	ds	2
	global	main@count
main@count:	; 2 bytes @ 0x2F
	ds	2
;;Data sizes: Strings 0, constant 0, data 51, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     49      74
;; BANK1           80      0      26
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->___awtoft
;;   _disp_num->___fttol
;;   _disp_num->___awtoft
;;   _scan_key->_lcddata
;;   _lcdinit->_lcdcmd
;;   ___awtoft->___ftpack
;;   ___ftmul->___fttol
;;   ___ftdiv->___awtoft
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_disp_num
;;   _disp_num->___ftmul
;;   ___ftmul->___fttol
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                12    12      0    3444
;;                                             37 BANK0     12    12      0
;;                            _lcdinit
;;                            _lcddata
;;                           _scan_key
;;                            _get_num
;;                             _lcdcmd
;;                           ___awtoft
;;                           _disp_num
;;                             ___wmul
;;                            ___ftdiv
;; ---------------------------------------------------------------------------------
;; (1) _disp_num                                            13    10      3    1882
;;                                             24 BANK0     13    10      3
;;                            ___ftmul
;;                            ___fttol
;;                             ___wmul
;;                            _lcddata
;;                            ___awdiv
;;                             ___bmul
;;                            ___awmod
;;                             _lcdcmd
;;                           ___awtoft (ARG)
;;                            ___ftdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _scan_key                                             5     5      0      95
;;                                              4 COMMON     5     5      0
;;                            _lcddata
;; ---------------------------------------------------------------------------------
;; (1) _lcdinit                                              3     3      0      22
;;                                              4 COMMON     3     3      0
;;                             _lcdcmd
;; ---------------------------------------------------------------------------------
;; (1) ___awtoft                                             4     1      3     300
;;                                              8 COMMON     4     1      3
;;                           ___ftpack
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             15     9      6     535
;;                                              9 BANK0     15     9      6
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) ___ftdiv                                             15     9      6     489
;;                                              0 BANK0     15     9      6
;;                           ___ftpack
;;                           ___awtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcddata                                              4     4      0      22
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _lcdcmd                                               4     4      0      22
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              6     2      4     296
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              8     4      4     300
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             13     9      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0      9     9      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (1) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               3     2      1      92
;;                                              0 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _get_num                                              3     1      2      22
;;                                              0 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcdinit
;;     _lcdcmd
;;   _lcddata
;;   _scan_key
;;     _lcddata
;;   _get_num
;;   _lcdcmd
;;   ___awtoft
;;     ___ftpack
;;     ___wmul (ARG)
;;   _disp_num
;;     ___ftmul
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol
;;       ___ftpack (ARG)
;;     ___wmul
;;     _lcddata
;;     ___awdiv
;;     ___bmul
;;     ___awmod
;;     _lcdcmd
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___wmul (ARG)
;;     ___ftdiv (ARG)
;;       ___ftpack
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___wmul (ARG)
;;   ___wmul
;;   ___ftdiv
;;     ___ftpack
;;     ___awtoft (ARG)
;;       ___ftpack
;;       ___wmul (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      1A       7       32.5%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      73      12        0.0%
;;ABS                  0      0      70       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     31      4A       5       92.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 40 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  count           2   47[BANK0 ] unsigned int 
;;  k1              2   45[BANK0 ] int 
;;  k2              2   43[BANK0 ] int 
;;  key1            1   42[BANK0 ] unsigned char 
;;  key             1   41[BANK0 ] unsigned char 
;;  ke              1   40[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcdinit
;;		_lcddata
;;		_scan_key
;;		_get_num
;;		_lcdcmd
;;		___awtoft
;;		_disp_num
;;		___wmul
;;		___ftdiv
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	40
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	41
	
l2500:	
;calc.c: 41: TRISC=0xF0;
	movlw	(0F0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	42
	
l2502:	
;calc.c: 42: TRISB=0x00;
	clrf	(134)^080h	;volatile
	line	43
	
l2504:	
;calc.c: 43: TRISD6=0;
	bcf	(1094/8)^080h,(1094)&7
	line	44
	
l2506:	
;calc.c: 44: TRISD7=0;
	bcf	(1095/8)^080h,(1095)&7
	line	45
	
l2508:	
;calc.c: 45: _delay((unsigned long)((400)*(20e6/4000.0)));
	opt asmopt_off
movlw  11
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	28
movwf	((??_main+0)+0+1),f
	movlw	99
movwf	((??_main+0)+0),f
u1357:
	decfsz	((??_main+0)+0),f
	goto	u1357
	decfsz	((??_main+0)+0+1),f
	goto	u1357
	decfsz	((??_main+0)+0+2),f
	goto	u1357
	clrwdt
opt asmopt_on

	line	47
;calc.c: 47: unsigned int count=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@count)
	clrf	(main@count+1)
	line	50
	
l2510:	
;calc.c: 48: int k2,k1;
;calc.c: 49: char ke,key,key1;
;calc.c: 50: lcdinit();
	fcall	_lcdinit
	line	51
	
l2512:	
;calc.c: 51: PORTC=0xF0;
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	goto	l2518
	line	55
	
l2514:	
;calc.c: 54: {
;calc.c: 55: lcddata(s[count]);
	movf	(main@count),w
	addlw	_s&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_lcddata
	line	56
	
l2516:	
;calc.c: 56: count++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@count),f
	skipnz
	incf	(main@count+1),f
	line	53
	
l2518:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@count),w
	addlw	_s&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l2514
u1310:
	line	59
	
l2520:	
;calc.c: 57: }
;calc.c: 59: ke=scan_key();
	fcall	_scan_key
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@ke)
	line	60
	
l2522:	
;calc.c: 60: k2=get_num(ke);
	movf	(main@ke),w
	fcall	_get_num
	movf	(1+(?_get_num)),w
	movwf	(main@k2+1)
	movf	(0+(?_get_num)),w
	movwf	(main@k2)
	line	62
	
l2524:	
;calc.c: 62: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	63
	
l2526:	
;calc.c: 63: count=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@count)
	clrf	(main@count+1)
	line	65
;calc.c: 65: while(s2[count]!='\0')
	goto	l2532
	line	67
	
l2528:	
;calc.c: 66: {
;calc.c: 67: lcddata(s2[count]);
	movf	(main@count),w
	addlw	_s2&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_lcddata
	line	68
	
l2530:	
;calc.c: 68: count++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@count),f
	skipnz
	incf	(main@count+1),f
	line	65
	
l2532:	
	movf	(main@count),w
	addlw	_s2&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,f
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l2528
u1320:
	line	71
	
l2534:	
;calc.c: 69: }
;calc.c: 71: key=scan_key();
	fcall	_scan_key
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@key)
	line	73
;calc.c: 73: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	74
	
l2536:	
;calc.c: 74: count=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@count)
	clrf	(main@count+1)
	line	76
;calc.c: 76: while(s1[count]!='\0')
	goto	l2542
	line	78
	
l2538:	
;calc.c: 77: {
;calc.c: 78: lcddata(s1[count]);
	movf	(main@count),w
	addlw	_s1&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_lcddata
	line	79
	
l2540:	
;calc.c: 79: count++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@count),f
	skipnz
	incf	(main@count+1),f
	line	76
	
l2542:	
	movf	(main@count),w
	addlw	_s1&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,f
	skipz
	goto	u1331
	goto	u1330
u1331:
	goto	l2538
u1330:
	line	82
	
l2544:	
;calc.c: 80: }
;calc.c: 82: key1=scan_key();
	fcall	_scan_key
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@key1)
	line	83
	
l2546:	
;calc.c: 83: k1=get_num(key1);
	movf	(main@key1),w
	fcall	_get_num
	movf	(1+(?_get_num)),w
	movwf	(main@k1+1)
	movf	(0+(?_get_num)),w
	movwf	(main@k1)
	line	85
	
l2548:	
;calc.c: 85: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	86
	
l2550:	
;calc.c: 86: lcdcmd(0x82);
	movlw	(082h)
	fcall	_lcdcmd
	line	87
	
l2552:	
;calc.c: 87: count=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@count)
	clrf	(main@count+1)
	line	89
;calc.c: 89: while(s3[count]!='\0')
	goto	l2558
	line	91
	
l2554:	
;calc.c: 90: {
;calc.c: 91: lcddata(s3[count]);
	movf	(main@count),w
	addlw	_s3&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_lcddata
	line	92
	
l2556:	
;calc.c: 92: count++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(main@count),f
	skipnz
	incf	(main@count+1),f
	line	89
	
l2558:	
	movf	(main@count),w
	addlw	_s3&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,f
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l2554
u1340:
	line	94
	
l2560:	
;calc.c: 93: }
;calc.c: 94: count=0;
	clrf	(main@count)
	clrf	(main@count+1)
	line	95
	
l2562:	
;calc.c: 95: lcdcmd(0xC0);
	movlw	(0C0h)
	fcall	_lcdcmd
	line	96
	
l2564:	
;calc.c: 96: lcddata(ke);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@ke),w
	fcall	_lcddata
	line	97
	
l2566:	
;calc.c: 97: lcddata(key);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@key),w
	fcall	_lcddata
	line	98
	
l2568:	
;calc.c: 98: lcddata(key1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@key1),w
	fcall	_lcddata
	line	99
	
l2570:	
;calc.c: 99: lcddata(' ');
	movlw	(020h)
	fcall	_lcddata
	line	100
	
l2572:	
;calc.c: 100: lcddata('=');
	movlw	(03Dh)
	fcall	_lcddata
	line	102
;calc.c: 102: switch(key)
	goto	l2584
	line	105
	
l2574:	
;calc.c: 105: disp_num(k1+k2);
	movf	(main@k1+1),w
	movwf	(?___awtoft+1)
	movf	(main@k1),w
	movwf	(?___awtoft)
	movf	(main@k2),w
	addwf	(?___awtoft),f
	skipnc
	incf	(?___awtoft+1),f
	movf	(main@k2+1),w
	addwf	(?___awtoft+1),f
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(?_disp_num)
	movf	(1+(?___awtoft)),w
	movwf	(?_disp_num+1)
	movf	(2+(?___awtoft)),w
	movwf	(?_disp_num+2)
	fcall	_disp_num
	line	106
;calc.c: 106: break;
	goto	l2518
	line	108
	
l2576:	
;calc.c: 108: disp_num(k2-k1);
	movf	(main@k2+1),w
	movwf	(?___awtoft+1)
	movf	(main@k2),w
	movwf	(?___awtoft)
	movf	(main@k1),w
	subwf	(?___awtoft),f
	movf	(main@k1+1),w
	skipc
	decf	(?___awtoft+1),f
	subwf	(?___awtoft+1),f
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(?_disp_num)
	movf	(1+(?___awtoft)),w
	movwf	(?_disp_num+1)
	movf	(2+(?___awtoft)),w
	movwf	(?_disp_num+2)
	fcall	_disp_num
	line	109
;calc.c: 109: break;
	goto	l2518
	line	111
	
l2578:	
;calc.c: 111: disp_num(k2*k1);
	movf	(main@k2+1),w
	movwf	(?___wmul+1)
	movf	(main@k2),w
	movwf	(?___wmul)
	movf	(main@k1+1),w
	movwf	1+(?___wmul)+02h
	movf	(main@k1),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(?___awtoft+1)
	movf	(0+(?___wmul)),w
	movwf	(?___awtoft)
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(?_disp_num)
	movf	(1+(?___awtoft)),w
	movwf	(?_disp_num+1)
	movf	(2+(?___awtoft)),w
	movwf	(?_disp_num+2)
	fcall	_disp_num
	line	112
;calc.c: 112: break;
	goto	l2518
	line	114
	
l2580:	
;calc.c: 114: disp_num((float)k2/k1);
	movf	(main@k1+1),w
	movwf	(?___awtoft+1)
	movf	(main@k1),w
	movwf	(?___awtoft)
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(?___ftdiv)
	movf	(1+(?___awtoft)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___awtoft)),w
	movwf	(?___ftdiv+2)
	movf	(main@k2+1),w
	movwf	(?___awtoft+1)
	movf	(main@k2),w
	movwf	(?___awtoft)
	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___awtoft)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___awtoft)),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	movf	(0+(?___ftdiv)),w
	movwf	(?_disp_num)
	movf	(1+(?___ftdiv)),w
	movwf	(?_disp_num+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?_disp_num+2)
	fcall	_disp_num
	line	115
;calc.c: 115: break;
	goto	l2518
	line	102
	
l2584:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@key),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 42 to 47
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    13     7 (average)
; direct_byte    40    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	42^0	; case 42
	skipnz
	goto	l2578
	xorlw	43^42	; case 43
	skipnz
	goto	l2574
	xorlw	45^43	; case 45
	skipnz
	goto	l2576
	xorlw	47^45	; case 47
	skipnz
	goto	l2580
	goto	l2518

	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

psect	maintext
	line	119
	signat	_main,88
	global	_disp_num
psect	text274,local,class=CODE,delta=2
global __ptext274
__ptext274:

;; *************** function _disp_num *****************
;; Defined at:
;;		line 195 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;  num             3   24[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  numb            2   35[BANK0 ] int 
;;  j               2   30[BANK0 ] int 
;;  TenthDigit      1   34[BANK0 ] unsigned char 
;;  decimal         1   33[BANK0 ] unsigned char 
;;  UnitDigit       1   32[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       7       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftmul
;;		___fttol
;;		___wmul
;;		_lcddata
;;		___awdiv
;;		___bmul
;;		___awmod
;;		_lcdcmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text274
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	195
	global	__size_of_disp_num
	__size_of_disp_num	equ	__end_of_disp_num-_disp_num
	
_disp_num:	
	opt	stack 7
; Regs used in _disp_num: [wreg+status,2+status,0+pclath+cstack]
	line	199
	
l2482:	
	line	201
	
l2484:	
;calc.c: 201: j=(int)(num*10);
	movf	(disp_num@num),w
	movwf	0+(?___ftmul)+03h
	movf	(disp_num@num+1),w
	movwf	1+(?___ftmul)+03h
	movf	(disp_num@num+2),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	movwf	(disp_num@j+1)
	movf	0+(((0+(?___fttol)))),w
	movwf	(disp_num@j)
	line	202
	
l2486:	
;calc.c: 202: numb=(int)num;
	movf	(disp_num@num),w
	movwf	(?___fttol)
	movf	(disp_num@num+1),w
	movwf	(?___fttol+1)
	movf	(disp_num@num+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	movwf	(disp_num@numb+1)
	movf	0+(((0+(?___fttol)))),w
	movwf	(disp_num@numb)
	line	204
	
l2488:	
;calc.c: 204: if(numb<0)
	btfss	(disp_num@numb+1),7
	goto	u1291
	goto	u1290
u1291:
	goto	l647
u1290:
	line	206
	
l2490:	
;calc.c: 205: {
;calc.c: 206: numb = -1*numb;
	movlw	low(-1)
	movwf	(?___wmul)
	movlw	high(-1)
	movwf	((?___wmul))+1
	movf	(disp_num@numb+1),w
	movwf	1+(?___wmul)+02h
	movf	(disp_num@numb),w
	movwf	0+(?___wmul)+02h
	fcall	___wmul
	movf	(1+(?___wmul)),w
	movwf	(disp_num@numb+1)
	movf	(0+(?___wmul)),w
	movwf	(disp_num@numb)
	line	207
;calc.c: 207: lcddata('-');
	movlw	(02Dh)
	fcall	_lcddata
	line	208
	
l647:	
	line	210
;calc.c: 208: }
;calc.c: 210: TenthDigit = (numb/10);
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(disp_num@numb+1),w
	movwf	1+(?___awdiv)+02h
	movf	(disp_num@numb),w
	movwf	0+(?___awdiv)+02h
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	movwf	(disp_num@TenthDigit)
	line	212
	
l2492:	
;calc.c: 212: if( TenthDigit != 0)
	movf	(disp_num@TenthDigit),w
	skipz
	goto	u1300
	goto	l648
u1300:
	line	213
	
l2494:	
;calc.c: 213: lcddata(TenthDigit+0x30);
	movf	(disp_num@TenthDigit),w
	addlw	030h
	fcall	_lcddata
	
l648:	
	line	215
;calc.c: 215: UnitDigit = numb - (TenthDigit*10);
	movlw	(0F6h)
	movwf	(?___bmul)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(disp_num@TenthDigit),w
	fcall	___bmul
	movwf	(??_disp_num+0)+0
	movf	(disp_num@numb),w
	addwf	0+(??_disp_num+0)+0,w
	movwf	(disp_num@UnitDigit)
	line	217
;calc.c: 217: lcddata(UnitDigit+0x30);
	movf	(disp_num@UnitDigit),w
	addlw	030h
	fcall	_lcddata
	line	218
;calc.c: 218: lcddata('.');
	movlw	(02Eh)
	fcall	_lcddata
	line	219
;calc.c: 219: decimal=(char)(j%10);
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(disp_num@j+1),w
	movwf	1+(?___awmod)+02h
	movf	(disp_num@j),w
	movwf	0+(?___awmod)+02h
	fcall	___awmod
	movf	(0+(?___awmod)),w
	movwf	(disp_num@decimal)
	line	220
;calc.c: 220: lcddata(decimal+0x30);
	movf	(disp_num@decimal),w
	addlw	030h
	fcall	_lcddata
	line	221
	
l2496:	
;calc.c: 221: _delay((unsigned long)((3000)*(20e6/4000.0)));
	opt asmopt_off
movlw  76
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_disp_num+0)+0+2),f
movlw	206
movwf	((??_disp_num+0)+0+1),f
	movlw	129
movwf	((??_disp_num+0)+0),f
u1367:
	decfsz	((??_disp_num+0)+0),f
	goto	u1367
	decfsz	((??_disp_num+0)+0+1),f
	goto	u1367
	decfsz	((??_disp_num+0)+0+2),f
	goto	u1367
	clrwdt
opt asmopt_on

	line	222
	
l2498:	
;calc.c: 222: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	223
	
l649:	
	return
	opt stack 0
GLOBAL	__end_of_disp_num
	__end_of_disp_num:
;; =============== function _disp_num ends ============

	signat	_disp_num,4216
	global	_scan_key
psect	text275,local,class=CODE,delta=2
global __ptext275
__ptext275:

;; *************** function _scan_key *****************
;; Defined at:
;;		line 143 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  c               1    8[COMMON] unsigned char 
;;  d               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcddata
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text275
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	143
	global	__size_of_scan_key
	__size_of_scan_key	equ	__end_of_scan_key-_scan_key
	
_scan_key:	
	opt	stack 7
; Regs used in _scan_key: [wreg+status,2+status,0+pclath+cstack]
	line	144
	
l2312:	
;calc.c: 144: unsigned char c='s',d;
	movlw	(073h)
	movwf	(scan_key@c)
	line	145
;calc.c: 145: while(c!='a')
	goto	l2476
	
l613:	
	line	147
;calc.c: 146: {
;calc.c: 147: RC0=1;RC1=0;RC2=0;RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	bcf	(57/8),(57)&7
	bcf	(58/8),(58)&7
	bcf	(59/8),(59)&7
	line	148
;calc.c: 148: if(RC4==1 ){ lcddata('7');_delay((unsigned long)((500)*(20e6/4000.0)));d= '7';c='a';}
	btfss	(60/8),(60)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l2322
u1140:
	
l2314:	
	movlw	(037h)
	fcall	_lcddata
	
l2316:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1377:
	decfsz	((??_scan_key+0)+0),f
	goto	u1377
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1377
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1377
	clrwdt
opt asmopt_on

	
l2318:	
	movlw	(037h)
	movwf	(scan_key@d)
	
l2320:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	149
	
l2322:	
;calc.c: 149: if(RC5==1 ){ lcddata('8');_delay((unsigned long)((500)*(20e6/4000.0)));d= '8';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(61/8),(61)&7
	goto	u1151
	goto	u1150
u1151:
	goto	l2332
u1150:
	
l2324:	
	movlw	(038h)
	fcall	_lcddata
	
l2326:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1387:
	decfsz	((??_scan_key+0)+0),f
	goto	u1387
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1387
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1387
	clrwdt
opt asmopt_on

	
l2328:	
	movlw	(038h)
	movwf	(scan_key@d)
	
l2330:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	150
	
l2332:	
;calc.c: 150: if(RC6==1 ){ lcddata('9');_delay((unsigned long)((500)*(20e6/4000.0)));d= '9';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(62/8),(62)&7
	goto	u1161
	goto	u1160
u1161:
	goto	l2342
u1160:
	
l2334:	
	movlw	(039h)
	fcall	_lcddata
	
l2336:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1397:
	decfsz	((??_scan_key+0)+0),f
	goto	u1397
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1397
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1397
	clrwdt
opt asmopt_on

	
l2338:	
	movlw	(039h)
	movwf	(scan_key@d)
	
l2340:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	151
	
l2342:	
;calc.c: 151: if(RC7==1 ){ lcddata('/');_delay((unsigned long)((500)*(20e6/4000.0)));d= '/';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(63/8),(63)&7
	goto	u1171
	goto	u1170
u1171:
	goto	l2352
u1170:
	
l2344:	
	movlw	(02Fh)
	fcall	_lcddata
	
l2346:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1407:
	decfsz	((??_scan_key+0)+0),f
	goto	u1407
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1407
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1407
	clrwdt
opt asmopt_on

	
l2348:	
	movlw	(02Fh)
	movwf	(scan_key@d)
	
l2350:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	153
	
l2352:	
;calc.c: 153: RC0=0;RC1=1;RC2=0;RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l2354:	
	bsf	(57/8),(57)&7
	
l2356:	
	bcf	(58/8),(58)&7
	
l2358:	
	bcf	(59/8),(59)&7
	line	155
	
l2360:	
;calc.c: 155: if(RC4==1 ){ lcddata('4');_delay((unsigned long)((500)*(20e6/4000.0)));d= '4';c='a';}
	btfss	(60/8),(60)&7
	goto	u1181
	goto	u1180
u1181:
	goto	l2370
u1180:
	
l2362:	
	movlw	(034h)
	fcall	_lcddata
	
l2364:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1417:
	decfsz	((??_scan_key+0)+0),f
	goto	u1417
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1417
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1417
	clrwdt
opt asmopt_on

	
l2366:	
	movlw	(034h)
	movwf	(scan_key@d)
	
l2368:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	156
	
l2370:	
;calc.c: 156: if(RC5==1 ){ lcddata('5');_delay((unsigned long)((500)*(20e6/4000.0)));d= '5';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(61/8),(61)&7
	goto	u1191
	goto	u1190
u1191:
	goto	l2380
u1190:
	
l2372:	
	movlw	(035h)
	fcall	_lcddata
	
l2374:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1427:
	decfsz	((??_scan_key+0)+0),f
	goto	u1427
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1427
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1427
	clrwdt
opt asmopt_on

	
l2376:	
	movlw	(035h)
	movwf	(scan_key@d)
	
l2378:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	157
	
l2380:	
;calc.c: 157: if(RC6==1 ){ lcddata('6');_delay((unsigned long)((500)*(20e6/4000.0)));d= '6';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(62/8),(62)&7
	goto	u1201
	goto	u1200
u1201:
	goto	l2390
u1200:
	
l2382:	
	movlw	(036h)
	fcall	_lcddata
	
l2384:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1437:
	decfsz	((??_scan_key+0)+0),f
	goto	u1437
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1437
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1437
	clrwdt
opt asmopt_on

	
l2386:	
	movlw	(036h)
	movwf	(scan_key@d)
	
l2388:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	158
	
l2390:	
;calc.c: 158: if(RC7==1 ){ lcddata('*');_delay((unsigned long)((500)*(20e6/4000.0)));d= '*';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(63/8),(63)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l2400
u1210:
	
l2392:	
	movlw	(02Ah)
	fcall	_lcddata
	
l2394:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1447:
	decfsz	((??_scan_key+0)+0),f
	goto	u1447
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1447
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1447
	clrwdt
opt asmopt_on

	
l2396:	
	movlw	(02Ah)
	movwf	(scan_key@d)
	
l2398:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	160
	
l2400:	
;calc.c: 160: RC0=0;RC1=0;RC2=1;RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l2402:	
	bcf	(57/8),(57)&7
	
l2404:	
	bsf	(58/8),(58)&7
	
l2406:	
	bcf	(59/8),(59)&7
	line	162
	
l2408:	
;calc.c: 162: if(RC4==1 ){ lcddata('1');_delay((unsigned long)((500)*(20e6/4000.0)));d= '1';c='a';}
	btfss	(60/8),(60)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l2418
u1220:
	
l2410:	
	movlw	(031h)
	fcall	_lcddata
	
l2412:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1457:
	decfsz	((??_scan_key+0)+0),f
	goto	u1457
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1457
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1457
	clrwdt
opt asmopt_on

	
l2414:	
	movlw	(031h)
	movwf	(scan_key@d)
	
l2416:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	163
	
l2418:	
;calc.c: 163: if(RC5==1 ){ lcddata('2');_delay((unsigned long)((500)*(20e6/4000.0)));d= '2';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(61/8),(61)&7
	goto	u1231
	goto	u1230
u1231:
	goto	l2428
u1230:
	
l2420:	
	movlw	(032h)
	fcall	_lcddata
	
l2422:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1467:
	decfsz	((??_scan_key+0)+0),f
	goto	u1467
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1467
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1467
	clrwdt
opt asmopt_on

	
l2424:	
	movlw	(032h)
	movwf	(scan_key@d)
	
l2426:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	164
	
l2428:	
;calc.c: 164: if(RC6==1 ){ lcddata('3');_delay((unsigned long)((500)*(20e6/4000.0)));d= '3';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(62/8),(62)&7
	goto	u1241
	goto	u1240
u1241:
	goto	l2438
u1240:
	
l2430:	
	movlw	(033h)
	fcall	_lcddata
	
l2432:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1477:
	decfsz	((??_scan_key+0)+0),f
	goto	u1477
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1477
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1477
	clrwdt
opt asmopt_on

	
l2434:	
	movlw	(033h)
	movwf	(scan_key@d)
	
l2436:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	165
	
l2438:	
;calc.c: 165: if(RC7==1 ){ lcddata('-');_delay((unsigned long)((500)*(20e6/4000.0)));d= '-';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(63/8),(63)&7
	goto	u1251
	goto	u1250
u1251:
	goto	l2448
u1250:
	
l2440:	
	movlw	(02Dh)
	fcall	_lcddata
	
l2442:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1487:
	decfsz	((??_scan_key+0)+0),f
	goto	u1487
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1487
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1487
	clrwdt
opt asmopt_on

	
l2444:	
	movlw	(02Dh)
	movwf	(scan_key@d)
	
l2446:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	167
	
l2448:	
;calc.c: 167: RC0=0;RC1=0;RC2=0;RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
	
l2450:	
	bcf	(57/8),(57)&7
	
l2452:	
	bcf	(58/8),(58)&7
	
l2454:	
	bsf	(59/8),(59)&7
	line	169
	
l2456:	
;calc.c: 169: if(RC5==1 ){ lcddata('0');_delay((unsigned long)((500)*(20e6/4000.0)));d= '0';c='a';}
	btfss	(61/8),(61)&7
	goto	u1261
	goto	u1260
u1261:
	goto	l2466
u1260:
	
l2458:	
	movlw	(030h)
	fcall	_lcddata
	
l2460:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1497:
	decfsz	((??_scan_key+0)+0),f
	goto	u1497
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1497
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1497
	clrwdt
opt asmopt_on

	
l2462:	
	movlw	(030h)
	movwf	(scan_key@d)
	
l2464:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	170
	
l2466:	
;calc.c: 170: if(RC7==1 ){ lcddata('+');_delay((unsigned long)((500)*(20e6/4000.0)));d= '+';c='a';}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(63/8),(63)&7
	goto	u1271
	goto	u1270
u1271:
	goto	l2476
u1270:
	
l2468:	
	movlw	(02Bh)
	fcall	_lcddata
	
l2470:	
	opt asmopt_off
movlw  13
movwf	((??_scan_key+0)+0+2),f
movlw	163
movwf	((??_scan_key+0)+0+1),f
	movlw	189
movwf	((??_scan_key+0)+0),f
u1507:
	decfsz	((??_scan_key+0)+0),f
	goto	u1507
	decfsz	((??_scan_key+0)+0+1),f
	goto	u1507
	decfsz	((??_scan_key+0)+0+2),f
	goto	u1507
	clrwdt
opt asmopt_on

	
l2472:	
	movlw	(02Bh)
	movwf	(scan_key@d)
	
l2474:	
	movlw	(061h)
	movwf	(scan_key@c)
	line	145
	
l2476:	
	movf	(scan_key@c),w
	xorlw	061h
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l613
u1280:
	line	172
	
l2478:	
;calc.c: 171: }
;calc.c: 172: return d;
	movf	(scan_key@d),w
	line	173
	
l629:	
	return
	opt stack 0
GLOBAL	__end_of_scan_key
	__end_of_scan_key:
;; =============== function _scan_key ends ============

	signat	_scan_key,89
	global	_lcdinit
psect	text276,local,class=CODE,delta=2
global __ptext276
__ptext276:

;; *************** function _lcdinit *****************
;; Defined at:
;;		line 29 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcdcmd
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text276
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	29
	global	__size_of_lcdinit
	__size_of_lcdinit	equ	__end_of_lcdinit-_lcdinit
	
_lcdinit:	
	opt	stack 7
; Regs used in _lcdinit: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l2292:	
;calc.c: 30: _delay((unsigned long)((400)*(20e6/4000.0))); lcdcmd(0x30); _delay((unsigned long)((400)*(20e6/4000.0))); lcdcmd(0x30);
	opt asmopt_off
movlw  11
movwf	((??_lcdinit+0)+0+2),f
movlw	28
movwf	((??_lcdinit+0)+0+1),f
	movlw	99
movwf	((??_lcdinit+0)+0),f
u1517:
	decfsz	((??_lcdinit+0)+0),f
	goto	u1517
	decfsz	((??_lcdinit+0)+0+1),f
	goto	u1517
	decfsz	((??_lcdinit+0)+0+2),f
	goto	u1517
	clrwdt
opt asmopt_on

	
l2294:	
	movlw	(030h)
	fcall	_lcdcmd
	
l2296:	
	opt asmopt_off
movlw  11
movwf	((??_lcdinit+0)+0+2),f
movlw	28
movwf	((??_lcdinit+0)+0+1),f
	movlw	99
movwf	((??_lcdinit+0)+0),f
u1527:
	decfsz	((??_lcdinit+0)+0),f
	goto	u1527
	decfsz	((??_lcdinit+0)+0+1),f
	goto	u1527
	decfsz	((??_lcdinit+0)+0+2),f
	goto	u1527
	clrwdt
opt asmopt_on

	movlw	(030h)
	fcall	_lcdcmd
	line	31
	
l2298:	
;calc.c: 31: _delay((unsigned long)((400)*(20e6/4000.0))); lcdcmd(0x30); _delay((unsigned long)((400)*(20e6/4000.0))); lcdcmd(0x38);
	opt asmopt_off
movlw  11
movwf	((??_lcdinit+0)+0+2),f
movlw	28
movwf	((??_lcdinit+0)+0+1),f
	movlw	99
movwf	((??_lcdinit+0)+0),f
u1537:
	decfsz	((??_lcdinit+0)+0),f
	goto	u1537
	decfsz	((??_lcdinit+0)+0+1),f
	goto	u1537
	decfsz	((??_lcdinit+0)+0+2),f
	goto	u1537
	clrwdt
opt asmopt_on

	
l2300:	
	movlw	(030h)
	fcall	_lcdcmd
	opt asmopt_off
movlw  11
movwf	((??_lcdinit+0)+0+2),f
movlw	28
movwf	((??_lcdinit+0)+0+1),f
	movlw	99
movwf	((??_lcdinit+0)+0),f
u1547:
	decfsz	((??_lcdinit+0)+0),f
	goto	u1547
	decfsz	((??_lcdinit+0)+0+1),f
	goto	u1547
	decfsz	((??_lcdinit+0)+0+2),f
	goto	u1547
	clrwdt
opt asmopt_on

	
l2302:	
	movlw	(038h)
	fcall	_lcdcmd
	line	32
	
l2304:	
;calc.c: 32: lcdcmd(0x0F);
	movlw	(0Fh)
	fcall	_lcdcmd
	line	33
	
l2306:	
;calc.c: 33: lcdcmd(0x01);
	movlw	(01h)
	fcall	_lcdcmd
	line	34
	
l2308:	
;calc.c: 34: lcdcmd(0x06);
	movlw	(06h)
	fcall	_lcdcmd
	line	35
	
l2310:	
;calc.c: 35: lcdcmd(0x80);
	movlw	(080h)
	fcall	_lcdcmd
	line	36
	
l579:	
	return
	opt stack 0
GLOBAL	__end_of_lcdinit
	__end_of_lcdinit:
;; =============== function _lcdinit ends ============

	signat	_lcdinit,88
	global	___awtoft
psect	text277,local,class=CODE,delta=2
global __ptext277
__ptext277:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text277
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 7
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l2280:	
	clrf	(___awtoft@sign)
	line	37
	
l2282:	
	btfss	(___awtoft@c+1),7
	goto	u1131
	goto	u1130
u1131:
	goto	l2288
u1130:
	line	38
	
l2284:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	
l2286:	
	clrf	(___awtoft@sign)
	incf	(___awtoft@sign),f
	line	41
	
l2288:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	line	42
	
l795:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text278,local,class=CODE,delta=2
global __ptext278
__ptext278:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3    9[BANK0 ] float 
;;  f2              3   12[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   19[BANK0 ] unsigned um
;;  sign            1   23[BANK0 ] unsigned char 
;;  cntr            1   22[BANK0 ] unsigned char 
;;  exp             1   18[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    9[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text278
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 6
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l2224:	
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u1051
	goto	u1050
u1051:
	goto	l2230
u1050:
	line	57
	
l2226:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l757
	line	58
	
l2230:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u1061
	goto	u1060
u1061:
	goto	l2236
u1060:
	line	59
	
l2232:	
	clrf	(?___ftmul)
	clrf	(?___ftmul+1)
	clrf	(?___ftmul+2)
	goto	l757
	line	60
	
l2236:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	addwf	(___ftmul@exp),f
	line	61
	
l2238:	
	movf	0+(((___ftmul@f1))+2),w
	movwf	(___ftmul@sign)
	line	62
	
l2240:	
	movf	0+(((___ftmul@f2))+2),w
	xorwf	(___ftmul@sign),f
	line	63
	
l2242:	
	movlw	(080h)
	andwf	(___ftmul@sign),f
	line	64
	
l2244:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l2246:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l2248:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l2250:	
	clrf	(___ftmul@f3_as_product)
	clrf	(___ftmul@f3_as_product+1)
	clrf	(___ftmul@f3_as_product+2)
	line	69
	
l2252:	
	movlw	(07h)
	movwf	(___ftmul@cntr)
	line	71
	
l2254:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l2258
u1070:
	line	72
	
l2256:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1081
	addwf	(___ftmul@f3_as_product+1),f
u1081:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1082
	addwf	(___ftmul@f3_as_product+2),f
u1082:

	line	73
	
l2258:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	74
	
l2260:	
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	line	75
	
l2262:	
	decfsz	(___ftmul@cntr),f
	goto	u1091
	goto	u1090
u1091:
	goto	l2254
u1090:
	line	76
	
l2264:	
	movlw	(09h)
	movwf	(___ftmul@cntr)
	line	78
	
l2266:	
	btfss	(___ftmul@f1),(0)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l2270
u1100:
	line	79
	
l2268:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u1111
	addwf	(___ftmul@f3_as_product+1),f
u1111:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u1112
	addwf	(___ftmul@f3_as_product+2),f
u1112:

	line	80
	
l2270:	
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	line	81
	
l2272:	
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	line	82
	
l2274:	
	decfsz	(___ftmul@cntr),f
	goto	u1121
	goto	u1120
u1121:
	goto	l2266
u1120:
	line	83
	
l2276:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	line	84
	
l757:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text279,local,class=CODE,delta=2
global __ptext279
__ptext279:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3    0[BANK0 ] float 
;;  f1              3    3[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   10[BANK0 ] float 
;;  sign            1   14[BANK0 ] unsigned char 
;;  exp             1   13[BANK0 ] unsigned char 
;;  cntr            1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text279
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 7
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l2180:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u1011
	goto	u1010
u1011:
	goto	l2186
u1010:
	line	56
	
l2182:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l747
	line	57
	
l2186:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l748
u1020:
	line	58
	
l2188:	
	clrf	(?___ftdiv)
	clrf	(?___ftdiv+1)
	clrf	(?___ftdiv+2)
	goto	l747
	
l748:	
	line	59
	clrf	(___ftdiv@f3)
	clrf	(___ftdiv@f3+1)
	clrf	(___ftdiv@f3+2)
	line	60
	
l2192:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l2194:	
	movf	0+(((___ftdiv@f1))+2),w
	movwf	(___ftdiv@sign)
	line	62
	
l2196:	
	movf	0+(((___ftdiv@f2))+2),w
	xorwf	(___ftdiv@sign),f
	line	63
	
l2198:	
	movlw	(080h)
	andwf	(___ftdiv@sign),f
	line	64
	
l2200:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	
l2202:	
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l2204:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	
l2206:	
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	
l2208:	
	movlw	(018h)
	movwf	(___ftdiv@cntr)
	line	70
	
l2210:	
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	line	71
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u1035
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u1035
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u1035:
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l2216
u1030:
	line	72
	
l2212:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l2214:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	line	75
	
l2216:	
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	line	76
	
l2218:	
	decfsz	(___ftdiv@cntr),f
	goto	u1041
	goto	u1040
u1041:
	goto	l2210
u1040:
	line	77
	
l2220:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	line	78
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	_lcddata
psect	text280,local,class=CODE,delta=2
global __ptext280
__ptext280:

;; *************** function _lcddata *****************
;; Defined at:
;;		line 131 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_scan_key
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text280
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	131
	global	__size_of_lcddata
	__size_of_lcddata	equ	__end_of_lcddata-_lcddata
	
_lcddata:	
	opt	stack 6
; Regs used in _lcddata: [wreg]
;lcddata@value stored from wreg
	movwf	(lcddata@value)
	line	132
	
l2172:	
;calc.c: 132: PORTB = value;
	movf	(lcddata@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	133
	
l2174:	
;calc.c: 133: RD6 = 1;
	bsf	(70/8),(70)&7
	line	134
	
l2176:	
;calc.c: 134: RD7 = 1;
	bsf	(71/8),(71)&7
	line	135
;calc.c: 135: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcddata+0)+0+2),f
movlw	136
movwf	((??_lcddata+0)+0+1),f
	movlw	86
movwf	((??_lcddata+0)+0),f
u1557:
	decfsz	((??_lcddata+0)+0),f
	goto	u1557
	decfsz	((??_lcddata+0)+0+1),f
	goto	u1557
	decfsz	((??_lcddata+0)+0+2),f
	goto	u1557
opt asmopt_on

	line	136
	
l2178:	
;calc.c: 136: RD7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(71/8),(71)&7
	line	137
;calc.c: 137: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcddata+0)+0+2),f
movlw	136
movwf	((??_lcddata+0)+0+1),f
	movlw	86
movwf	((??_lcddata+0)+0),f
u1567:
	decfsz	((??_lcddata+0)+0),f
	goto	u1567
	decfsz	((??_lcddata+0)+0+1),f
	goto	u1567
	decfsz	((??_lcddata+0)+0+2),f
	goto	u1567
opt asmopt_on

	line	138
	
l609:	
	return
	opt stack 0
GLOBAL	__end_of_lcddata
	__end_of_lcddata:
;; =============== function _lcddata ends ============

	signat	_lcddata,4216
	global	_lcdcmd
psect	text281,local,class=CODE,delta=2
global __ptext281
__ptext281:

;; *************** function _lcdcmd *****************
;; Defined at:
;;		line 122 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;  value           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  value           1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcdinit
;;		_main
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text281
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	122
	global	__size_of_lcdcmd
	__size_of_lcdcmd	equ	__end_of_lcdcmd-_lcdcmd
	
_lcdcmd:	
	opt	stack 6
; Regs used in _lcdcmd: [wreg]
;lcdcmd@value stored from wreg
	movwf	(lcdcmd@value)
	line	123
	
l2164:	
;calc.c: 123: PORTB = value;
	movf	(lcdcmd@value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	124
	
l2166:	
;calc.c: 124: RD6 = 0;
	bcf	(70/8),(70)&7
	line	125
	
l2168:	
;calc.c: 125: RD7 = 1;
	bsf	(71/8),(71)&7
	line	126
;calc.c: 126: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcdcmd+0)+0+2),f
movlw	136
movwf	((??_lcdcmd+0)+0+1),f
	movlw	86
movwf	((??_lcdcmd+0)+0),f
u1577:
	decfsz	((??_lcdcmd+0)+0),f
	goto	u1577
	decfsz	((??_lcdcmd+0)+0+1),f
	goto	u1577
	decfsz	((??_lcdcmd+0)+0+2),f
	goto	u1577
opt asmopt_on

	line	127
	
l2170:	
;calc.c: 127: RD7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(71/8),(71)&7
	line	128
;calc.c: 128: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_lcdcmd+0)+0+2),f
movlw	136
movwf	((??_lcdcmd+0)+0+1),f
	movlw	86
movwf	((??_lcdcmd+0)+0),f
u1587:
	decfsz	((??_lcdcmd+0)+0),f
	goto	u1587
	decfsz	((??_lcdcmd+0)+0+1),f
	goto	u1587
	decfsz	((??_lcdcmd+0)+0+2),f
	goto	u1587
opt asmopt_on

	line	129
	
l606:	
	return
	opt stack 0
GLOBAL	__end_of_lcdcmd
	__end_of_lcdcmd:
;; =============== function _lcdcmd ends ============

	signat	_lcdcmd,4216
	global	___awmod
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text282
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2128:	
	clrf	(___awmod@sign)
	line	9
	
l2130:	
	btfss	(___awmod@dividend+1),7
	goto	u941
	goto	u940
u941:
	goto	l2136
u940:
	line	10
	
l2132:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	
l2134:	
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	13
	
l2136:	
	btfss	(___awmod@divisor+1),7
	goto	u951
	goto	u950
u951:
	goto	l2140
u950:
	line	14
	
l2138:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	15
	
l2140:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u961
	goto	u960
u961:
	goto	l2156
u960:
	line	16
	
l2142:	
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	17
	goto	l2146
	line	18
	
l2144:	
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	19
	incf	(___awmod@counter),f
	line	17
	
l2146:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u971
	goto	u970
u971:
	goto	l2144
u970:
	line	22
	
l2148:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u985
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u985:
	skipc
	goto	u981
	goto	u980
u981:
	goto	l2152
u980:
	line	23
	
l2150:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	24
	
l2152:	
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	25
	
l2154:	
	decfsz	(___awmod@counter),f
	goto	u991
	goto	u990
u991:
	goto	l2148
u990:
	line	27
	
l2156:	
	movf	(___awmod@sign),w
	skipz
	goto	u1000
	goto	l2160
u1000:
	line	28
	
l2158:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	29
	
l2160:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	30
	
l876:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] int 
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text283
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2084:	
	clrf	(___awdiv@sign)
	line	10
	
l2086:	
	btfss	(___awdiv@divisor+1),7
	goto	u871
	goto	u870
u871:
	goto	l2092
u870:
	line	11
	
l2088:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l2090:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l2092:	
	btfss	(___awdiv@dividend+1),7
	goto	u881
	goto	u880
u881:
	goto	l2098
u880:
	line	15
	
l2094:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2096:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l2098:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2100:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u891
	goto	u890
u891:
	goto	l2120
u890:
	line	20
	
l2102:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l2106
	line	22
	
l2104:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l2106:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u901
	goto	u900
u901:
	goto	l2104
u900:
	line	26
	
l2108:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l2110:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u915
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u915:
	skipc
	goto	u911
	goto	u910
u911:
	goto	l2116
u910:
	line	28
	
l2112:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2114:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l2116:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l2118:	
	decfsz	(___awdiv@counter),f
	goto	u921
	goto	u920
u921:
	goto	l2108
u920:
	line	34
	
l2120:	
	movf	(___awdiv@sign),w
	skipz
	goto	u930
	goto	l2124
u930:
	line	35
	
l2122:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l2124:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l808:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    4[BANK0 ] unsigned long 
;;  exp1            1    8[BANK0 ] unsigned char 
;;  sign1           1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         4       9       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text284
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l2046:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u791
	goto	u790
u791:
	goto	l2050
u790:
	line	50
	
l2048:	
	clrf	(?___fttol)
	clrf	(?___fttol+1)
	clrf	(?___fttol+2)
	clrf	(?___fttol+3)
	goto	l768
	line	51
	
l2050:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u805:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u800:
	addlw	-1
	skipz
	goto	u805
	movf	0+(??___fttol+0)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l2052:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l2054:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l2056:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l2058:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l2060:	
	btfss	(___fttol@exp1),7
	goto	u811
	goto	u810
u811:
	goto	l2070
u810:
	line	57
	
l2062:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u821
	goto	u820
u821:
	goto	l2066
u820:
	goto	l2048
	line	60
	
l2066:	
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	line	61
	
l2068:	
	incfsz	(___fttol@exp1),f
	goto	u831
	goto	u830
u831:
	goto	l2066
u830:
	goto	l2076
	line	63
	
l2070:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u841
	goto	u840
u841:
	goto	l775
u840:
	goto	l2048
	line	66
	
l2074:	
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	line	67
	decf	(___fttol@exp1),f
	line	68
	
l775:	
	line	65
	movf	(___fttol@exp1),f
	skipz
	goto	u851
	goto	u850
u851:
	goto	l2074
u850:
	line	70
	
l2076:	
	movf	(___fttol@sign1),w
	skipz
	goto	u860
	goto	l2080
u860:
	line	71
	
l2078:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	line	72
	
l2080:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	line	73
	
l768:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text285,local,class=CODE,delta=2
global __ptext285
__ptext285:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;; This function uses a non-reentrant model
;;
psect	text285
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 6
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l2018:	
	movf	(___ftpack@exp),w
	skipz
	goto	u720
	goto	l2022
u720:
	
l2020:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u731
	goto	u730
u731:
	goto	l2028
u730:
	line	65
	
l2022:	
	clrf	(?___ftpack)
	clrf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	goto	l993
	line	67
	
l2026:	
	incf	(___ftpack@exp),f
	line	68
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	66
	
l2028:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u741
	goto	u740
u741:
	goto	l2026
u740:
	goto	l2032
	line	71
	
l2030:	
	incf	(___ftpack@exp),f
	line	72
	incf	(___ftpack@arg),f
	skipnz
	incf	(___ftpack@arg+1),f
	skipnz
	incf	(___ftpack@arg+2),f
	line	73
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	line	70
	
l2032:	
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u751
	goto	u750
u751:
	goto	l2030
u750:
	goto	l2036
	line	76
	
l2034:	
	decf	(___ftpack@exp),f
	line	77
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	line	75
	
l2036:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u761
	goto	u760
u761:
	goto	l2034
u760:
	
l1002:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u771
	goto	u770
u771:
	goto	l1003
u770:
	line	80
	
l2038:	
	bcf	(___ftpack@arg)+(15/8),(15)&7
	
l1003:	
	line	81
	clrc
	rrf	(___ftpack@exp),f
	line	82
	
l2040:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0+2)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+0)
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l2042:	
	movf	(___ftpack@sign),w
	skipz
	goto	u780
	goto	l1004
u780:
	line	84
	
l2044:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1004:	
	line	85
	line	86
	
l993:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___wmul
psect	text286,local,class=CODE,delta=2
global __ptext286
__ptext286:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text286
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 7
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l2002:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	line	7
	
l2004:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u701
	goto	u700
u701:
	goto	l2008
u700:
	line	8
	
l2006:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	line	9
	
l2008:	
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	line	10
	
l2010:	
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	line	11
	
l2012:	
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u711
	goto	u710
u711:
	goto	l2004
u710:
	line	12
	
l2014:	
	movf	(___wmul@product+1),w
	movwf	(?___wmul+1)
	movf	(___wmul@product),w
	movwf	(?___wmul)
	line	13
	
l661:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	___bmul
psect	text287,local,class=CODE,delta=2
global __ptext287
__ptext287:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    2[COMMON] unsigned char 
;;  product         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_disp_num
;; This function uses a non-reentrant model
;;
psect	text287
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.71a\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l1986:	
	clrf	(___bmul@product)
	line	7
	
l1988:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u681
	goto	u680
u681:
	goto	l1992
u680:
	line	8
	
l1990:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l1992:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
l1994:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
l1996:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u691
	goto	u690
u691:
	goto	l1988
u690:
	line	12
	
l1998:	
	movf	(___bmul@product),w
	line	13
	
l655:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_get_num
psect	text288,local,class=CODE,delta=2
global __ptext288
__ptext288:

;; *************** function _get_num *****************
;; Defined at:
;;		line 177 in file "C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text288
	file	"C:\Users\usman\Desktop\My site\new\Calculator with PIC16f877\calc.c"
	line	177
	global	__size_of_get_num
	__size_of_get_num	equ	__end_of_get_num-_get_num
	
_get_num:	
	opt	stack 7
; Regs used in _get_num: [wreg-fsr0h+status,2+status,0]
;get_num@ch stored from wreg
	movwf	(get_num@ch)
	line	178
	
l1916:	
;calc.c: 178: switch(ch)
	goto	l1980
	line	180
	
l1918:	
	clrf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	181
	
l1924:	
	clrf	(?_get_num)
	incf	(?_get_num),f
	clrf	(?_get_num+1)
	goto	l634
	line	182
	
l1930:	
	movlw	02h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	183
	
l1936:	
	movlw	03h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	184
	
l1942:	
	movlw	04h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	185
	
l1948:	
	movlw	05h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	186
	
l1954:	
	movlw	06h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	187
	
l1960:	
	movlw	07h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	188
	
l1966:	
	movlw	08h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	189
	
l1972:	
	movlw	09h
	movwf	(?_get_num)
	clrf	(?_get_num+1)
	goto	l634
	line	178
	
l1980:	
	movf	(get_num@ch),w
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 48 to 57
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    31    16 (average)
; direct_byte    52    22 (fixed)
;	Chosen strategy is simple_byte

	xorlw	48^0	; case 48
	skipnz
	goto	l1918
	xorlw	49^48	; case 49
	skipnz
	goto	l1924
	xorlw	50^49	; case 50
	skipnz
	goto	l1930
	xorlw	51^50	; case 51
	skipnz
	goto	l1936
	xorlw	52^51	; case 52
	skipnz
	goto	l1942
	xorlw	53^52	; case 53
	skipnz
	goto	l1948
	xorlw	54^53	; case 54
	skipnz
	goto	l1954
	xorlw	55^54	; case 55
	skipnz
	goto	l1960
	xorlw	56^55	; case 56
	skipnz
	goto	l1966
	xorlw	57^56	; case 57
	skipnz
	goto	l1972
	goto	l1918

	line	192
	
l634:	
	return
	opt stack 0
GLOBAL	__end_of_get_num
	__end_of_get_num:
;; =============== function _get_num ends ============

	signat	_get_num,4218
psect	text289,local,class=CODE,delta=2
global __ptext289
__ptext289:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
