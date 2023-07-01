.data
a:	.double 4.3,2.1,3.3,5.2,4.8,9.3,2.3,0.5
n:	.word	8

	.text
start:	LD	r1, n(r0)		; r1 = n = 8 (number of elements)
	DADDI 	r2, r0, 8		; r2 = i = 8		
	DSLL	r1, r1, 3		; r1 = n x 2^3	
for: 	
	SLT	r6, r2, r1		; r6 = i < n 
	BEQZ	r6, end			; se falso termina il programma
	DADDI 	r4, r2, -8		; r4 = j = i - 1
	L.D 	f0, a(r2)		; f0 = a[i] 
	L.D 	f2, a(r2)		; f2 = a[i] 
	L.D 	f4, a(r2)		; f4 = a[i] 
	L.D 	f6, a(r2)		; f6 = a[i] 
	L.D 	f8, a(r2)		; f8 = a[i] 
	L.D 	f10, a(r2)		; f10 = a[i] 	
	L.D 	f12, a(r2)		; f12 = a[i] 
	L.D 	f14, a(r2)		; f14 = a[i] 
	
	L.D 	f1, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f1, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --
	
	L.D 	f3, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f3, f2			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f3, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f5, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f5, f4			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f5, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f7, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f7, f6			; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f7, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f9, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f9, f8			; a[j] < a[i]	
	BC1T	cont			; se vero salta al cont
	S.D 	f9, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f11, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f11, f10		; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f11, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f13, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f13, f12		; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f13, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --

	L.D 	f15, a(r4)		; f1 = a[j]
	DADDI	r5, r4, 8		; r5 = j + 1
	C.LT.D 	f15, f14		; a[j] < a[i]	
	BC1T	cont			; se vero salta a cont
	S.D 	f15, a(r5)		; a[j + 1] = a[j] -> scambio
	DADDI	r4, r4, -8		; j --
cont:
	S.D 	f0, a(r5)		; a[j + 1] = a[i]
	S.D 	f2, a(r5)		; a[j + 1] = a[i]
	S.D 	f4, a(r5)		; a[j + 1] = a[i]
	S.D 	f6, a(r5)		; a[j + 1] = a[i]
	S.D 	f8, a(r5)		; a[j + 1] = a[i]
	S.D 	f10, a(r5)		; a[j + 1] = a[i]
	S.D 	f12, a(r5)		; a[j + 1] = a[i]
	S.D 	f12, a(r5)		; a[j + 1] = a[i]
	S.D 	f14, a(r5)		; a[j + 1] = a[i]
	DADDI 	r2, r2, 8		; i ++		
	j for
end:	
	L.D	f0, a(r7)
	DADDI	r7, r0, 8
	L.D	f1, a(r7)
	DADDI	r7, r0, 16
	L.D	f2, a(r7)
	DADDI	r7, r0, 24
	L.D	f3, a(r7)
	DADDI	r7, r0, 32
	L.D	f4, a(r7)
	DADDI	r7, r0, 40
	L.D	f5, a(r7)
	DADDI	r7, r0, 48
	L.D	f6, a(r7)
	DADDI	r7, r0, 56
	L.D	f7, a(r7)
	HALT