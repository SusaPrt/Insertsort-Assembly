.data
a:	.double 4.3,2.1,3.3,5.2,4.8,9.3,2.3,0.5
n:	.word	8

.text
start:	
	LD	r1, n(r0)		; r1 = n = 8 (number of elements)	
	DSLL	r1, r1, 3		; r1 = n x 2^3
	DADDI	r2, r0, a		; pointer
for_1:
	L.D	f0, 8(r2)		; f0 = a[1]

	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_2			; se vero salta a for_2
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_a0
for_2:
	L.D	f0, 16(r2)		; f0 = a[i]

	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_3			; se vero salta a for_3
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio

	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_b0			; se vero salta a cont_b0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_b0
for_3:
	L.D	f0, 24(r2)		; f0 = a[i]
	
	L.D 	f1, 16(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_4			; se vero salta a for_4
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio

	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_c1			; se vero salta a cont_c1
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_c0			; se vero salta a cont_c0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_c0
for_4:
	L.D		f0, 32(r2)		; f1 = a[i]

	L.D 	f1, 24(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_5			; se vero salta a for_5
	S.D 	f1, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 16(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d2			; se vero salta a cont_d2
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d1			; se vero salta a cont_d1
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d0			; se vero salta a cont_d0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_d0
for_5:
	L.D		f0, 40(r2)		; f0 = a[i]
	
	L.D 	f1, 32(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_6			; se vero salta a for_6
	S.D 	f1, 40(r2)		; a[j + 1] = a[j] -> scambio
		
	L.D 	f1, 24(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_e3			; se vero salta a cont_e3
	S.D 	f1, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 16(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d2			; se vero salta a cont_e2
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio

	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d1			; se vero salta a cont_e1
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_d0			; se vero salta a cont_e0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_e0
for_6:
	L.D		f0, 48(r2)		; f0 = a[i]
	
	L.D 	f1, 40(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_7			; se vero salta a for_7
	S.D 	f1, 48(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 32(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_f4			; se vero salta a cont_f4
	S.D 	f1, 40(r2)		; a[j + 1] = a[j] -> scambio

	L.D 	f1, 24(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_f3			; se vero salta a cont_f3
	S.D 	f1, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 16(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_f2			; se vero salta a cont_f2
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_f1			; se vero salta a cont_f1
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_f0			; se vero salta a cont_f0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_f0
for_7:
	L.D		f0, 56(r2)		; f0 = a[i]
	
	L.D 	f1, 48(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	end				; se vero salta a end
	S.D 	f1, 56(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 40(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g5			; se vero salta a cont_g5
	S.D 	f1, 48(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 32(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g4			; se vero salta a cont_g4
	S.D 	f1, 40(r2)		; a[j + 1] = a[j] -> scambio
		
	L.D 	f1, 24(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g3			; se vero salta a cont_g3
	S.D 	f1, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 16(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g2			; se vero salta a cont_g2
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	L.D 	f1, 8(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g1			; se vero salta a cont_g1
	S.D 	f1, 16(r2)		; a[j + 1] = a[j] -> scambio

	L.D 	f1, 0(r2)		; f1 = a[j]
	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	cont_g0			; se vero salta a cont_g0
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	j cont_g0
cont_a0: 
	S.D 	f0, 0(r2)		; a[j + 1] = a[i]
	j for_2
	
cont_b0:
	S.D		f0, 8(r2)		; a[j + 1] = a[i]
	j for_3	

cont_c1:
	S.D		f0, 16(r2)		; a[j + 1] = a[i]
	j for_4
cont_c0:
	S.D		f0, 8(r2)		;a[j + 1] = a[i]
	j for_4

cont_d2:
	S.D		f0, 24(r2)		;a[j + 1] = a[i]
	j for_5
cont_d1:
	S.D		f0, 16(r2)		;a[j + 1] = a[i]
	j for_5
cont_d0:
	S.D		f0, 8(r2)		;a[j + 1] = a[i]
	j for_5

cont_e3:
	S.D		f0, 32(r2)		;a[j + 1] = a[i]
	j for_6
cont_e2:
	S.D		f0, 24(r2)		;a[j + 1] = a[i]
	j for_6
cont_e1:
	S.D		f0, 16(r2)		;a[j + 1] = a[i]
	j for_6
cont_e0:
	S.D		f0, 8(r2)		;a[j + 1] = a[i]
	j for_6

cont_f4:
	S.D		f0, 40(r2)		;a[j + 1] = a[i]
	j for_7
cont_f3:
	S.D		f0, 32(r2)		;a[j + 1] = a[i]
	j for_7
cont_f2:
	S.D		f0, 24(r2)		;a[j + 1] = a[i]
	j for_7
cont_f1:
	S.D		f0, 16(r2)		;a[j + 1] = a[i]
	j for_7
cont_f0:
	S.D		f0, 8(r2)		;a[j + 1] = a[i]
	j for_7
		
cont_g5:	
	S.D		f0, 40(r2)		;a[j + 1] = a[i]
	j end		
cont_g4:
	S.D		f0, 32(r2)		;a[j + 1] = a[i]
	j end
cont_g3:
	S.D		f0, 24(r2)		;a[j + 1] = a[i]
	j end
cont_g2:
	S.D		f0, 16(r2)		;a[j + 1] = a[i]
	j end
cont_g1: 
	S.D		f0, 8(r2)		;a[j + 1] = a[i]
	j end
cont_g0:
	S.D		f0, 0(r2)		;a[j + 1] = a[i]
	j end

end:	
	L.D		f0, 0(r2)
	L.D		f1, 8(r2)
	L.D		f2, 16(r2)
	L.D		f3, 24(r2)
	L.D		f4, 32(r2)
	L.D		f5, 40(r2)
	L.D		f6, 48(r2)
	L.D		f7, 56(r2)
	HALT