.data
a:	.double 4.3,2.1,3.3,5.2,4.8,9.3,2.3,0.5
n:	.word	8

	.text
start:	LD	r1, n(r0)		; r1 = n = 7 (number of elements)
	DADDI 	r2, r0, 8		; r2 = i = 8
	DSLL	r1, r1, 3		; r1 = n x 2^3
for: 	
	SLT		r6, r2, r1		; r6 = i < n 
	BEQZ	r6, end			; se falso termina il programma
	DADDI 	r4, r2, -8		; r4 = j = i - 1
	L.D 	f0, a(r2)		; f0 = a[i] 
	L.D 	f2, a(r2)		; f2 = a[i] 
	L.D 	f4, a(r2)		; f4 = a[i] 
	L.D 	f6, a(r2)		; f6 = a[i] 
loop:
	L.D 	f1, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f3, a(r4)		; f3 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f3, f2			; a[j] < a[i]	
	BC1T	cont			; se è vero salta a cont
	S.D 	f3, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f5, a(r4)		; f5 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f5, f4			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f5, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f7, a(r4)		; f7 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f7, f6			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f7, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --
	j loop				; salto a loop
cont:
	S.D 	f0, a(r5)		; a[j + 1] = a[i]
	S.D 	f2, a(r5)		; a[j + 1] = a[i]
	S.D 	f4, a(r5)		; a[j + 1] = a[i]
	S.D 	f6, a(r5)		; a[j + 1] = a[i]
	DADDI 	r2, r2, 8		; i ++
	j for	
end:	
	L.D		f0, 0(r7)
	L.D		f1, 8(r7)
	L.D		f2, 16(r7)
	L.D		f3, 24(r7)
	L.D		f4, 32(r7)
	L.D		f5, 40(r7)
	L.D		f6, 48(r7)
	L.D		f7, 56(r7)
	HALT
