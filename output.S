.section .data
.comm t13, 4
.comm t12, 4
.comm t16, 4
.comm t15, 4
.comm t7, 4
.comm t19, 4
.comm t21, 4
.comm t5, 4
.comm t4, 4
.comm t2, 4
.comm t18, 4
.comm t1, 4
.comm t9, 4
const_0: .byte 0x00, 0x00, 0x00, 0x00 // 0.0
const_1: .byte 0x00, 0x00, 0x80, 0x3f // 1.0
const_2: .byte 0x00, 0x00, 0xa0, 0x40 // 5.0
const_3: .byte 0x00, 0x00, 0xa0, 0x41 // 20.0
const_4: .byte 0x00, 0x00, 0x40, 0x40 // 3.0
const_5: .byte 0x00, 0x00, 0x00, 0x40 // 2.0
.comm RESULTS_HISTORY, 24
.comm MEM_STORAGE, 4
.section .text
.global main_prog
main_prog:
// MEM[0] = 5.0
	lds r22, const_2
	lds r23, const_2+1
	lds r24, const_2+2
	lds r25, const_2+3
	sts MEM_STORAGE, r22
	sts MEM_STORAGE+1, r23
	sts MEM_STORAGE+2, r24
	sts MEM_STORAGE+3, r25
// t1 = 0.0
	lds r22, const_0
	lds r23, const_0+1
	lds r24, const_0+2
	lds r25, const_0+3
	sts t1, r22
	sts t1+1, r23
	sts t1+2, r24
	sts t1+3, r25
// HISTORY[0] = t1
	lds r22, t1
	lds r23, t1+1
	lds r24, t1+2
	lds r25, t1+3
	ldi r30, lo8(RESULTS_HISTORY+0)
	ldi r31, hi8(RESULTS_HISTORY+0)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// L0:
L0:
// t2 = MEM[0]
	lds r22, MEM_STORAGE
	lds r23, MEM_STORAGE+1
	lds r24, MEM_STORAGE+2
	lds r25, MEM_STORAGE+3
	sts t2, r22
	sts t2+1, r23
	sts t2+2, r24
	sts t2+3, r25
// t4 = t2 > 0.0
	lds r22, t2
	lds r23, t2+1
	lds r24, t2+2
	lds r25, t2+3
	lds r18, const_0
	lds r19, const_0+1
	lds r20, const_0+2
	lds r21, const_0+3
	call __gtsf2
	lds r18, const_0
	lds r19, const_0+1
	lds r20, const_0+2
	lds r21, const_0+3
	tst r24
	breq store_res_54
	brmi store_res_54
	lds r18, const_1
	lds r19, const_1+1
	lds r20, const_1+2
	lds r21, const_1+3
store_res_54:
	sts t4, r18
	sts t4+1, r19
	sts t4+2, r20
	sts t4+3, r21
// ifFalse t4 goto L1
	lds r24, t4
	lds r25, t4+1
	lds r26, t4+2
	lds r27, t4+3
	mov r18, r24
	or r18, r25
	or r18, r26
	or r18, r27
	breq L1
// t5 = MEM[0]
	lds r22, MEM_STORAGE
	lds r23, MEM_STORAGE+1
	lds r24, MEM_STORAGE+2
	lds r25, MEM_STORAGE+3
	sts t5, r22
	sts t5+1, r23
	sts t5+2, r24
	sts t5+3, r25
// t7 = t5 - 1.0
	lds r22, t5
	lds r23, t5+1
	lds r24, t5+2
	lds r25, t5+3
	lds r18, const_1
	lds r19, const_1+1
	lds r20, const_1+2
	lds r21, const_1+3
	call __subsf3
	sts t7, r22
	sts t7+1, r23
	sts t7+2, r24
	sts t7+3, r25
// MEM[0] = t7
	lds r22, t7
	lds r23, t7+1
	lds r24, t7+2
	lds r25, t7+3
	sts MEM_STORAGE, r22
	sts MEM_STORAGE+1, r23
	sts MEM_STORAGE+2, r24
	sts MEM_STORAGE+3, r25
// goto L0
	rjmp L0
