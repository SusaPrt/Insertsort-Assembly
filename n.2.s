.data
a:	.double 4.3,2.1,3.3,5.2,4.8,9.3,2.3,0.5
n:	.word	8

.text
start:	
	LD	r1, n(r0)		; r1 = n = 8 (number of elements)
	DADDI	r2, r0, a		; pointer
	DSLL	r1, r1, 3		; r1 = n x 2^3
for_1:
	L.D	f0, 8(r2)		; f0 = a[1]
	L.D 	f1, 0(r2)		; f1 = a[j]

	C.LT.D 	f1, f0			; a[j] < a[i]	
	BC1T	for_2			; se vero salta a for_2
	S.D 	f1, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D 	f0, 0(r2)		; a[j + 1] = a[i]
for_2:
	L.D	f2, 16(r2)		; f2 = a[i]
	L.D 	f3, 8(r2)		; f3 = a[j]
	L.D 	f4, 0(r2)		; f4 = a[j]

	C.LT.D 	f3, f2			; a[j] < a[i]	
	BC1T	for_3			; se vero salta a for_3
	S.D 	f3, 16(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f4, f2			; a[j] < a[i]	
	BC1T	cont_b0			; se vero salta a cont_b0
	S.D 	f4, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D	f2, 8(r2)		; a[j + 1] = a[i]
for_3:
	L.D	f5, 24(r2)		; f5 = a[i]
	L.D 	f6, 16(r2)		; f6 = a[j]
	L.D 	f7, 8(r2)		; f7 = a[j]
	L.D 	f8, 0(r2)		; f8 = a[j]

	C.LT.D 	f6, f5			; a[j] < a[i]	
	BC1T	for_4			; se vero salta a for_4
	S.D 	f6, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f7, f5			; a[j] < a[i]	
	BC1T	cont_c1			; se vero salta a cont_c1
	S.D 	f7, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f8, f5			; a[j] < a[i]	
	BC1T	cont_c0			; se vero salta a cont_c0
	S.D 	f8, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D	f5, 8(r2)		; a[j + 1] = a[i]
for_4:
	L.D	f9, 32(r2)		; f9 = a[i]
	L.D 	f10, 24(r2)		; f10 = a[j]
	L.D 	f11, 16(r2)		; f11 = a[j]
	L.D 	f12, 8(r2)		; f12 = a[j]
	L.D 	f13, 0(r2)		; f13 = a[j]

	C.LT.D 	f10, f9			; a[j] < a[i]	
	BC1T	for_5			; se vero salta a for_5
	S.D 	f10, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f11, f9			; a[j] < a[i]	
	BC1T	cont_d2			; se vero salta a cont_d2
	S.D 	f11, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f12, f9			; a[j] < a[i]	
	BC1T	cont_d1			; se vero salta a cont_d1
	S.D 	f12, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f13, f9			; a[j] < a[i]	
	BC1T	cont_d0			; se vero salta a cont_d0
	S.D 	f13, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D	f9, 8(r2)		; a[j + 1] = a[i]
for_5:
	L.D	f14, 40(r2)		; f14 = a[i]
	L.D 	f15, 32(r2)		; f15 = a[j]
	L.D 	f16, 24(r2)		; f16 = a[j]
	L.D 	f17, 16(r2)		; f17 = a[j]
	L.D 	f18, 8(r2)		; f18 = a[j]
	L.D 	f19, 0(r2)		; f19 = a[j]

	C.LT.D 	f15, f14		; a[j] < a[i]	
	BC1T	for_6			; se vero salta a for_6
	S.D 	f15, 40(r2)		; a[j + 1] = a[j] -> scambio
		
	C.LT.D 	f16, f14		; a[j] < a[i]	
	BC1T	cont_e3			; se vero salta a cont_e3
	S.D 	f16, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	
	C.LT.D 	f17, f14		; a[j] < a[i]	
	BC1T	cont_d2			; se vero salta a cont_e2
	S.D 	f17, 24(r2)		; a[j + 1] = a[j] -> scambio


	C.LT.D 	f18, f14		; a[j] < a[i]	
	BC1T	cont_d1			; se vero salta a cont_e1
	S.D 	f18, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f19, f14		; a[j] < a[i]	
	BC1T	cont_d0			; se vero salta a cont_e0
	S.D 	f19, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D	f14, 8(r2)		; a[j + 1] = a[i]
for_6:
	L.D	f20, 48(r2)		; f20 = a[i]
	L.D 	f21, 40(r2)		; f21 = a[j]
	L.D 	f22, 32(r2)		; f22 = a[j]
	L.D 	f23, 24(r2)		; f23= a[j]
	L.D 	f24, 16(r2)		; f24 = a[j]
	L.D 	f25, 8(r2)		; f26 = a[j]
	L.D 	f26, 0(r2)		; f27 = a[j]

	C.LT.D 	f21, f20		; a[j] < a[i]	
	BC1T	for_7			; se vero salta a for_7
	S.D 	f21, 48(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f22, f20		; a[j] < a[i]	
	BC1T	cont_f4			; se vero salta a cont_f4
	S.D 	f22, 40(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f23, f20		; a[j] < a[i]	
	BC1T	cont_f3			; se vero salta a cont_f3
	S.D 	f23, 32(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f24, f20		; a[j] < a[i]	
	BC1T	cont_f2			; se vero salta a cont_f2
	S.D 	f24, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f25, f20		; a[j] < a[i]	
	BC1T	cont_f1			; se vero salta a cont_f1
	S.D 	f25, 16(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f26, f20		; a[j] < a[i]	
	BC1T	cont_f0			; se vero salta a cont_f0
	S.D 	f26, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D	f20, 8(r2)		; a[j + 1] = a[i]
for_7:
	L.D	f27, 56(r2)		; f27 = a[i]
	L.D 	f28, 48(r2)		; f28 = a[j]
	L.D 	f29, 40(r2)		; f29 = a[j]
	L.D 	f30, 32(r2)		; f30 = a[j]
	L.D 	f31, 24(r2)		; f31 = a[j]
	L.D 	f1, 16(r2)		; f1 = a[j]
	L.D 	f2, 8(r2)		; f2 = a[j]
	L.D 	f3, 0(r2)		; f3 = a[j]

	C.LT.D 	f28, f27		; a[j] < a[i]	
	BC1T	end				; se vero salta a end
	S.D 	f28, 56(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f29, f27		; a[j] < a[i]	
	BC1T	cont_g5			; se vero salta a cont_g5
	S.D 	f29, 48(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f30, f27		; a[j] < a[i]	
	BC1T	cont_g4			; se vero salta a cont_g4
	S.D 	f30, 40(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f31, f27		; a[j] < a[i]	
	BC1T	cont_g3			; se vero salta a cont_g3
	S.D 	f31, 32(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f1, f27			; a[j] < a[i]	
	BC1T	cont_g2			; se vero salta a cont_g2
	S.D 	f1, 24(r2)		; a[j + 1] = a[j] -> scambio
	
	C.LT.D 	f2, f27			; a[j] < a[i]	
	BC1T	cont_g1			; se vero salta a cont_g1
	S.D 	f2, 16(r2)		; a[j + 1] = a[j] -> scambio

	C.LT.D 	f3, f27			; a[j] < a[i]	
	BC1T	cont_g0			; se vero salta a cont_g0
	S.D 	f3, 8(r2)		; a[j + 1] = a[j] -> scambio
	S.D		f27, 0(r2)		; a[j + 1] = a[i]
	j end
cont_b0:
	S.D		f2, 8(r2)		; a[j + 1] = a[i]
	j for_3	

cont_c1:
	S.D		f5, 16(r2)		; a[j + 1] = a[i]
	j for_4
cont_c0:
	S.D		f5, 8(r2)		;a[j + 1] = a[i]
	j for_4

cont_d2:
	S.D		f9, 24(r2)		;a[j + 1] = a[i]
	j for_5
cont_d1:
	S.D		f9, 16(r2)		;a[j + 1] = a[i]
	j for_5
cont_d0:
	S.D		f9, 8(r2)		;a[j + 1] = a[i]
	j for_5

cont_e3:
	S.D		f14, 32(r2)		;a[j + 1] = a[i]
	j for_6
cont_e2:
	S.D		f14, 24(r2)		;a[j + 1] = a[i]
	j for_6
cont_e1:
	S.D		f14, 16(r2)		;a[j + 1] = a[i]
	j for_6
cont_e0:
	S.D		f14, 8(r2)		;a[j + 1] = a[i]
	j for_6

cont_f4:
	S.D		f20, 40(r2)		;a[j + 1] = a[i]
	j for_7
cont_f3:
	S.D		f20, 32(r2)		;a[j + 1] = a[i]
	j for_7
cont_f2:
	S.D		f20, 24(r2)		;a[j + 1] = a[i]
	j for_7
cont_f1:
	S.D		f20, 16(r2)		;a[j + 1] = a[i]
	j for_7
cont_f0:
	S.D		f20, 8(r2)		;a[j + 1] = a[i]
	j for_7
		
cont_g5:	
	S.D		f27, 40(r2)		;a[j + 1] = a[i]
	j end		
cont_g4:
	S.D		f27, 32(r2)		;a[j + 1] = a[i]
	j end
cont_g3:
	S.D		f27, 24(r2)		;a[j + 1] = a[i]
	j end
cont_g2:
	S.D		f27, 16(r2)		;a[j + 1] = a[i]
	j end
cont_g1: 
	S.D		f27, 8(r2)		;a[j + 1] = a[i]
	j end
cont_g0:
	S.D		f27, 0(r2)		;a[j + 1] = a[i]
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