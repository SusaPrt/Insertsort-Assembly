.data
a:	.double 4.3,2.1,3.3,5.2,4.8,9.3,2.3
n:	.word	7

	.text
start:	LD	r1, n(r0)		; r1 = n = 7 (number of elements)
	DADDI 	r2, r0, 8		; r2 = i = 8
	DSLL	r1, r1, 3		; r1 = n x 2^3
for: 	
	SLT		r6, r2, r1		; r6 = i < n 
	BEQZ	r6, end			; se falso termina il programma
	DADDI 	r4, r2, -8		; r4 = j = i - 1
	L.D 	f0, a(r2)		; f0 = a[i] 
loop:
	DADDI	r5, r4, 8		; r5 = j + 1
	SLT 	r3, r4, r0		; j < 0
	BNEZ  	r3, cont		; se vero salta a cont
	L.D 	f1, a(r4)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	DADDI	r5, r4, 8		; r5 = j + 1
	SLT 	r3, r4, r0		; j < 0
	BNEZ  	r3, cont		; se vero salta a cont
	L.D 	f1, a(r4)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se è vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	DADDI	r5, r4, 8		; r5 = j + 1
	SLT 	r3, r4, r0		; j < 0
	BNEZ  	r3, cont		; se vero salta a cont
	L.D 	f1, a(r4)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	DADDI	r5, r4, 8		; r5 = j + 1
	SLT 	r3, r4, r0		; j < 0
	BNEZ  	r3, cont		; se vero salta a cont
	L.D 	f1, a(r4)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --
	j loop				; salto a loop
cont:
	S.D 	f0, a(r5)		; a[j + 1] = a[i]
	DADDI 	r2, r2, 8		; i ++
	j for	
end:	
	L.D		f0, a(r7)
	DADDI	r7, r0, 8
	L.D		f1, a(r7)
	DADDI	r7, r0, 16
	L.D		f2, a(r7)
	DADDI	r7, r0, 24
	L.D		f3, a(r7)
	DADDI	r7, r0, 32
	L.D		f4, a(r7)
	DADDI	r7, r0, 40
	L.D		f5, a(r7)
	DADDI	r7, r0, 48
	L.D		f6, a(r7)
	DADDI	r7, r0, 56
	L.D		f7, a(r7)
	HALT

