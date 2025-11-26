.section .data
.comm t8, 4
.comm t17, 4
.comm t27, 4
.comm t5, 4
.comm t34, 4
.comm t14, 4
.comm t11, 4
.comm t20, 4
.comm t2, 4
.comm t41, 4
.comm t48, 4
const_0: .byte 0x00, 0x00, 0x00, 0x00 // 0.0
const_1: .byte 0x00, 0x00, 0x80, 0x3f // 1.0
const_2: .byte 0x00, 0x00, 0x10, 0x41 // 9.0
const_3: .byte 0x66, 0x66, 0x06, 0x40 // 2.1
const_4: .byte 0x00, 0x00, 0xc0, 0x40 // 6.0
const_5: .byte 0x55, 0x55, 0x55, 0x40 // 3.3333333333333335
const_6: .byte 0x00, 0x00, 0x20, 0x40 // 2.5
const_7: .byte 0x00, 0x00, 0x00, 0x40 // 2.0
const_8: .byte 0x00, 0x00, 0x80, 0x41 // 16.0
const_9: .byte 0x00, 0x00, 0x70, 0x41 // 15.0
const_10: .byte 0x00, 0x00, 0x88, 0x41 // 17.0
const_11: .byte 0x00, 0x00, 0x00, 0x3f // 0.5
.comm RESULTS_HISTORY, 44
.comm MEM_STORAGE, 4
.section .text
.global main_prog
main_prog:
// t2 = 9.0
	lds r22, const_2
	lds r23, const_2+1
	lds r24, const_2+2
	lds r25, const_2+3
	sts t2, r22
	sts t2+1, r23
	sts t2+2, r24
	sts t2+3, r25
// HISTORY[0] = t2
	lds r22, t2
	lds r23, t2+1
	lds r24, t2+2
	lds r25, t2+3
	ldi r30, lo8(RESULTS_HISTORY+0)
	ldi r31, hi8(RESULTS_HISTORY+0)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t5 = 2.1
	lds r22, const_3
	lds r23, const_3+1
	lds r24, const_3+2
	lds r25, const_3+3
	sts t5, r22
	sts t5+1, r23
	sts t5+2, r24
	sts t5+3, r25
// HISTORY[1] = t5
	lds r22, t5
	lds r23, t5+1
	lds r24, t5+2
	lds r25, t5+3
	ldi r30, lo8(RESULTS_HISTORY+4)
	ldi r31, hi8(RESULTS_HISTORY+4)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t8 = 6.0
	lds r22, const_4
	lds r23, const_4+1
	lds r24, const_4+2
	lds r25, const_4+3
	sts t8, r22
	sts t8+1, r23
	sts t8+2, r24
	sts t8+3, r25
// HISTORY[2] = t8
	lds r22, t8
	lds r23, t8+1
	lds r24, t8+2
	lds r25, t8+3
	ldi r30, lo8(RESULTS_HISTORY+8)
	ldi r31, hi8(RESULTS_HISTORY+8)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t11 = 3.3333333333333335
	lds r22, const_5
	lds r23, const_5+1
	lds r24, const_5+2
	lds r25, const_5+3
	sts t11, r22
	sts t11+1, r23
	sts t11+2, r24
	sts t11+3, r25
// HISTORY[3] = t11
	lds r22, t11
	lds r23, t11+1
	lds r24, t11+2
	lds r25, t11+3
	ldi r30, lo8(RESULTS_HISTORY+12)
	ldi r31, hi8(RESULTS_HISTORY+12)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t14 = 2.5
	lds r22, const_6
	lds r23, const_6+1
	lds r24, const_6+2
	lds r25, const_6+3
	sts t14, r22
	sts t14+1, r23
	sts t14+2, r24
	sts t14+3, r25
// HISTORY[4] = t14
	lds r22, t14
	lds r23, t14+1
	lds r24, t14+2
	lds r25, t14+3
	ldi r30, lo8(RESULTS_HISTORY+16)
	ldi r31, hi8(RESULTS_HISTORY+16)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t17 = 2.0
	lds r22, const_7
	lds r23, const_7+1
	lds r24, const_7+2
	lds r25, const_7+3
	sts t17, r22
	sts t17+1, r23
	sts t17+2, r24
	sts t17+3, r25
// HISTORY[5] = t17
	lds r22, t17
	lds r23, t17+1
	lds r24, t17+2
	lds r25, t17+3
	ldi r30, lo8(RESULTS_HISTORY+20)
	ldi r31, hi8(RESULTS_HISTORY+20)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t20 = 16.0
	lds r22, const_8
	lds r23, const_8+1
	lds r24, const_8+2
	lds r25, const_8+3
	sts t20, r22
	sts t20+1, r23
	sts t20+2, r24
	sts t20+3, r25
// HISTORY[6] = t20
	lds r22, t20
	lds r23, t20+1
	lds r24, t20+2
	lds r25, t20+3
	ldi r30, lo8(RESULTS_HISTORY+24)
	ldi r31, hi8(RESULTS_HISTORY+24)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t27 = 15.0
	lds r22, const_9
	lds r23, const_9+1
	lds r24, const_9+2
	lds r25, const_9+3
	sts t27, r22
	sts t27+1, r23
	sts t27+2, r24
	sts t27+3, r25
// HISTORY[7] = t27
	lds r22, t27
	lds r23, t27+1
	lds r24, t27+2
	lds r25, t27+3
	ldi r30, lo8(RESULTS_HISTORY+28)
	ldi r31, hi8(RESULTS_HISTORY+28)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t34 = 2.5
	lds r22, const_6
	lds r23, const_6+1
	lds r24, const_6+2
	lds r25, const_6+3
	sts t34, r22
	sts t34+1, r23
	sts t34+2, r24
	sts t34+3, r25
// HISTORY[8] = t34
	lds r22, t34
	lds r23, t34+1
	lds r24, t34+2
	lds r25, t34+3
	ldi r30, lo8(RESULTS_HISTORY+32)
	ldi r31, hi8(RESULTS_HISTORY+32)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t41 = 17.0
	lds r22, const_10
	lds r23, const_10+1
	lds r24, const_10+2
	lds r25, const_10+3
	sts t41, r22
	sts t41+1, r23
	sts t41+2, r24
	sts t41+3, r25
// HISTORY[9] = t41
	lds r22, t41
	lds r23, t41+1
	lds r24, t41+2
	lds r25, t41+3
	ldi r30, lo8(RESULTS_HISTORY+36)
	ldi r31, hi8(RESULTS_HISTORY+36)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t48 = 0.5
	lds r22, const_11
	lds r23, const_11+1
	lds r24, const_11+2
	lds r25, const_11+3
	sts t48, r22
	sts t48+1, r23
	sts t48+2, r24
	sts t48+3, r25
// HISTORY[10] = t48
	lds r22, t48
	lds r23, t48+1
	lds r24, t48+2
	lds r25, t48+3
	ldi r30, lo8(RESULTS_HISTORY+40)
	ldi r31, hi8(RESULTS_HISTORY+40)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
	ret