// L1:
L1:
// t9 = 0.0
	lds r22, const_0
	lds r23, const_0+1
	lds r24, const_0+2
	lds r25, const_0+3
	sts t9, r22
	sts t9+1, r23
	sts t9+2, r24
	sts t9+3, r25
// HISTORY[1] = t9
	lds r22, t9
	lds r23, t9+1
	lds r24, t9+2
	lds r25, t9+3
	ldi r30, lo8(RESULTS_HISTORY+4)
	ldi r31, hi8(RESULTS_HISTORY+4)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t12 = 20.0
	lds r22, const_3
	lds r23, const_3+1
	lds r24, const_3+2
	lds r25, const_3+3
	sts t12, r22
	sts t12+1, r23
	sts t12+2, r24
	sts t12+3, r25
// HISTORY[2] = t12
	lds r22, t12
	lds r23, t12+1
	lds r24, t12+2
	lds r25, t12+3
	ldi r30, lo8(RESULTS_HISTORY+8)
	ldi r31, hi8(RESULTS_HISTORY+8)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t13 = HISTORY[2]
	ldi r30, lo8(RESULTS_HISTORY+8)
	ldi r31, hi8(RESULTS_HISTORY+8)
	ld r22, Z+
	ld r23, Z+
	ld r24, Z+
	ld r25, Z
	sts t13, r22
	sts t13+1, r23
	sts t13+2, r24
	sts t13+3, r25
// t15 = t13 * 3.0
	lds r22, t13
	lds r23, t13+1
	lds r24, t13+2
	lds r25, t13+3
	lds r18, const_4
	lds r19, const_4+1
	lds r20, const_4+2
	lds r21, const_4+3
	call __mulsf3
	sts t15, r22
	sts t15+1, r23
	sts t15+2, r24
	sts t15+3, r25
// HISTORY[3] = t15
	lds r22, t15
	lds r23, t15+1
	lds r24, t15+2
	lds r25, t15+3
	ldi r30, lo8(RESULTS_HISTORY+12)
	ldi r31, hi8(RESULTS_HISTORY+12)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t16 = HISTORY[3]
	ldi r30, lo8(RESULTS_HISTORY+12)
	ldi r31, hi8(RESULTS_HISTORY+12)
	ld r22, Z+
	ld r23, Z+
	ld r24, Z+
	ld r25, Z
	sts t16, r22
	sts t16+1, r23
	sts t16+2, r24
	sts t16+3, r25
// t18 = t16 * 2.0
	lds r22, t16
	lds r23, t16+1
	lds r24, t16+2
	lds r25, t16+3
	lds r18, const_5
	lds r19, const_5+1
	lds r20, const_5+2
	lds r21, const_5+3
	call __mulsf3
	sts t18, r22
	sts t18+1, r23
	sts t18+2, r24
	sts t18+3, r25
// HISTORY[4] = t18
	lds r22, t18
	lds r23, t18+1
	lds r24, t18+2
	lds r25, t18+3
	ldi r30, lo8(RESULTS_HISTORY+16)
	ldi r31, hi8(RESULTS_HISTORY+16)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
// t19 = HISTORY[4]
	ldi r30, lo8(RESULTS_HISTORY+16)
	ldi r31, hi8(RESULTS_HISTORY+16)
	ld r22, Z+
	ld r23, Z+
	ld r24, Z+
	ld r25, Z
	sts t19, r22
	sts t19+1, r23
	sts t19+2, r24
	sts t19+3, r25
// t21 = t19 * 1.0
	lds r22, t19
	lds r23, t19+1
	lds r24, t19+2
	lds r25, t19+3
	lds r18, const_1
	lds r19, const_1+1
	lds r20, const_1+2
	lds r21, const_1+3
	call __mulsf3
	sts t21, r22
	sts t21+1, r23
	sts t21+2, r24
	sts t21+3, r25
// HISTORY[5] = t21
	lds r22, t21
	lds r23, t21+1
	lds r24, t21+2
	lds r25, t21+3
	ldi r30, lo8(RESULTS_HISTORY+20)
	ldi r31, hi8(RESULTS_HISTORY+20)
	st Z+, r22
	st Z+, r23
	st Z+, r24
	st Z, r25
	ret