	.arch armv9-a+crc+i8mm+bf16+sve2-aes+sve2-bitperm+sve2-sha3+sve2-sm4+memtag+profile+nossbs
	.file	"cnn_internals.cpp"
// GNU C++17 (Spack GCC) version 14.2.0 (aarch64-unknown-linux-gnu)
//	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1-p1, MPC version 1.3.1, isl version none
// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mlittle-endian -mabi=lp64 -mcpu=neoverse-v2+crc+sve2-aes+sve2-sha3+sve2-sm4+norng+nossbs -O3 -std=c++17 -ffast-math -ftree-vectorize -fopt-info-vec-optimized
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_, %function
_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_:
.LFB1535:
	.cfi_startproc
	stp	x29, x30, [sp, -224]!	//,,,
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	mov	x29, sp	//,
	mov	x12, x3	// output, tmp355
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	mov	x21, x0	// input, tmp352
	mov	x0, x1	// weight, tmp353
// src/cpp/cnn_internals.cpp:412:     for (int b = 0; b < input.batches; ++b)
	ldr	w4, [x21, 24]	//, input_70(D)->batches
// src/cpp/cnn_internals.cpp:409:     const int OC = weight.batches, IC = weight.channels;
	ldr	w3, [x1, 24]	//, weight_73(D)->batches
// src/cpp/cnn_internals.cpp:412:     for (int b = 0; b < input.batches; ++b)
	cmp	w4, 0	// _97,
	ble	.L1		//,
	cmp	w3, 0	// OC,
	ble	.L1		//,
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 20, -200
	.cfi_offset 19, -208
	mov	x1, x2	// bias, tmp354
	sxtw	x15, w4	// _272, _97
// src/cpp/cnn_internals.cpp:414:         for (int oh = 0; oh < output.height; ++oh)
	mov	x2, 0	// ivtmp.370,
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -168
	.cfi_offset 23, -176
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -152
	.cfi_offset 25, -160
	mov	x25, 0	// ivtmp.373,
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -136
	.cfi_offset 27, -144
// src/cpp/cnn_internals.cpp:410:     const int KH = weight.height,  KW = weight.width;
	ldp	w19, w22, [x0, 28]	// IC, KH,
// src/cpp/cnn_internals.cpp:410:     const int KH = weight.height,  KW = weight.width;
	ldr	w7, [x0, 36]	//, weight_73(D)->width
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x28, [x1]	// _76, MEM[(const struct vector *)bias_75(D)].D.33436._M_impl.D.32737._M_start
	smull	x1, w22, w19	// _253, KH, IC
	sxtw	x10, w19	// _267, IC
	ldr	x16, [x0]	// _74, MEM[(const struct vector *)weight_73(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:414:         for (int oh = 0; oh < output.height; ++oh)
	mov	x23, x10	// ivtmp.372, _267
	sxtw	x11, w7	// _254, KW
	smull	x24, w22, w7	// _219, KH, KW
	sub	w17, w7, #1	// _144, KW,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x0, [x12]	// _78, MEM[(struct vector *)output_77(D)].D.33436._M_impl.D.32737._M_start
	lsl	x13, x11, 2	// _21, _254,
	mul	x27, x1, x11	// _255, _253, _254
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x8, [x21]	// _72, MEM[(const struct vector *)input_70(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:414:         for (int oh = 0; oh < output.height; ++oh)
	ldr	w20, [x12, 32]	//, output_77(D)->height
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	str	x0, [sp, 144]	// _78, %sfp
.L4:
	cmp	w20, 0	// _100,
	bgt	.L48		//,
// src/cpp/cnn_internals.cpp:412:     for (int b = 0; b < input.batches; ++b)
	add	x2, x2, 1	// ivtmp.370, ivtmp.370,
	add	x23, x23, x10	// ivtmp.372, ivtmp.372, _267
	add	x25, x25, x10	// ivtmp.373, ivtmp.373, _267
	cmp	x2, x15	// ivtmp.370, _272
	bne	.L4		//,
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_restore 20
	.cfi_restore 19
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
.L1:
// src/cpp/cnn_internals.cpp:427: }
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x29, x30, [sp], 224	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_def_cfa_offset 0
	ret	
.L48:
	.cfi_def_cfa_offset 224
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	.cfi_offset 27, -144
	.cfi_offset 28, -136
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	ldr	w6, [x12, 36]	//, output_77(D)->width
	sxtw	x3, w3	// _262, OC
	mov	x1, x2	// ivtmp.370, ivtmp.370
	ptrue	p6.b, all	// tmp330
	mov	x2, x3	// _262, _262
// src/cpp/cnn_internals.cpp:419:                 for (int kw = 0; kw < KW; ++kw)
	cntw	x5		// tmp328
	mov	w3, w20	// _100, _100
	lsr	w18, w7, 4	// bnd.283_141, KW,
	mov	w14, w22	// KH, KH
	mov	w20, w19	// IC, IC
	sxtw	x26, w6	// _47, _103
.L26:
// src/cpp/cnn_internals.cpp:415:           for (int ow = 0; ow < output.width; ++ow) {
	mov	x30, 0	// ivtmp.366,
	mov	x0, 0	// ivtmp.362,
.L28:
	cmp	w6, 0	// _103,
	bgt	.L49		//,
// src/cpp/cnn_internals.cpp:413:       for (int oc = 0; oc < OC; ++oc)
	add	x0, x0, 1	// ivtmp.362, ivtmp.362,
	add	x30, x30, x27	// ivtmp.366, ivtmp.366, _255
	cmp	x0, x2	// ivtmp.362, _262
	bne	.L28		//,
// src/cpp/cnn_internals.cpp:412:     for (int b = 0; b < input.batches; ++b)
	add	x1, x1, 1	// ivtmp.370, ivtmp.370,
	add	x23, x23, x10	// ivtmp.372, ivtmp.372, _267
	add	x25, x25, x10	// ivtmp.373, ivtmp.373, _267
	cmp	x1, x15	// ivtmp.370, _272
	bne	.L26		//,
.L54:
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_remember_state
	.cfi_restore 20
	.cfi_restore 19
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
	b	.L1		//
.L49:
	.cfi_restore_state
	ldrsw	x4, [x12, 28]	// _40, output_77(D)->channels
	sxtw	x9, w3	// _246, _100
	mov	w19, 64	// tmp300,
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	mov	x22, x1	// ivtmp.370, ivtmp.370
	str	w3, [sp, 164]	// _100, %sfp
	mov	w3, w20	// IC, IC
	mov	x20, x10	// _267, _267
	mov	w10, w6	// _103, _103
	str	x9, [sp, 128]	// _246, %sfp
	mov	x6, x25	// ivtmp.373, ivtmp.373
	and	w9, w7, -16	// niters_vector_mult_vf.284, KW,
	mul	x4, x4, x1	// _41, _40, ivtmp.370
	str	x4, [sp, 152]	// _41, %sfp
	mov	w4, w14	// KH, KH
.L22:
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	ldr	x1, [sp, 152]	// _41, %sfp
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	mov	x25, 0	// ivtmp.358,
	str	x0, [sp, 120]	// ivtmp.362, %sfp
	ldr	x14, [sp, 128]	// _246, %sfp
	str	x27, [sp, 168]	// _255, %sfp
	mov	x27, x22	// ivtmp.370, ivtmp.370
	str	w4, [sp, 96]	// KH, %sfp
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	add	x1, x1, x0	// _42, _41, ivtmp.362
	mov	x0, x2	// _262, _262
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	mul	x1, x1, x14	// _44, _42, _246
	uxtw	x14, w4	//,
	str	x1, [sp, 136]	// _44, %sfp
	mov	w1, w3	// IC, IC
.L25:
	ldp	x2, x3, [sp, 136]	// _44, _78,
// src/cpp/cnn_internals.cpp:424:             op[((std::size_t)b * output.channels + oc) * output.height * output.width
	mov	x22, 0	// ivtmp.353,
// src/cpp/cnn_internals.cpp:425:                + (std::size_t)oh * output.width + ow] = s;
	add	x2, x2, x25	// _46, _44, ivtmp.358
	mul	x2, x2, x26	// _69, _46, _47
	add	x3, x3, x2, lsl 2	// _239, _78, _69,
// src/cpp/cnn_internals.cpp:416:             float s = bp[oc];
	ldr	x2, [sp, 120]	// ivtmp.362, %sfp
	ldr	s31, [x28, x2, lsl 2]	//, MEM[(const float *)_76 + ivtmp.362_167 * 4]
// src/cpp/cnn_internals.cpp:417:             for (int ic = 0; ic < IC; ++ic)
	cmp	w1, 0	// IC,
	bgt	.L50		//,
.L5:
// src/cpp/cnn_internals.cpp:425:                + (std::size_t)oh * output.width + ow] = s;
	str	s31, [x3, x22, lsl 2]	//, MEM[(float *)_239 + ivtmp.353_236 * 4]
// src/cpp/cnn_internals.cpp:415:           for (int ow = 0; ow < output.width; ++ow) {
	add	x22, x22, 1	// ivtmp.353, ivtmp.353,
	cmp	x26, x22	// _47, ivtmp.353
	beq	.L18		//,
// src/cpp/cnn_internals.cpp:416:             float s = bp[oc];
	ldr	x2, [sp, 120]	// ivtmp.362, %sfp
	ldr	s31, [x28, x2, lsl 2]	//, MEM[(const float *)_76 + ivtmp.362_167 * 4]
// src/cpp/cnn_internals.cpp:417:             for (int ic = 0; ic < IC; ++ic)
	cmp	w1, 0	// IC,
	ble	.L5		//,
.L50:
	mov	x2, x12	// output, output
	mov	x12, x27	// ivtmp.370, ivtmp.370
	str	w1, [sp, 184]	// IC, %sfp
.L19:
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	mov	x27, x6	// ivtmp.350, ivtmp.373
	mov	x1, x30	// ivtmp.349, ivtmp.366
.L6:
// src/cpp/cnn_internals.cpp:418:               for (int kh = 0; kh < KH; ++kh)
	cmp	w4, 0	// KH,
	bgt	.L51		//,
// src/cpp/cnn_internals.cpp:417:             for (int ic = 0; ic < IC; ++ic)
	add	x27, x27, 1	// ivtmp.350, ivtmp.350,
	add	x1, x1, x24	// ivtmp.349, ivtmp.349, _219
	cmp	x23, x27	// ivtmp.372, ivtmp.350
	bne	.L6		//,
// src/cpp/cnn_internals.cpp:425:                + (std::size_t)oh * output.width + ow] = s;
	str	s31, [x3, x22, lsl 2]	//, MEM[(float *)_239 + ivtmp.353_166 * 4]
// src/cpp/cnn_internals.cpp:415:           for (int ow = 0; ow < output.width; ++ow) {
	add	x22, x22, 1	// ivtmp.353, ivtmp.353,
	cmp	x26, x22	// _47, ivtmp.353
	beq	.L42		//,
.L53:
// src/cpp/cnn_internals.cpp:416:             float s = bp[oc];
	ldr	x1, [sp, 120]	// ivtmp.362, %sfp
	ldr	s31, [x28, x1, lsl 2]	//, MEM[(const float *)_76 + ivtmp.362_167 * 4]
	b	.L19		//
.L51:
	str	w4, [sp, 188]	// KH, %sfp
	mov	x4, x20	// _267, _267
	stp	x3, x30, [sp, 192]	// _239, ivtmp.366,
	mov	x3, x15	// _272, _272
	str	x28, [sp, 176]	// _76, %sfp
	stp	x12, x6, [sp, 208]	// ivtmp.370, ivtmp.373,
	.p2align 5,,15
.L14:
	add	x12, x16, x1, lsl 2	// ivtmp.340, _74, ivtmp.349,
	mov	w6, w25	// ivtmp.341, ivtmp.358
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	mov	x15, x1	// ivtmp.342, ivtmp.349
.L17:
// src/cpp/cnn_internals.cpp:419:                 for (int kw = 0; kw < KW; ++kw)
	cmp	w7, 0	// KW,
	bgt	.L52		//,
// src/cpp/cnn_internals.cpp:418:               for (int kh = 0; kh < KH; ++kh)
	add	w6, w6, 1	// ivtmp.341, ivtmp.341,
	add	x12, x12, x13	// ivtmp.340, ivtmp.340, _21
	add	x15, x15, x11	// ivtmp.342, ivtmp.342, _254
	cmp	w6, w14	// ivtmp.341, ivtmp.360
	bne	.L17		//,
// src/cpp/cnn_internals.cpp:417:             for (int ic = 0; ic < IC; ++ic)
	add	x27, x27, 1	// ivtmp.350, ivtmp.350,
	add	x1, x1, x24	// ivtmp.349, ivtmp.349, _219
	cmp	x27, x23	// ivtmp.350, ivtmp.372
	bne	.L14		//,
.L55:
	mov	x15, x3	// _272, _272
	ldp	x3, x30, [sp, 192]	// _239, ivtmp.366,
	mov	x20, x4	// _267, _267
	ldp	x12, x6, [sp, 208]	// ivtmp.370, ivtmp.373,
// src/cpp/cnn_internals.cpp:425:                + (std::size_t)oh * output.width + ow] = s;
	str	s31, [x3, x22, lsl 2]	//, MEM[(float *)_239 + ivtmp.353_166 * 4]
// src/cpp/cnn_internals.cpp:415:           for (int ow = 0; ow < output.width; ++ow) {
	add	x22, x22, 1	// ivtmp.353, ivtmp.353,
	ldr	x28, [sp, 176]	// _76, %sfp
	ldr	w4, [sp, 188]	//, %sfp
	cmp	x26, x22	// _47, ivtmp.353
	bne	.L53		//,
.L42:
	mov	x27, x12	// ivtmp.370, ivtmp.370
	mov	x12, x2	// output, output
	ldr	w1, [sp, 184]	//, %sfp
.L18:
// src/cpp/cnn_internals.cpp:414:         for (int oh = 0; oh < output.height; ++oh)
	add	x25, x25, 1	// ivtmp.358, ivtmp.358,
	add	w14, w14, 1	// ivtmp.360, ivtmp.360,
	ldr	x2, [sp, 128]	// _246, %sfp
	cmp	x25, x2	// ivtmp.358, _246
	bne	.L25		//,
// src/cpp/cnn_internals.cpp:413:       for (int oc = 0; oc < OC; ++oc)
	mov	x2, x0	// _262, _262
	ldr	x0, [sp, 120]	// ivtmp.362, %sfp
	mov	x22, x27	// ivtmp.370, ivtmp.370
	mov	w3, w1	// IC, IC
	ldr	x27, [sp, 168]	// _255, %sfp
	add	x0, x0, 1	// ivtmp.362, ivtmp.362,
	add	x30, x30, x27	// ivtmp.366, ivtmp.366, _255
	cmp	x0, x2	// ivtmp.362, _262
	bne	.L22		//,
	mov	x1, x22	// ivtmp.370, ivtmp.370
	mov	x25, x6	// ivtmp.373, ivtmp.373
// src/cpp/cnn_internals.cpp:412:     for (int b = 0; b < input.batches; ++b)
	add	x1, x1, 1	// ivtmp.370, ivtmp.370,
	mov	w6, w10	// _103, _103
	mov	x10, x20	// _267, _267
	mov	w14, w4	// KH, KH
	mov	w20, w3	// IC, IC
	add	x23, x23, x10	// ivtmp.372, ivtmp.372, _267
	ldr	w3, [sp, 164]	//, %sfp
	add	x25, x25, x10	// ivtmp.373, ivtmp.373, _267
	cmp	x1, x15	// ivtmp.370, _272
	bne	.L26		//,
	b	.L54		//
	.p2align 2,,3
.L52:
	ldpsw	x20, x28, [x21, 32]	// _10, _16,
	stp	x27, x1, [sp, 96]	// ivtmp.350, ivtmp.349,
	str	x24, [sp, 112]	// _219, %sfp
// src/cpp/cnn_internals.cpp:420:                   s += ip[((std::size_t)b * IC + ic) * input.height * input.width
	mul	x20, x20, x27	// _11, _10, ivtmp.350
	.p2align 5,,15
.L11:
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	add	x27, x20, w6, sxtw	// _14, _11, ivtmp.341
	mul	x27, x27, x28	// _17, _14, _16
	cmp	w17, 14	// _144,
	bls	.L29		//,
	movi	v30.4s, 0	//
	add	x27, x27, x22	// _189, _17, ivtmp.353
	umaddl	x30, w18, w19, x12	// _162, bnd.283_141, tmp300, ivtmp.340
	mov	x24, x12	// ivtmp.333, ivtmp.340
	add	x1, x8, x27, lsl 2	// ivtmp.335, _72, _189,
	mov	v1.16b, v30.16b	//,
	mov	v28.16b, v30.16b	//,
	mov	v0.16b, v30.16b	//,
	.p2align 5,,15
.L8:
// src/cpp/cnn_internals.cpp:423:                           + (std::size_t)kh * KW + kw];
	ldp	q23, q22, [x24, 16]	//,,
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	ldp	q25, q24, [x1, 32]	//,,
	ldp	q2, q26, [x1], 64	//,, ivtmp.335,
// src/cpp/cnn_internals.cpp:423:                           + (std::size_t)kh * KW + kw];
	ldr	q21, [x24, 48]	//, MEM <const vector(4) float> [(const float *)_156 + 48B]
	ldr	q20, [x24], 64	//, MEM <const vector(4) float> [(const float *)_156]
// src/cpp/cnn_internals.cpp:420:                   s += ip[((std::size_t)b * IC + ic) * input.height * input.width
	fmla	v1.4s, v22.4s, v25.4s	//,,
	fmla	v28.4s, v23.4s, v26.4s	//,,
	fmla	v30.4s, v21.4s, v24.4s	//,,
	fmla	v0.4s, v20.4s, v2.4s	//,,
	cmp	x24, x30	// ivtmp.333, _162
	bne	.L8		//,
	mov	w24, w9	// niters_vector_mult_vf.284, niters_vector_mult_vf.284
	fadd	v1.4s, v30.4s, v1.4s	//,,
	fadd	v0.4s, v28.4s, v0.4s	//,,
	fadd	v0.4s, v1.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	fadd	s31, s31, s0	//,,
	cmp	w9, w7	// niters_vector_mult_vf.284, KW
	beq	.L9		//,
.L7:
	uxtw	x30, w24	// _190, niters_vector_mult_vf.284
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	mov	x1, 0	// ivtmp_209,
	mov	z19.s, #0	//
	add	x27, x27, x30	// _191, _189, _190
	add	x30, x15, x30	// _199, ivtmp.342, _190
	add	x27, x8, x27, lsl 2	// vectp.306, _72, _191,
	sub	w24, w7, w24	// bnd.303, KW, niters_vector_mult_vf.284
	whilelo	p7.s, wzr, w24	// loop_mask_195,, bnd.303
	add	x30, x16, x30, lsl 2	// vectp.309, _74, _199,
.L10:
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	ld1w	z29.s, p7/z, [x27, x1, lsl 2]	//, loop_mask_195,* vectp.306
// src/cpp/cnn_internals.cpp:423:                           + (std::size_t)kh * KW + kw];
	ld1w	z27.s, p7/z, [x30, x1, lsl 2]	//, loop_mask_195,* vectp.309
// src/cpp/cnn_internals.cpp:419:                 for (int kw = 0; kw < KW; ++kw)
	add	x1, x1, x5	// ivtmp_209, ivtmp_209, tmp328
// src/cpp/cnn_internals.cpp:420:                   s += ip[((std::size_t)b * IC + ic) * input.height * input.width
	fmla	z19.s, p7/m, z29.s, z27.s	//, loop_mask_195,,
	whilelo	p7.s, w1, w24	// loop_mask_195, ivtmp_209, bnd.303
	b.any	.L10	//,
	faddv	s19, p6, z19.s	//, tmp330,
	fadd	s31, s31, s19	//,,
.L9:
// src/cpp/cnn_internals.cpp:418:               for (int kh = 0; kh < KH; ++kh)
	add	w6, w6, 1	// ivtmp.341, ivtmp.341,
	add	x12, x12, x13	// ivtmp.340, ivtmp.340, _21
	add	x15, x15, x11	// ivtmp.342, ivtmp.342, _254
	cmp	w6, w14	// ivtmp.341, ivtmp.360
	bne	.L11		//,
	ldp	x27, x1, [sp, 96]	// ivtmp.350, ivtmp.349,
	ldr	x24, [sp, 112]	// _219, %sfp
// src/cpp/cnn_internals.cpp:417:             for (int ic = 0; ic < IC; ++ic)
	add	x27, x27, 1	// ivtmp.350, ivtmp.350,
	add	x1, x1, x24	// ivtmp.349, ivtmp.349, _219
	cmp	x27, x23	// ivtmp.350, ivtmp.372
	bne	.L14		//,
	b	.L55		//
.L29:
// src/cpp/cnn_internals.cpp:421:                           + (std::size_t)(oh + kh) * input.width + (ow + kw)]
	mov	w24, 0	// niters_vector_mult_vf.284,
	add	x27, x27, x22	// _189, _17, ivtmp.353
	b	.L7		//
	.cfi_endproc
.LFE1535:
	.size	_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_, .-_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_
	.align	2
	.p2align 5,,15
	.global	_Z14conv2d_forwardRK6TensorS1_S1_RS_ii
	.type	_Z14conv2d_forwardRK6TensorS1_S1_RS_ii, %function
_Z14conv2d_forwardRK6TensorS1_S1_RS_ii:
.LFB1528:
	.cfi_startproc
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	ldr	w12, [x0, 24]	//, input_63(D)->batches
// src/cpp/cnn_internals.cpp:7:                     int stride, int padding) {
	mov	x8, x0	// input, tmp248
// src/cpp/cnn_internals.cpp:8:     int out_channels = weight.batches;
	ldr	w0, [x1, 24]	//, weight_58(D)->batches
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	cmp	w12, 0	// _98,
	ble	.L105		//,
	cmp	w0, 0	// out_channels,
	ble	.L105		//,
// src/cpp/cnn_internals.cpp:7:                     int stride, int padding) {
	stp	x29, x30, [sp, -192]!	//,,,
	.cfi_def_cfa_offset 192
	.cfi_offset 29, -192
	.cfi_offset 30, -184
	mov	x29, sp	//,
	mov	x15, x2	// bias, tmp250
	mov	x14, x1	// weight, tmp249
	mov	x11, x3	// output, tmp251
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 19, -176
	.cfi_offset 20, -168
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	mov	w20, 0	// b,
// src/cpp/cnn_internals.cpp:7:                     int stride, int padding) {
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 21, -160
	.cfi_offset 22, -152
	mov	w22, w4	// stride, tmp252
	stp	x23, x24, [sp, 48]	//,,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 23, -144
	.cfi_offset 24, -136
	.cfi_offset 25, -128
	.cfi_offset 26, -120
	mov	w25, w5	// padding, tmp253
// src/cpp/cnn_internals.cpp:10:     int kernel_h     = weight.height;
	ldp	w5, w2, [x1, 28]	// in_channels, kernel_h,
// src/cpp/cnn_internals.cpp:11:     int kernel_w     = weight.width;
	ldr	w10, [x14, 36]	//, weight_58(D)->width
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	ldr	w24, [x3, 32]	//, output_65(D)->height
	mul	w1, w5, w2	// _46, in_channels, kernel_h
	mul	w21, w10, w2	// _27, kernel_w, kernel_h
	mul	w13, w1, w10	// _237, _46, kernel_w
.L59:
	cmp	w24, 0	// _106,
	bgt	.L110		//,
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	add	w20, w20, 1	// b, b,
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	cmp	w20, w12	// b, _98
	bne	.L59		//,
// src/cpp/cnn_internals.cpp:44: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x25, x26, [sp, 64]	//,,
	ldp	x29, x30, [sp], 192	//,,,
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
.L110:
	.cfi_restore_state
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -104
	.cfi_offset 27, -112
	sxtw	x1, w0	// _239, out_channels
	mov	w3, w13	// _237, _237
	sub	w0, w2, w25	// ivtmp.418, kernel_h, padding
	mov	w13, w12	// _98, _98
	sub	w28, w10, w25	// ivtmp.411, kernel_w, padding
	neg	w26, w25	// ivtmp.419, padding
	ldr	w23, [x11, 36]	//, output_65(D)->width
	mov	x6, x11	// output, output
	mov	w30, w25	// padding, padding
	str	w0, [sp, 160]	// ivtmp.418, %sfp
// src/cpp/cnn_internals.cpp:37:                                   oc * (output.height * output.width) +
	mul	w9, w24, w23	// _54, _106, _109
	sxtw	x27, w23	// _162, _109
	mov	w12, w23	// _109, _109
	mov	w23, w22	// stride, stride
	mov	w7, w9	// _54, _54
.L81:
	mov	w25, 0	// ivtmp.425,
	mov	x0, 0	// ivtmp.422,
.L83:
	cmp	w12, 0	// _109,
	bgt	.L111		//,
// src/cpp/cnn_internals.cpp:15:         for (int oc = 0; oc < out_channels; ++oc) {
	add	x0, x0, 1	// ivtmp.422, ivtmp.422,
	add	w25, w25, w3	// ivtmp.425, ivtmp.425, _237
	cmp	x0, x1	// ivtmp.422, _239
	bne	.L83		//,
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	add	w20, w20, 1	// b, b,
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	cmp	w20, w13	// b, _98
	bne	.L81		//,
.L115:
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_remember_state
	.cfi_restore 28
	.cfi_restore 27
// src/cpp/cnn_internals.cpp:44: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x25, x26, [sp, 64]	//,,
	ldp	x29, x30, [sp], 192	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
.L111:
	.cfi_restore_state
	ldr	w11, [x6, 28]	//, output_65(D)->channels
// src/cpp/cnn_internals.cpp:37:                                   oc * (output.height * output.width) +
	mul	w4, w7, w0	// _215, _54, ivtmp.422
	lsl	x9, x0, 2	// _164, ivtmp.422,
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	str	w13, [sp, 164]	// _98, %sfp
	mov	x13, x6	// output, output
	ldr	x17, [x6]	// _93, MEM[(struct vector *)output_65(D)].D.33436._M_impl.D.32737._M_start
	mov	x6, x1	// _239, _239
	mov	w1, w12	// _109, _109
	ldr	x16, [x15]	// MEM[(const struct vector *)bias_68(D)].D.33436._M_impl.D.32737._M_start, MEM[(const struct vector *)bias_68(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w11, w24, w11	// _30, _106, output_65(D)->channels
	str	x17, [sp, 152]	// _93, %sfp
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	mov	x17, x15	// bias, bias
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w11, w11, w12	// _31, _30, _109
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w22, w11, w20	// _32, _31, b
.L78:
	ldr	w15, [sp, 160]	//, %sfp
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	add	w4, w22, w4	// _35, _32, _215
	mov	w11, w3	// _237, _237
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	add	x19, x16, x9	// _83, MEM[(const struct vector *)bias_68(D)].D.33436._M_impl.D.32737._M_start, _164
	mov	w3, w25	// ivtmp.425, ivtmp.425
	str	x0, [sp, 168]	// ivtmp.422, %sfp
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	mov	w9, 0	// oh,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	mov	w12, w26	// ivtmp.419, ivtmp.419
// src/cpp/cnn_internals.cpp:36:                     int out_idx = b * (output.channels * output.height * output.width) +
	str	w4, [sp, 148]	// _35, %sfp
	mov	x18, x17	// bias, bias
	mov	w25, w11	// _237, _237
	str	w7, [sp, 176]	// _54, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	mov	w4, 0	// ivtmp.417,
	mov	w7, w22	// _32, _32
	mov	x0, x6	// _239, _239
.L80:
	ldr	x22, [sp, 152]	// _93, %sfp
	mov	w11, w28	// ivtmp.411, ivtmp.411
	stp	w4, w9, [sp, 180]	// ivtmp.417, oh,
	mov	x9, x0	// _239, _239
// src/cpp/cnn_internals.cpp:37:                                   oc * (output.height * output.width) +
	ldr	w6, [sp, 148]	//, %sfp
	str	w24, [sp, 188]	// _106, %sfp
	mov	w24, w25	// _237, _237
	add	w6, w4, w6	// _37, ivtmp.417, _35
	add	x17, x27, w6, sxtw	// _148, _162, _37
	add	x17, x22, x17, lsl 2	// _23, _93, _148,
	add	x6, x22, w6, sxtw 2	// ivtmp.408, _93, _37,
	mov	w4, w7	// _32, _32
	mov	w22, w26	// ivtmp.412, ivtmp.419
	str	x17, [sp, 136]	// _23, %sfp
	mov	w17, w30	// ivtmp.410, padding
.L75:
// src/cpp/cnn_internals.cpp:18:                     float pixel_value = bias.data[oc];
	ldr	s31, [x19]	//, *_83
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w0, w3	// ivtmp.403, ivtmp.425
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w25, 0	// ic,
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w5, 0	// in_channels,
	ble	.L61		//,
	stp	x19, x6, [sp, 120]	// _83, ivtmp.408,
	mov	w6, w3	// ivtmp.425, ivtmp.425
	mov	x3, x13	// output, output
	stp	w12, w21, [sp, 108]	// ivtmp.419, _27,
	str	w5, [sp, 116]	// in_channels, %sfp
	str	w2, [sp, 144]	// kernel_h, %sfp
.L60:
// src/cpp/cnn_internals.cpp:20:                         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w2, [sp, 144]	//, %sfp
	cmp	w2, 0	// kernel_h,
	ble	.L69		//,
	mov	x13, x18	// bias, bias
	mov	x2, x3	// output, output
.L73:
// src/cpp/cnn_internals.cpp:24:                                 if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
	ldr	w7, [sp, 108]	//, %sfp
	add	w18, w0, w17	// ivtmp.398, ivtmp.403, ivtmp.410
.L74:
// src/cpp/cnn_internals.cpp:21:                             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w10, 0	// kernel_w,
	bgt	.L112		//,
// src/cpp/cnn_internals.cpp:20:                         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w7, w7, 1	// ivtmp.397, ivtmp.397,
	add	w18, w18, w10	// ivtmp.398, ivtmp.398, kernel_w
	cmp	w7, w15	// ivtmp.397, ivtmp.418
	bne	.L74		//,
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w3, [sp, 112]	//, %sfp
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w25, w25, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w0, w0, w3	// ivtmp.403, ivtmp.403, _27
	ldr	w3, [sp, 116]	//, %sfp
	cmp	w3, w25	// in_channels, ic
	bne	.L73		//,
.L114:
	mov	x5, x3	//,
	mov	x18, x13	// bias, bias
	ldp	w12, w21, [sp, 108]	//,,
	mov	w3, w6	// ivtmp.425, ivtmp.425
	mov	x13, x2	// output, output
	ldp	x19, x6, [sp, 120]	// _83, ivtmp.408,
	ldr	w2, [sp, 144]	//, %sfp
.L61:
// src/cpp/cnn_internals.cpp:17:                 for (int ow = 0; ow < output.width; ++ow) {
	sub	w17, w17, w23	// ivtmp.410, ivtmp.410, stride
	add	w11, w11, w23	// ivtmp.411, ivtmp.411, stride
// src/cpp/cnn_internals.cpp:39:                     output.data[out_idx] = pixel_value;
	str	s31, [x6], 4	//, MEM[(value_type &)_181]
// src/cpp/cnn_internals.cpp:17:                 for (int ow = 0; ow < output.width; ++ow) {
	ldr	x0, [sp, 136]	// _23, %sfp
	add	w22, w22, w23	// ivtmp.412, ivtmp.412, stride
	cmp	x0, x6	// _23, ivtmp.408
	bne	.L75		//,
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	mov	w7, w4	// _32, _32
	mov	x0, x9	// _239, _239
	ldp	w4, w9, [sp, 180]	//,,
	mov	w25, w24	// _237, _237
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	add	w15, w15, w23	// ivtmp.418, ivtmp.418, stride
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	ldr	w24, [sp, 188]	//, %sfp
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	add	w12, w12, w23	// ivtmp.419, ivtmp.419, stride
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	add	w9, w9, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:16:             for (int oh = 0; oh < output.height; ++oh) {
	add	w4, w4, w1	// ivtmp.417, ivtmp.417, _109
	cmp	w9, w24	// oh, _106
	bne	.L80		//,
// src/cpp/cnn_internals.cpp:15:         for (int oc = 0; oc < out_channels; ++oc) {
	mov	x6, x0	// _239, _239
	ldr	x0, [sp, 168]	// ivtmp.422, %sfp
	mov	w4, w25	// _237, _237
	mov	w25, w3	// ivtmp.425, ivtmp.425
	mov	w22, w7	// _32, _32
	mov	x17, x18	// bias, bias
	ldr	w7, [sp, 176]	//, %sfp
	mov	w3, w4	// _237, _237
	add	w25, w25, w4	// ivtmp.425, ivtmp.425, _237
	add	x0, x0, 1	// ivtmp.422, ivtmp.422,
	cmp	x0, x6	// ivtmp.422, _239
	beq	.L100		//,
// src/cpp/cnn_internals.cpp:37:                                   oc * (output.height * output.width) +
	mul	w4, w7, w0	// _215, _54, ivtmp.422
	lsl	x9, x0, 2	// _164, ivtmp.422,
	b	.L78		//
	.p2align 2,,3
.L112:
	mov	w19, w17	// ivtmp.410, ivtmp.410
	mov	w21, w6	// ivtmp.425, ivtmp.425
	.p2align 5,,15
.L66:
	tbnz	w7, #31, .L62	// ivtmp.397,
	ldr	w17, [x8, 32]	//, MEM[(int *)input_63(D) + 32B]
// src/cpp/cnn_internals.cpp:24:                                 if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
	mov	w3, w22	// ivtmp.392, ivtmp.412
	stp	w10, w0, [sp, 96]	// kernel_w, ivtmp.403,
	cmp	w7, w17	// ivtmp.397, input__height_lsm0.385
	cset	w5, lt	// _141,
	b	.L64		//
	.p2align 2,,3
.L63:
// src/cpp/cnn_internals.cpp:21:                             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w3, w3, 1	// ivtmp.392, ivtmp.392,
	cmp	w11, w3	// ivtmp.411, ivtmp.392
	beq	.L113		//,
.L64:
// src/cpp/cnn_internals.cpp:24:                                 if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
	cmp	w3, 0	// ivtmp.392,
	ccmp	w5, 0, 4, ge	// _141,,,
	beq	.L63		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	add	w6, w18, w3	// _167, ivtmp.398, ivtmp.392
	mov	x0, x6	// _167, _167
// src/cpp/cnn_internals.cpp:24:                                 if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
	ldr	w6, [x8, 36]	//, input_63(D)->width
// src/cpp/cnn_internals.cpp:26:                                                  ic * (input.height * input.width) +
	mul	w12, w6, w17	// _111, _139, input__height_lsm0.385
// src/cpp/cnn_internals.cpp:24:                                 if (ih >= 0 && ih < input.height && iw >= 0 && iw < input.width) {
	cmp	w6, w3	// _139, ivtmp.392
	ble	.L63		//,
// src/cpp/cnn_internals.cpp:25:                                     int in_idx = b * (input.channels * input.height * input.width) +
	ldr	w10, [x8, 28]	//, input_63(D)->channels
// src/cpp/cnn_internals.cpp:26:                                                  ic * (input.height * input.width) +
	mul	w12, w12, w25	// _110, _111, ic
// src/cpp/cnn_internals.cpp:25:                                     int in_idx = b * (input.channels * input.height * input.width) +
	mul	w10, w17, w10	// _114, input__height_lsm0.385, input_63(D)->channels
// src/cpp/cnn_internals.cpp:25:                                     int in_idx = b * (input.channels * input.height * input.width) +
	mul	w10, w10, w6	// _113, _114, _139
	str	w10, [sp, 104]	// _113, %sfp
// src/cpp/cnn_internals.cpp:31:                                     pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldr	x10, [x14]	// tmp530, MEM[(const struct vector *)weight_58(D)].D.33436._M_impl.D.32737._M_start
	ldr	s29, [x10, x0, lsl 2]	//, *_170
// src/cpp/cnn_internals.cpp:25:                                     int in_idx = b * (input.channels * input.height * input.width) +
	ldr	w0, [sp, 104]	//, %sfp
	madd	w10, w0, w20, w12	// _107, _113, b, _110
// src/cpp/cnn_internals.cpp:31:                                     pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldr	x0, [x8]	// tmp532, MEM[(const struct vector *)input_63(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:26:                                                  ic * (input.height * input.width) +
	madd	w6, w7, w6, w10	// _99, ivtmp.397, _139, _107
// src/cpp/cnn_internals.cpp:25:                                     int in_idx = b * (input.channels * input.height * input.width) +
	add	w6, w6, w3	// in_idx_97, _99, ivtmp.392
// src/cpp/cnn_internals.cpp:21:                             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w3, w3, 1	// ivtmp.392, ivtmp.392,
// src/cpp/cnn_internals.cpp:31:                                     pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldr	s30, [x0, w6, sxtw 2]	//, *_108
	fmadd	s31, s30, s29, s31	//,,,
// src/cpp/cnn_internals.cpp:21:                             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w11, w3	// ivtmp.411, ivtmp.392
	bne	.L64		//,
	.p2align 5,,15
.L113:
	ldp	w10, w0, [sp, 96]	//,,
// src/cpp/cnn_internals.cpp:20:                         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w7, w7, 1	// ivtmp.397, ivtmp.397,
	add	w18, w18, w10	// ivtmp.398, ivtmp.398, kernel_w
	cmp	w15, w7	// ivtmp.418, ivtmp.397
	bne	.L66		//,
	mov	w17, w19	// ivtmp.410, ivtmp.410
	mov	w6, w21	// ivtmp.425, ivtmp.425
	mov	x18, x13	// bias, bias
	mov	x3, x2	// output, output
.L69:
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w2, [sp, 112]	//, %sfp
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w25, w25, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w0, w0, w2	// ivtmp.403, ivtmp.403, _27
	ldr	w2, [sp, 116]	//, %sfp
	cmp	w2, w25	// in_channels, ic
	bne	.L60		//,
	mov	x13, x3	// output, output
	ldp	w12, w21, [sp, 108]	//,,
	mov	w3, w6	// ivtmp.425, ivtmp.425
	ldp	x19, x6, [sp, 120]	// _83, ivtmp.408,
	ldr	w5, [sp, 116]	//, %sfp
	ldr	w2, [sp, 144]	//, %sfp
	b	.L61		//
	.p2align 2,,3
.L62:
// src/cpp/cnn_internals.cpp:20:                         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w7, w7, 1	// ivtmp.397, ivtmp.397,
	add	w18, w18, w10	// ivtmp.398, ivtmp.398, kernel_w
	cmp	w15, w7	// ivtmp.418, ivtmp.397
	bne	.L66		//,
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w3, [sp, 112]	//, %sfp
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w25, w25, 1	// ic, ic,
	mov	w17, w19	// ivtmp.410, ivtmp.410
	mov	w6, w21	// ivtmp.425, ivtmp.425
// src/cpp/cnn_internals.cpp:19:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w0, w0, w3	// ivtmp.403, ivtmp.403, _27
	ldr	w3, [sp, 116]	//, %sfp
	cmp	w3, w25	// in_channels, ic
	bne	.L73		//,
	b	.L114		//
.L100:
	mov	w12, w1	// _109, _109
	mov	x1, x6	// _239, _239
	mov	x6, x13	// output, output
	ldr	w13, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	add	w20, w20, 1	// b, b,
	mov	x15, x18	// bias, bias
// src/cpp/cnn_internals.cpp:14:     for (int b = 0; b < input.batches; ++b) {
	cmp	w20, w13	// b, _98
	bne	.L81		//,
	b	.L115		//
.L105:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 29
	.cfi_restore 30
	ret	
	.cfi_endproc
.LFE1528:
	.size	_Z14conv2d_forwardRK6TensorS1_S1_RS_ii, .-_Z14conv2d_forwardRK6TensorS1_S1_RS_ii
	.align	2
	.p2align 5,,15
	.global	_Z27conv2d_forward_restructuredRK6TensorS1_S1_RS_ii
	.type	_Z27conv2d_forward_restructuredRK6TensorS1_S1_RS_ii, %function
_Z27conv2d_forward_restructuredRK6TensorS1_S1_RS_ii:
.LFB1529:
	.cfi_startproc
// src/cpp/cnn_internals.cpp:56:     int input_batches = input.batches;
	ldr	w6, [x0, 24]	//, input_60(D)->batches
// src/cpp/cnn_internals.cpp:48:     int out_channels = weight.batches;
	ldr	w7, [x1, 24]	//, weight_56(D)->batches
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	cmp	w6, 0	// input_batches,
	ble	.L146		//,
	cmp	w7, 0	// out_channels,
	ble	.L146		//,
// src/cpp/cnn_internals.cpp:47:                     int stride, int padding) {
	stp	x29, x30, [sp, -336]!	//,,,
	.cfi_def_cfa_offset 336
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	mov	x29, sp	//,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	mov	x26, x0	// input, tmp409
	mov	x0, x3	// output, tmp412
// src/cpp/cnn_internals.cpp:54:     int output_h     = output.height;
	ldr	w15, [x3, 32]	//, output_63(D)->height
	cmp	w15, 0	// output_h,
	ble	.L116		//,
// src/cpp/cnn_internals.cpp:55:     int output_w     = output.width;
	ldr	w16, [x3, 36]	//, output_63(D)->width
	cmp	w16, 0	// output_w,
	ble	.L116		//,
	sxtw	x3, w4	// _205, stride
	mov	x11, x1	// weight, tmp410
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 20, -312
	.cfi_offset 19, -320
// src/cpp/cnn_internals.cpp:91:                                   oc * (output_h * output_w) +
	mul	w18, w15, w16	// _137, output_h, output_w
	ptrue	p6.b, all	// tmp382
	ubfiz	x10, x7, 2, 32	// _307, out_channels,,
	mov	x1, x2	// bias, tmp411
	mov	w30, w4	// stride, tmp413
	mov	w25, w5	// padding, tmp414
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 22, -296
	.cfi_offset 21, -304
	neg	w17, w5	// ivtmp.520, padding
	sxtw	x22, w5	// _207, padding
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	mov	w2, 0	// b,
	mov	x13, x22	// _207, _207
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -280
	.cfi_offset 23, -288
	sxtw	x23, w16	// _212, output_w
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -248
	.cfi_offset 27, -256
// src/cpp/cnn_internals.cpp:77:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	cntw	x28		// tmp380
	mov	w27, 64	// tmp383,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	str	wzr, [sp, 164]	//, %sfp
	str	x3, [sp, 224]	// _205, %sfp
// src/cpp/cnn_internals.cpp:50:     int kernel_h     = weight.height;
	ldp	w7, w8, [x11, 28]	// in_channels, _1,
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	ldr	w3, [x0, 28]	//, output_63(D)->channels
// src/cpp/cnn_internals.cpp:51:     int kernel_w     = weight.width;
	ldr	w12, [x11, 36]	//, weight_56(D)->width
// src/cpp/cnn_internals.cpp:50:     int kernel_h     = weight.height;
	str	w7, [sp, 136]	// in_channels, %sfp
// src/cpp/cnn_internals.cpp:83:                                 int w_idx  = oc * (in_channels * kernel_h * kernel_w) +
	mul	w5, w8, w7	// _45, _1, in_channels
	ldp	w19, w9, [x26, 32]	// _105, _41,
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	mul	w3, w15, w3	// _32, output_h, output_63(D)->channels
	str	w30, [sp, 176]	// stride, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	ldr	x20, [x0]	// _100, MEM[(struct vector *)output_63(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:84:                                                 ic * (kernel_h * kernel_w) +
	mul	w0, w8, w12	// _110, _1, _2
	mov	w30, w12	// _2, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	ldr	x14, [x1]	// _91, MEM[(const struct vector *)bias_74(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	mul	w4, w3, w16	// _33, _32, output_w
	mul	w1, w9, w19	// _117, _41, _105
// src/cpp/cnn_internals.cpp:83:                                 int w_idx  = oc * (in_channels * kernel_h * kernel_w) +
	mul	w21, w5, w12	// _108, _45, _2
// src/cpp/cnn_internals.cpp:84:                                                 ic * (kernel_h * kernel_w) +
	mov	w5, w8	// _1, _1
	mov	w3, w4	// _33, _33
	mov	x4, x10	// _307, _307
// src/cpp/cnn_internals.cpp:80:                                 int in_idx = b * (in_channels * input_h * input_w) +
	mul	w7, w7, w1	// _53, in_channels, _117
	mov	w10, w18	// _137, _137
// src/cpp/cnn_internals.cpp:84:                                                 ic * (kernel_h * kernel_w) +
	stp	w0, w1, [sp, 208]	// _110, _117,
	mov	x1, x26	// input, input
	mov	w26, w25	// padding, padding
	mov	w25, w9	// _41, _41
	mov	w9, w17	// ivtmp.520, ivtmp.520
.L119:
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	mov	w18, 0	// ivtmp.527,
	ldr	w12, [sp, 208]	//, %sfp
	mul	w8, w3, w2	// _34, _33, b
	mov	x17, x1	// input, input
	str	w6, [sp, 248]	// input_batches, %sfp
	mov	w6, w18	// ivtmp.527, ivtmp.527
	mov	x18, x11	// weight, weight
	ldr	w11, [sp, 212]	//, %sfp
	mov	w22, 0	// ivtmp.526,
	mov	x0, 0	// ivtmp.525,
	mov	w1, w10	// _137, _137
	stp	w3, w7, [sp, 232]	// _33, _53,
.L133:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	add	x3, x14, x0	// _93, _91, ivtmp.525
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	mov	w7, w26	// ivtmp.517, padding
	str	w16, [sp, 180]	// output_w, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	mov	w24, 0	// oh,
	mov	x16, x18	// weight, weight
	str	x23, [sp, 184]	// _212, %sfp
	mov	x23, x17	// input, input
	str	w26, [sp, 192]	// padding, %sfp
	mov	w26, w25	// _41, _41
	mov	w25, w30	// _2, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	str	x3, [sp, 200]	// _93, %sfp
// src/cpp/cnn_internals.cpp:90:                     int out_idx = b * (output.channels * output_h * output_w) +
	add	w3, w22, w8	// _37, ivtmp.526, _34
	str	w8, [sp, 252]	// _34, %sfp
	mov	w8, w6	// ivtmp.527, ivtmp.527
	str	w2, [sp, 264]	// b, %sfp
	mov	w2, w5	// _1, _1
	stp	wzr, w9, [sp, 156]	//, ivtmp.520,
	str	w3, [sp, 196]	// _37, %sfp
	str	x0, [sp, 240]	// ivtmp.525, %sfp
	str	x14, [sp, 256]	// _91, %sfp
	str	w1, [sp, 268]	// _137, %sfp
	str	x4, [sp, 272]	// _307, %sfp
	str	w9, [sp, 280]	// ivtmp.520, %sfp
.L131:
// src/cpp/cnn_internals.cpp:91:                                   oc * (output_h * output_w) +
	ldp	w6, w3, [sp, 192]	//,,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	bic	w0, w7, w7, asr #31	// _5, ivtmp.517
	add	x9, sp, 312	//,,
	str	w2, [sp, 284]	// _1, %sfp
// src/cpp/cnn_internals.cpp:91:                                   oc * (output_h * output_w) +
	ldr	w1, [sp, 156]	//, %sfp
	str	w15, [sp, 288]	// output_h, %sfp
	str	w24, [sp, 292]	// oh, %sfp
	str	x20, [sp, 296]	// _100, %sfp
	add	w4, w1, w3	// _39, ivtmp.519, _37
	ldr	x1, [sp, 184]	// _212, %sfp
	add	x5, x1, w4, sxtw	// _213, _212, _39
	neg	x3, x13	// ivtmp.511, _207
	add	x1, x20, w4, sxtw 2	// ivtmp.509, _100, _39,
// src/cpp/cnn_internals.cpp:65:                 int kh_hi = std::min(kernel_h, input_h - c_h);
	add	w4, w19, w7	// _130, _105, ivtmp.517
	str	x1, [sp, 168]	// ivtmp.509, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w4, w2	// _130, _1
	csel	w30, w4, w2, le	// _103, _130, _1,
	mul	w4, w25, w0	// ivtmp.498, _2, _5
	mov	w2, w6	// ivtmp.507, ivtmp.507
	add	x1, x20, x5, lsl 2	// _216, _100, _213,
	str	w4, [sp, 152]	// ivtmp.498, %sfp
	stp	w19, w21, [x9, -8]	// _105, _108,
	stp	w7, w22, [x9]	// ivtmp.517, ivtmp.526,
	str	x1, [sp, 216]	// _216, %sfp
	ldr	w1, [sp, 160]	//, %sfp
	add	w5, w0, w1	// _187, _5, ivtmp.520
	mul	w5, w5, w26	// ivtmp.497, _187, _41
	str	w5, [sp, 148]	// ivtmp.497, %sfp
.L130:
// src/cpp/cnn_internals.cpp:68:                     float pixel_value = bias.data[oc];
	ldr	x1, [sp, 200]	// _93, %sfp
// src/cpp/cnn_internals.cpp:73:                     int kw_hi = std::min(kernel_w, input_w - c_w);
	add	w15, w26, w2	// _209, _41, ivtmp.507
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	bic	w17, w2, w2, asr #31	// _77, ivtmp.507
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w15, w25	// _209, _2
	csel	w15, w15, w25, le	// _78, _209, _2,
// src/cpp/cnn_internals.cpp:68:                     float pixel_value = bias.data[oc];
	ldr	s31, [x1]	//, *_93
// src/cpp/cnn_internals.cpp:75:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w1, [sp, 136]	//, %sfp
	cmp	w1, 0	// in_channels,
	ble	.L120		//,
	sxtw	x4, w17	// _269, _77
	sub	w21, w15, w17	// _180, _78, _77
	str	w8, [sp, 124]	// ivtmp.527, %sfp
	add	x18, x3, x4	// _48, ivtmp.511, _269
	and	w5, w21, -16	// niters_vector_mult_vf.441, _180,
	stp	w12, w11, [sp, 140]	// _110, _117,
	str	x4, [sp, 96]	// _269, %sfp
// src/cpp/cnn_internals.cpp:75:                     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w1, 0	// ic,
	sub	w20, w21, #1	// _179, _180,
// src/cpp/cnn_internals.cpp:75:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w4, [sp, 164]	//, %sfp
	lsr	w24, w21, 4	// bnd.440_176, _180,
	and	w22, w21, 15	// _54, _180,
	str	w5, [sp, 116]	// niters_vector_mult_vf.441, %sfp
	mov	w5, w1	// ic, ic
	str	w2, [sp, 320]	// ivtmp.507, %sfp
	str	w8, [sp, 324]	// ivtmp.527, %sfp
	str	x13, [sp, 328]	// _207, %sfp
	str	w4, [sp, 120]	// ivtmp.531, %sfp
	.p2align 5,,15
.L121:
// src/cpp/cnn_internals.cpp:76:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	cmp	w0, w30	// _5, _103
	bge	.L126		//,
	ldr	x2, [sp, 96]	// _269, %sfp
// src/cpp/cnn_internals.cpp:76:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	mov	w7, w0	// kh, _5
	stp	w0, w5, [sp, 128]	// _5, ic,
	ldpsw	x14, x1, [sp, 120]	// _271, _283,
// src/cpp/cnn_internals.cpp:76:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	ldp	w8, w9, [sp, 148]	//,,
	add	x19, x1, x2	// _119, _283, _269
	str	x1, [sp, 104]	// _283, %sfp
	.p2align 5,,15
.L129:
// src/cpp/cnn_internals.cpp:77:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	cmp	w17, w15	// _77, _78
	bge	.L128		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	ldr	x10, [x16]	// _94, MEM[(const struct vector *)weight_56(D)].D.33436._M_impl.D.32737._M_start
	ldr	x11, [x23]	// _97, MEM[(const struct vector *)input_60(D)].D.33436._M_impl.D.32737._M_start
	cmp	w20, 14	// _179,
	bls	.L134		//,
	movi	v30.4s, 0	//
	sxtw	x5, w9	// _284, ivtmp.498
	sxtw	x6, w8	// _272, ivtmp.497
	ldp	x2, x12, [sp, 96]	// _269, _283,
	add	x1, x19, x5	// _141, _119, _284
	add	x0, x6, x14	// _79, _272, _271
	add	x1, x10, x1, lsl 2	// ivtmp.487, _94, _141,
	add	x0, x18, x0	// _157, _48, _79
	mov	x13, x14	// _271, _271
	add	x0, x11, x0, lsl 2	// ivtmp.491, _97, _157,
	mov	v0.16b, v30.16b	//,
	mov	v28.16b, v30.16b	//,
	mov	v1.16b, v30.16b	//,
	umaddl	x4, w24, w27, x1	// _87, bnd.440_176, tmp383, ivtmp.487
	.p2align 5,,15
.L123:
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldp	q23, q22, [x1, 16]	//,,
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldp	q25, q24, [x0, 32]	//,,
	ldp	q2, q26, [x0], 64	//,, ivtmp.491,
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	ldr	q21, [x1, 48]	//, MEM <const vector(4) float> [(const value_type &)_96 + 48]
	ldr	q20, [x1], 64	//, MEM <const vector(4) float> [(const value_type &)_96]
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	fmla	v0.4s, v22.4s, v25.4s	//,,
	fmla	v28.4s, v23.4s, v26.4s	//,,
	fmla	v30.4s, v24.4s, v21.4s	//,,
	fmla	v1.4s, v20.4s, v2.4s	//,,
	cmp	x4, x1	// _87, ivtmp.487
	bne	.L123		//,
	ldr	w0, [sp, 116]	//, %sfp
	fadd	v1.4s, v1.4s, v28.4s	//,,
	fadd	v0.4s, v0.4s, v30.4s	//,,
	fadd	v0.4s, v1.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	fadd	s31, s31, s0	//,,
	cbz	w22, .L128	// _54,
.L122:
	add	x1, x3, x2	// _20, ivtmp.511, _269
	add	x2, x12, x2	// _244, _283, _269
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	mov	z19.s, #0	//
	uxtw	x12, w0	// _275, niters_vector_mult_vf.441
	add	x6, x13, x6	// _19, _271, _272
	add	x1, x1, x12	// _14, _20, _275
	add	x5, x5, x12	// _296, _284, _275
	add	x1, x1, x6	// _276, _14, _19
	add	x2, x2, x5	// _289, _244, _296
	add	x1, x11, x1, lsl 2	// vectp.463, _97, _276,
	mov	x4, 0	// ivtmp_299,
	sub	w0, w21, w0	// bnd.460, _180, niters_vector_mult_vf.441
	whilelo	p7.s, wzr, w0	// loop_mask_280,, bnd.460
	add	x2, x10, x2, lsl 2	// vectp.466, _94, _289,
.L125:
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	ld1w	z27.s, p7/z, [x1, x4, lsl 2]	//, loop_mask_280,* vectp.463
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	ld1w	z29.s, p7/z, [x2, x4, lsl 2]	//, loop_mask_280,* vectp.466
// src/cpp/cnn_internals.cpp:77:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	add	x4, x4, x28	// ivtmp_299, ivtmp_299, tmp380
// src/cpp/cnn_internals.cpp:86:                                 pixel_value += input.data[in_idx] * weight.data[w_idx];
	fmla	z19.s, p7/m, z27.s, z29.s	//, loop_mask_280,,
	whilelo	p7.s, w4, w0	// loop_mask_280, ivtmp_299, bnd.460
	b.any	.L125	//,
	faddv	s19, p6, z19.s	//, tmp382,
	fadd	s31, s31, s19	//,,
.L128:
// src/cpp/cnn_internals.cpp:76:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w7, w7, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:76:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w8, w8, w26	// ivtmp.497, ivtmp.497, _41
	add	w9, w9, w25	// ivtmp.498, ivtmp.498, _2
	cmp	w7, w30	// kh, _103
	bne	.L129		//,
	ldp	w0, w5, [sp, 128]	//,,
.L126:
// src/cpp/cnn_internals.cpp:75:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w5, w5, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:75:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w1, [sp, 120]	//, %sfp
	ldr	w2, [sp, 144]	//, %sfp
	add	w1, w1, w2	// ivtmp.502, ivtmp.502, _117
	ldr	w2, [sp, 140]	//, %sfp
	str	w1, [sp, 120]	// ivtmp.502, %sfp
	ldr	w1, [sp, 124]	//, %sfp
	add	w1, w1, w2	// ivtmp.503, ivtmp.503, _110
	str	w1, [sp, 124]	// ivtmp.503, %sfp
	ldr	w1, [sp, 136]	//, %sfp
	cmp	w1, w5	// in_channels, ic
	bne	.L121		//,
	ldr	x13, [sp, 328]	// _207, %sfp
	ldp	w12, w11, [sp, 140]	//,,
	ldr	w2, [sp, 320]	//, %sfp
	ldr	w8, [sp, 324]	//, %sfp
.L120:
	ldr	w1, [sp, 176]	//, %sfp
	sub	w2, w2, w1	// ivtmp.507, ivtmp.507, stride
// src/cpp/cnn_internals.cpp:67:                 for (int ow = 0; ow < output_w; ++ow) {
	ldp	x4, x1, [sp, 216]	// _216, _205,
	add	x3, x3, x1	// ivtmp.511, ivtmp.511, _205
// src/cpp/cnn_internals.cpp:93:                     output.data[out_idx] = pixel_value;
	ldr	x1, [sp, 168]	// ivtmp.509, %sfp
	str	s31, [x1], 4	//, MEM[(value_type &)_210]
	str	x1, [sp, 168]	// ivtmp.509, %sfp
// src/cpp/cnn_internals.cpp:67:                 for (int ow = 0; ow < output_w; ++ow) {
	cmp	x1, x4	// ivtmp.509, _216
	bne	.L130		//,
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldp	w0, w3, [sp, 176]	//,,
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	add	x4, sp, 300	//,,
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w1, [sp, 156]	//, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldp	w15, w24, [x4, -12]	//,,
	ldp	w19, w21, [x4, 4]	//,,
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	add	w1, w1, w3	// ivtmp.519, ivtmp.519, output_w
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w7, [sp, 312]	//, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	str	w1, [sp, 156]	// ivtmp.519, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	add	w24, w24, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w1, [sp, 160]	//, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	x20, [sp, 296]	// _100, %sfp
	sub	w7, w7, w0	// ivtmp.517, ivtmp.517, stride
	ldr	w2, [sp, 284]	//, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	add	w0, w1, w0	// ivtmp.520, ivtmp.520, stride
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w22, [sp, 316]	//, %sfp
// src/cpp/cnn_internals.cpp:61:             for (int oh = 0; oh < output_h; ++oh) {
	str	w0, [sp, 160]	// ivtmp.520, %sfp
	cmp	w15, w24	// output_h, oh
	bne	.L131		//,
// src/cpp/cnn_internals.cpp:59:         for (int oc = 0; oc < out_channels; ++oc) {
	ldr	x0, [sp, 240]	// ivtmp.525, %sfp
	mov	w5, w2	// _1, _1
	mov	w30, w25	// _2, _2
	mov	x17, x23	// input, input
	mov	w25, w26	// _41, _41
	ldr	x4, [sp, 272]	// _307, %sfp
	mov	x18, x16	// weight, weight
	add	w6, w8, w21	// ivtmp.527, ivtmp.527, _108
	mov	x16, x3	//,
	ldr	w1, [sp, 268]	//, %sfp
	add	x0, x0, 4	// ivtmp.525, ivtmp.525,
	ldr	x23, [sp, 184]	// _212, %sfp
	ldr	x14, [sp, 256]	// _91, %sfp
	add	w22, w22, w1	// ivtmp.526, ivtmp.526, _137
	ldr	w26, [sp, 192]	//, %sfp
	ldr	w8, [sp, 252]	//, %sfp
	ldr	w2, [sp, 264]	//, %sfp
	ldr	w9, [sp, 280]	//, %sfp
	cmp	x0, x4	// ivtmp.525, _307
	bne	.L133		//,
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	add	w2, w2, 1	// b, b,
	mov	w10, w1	// _137, _137
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	ldr	w0, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	mov	x1, x17	// input, input
	mov	x11, x18	// weight, weight
	ldp	w3, w7, [sp, 232]	//,,
	ldr	w6, [sp, 248]	//, %sfp
// src/cpp/cnn_internals.cpp:58:     for (int b = 0; b < input_batches; ++b) {
	add	w0, w0, w7	// ivtmp.531, ivtmp.531, _53
	str	w0, [sp, 164]	// ivtmp.531, %sfp
	cmp	w6, w2	// input_batches, b
	bne	.L119		//,
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
.L116:
// src/cpp/cnn_internals.cpp:98: }
	ldp	x25, x26, [sp, 64]	//,,
	ldp	x29, x30, [sp], 336	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret	
.L134:
	.cfi_def_cfa_offset 336
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	ldr	x2, [sp, 96]	// _269, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	mov	w0, 0	// niters_vector_mult_vf.441,
	sxtw	x5, w9	// _284, ivtmp.498
	sxtw	x6, w8	// _272, ivtmp.497
	ldpsw	x13, x12, [sp, 120]	// _271, _283,
	b	.L122		//
.L146:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 29
	.cfi_restore 30
	ret	
	.cfi_endproc
.LFE1529:
	.size	_Z27conv2d_forward_restructuredRK6TensorS1_S1_RS_ii, .-_Z27conv2d_forward_restructuredRK6TensorS1_S1_RS_ii
	.align	2
	.p2align 5,,15
	.global	_Z29conv2d_forward_hoist_restrictRK6TensorS1_S1_RS_ii
	.type	_Z29conv2d_forward_hoist_restrictRK6TensorS1_S1_RS_ii, %function
_Z29conv2d_forward_hoist_restrictRK6TensorS1_S1_RS_ii:
.LFB1530:
	.cfi_startproc
// src/cpp/cnn_internals.cpp:115:     int input_batches = input.batches;
	ldr	w7, [x0, 24]	//, input_49(D)->batches
// src/cpp/cnn_internals.cpp:107:     int out_channels = weight.batches;
	ldr	w6, [x1, 24]	//, weight_52(D)->batches
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	cmp	w7, 0	// input_batches,
	ble	.L180		//,
	cmp	w6, 0	// out_channels,
	ble	.L180		//,
// src/cpp/cnn_internals.cpp:113:     int output_h     = output.height;
	ldr	w11, [x3, 32]	//, output_54(D)->height
	mov	x18, x3	// output, tmp399
	cmp	w11, 0	// output_h,
	ble	.L180		//,
// src/cpp/cnn_internals.cpp:101:                     int stride, int padding) {
	stp	x29, x30, [sp, -336]!	//,,,
	.cfi_def_cfa_offset 336
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	mov	x29, sp	//,
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	mov	x20, x2	// bias, tmp398
// src/cpp/cnn_internals.cpp:114:     int output_w     = output.width;
	ldr	w2, [x3, 36]	//, output_54(D)->width
	cmp	w2, 0	// output_w,
	ble	.L150		//,
	mov	x19, x1	// weight, tmp397
	sxtw	x1, w4	// _152, stride
// src/cpp/cnn_internals.cpp:119:     int out_size = output_h * output_w;
	mul	w3, w11, w2	// out_size, output_h, output_w
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 22, -296
	.cfi_offset 21, -304
	ptrue	p6.b, all	// tmp363
	neg	w22, w5	// ivtmp.627, padding
	sxtw	x17, w5	// _154, padding
// src/cpp/cnn_internals.cpp:118:     int in_ch_size = in_channels * in_size;
	mov	x16, 0	// ivtmp.644,
	mov	w8, w4	// stride, tmp400
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -280
	.cfi_offset 23, -288
	sbfiz	x9, x3, 2, 32	// _317, out_size,,
	ubfiz	x15, x2, 2, 32	// _181, output_w,,
	mov	x10, 0	// ivtmp.643,
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	mov	w2, 0	// b,
	mov	w4, 64	// tmp364,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -264
	.cfi_offset 25, -272
	mov	w26, w5	// padding, tmp401
// src/cpp/cnn_internals.cpp:120:     int out_ch_size = out_channels * out_size;
	mul	w5, w6, w3	// out_ch_size_66, out_channels, out_size
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -248
	.cfi_offset 27, -256
	sxtw	x12, w5	// _332, out_ch_size_66
// src/cpp/cnn_internals.cpp:150:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	cntw	x27		// tmp361
	str	x1, [sp, 160]	// _152, %sfp
// src/cpp/cnn_internals.cpp:110:     int kernel_w     = weight.width;
	ldr	w1, [x19, 36]	//, weight_52(D)->width
// src/cpp/cnn_internals.cpp:112:     int input_w      = input.width;
	ldp	w13, w24, [x0, 32]	// input_h, input_w,
// src/cpp/cnn_internals.cpp:108:     int in_channels  = weight.channels;
	ldp	w21, w14, [x19, 28]	// in_channels, _1,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x28, [x19]	// _80, MEM[(const struct vector *)weight_52(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:117:     int in_size = input_h * input_w;
	mul	w5, w13, w24	// in_size, input_h, input_w
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x25, [x0]	// _79, MEM[(const struct vector *)input_49(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:121:     int weight_size = kernel_h * kernel_w;
	mul	w3, w14, w1	// weight_size, _1, _2
// src/cpp/cnn_internals.cpp:108:     int in_channels  = weight.channels;
	str	w21, [sp, 108]	// in_channels, %sfp
// src/cpp/cnn_internals.cpp:118:     int in_ch_size = in_channels * in_size;
	mul	w0, w21, w5	// in_ch_size_64, in_channels, in_size
	sxtw	x5, w5	// _145, in_size
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x18, [x18]	// _85, MEM[(struct vector *)output_54(D)].D.33436._M_impl.D.32737._M_start
	stp	x9, x17, [sp, 184]	// _317, _154,
	sxtw	x19, w3	// _244, weight_size
// src/cpp/cnn_internals.cpp:122:     int weight_ch_size = in_channels * weight_size;
	mul	w3, w21, w3	// weight_ch_size, in_channels, weight_size
	sxtw	x21, w0	// _335, in_ch_size_64
	mov	w0, w22	// ivtmp.627, ivtmp.627
	stp	x5, x19, [sp, 168]	// _145, _244,
	mov	w22, w13	// input_h, input_h
	mov	x5, x12	// _332, _332
	sxtw	x19, w3	// _324, weight_ch_size
	mov	w13, w0	// ivtmp.627, ivtmp.627
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x3, [x20]	// _84, MEM[(const struct vector *)bias_53(D)].D.33436._M_impl.D.32737._M_start
	add	x20, x3, w6, uxtw 2	// _328, _84, out_channels,
	mov	w6, w26	// padding, padding
	mov	w26, w24	// input_w, input_w
	mov	x24, x28	// _80, _80
	mov	w28, w1	// _2, _2
	mov	w1, w7	// input_batches, input_batches
	mov	x7, x16	// ivtmp.644, ivtmp.644
	mov	w16, w11	// output_h, output_h
	mov	w11, w6	// padding, padding
.L166:
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	stp	w1, w2, [sp, 200]	// input_batches, b,
	mov	x2, x3	// ivtmp.634, ivtmp.634
	add	x23, x18, x10, lsl 2	// ivtmp.636, _85, ivtmp.643,
	mov	x17, x7	// ivtmp.644, ivtmp.644
	stp	x3, x18, [sp, 208]	// _84, _85,
	ldr	x3, [sp, 176]	// _244, %sfp
	str	xzr, [sp, 144]	//, %sfp
	str	x5, [sp, 224]	// _332, %sfp
.L165:
	ldr	x0, [sp, 168]	// _145, %sfp
// src/cpp/cnn_internals.cpp:131:             for (int oh = 0; oh < output_h; ++oh) {
	mov	w12, 0	// oh,
	mov	w18, w13	// ivtmp.627, ivtmp.627
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	mov	w7, w11	// ivtmp.622, padding
	mov	x9, x2	// ivtmp.634, ivtmp.634
	str	x23, [sp, 136]	// ivtmp.636, %sfp
	stp	x23, x20, [sp, 232]	// ivtmp.636, _328,
	str	x10, [sp, 248]	// ivtmp.643, %sfp
	str	w13, [sp, 256]	// ivtmp.627, %sfp
.L164:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	bic	w5, w7, w7, asr #31	// _99, ivtmp.622
	ldr	x1, [sp, 136]	// ivtmp.626, %sfp
// src/cpp/cnn_internals.cpp:135:                 int kh_hi = std::min(kernel_h, input_h - c_h);
	add	w13, w22, w7	// _303, input_h, ivtmp.622
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w13, w14	// _303, _1
	csel	w13, w13, w14, le	// _51, _303, _1,
	add	w6, w5, w18	// _134, _99, ivtmp.627
	ldr	x2, [sp, 192]	// _154, %sfp
	mul	w6, w6, w26	// ivtmp.600, _134, input_w
	str	x1, [sp, 152]	// ivtmp.626, %sfp
	add	x1, x1, x15	// ivtmp.626, ivtmp.626, _181
	str	w6, [sp, 132]	// ivtmp.600, %sfp
	add	x6, sp, 268	//,,
	neg	x30, x2	// ivtmp.616, _154
	mov	w2, w11	// ivtmp.612, padding
	stp	w14, w22, [x6, -8]	// _1, input_h,
	stp	w16, w12, [x6]	// output_h, oh,
	mov	w6, w5	// _99, _99
	str	x1, [sp, 136]	// ivtmp.626, %sfp
	mul	w1, w5, w28	// ivtmp.601, _99, _2
	str	w7, [sp, 276]	// ivtmp.622, %sfp
	mov	x7, x17	// ivtmp.644, ivtmp.644
	stp	x15, x21, [sp, 280]	// _181, _335,
	str	w18, [sp, 296]	// ivtmp.627, %sfp
	str	w11, [sp, 300]	// padding, %sfp
	str	x19, [sp, 304]	// _324, %sfp
.L163:
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w5, [sp, 108]	//, %sfp
// src/cpp/cnn_internals.cpp:143:                     int kw_hi = std::min(kernel_w, input_w - c_w);
	add	w14, w2, w26	// _156, ivtmp.612, input_w
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	bic	w15, w2, w2, asr #31	// _4, ivtmp.612
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w14, w28	// _156, _2
	csel	w14, w14, w28, le	// _3, _156, _2,
// src/cpp/cnn_internals.cpp:138:                     float pixel_value = bias_ptr[oc];
	ldr	s31, [x9]	//, MEM[(const float *)_329]
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w5, 0	// in_channels,
	ble	.L152		//,
	ldr	x12, [sp, 144]	// ivtmp.606, %sfp
	sub	w18, w14, w15	// _104, _3, _4
	sxtw	x16, w15	// _252, _4
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w5, 0	// ic,
	sub	w19, w18, #1	// _103, _104,
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	stp	x0, x3, [sp, 112]	// _145, _244,
	lsr	w22, w18, 4	// bnd.543_100, _104,
	and	w21, w18, 15	// _336, _104,
	and	w23, w18, -16	// niters_vector_mult_vf.544, _104,
	add	x20, x16, x30	// _70, _252, ivtmp.616
	mov	x10, x7	// ivtmp.605, ivtmp.644
	str	w1, [sp, 128]	// ivtmp.601, %sfp
	stp	x9, x7, [sp, 312]	// ivtmp.634, ivtmp.644,
	str	w2, [sp, 328]	// ivtmp.612, %sfp
	str	w8, [sp, 332]	// stride, %sfp
	.p2align 5,,15
.L162:
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	ldp	w9, w8, [sp, 128]	//,,
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	mov	w7, w6	// kh, _99
	add	x17, x16, x12	// _113, _252, ivtmp.606
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	cmp	w13, w6	// _51, _99
	ble	.L154		//,
	stp	w5, w6, [sp, 100]	// ic, _99,
	.p2align 5,,15
.L153:
// src/cpp/cnn_internals.cpp:150:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	cmp	w14, w15	// _3, _4
	ble	.L161		//,
	cmp	w19, 14	// _103,
	bls	.L168		//,
	mov	x2, x16	// _252, _252
.L158:
	sxtw	x6, w8	// _260, ivtmp.600
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	movi	v30.4s, 0	//
	sxtw	x5, w9	// _275, ivtmp.601
	add	x0, x6, x10	// _74, _260, ivtmp.605
	add	x1, x17, x5	// _211, _113, _275
	add	x0, x20, x0	// _193, _70, _74
	add	x1, x24, x1, lsl 2	// ivtmp.593, _80, _211,
	add	x0, x25, x0, lsl 2	// ivtmp.590, _79, _193,
	mov	v1.16b, v30.16b	//,
	mov	v28.16b, v30.16b	//,
	mov	v0.16b, v30.16b	//,
	umaddl	x3, w22, w4, x0	// _94, bnd.543_100, tmp364, ivtmp.590
	.p2align 5,,15
.L156:
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	ldp	q23, q22, [x1, 16]	//,,
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	ldp	q25, q24, [x0, 32]	//,,
	ldp	q20, q26, [x0], 64	//,, ivtmp.590,
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	ldr	q21, [x1, 48]	//, MEM <const vector(4) float> [(const float *)_24 + 48B]
	ldr	q2, [x1], 64	//, MEM <const vector(4) float> [(const float *)_24]
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	fmla	v1.4s, v25.4s, v22.4s	//,,
	fmla	v28.4s, v26.4s, v23.4s	//,,
	fmla	v30.4s, v24.4s, v21.4s	//,,
	fmla	v0.4s, v20.4s, v2.4s	//,,
	cmp	x3, x0	// _94, ivtmp.590
	bne	.L156		//,
	fadd	v1.4s, v1.4s, v30.4s	//,,
	fadd	v0.4s, v0.4s, v28.4s	//,,
	fadd	v0.4s, v1.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	fadd	s31, s31, s0	//,,
	cbz	w21, .L157	// _336,
	mov	w1, w23	// niters_vector_mult_vf.544, niters_vector_mult_vf.544
.L155:
	uxtw	x3, w1	// _263, niters_vector_mult_vf.544
	add	x11, x30, x2	// _128, ivtmp.616, _252
// src/cpp/cnn_internals.cpp:154:                                 int w_idx  = out_oc_ch_size + ic_weight_size + kh * kernel_w + kw;
	mov	z19.s, #0	//
	add	x5, x5, x3	// _286, _275, _263
	add	x6, x6, x10	// _188, _260, ivtmp.605
	add	x3, x11, x3	// _187, _128, _263
	add	x2, x12, x2	// _230, ivtmp.606, _252
	add	x3, x3, x6	// _264, _187, _188
	add	x2, x2, x5	// _279, _230, _286
	add	x3, x25, x3, lsl 2	// vectp.566, _79, _264,
	mov	x0, 0	// ivtmp_289,
	sub	w1, w18, w1	// bnd.563, _104, niters_vector_mult_vf.544
	whilelo	p7.s, wzr, w1	// loop_mask_268,, bnd.563
	add	x2, x24, x2, lsl 2	// vectp.569, _80, _279,
.L159:
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	ld1w	z29.s, p7/z, [x3, x0, lsl 2]	//, loop_mask_268,* vectp.566
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	ld1w	z27.s, p7/z, [x2, x0, lsl 2]	//, loop_mask_268,* vectp.569
// src/cpp/cnn_internals.cpp:150:                             for (int kw = kw_lo; kw < kw_hi; ++kw) {
	add	x0, x0, x27	// ivtmp_289, ivtmp_289, tmp361
// src/cpp/cnn_internals.cpp:156:                                 pixel_value += input_ptr[in_idx] * weight_ptr[w_idx];
	fmla	z19.s, p7/m, z29.s, z27.s	//, loop_mask_268,,
	whilelo	p7.s, w0, w1	// loop_mask_268, ivtmp_289, bnd.563
	b.any	.L159	//,
	faddv	s19, p6, z19.s	//, tmp363,
	fadd	s31, s31, s19	//,,
.L161:
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w7, w7, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w8, w8, w26	// ivtmp.600, ivtmp.600, input_w
	add	w9, w9, w28	// ivtmp.601, ivtmp.601, _2
	cmp	w13, w7	// _51, kh
	bne	.L153		//,
.L178:
	ldp	w5, w6, [sp, 100]	//,,
.L154:
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	add	w5, w5, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:145:                     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 112]	// _145, %sfp
	add	x10, x10, x0	// ivtmp.605, ivtmp.605, _145
	ldr	x0, [sp, 120]	// _244, %sfp
	add	x12, x12, x0	// ivtmp.606, ivtmp.606, _244
	ldr	w0, [sp, 108]	//, %sfp
	cmp	w0, w5	// in_channels, ic
	bne	.L162		//,
	ldr	w1, [sp, 128]	//, %sfp
	ldp	x0, x3, [sp, 112]	// _145, _244,
	ldp	x9, x7, [sp, 312]	// ivtmp.634, ivtmp.644,
	ldr	w2, [sp, 328]	//, %sfp
	ldr	w8, [sp, 332]	//, %sfp
.L152:
	sub	w2, w2, w8	// ivtmp.612, ivtmp.612, stride
// src/cpp/cnn_internals.cpp:137:                 for (int ow = 0; ow < output_w; ++ow) {
	ldr	x5, [sp, 160]	// _152, %sfp
	ldr	x10, [sp, 136]	// ivtmp.626, %sfp
	add	x30, x30, x5	// ivtmp.616, ivtmp.616, _152
// src/cpp/cnn_internals.cpp:161:                     out_ptr[out_idx] = pixel_value;
	ldr	x5, [sp, 152]	// ivtmp.614, %sfp
	str	s31, [x5], 4	//, MEM[(float *)_157]
	str	x5, [sp, 152]	// ivtmp.614, %sfp
// src/cpp/cnn_internals.cpp:137:                 for (int ow = 0; ow < output_w; ++ow) {
	cmp	x5, x10	// ivtmp.614, ivtmp.626
	bne	.L163		//,
// src/cpp/cnn_internals.cpp:131:             for (int oh = 0; oh < output_h; ++oh) {
	add	x1, sp, 268	//,,
	ldr	w18, [sp, 296]	//, %sfp
	mov	x17, x7	// ivtmp.644, ivtmp.644
	ldp	x15, x21, [sp, 280]	// _181, _335,
	ldp	w16, w12, [x1]	//,,
// src/cpp/cnn_internals.cpp:131:             for (int oh = 0; oh < output_h; ++oh) {
	add	w18, w18, w8	// ivtmp.627, ivtmp.627, stride
// src/cpp/cnn_internals.cpp:131:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w7, [sp, 276]	//, %sfp
	ldr	x19, [sp, 304]	// _324, %sfp
	add	w12, w12, 1	// oh, oh,
	ldp	w14, w22, [x1, -8]	//,,
	sub	w7, w7, w8	// ivtmp.622, ivtmp.622, stride
	ldr	w11, [sp, 300]	//, %sfp
// src/cpp/cnn_internals.cpp:131:             for (int oh = 0; oh < output_h; ++oh) {
	cmp	w16, w12	// output_h, oh
	bne	.L164		//,
// src/cpp/cnn_internals.cpp:127:         for (int oc = 0; oc < out_channels; ++oc) {
	ldp	x23, x20, [sp, 232]	// ivtmp.636, _328,
	add	x2, x9, 4	// ivtmp.634, ivtmp.634,
	ldr	x0, [sp, 184]	// _317, %sfp
	ldr	x10, [sp, 248]	// ivtmp.643, %sfp
	ldr	w13, [sp, 256]	//, %sfp
	add	x23, x23, x0	// ivtmp.636, ivtmp.636, _317
	ldr	x0, [sp, 144]	// ivtmp.637, %sfp
	add	x0, x0, x19	// ivtmp.637, ivtmp.637, _324
	str	x0, [sp, 144]	// ivtmp.637, %sfp
	cmp	x2, x20	// ivtmp.634, _328
	bne	.L165		//,
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	ldp	w1, w2, [sp, 200]	//,,
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	add	x7, x17, x21	// ivtmp.644, ivtmp.644, _335
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	ldp	x3, x18, [sp, 208]	// _84, _85,
	ldr	x5, [sp, 224]	// _332, %sfp
	add	w2, w2, 1	// b, b,
// src/cpp/cnn_internals.cpp:124:     for (int b = 0; b < input_batches; ++b) {
	add	x10, x10, x5	// ivtmp.643, ivtmp.643, _332
	cmp	w1, w2	// input_batches, b
	bne	.L166		//,
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
.L150:
// src/cpp/cnn_internals.cpp:166: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x29, x30, [sp], 336	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
.L168:
	.cfi_def_cfa_offset 336
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	.cfi_offset 29, -336
	.cfi_offset 30, -328
// src/cpp/cnn_internals.cpp:154:                                 int w_idx  = out_oc_ch_size + ic_weight_size + kh * kernel_w + kw;
	mov	w1, 0	// niters_vector_mult_vf.544,
	mov	x2, x16	// _252, _252
	sxtw	x6, w8	// _260, ivtmp.600
	sxtw	x5, w9	// _275, ivtmp.601
	b	.L155		//
.L157:
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w7, w7, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:149:                         for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w8, w8, w26	// ivtmp.600, ivtmp.600, input_w
	add	w9, w9, w28	// ivtmp.601, ivtmp.601, _2
	cmp	w13, w7	// _51, kh
	bne	.L158		//,
	b	.L178		//
.L180:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 29
	.cfi_restore 30
	ret	
	.cfi_endproc
.LFE1530:
	.size	_Z29conv2d_forward_hoist_restrictRK6TensorS1_S1_RS_ii, .-_Z29conv2d_forward_hoist_restrictRK6TensorS1_S1_RS_ii
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.align	2
	.p2align 5,,15
	.global	_Z22conv2d_forward_reorderRK6TensorS1_S1_RS_ii
	.type	_Z22conv2d_forward_reorderRK6TensorS1_S1_RS_ii, %function
_Z22conv2d_forward_reorderRK6TensorS1_S1_RS_ii:
.LFB1531:
	.cfi_startproc
	stp	x29, x30, [sp, -384]!	//,,,
	.cfi_def_cfa_offset 384
	.cfi_offset 29, -384
	.cfi_offset 30, -376
	mov	x29, sp	//,
	mov	x6, x3	// output, tmp601
	mov	x3, x0	// input, tmp598
	mov	x0, x1	// weight, tmp599
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1919: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	mov	x1, 2305843009213693951	// tmp372,
// src/cpp/cnn_internals.cpp:169:                     int stride, int padding) {
	stp	x19, x20, [sp, 16]	//,,
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 19, -368
	.cfi_offset 20, -360
	.cfi_offset 21, -352
	.cfi_offset 22, -344
	mov	w21, w4	// stride, tmp602
	stp	x23, x24, [sp, 48]	//,,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x2, [x2]	// _123, MEM[(const struct vector *)bias_75(D)].D.33436._M_impl.D.32737._M_start
	.cfi_offset 23, -336
	.cfi_offset 24, -328
// src/cpp/cnn_internals.cpp:181:     int output_h     = output.height;
	ldp	w7, w24, [x6, 32]	// output_h, _2,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x4, [x3]	// _108, MEM[(const struct vector *)input_72(D)].D.33436._M_impl.D.32737._M_start
	str	x2, [sp, 224]	// _123, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x2, [x6]	// _132, MEM[(struct vector *)output_76(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:181:     int output_h     = output.height;
	str	w7, [sp, 172]	// output_h, %sfp
// src/cpp/cnn_internals.cpp:192:     std::vector<float> acc(output_w); 
	sxtw	x19, w24	// _2, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	str	x2, [sp, 152]	// _132, %sfp
// src/cpp/cnn_internals.cpp:187:     int out_size = output_h * output_w;
	mul	w2, w24, w7	// out_size, _2, output_h
	str	w2, [sp, 184]	// out_size, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x2, [x0]	// _109, MEM[(const struct vector *)weight_74(D)].D.33436._M_impl.D.32737._M_start
	str	x2, [sp, 240]	// _109, %sfp
// src/cpp/cnn_internals.cpp:183:     int input_batches = input.batches;
	ldr	w2, [x3, 24]	//, input_72(D)->batches
	str	w2, [sp, 148]	// input_batches, %sfp
// src/cpp/cnn_internals.cpp:176:     int in_channels  = weight.channels;
	ldp	w23, w7, [x0, 24]	// out_channels, in_channels,
// src/cpp/cnn_internals.cpp:178:     int kernel_w     = weight.width;
	ldp	w0, w2, [x0, 32]	// _1, kernel_w,
	str	w2, [sp, 144]	// kernel_w, %sfp
	str	w0, [sp, 208]	// _1, %sfp
// src/cpp/cnn_internals.cpp:180:     int input_w      = input.width;
	ldp	w0, w2, [x3, 32]	// input_h, input_w,
	str	w2, [sp, 168]	// input_w, %sfp
	str	w0, [sp, 212]	// input_h, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1919: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	cmp	x19, x1	// _2, tmp372
	bhi	.L266		//,
	mov	w22, w5	// padding, tmp603
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:380: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	cbz	x19, .L267	// _2,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	lsl	x20, x19, 2	// _145, _2,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -312
	.cfi_offset 25, -320
	mov	x0, x20	//, _145
	str	w7, [sp, 104]	// in_channels, %sfp
	str	x4, [sp, 112]	// _108, %sfp
	str	x20, [sp, 136]	// _145, %sfp
	bl	_Znwm		//
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1146:       if (__n <= 0)
	cmp	x19, 1	// _2,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_construct.h:119:       ::new((void*)__p) _Tp(std::forward<_Args>(__args)...);
	str	wzr, [x0]	//, *_152
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	mov	x26, x0	// iftmp.18_56, tmp604
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1146:       if (__n <= 0)
	ldr	x4, [sp, 112]	// _108, %sfp
	ldr	w7, [sp, 104]	//, %sfp
	beq	.L189		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	sub	x2, x20, #4	//, _145,
	mov	w1, 0	//,
	str	w7, [sp, 104]	// in_channels, %sfp
	add	x0, x0, 4	//, iftmp.18_56,
	bl	memset		//
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	w0, [sp, 148]	//, %sfp
	ldr	x4, [sp, 112]	// _108, %sfp
	ldr	w7, [sp, 104]	//, %sfp
	cmp	w0, 0	// input_batches,
	ble	.L191		//,
	cmp	w23, 0	// out_channels,
	ble	.L191		//,
	ldr	w0, [sp, 172]	//, %sfp
	cmp	w0, 0	// output_h,
	bgt	.L187		//,
.L191:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	ldr	x1, [sp, 136]	//, %sfp
	mov	x0, x26	//, iftmp.18_56
// src/cpp/cnn_internals.cpp:243: }
	ldp	x19, x20, [sp, 16]	//,,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
// src/cpp/cnn_internals.cpp:243: }
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 384	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	b	_ZdlPvm		//
.L267:
	.cfi_def_cfa_offset 384
	.cfi_offset 19, -368
	.cfi_offset 20, -360
	.cfi_offset 21, -352
	.cfi_offset 22, -344
	.cfi_offset 23, -336
	.cfi_offset 24, -328
	.cfi_offset 29, -384
	.cfi_offset 30, -376
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	w0, [sp, 148]	//, %sfp
	cmp	w0, 0	// input_batches,
	ble	.L183		//,
	cmp	w23, 0	// out_channels,
	ble	.L183		//,
	ldr	w0, [sp, 172]	//, %sfp
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -312
	.cfi_offset 25, -320
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:380: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	mov	x26, 0	// iftmp.18_56,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:400: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	str	xzr, [sp, 136]	//, %sfp
	cmp	w0, 0	// output_h,
	ble	.L268		//,
.L187:
// src/cpp/cnn_internals.cpp:185:     int in_size = input_h * input_w;
	ldp	w2, w0, [sp, 208]	//,,
	lsl	x11, x19, 2	// _254, _2,
	lsr	w9, w24, 3	// bnd.659_168, _2,
	index	z31.s, #0, w21	//,, stride
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ptrue	p6.b, all	// tmp571
	mvn	w5, w21	// tmp387, stride
	mov	w10, 32	// tmp585,
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -296
	.cfi_offset 27, -304
	lsr	w19, w5, 31	// _332, tmp387,
	sbfiz	x18, x21, 2, 32	// _463, stride,,
// src/cpp/cnn_internals.cpp:186:     int in_ch_size = in_channels * in_size;
	mov	w3, 0	// ivtmp.807,
	lsr	w20, w21, 31	// _370, stride,
// src/cpp/cnn_internals.cpp:185:     int in_size = input_h * input_w;
	ldr	w1, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:186:     int in_ch_size = in_channels * in_size;
	mov	x16, 0	// ivtmp.808,
	sxtw	x25, w21	// _333, stride
	str	x11, [sp, 248]	// _254, %sfp
	sbfiz	x28, x21, 4, 32	// _459, stride,,
	sbfiz	x30, x21, 3, 32	// _552, stride,,
// src/cpp/cnn_internals.cpp:188:     int out_ch_size = out_channels * out_size;
	ldr	w15, [sp, 184]	//, %sfp
// src/cpp/cnn_internals.cpp:186:     int in_ch_size = in_channels * in_size;
	str	xzr, [sp, 176]	//, %sfp
	ldr	x5, [sp, 224]	// _123, %sfp
	add	x5, x5, w23, sxtw 2	// _407, _123, out_channels,
// src/cpp/cnn_internals.cpp:185:     int in_size = input_h * input_w;
	mul	w8, w0, w1	// in_size, input_h, input_w
	mov	w0, 12	// tmp394,
	str	x5, [sp, 104]	// _407, %sfp
	mov	w5, w3	// ivtmp.807, ivtmp.807
// src/cpp/cnn_internals.cpp:189:     int weight_size = kernel_h * kernel_w;
	ldr	w1, [sp, 144]	//, %sfp
	mov	x3, x18	// _463, _463
	mov	w18, w19	// _332, _332
	smull	x27, w21, w0	// _555, stride, tmp394
	mov	w19, w20	// _370, _370
	mov	w20, w24	// _2, _2
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	str	wzr, [sp, 216]	//, %sfp
// src/cpp/cnn_internals.cpp:186:     int in_ch_size = in_channels * in_size;
	mul	w11, w7, w8	// in_ch_size_87, in_channels, in_size
// src/cpp/cnn_internals.cpp:185:     int in_size = input_h * input_w;
	str	w8, [sp, 236]	// in_size, %sfp
	sub	w8, w24, #1	// _576, _2,
	umaddl	x0, w9, w10, x26	// _439, bnd.659_168, tmp585, iftmp.18_56
	str	w8, [sp, 232]	// _576, %sfp
// src/cpp/cnn_internals.cpp:189:     int weight_size = kernel_h * kernel_w;
	mul	w6, w2, w1	// weight_size, _1, kernel_w
	sxtw	x17, w1	// _129, kernel_w
	sbfiz	x8, x1, 2, 32	// _42, kernel_w,,
// src/cpp/cnn_internals.cpp:188:     int out_ch_size = out_channels * out_size;
	mul	w2, w23, w15	// out_ch_size, out_channels, out_size
	lsr	w1, w24, 3	// _251, _2,
	sxtw	x15, w15	// _411, out_size
	mov	x24, x3	// _463, _463
	ldr	x3, [sp, 104]	// _407, %sfp
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	sub	w23, w22, #1	// _222, padding,
// src/cpp/cnn_internals.cpp:190:     int weight_ch_size = in_channels * weight_size;
	mul	w12, w7, w6	// weight_ch_size, in_channels, weight_size
	sbfiz	x6, x6, 2, 32	// _515, weight_size,,
	sxtw	x13, w11	// _176, in_ch_size_87
	stp	x0, x15, [sp, 288]	// _439, _411,
	sxtw	x11, w22	// _321, padding
	neg	w0, w22	// ivtmp.791, padding
	mov	w10, w2	// out_ch_size, out_ch_size
	str	x6, [sp, 264]	// _515, %sfp
	sxtw	x6, w2	// _267, out_ch_size
	sxtw	x14, w12	// _209, weight_ch_size
	mov	x9, x6	// _267, _267
	mov	x12, x16	// ivtmp.808, ivtmp.808
	mov	w2, w0	// ivtmp.791, ivtmp.791
	mov	w16, w23	// _222, _222
	mov	x0, x11	// _321, _321
	mov	w23, w21	// stride, stride
	mov	x6, x1	// _251, _251
	mov	x21, x17	// _129, _129
	mov	w17, w22	// padding, padding
	mov	x22, x4	// _108, _108
.L230:
	ldr	w1, [sp, 168]	//, %sfp
	lsl	x4, x6, 5	// _250, _251,
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	str	w5, [sp, 132]	// ivtmp.807, %sfp
	str	w10, [sp, 312]	// out_ch_size, %sfp
	mov	x10, x6	// _251, _251
	str	w5, [sp, 316]	// ivtmp.807, %sfp
	mov	x5, x3	// _407, _407
	stp	x12, x9, [sp, 320]	// ivtmp.808, _267,
	mov	w9, w19	// _370, _370
	mov	x19, x21	// _129, _129
	add	w1, w1, w17	// _244, input_w, padding
	mov	w21, w17	// padding, padding
	sub	w15, w1, #1	// _115, _244,
	mov	w17, w16	// _222, _222
	ldr	x1, [sp, 224]	// ivtmp.796, %sfp
	mov	w11, w15	// _115, _115
	mov	x16, x12	// ivtmp.800, ivtmp.808
	str	x12, [sp, 104]	// ivtmp.808, %sfp
	str	xzr, [sp, 160]	//, %sfp
	str	x4, [sp, 280]	// _250, %sfp
	str	x13, [sp, 304]	// _176, %sfp
	str	x1, [sp, 200]	// ivtmp.796, %sfp
	mov	w1, w2	// ivtmp.791, ivtmp.791
.L218:
// src/cpp/cnn_internals.cpp:202:             const float b_val = bias_ptr[oc];
	ldr	x2, [sp, 200]	// ivtmp.796, %sfp
	mov	w4, w1	// ivtmp.791, ivtmp.791
	mov	w6, w21	// ivtmp.787, ivtmp.787
	mov	x13, x10	// _251, _251
	str	w1, [sp, 188]	// ivtmp.791, %sfp
	mov	w1, w16	// ivtmp.789, ivtmp.789
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	str	wzr, [sp, 220]	//, %sfp
	str	x5, [sp, 336]	// _407, %sfp
// src/cpp/cnn_internals.cpp:202:             const float b_val = bias_ptr[oc];
	ldr	s25, [x2]	// b_val, MEM[(const float *)_575]
	dup	v30.4s, v25.s[0]	//, b_val
.L192:
// src/cpp/cnn_internals.cpp:209:                 int kh_hi = std::min(kernel_h, input_h - c_h);
	ldp	w3, w2, [sp, 208]	//,,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	bic	w12, w6, w6, asr #31	// _280, ivtmp.787
// src/cpp/cnn_internals.cpp:209:                 int kh_hi = std::min(kernel_h, input_h - c_h);
	add	w2, w2, w6	// _365, input_h, ivtmp.787
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w2, w3	// _365, _1
	csel	w10, w2, w3, le	// _283, _365, _1,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cbz	w20, .L269	// _2,
	ldr	w2, [sp, 232]	//, %sfp
	cmp	w2, 7	// _576,
	bls	.L236		//,
	mov	x2, x26	// ivtmp.779, iftmp.18_56
.L194:
	ldr	x3, [sp, 288]	// _439, %sfp
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	stp	q30, q30, [x2], 32	//,, ivtmp.779,
	cmp	x3, x2	// _439, ivtmp.779
	bne	.L194		//,
	and	w2, w20, -8	// _202, _2,
	cmp	w20, w2	// _2, _202
	beq	.L195		//,
.L193:
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	uxtw	x3, w2	// _207, _202
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w15, w2, 1	// ow_184, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	lsl	x5, x3, 2	// _206, _207,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x26, x5]	// b_val, *_205
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w15	// _2, ow_184
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	x3, x26, x5	// tmp407, iftmp.18_56, _206
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w5, w2, 2	// ow_50, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 4]	// b_val, *_48
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w5	// _2, ow_50
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w5, w2, 3	// ow_486, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 8]	// b_val, *_162
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w5	// _2, ow_486
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w5, w2, 4	// ow_410, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 12]	// b_val, *_408
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w5	// _2, ow_410
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w5, w2, 5	// ow_417, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 16]	// b_val, *_415
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w5	// _2, ow_417
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w5, w2, 6	// ow_30, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 20]	// b_val, *_423
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w5	// _2, ow_30
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	add	w2, w2, 7	// ow_36, _202,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 24]	// b_val, *_34
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	cmp	w20, w2	// _2, ow_36
	ble	.L195		//,
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	str	s25, [x3, 28]	// b_val, *_551
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w7, 0	// in_channels,
	ble	.L270		//,
.L196:
	cmp	w12, w10	// _280, _283
	bge	.L200		//,
	ldr	w2, [sp, 144]	//, %sfp
	cmp	w2, 0	// kernel_w,
	ble	.L200		//,
.L231:
	ldr	w2, [sp, 144]	//, %sfp
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	mov	w3, 0	// ic,
	str	x8, [sp, 120]	// _42, %sfp
	mov	w8, w7	// in_channels, in_channels
	mov	w7, w3	// ic, ic
	mov	x3, x14	// _209, _209
	str	w1, [sp, 356]	// ivtmp.789, %sfp
	mov	x1, 0	// ivtmp.772,
	str	x16, [sp, 344]	// ivtmp.800, %sfp
	str	w6, [sp, 352]	// ivtmp.787, %sfp
	mul	w5, w2, w12	// _520, kernel_w, _280
	ldr	x2, [sp, 160]	// ivtmp.802, %sfp
	add	x5, x2, w5, sxtw	// _502, ivtmp.802, _520
	ldr	w2, [sp, 188]	//, %sfp
	add	w15, w2, w12	// _12, ivtmp.791, _280
	ldr	x2, [sp, 240]	// _109, %sfp
	add	x2, x2, x5, lsl 2	// ivtmp.774, _109, _502,
	str	x2, [sp, 192]	// ivtmp.774, %sfp
	ldrsw	x2, [sp, 236]	// _539, %sfp
	str	x2, [sp, 272]	// _539, %sfp
	ldr	w2, [sp, 168]	//, %sfp
	mul	w15, w15, w2	// _11, _12, input_w
	sxtw	x5, w2	// _107, input_w
	ldr	x2, [sp, 176]	// ivtmp.809, %sfp
	add	x2, x2, w15, sxtw	// _449, ivtmp.809, _11
	str	x2, [sp, 256]	// _449, %sfp
	mov	x2, x13	// _251, _251
.L205:
	ldr	x6, [sp, 256]	// _449, %sfp
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	mov	w15, w12	// kh, _280
	str	w7, [sp, 364]	// ic, %sfp
	mov	x7, x3	// _209, _209
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x13, [sp, 192]	// ivtmp.764, %sfp
	str	x1, [sp, 368]	// ivtmp.772, %sfp
	str	w10, [sp, 128]	// _283, %sfp
	add	x16, x6, x1	// ivtmp.767, _449, ivtmp.772
	mov	x1, x2	// _251, _251
	str	w8, [sp, 360]	// in_channels, %sfp
	str	w12, [sp, 376]	// _280, %sfp
	str	w4, [sp, 380]	// ivtmp.791, %sfp
	.p2align 5,,15
.L201:
// src/cpp/cnn_internals.cpp:223:                             int ow_hi = std::min(output_w, (input_w + padding - kw - 1) / stride + 1);
	mov	x8, 0	// ivtmp.749,
	sub	x14, x16, x0	// _286, ivtmp.767, _321
	str	x16, [sp, 104]	// ivtmp.767, %sfp
	str	w15, [sp, 112]	// kh, %sfp
	.p2align 5,,15
.L204:
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	sub	w4, w21, w8	// _130, padding, ivtmp.749
	mov	w2, w8	// _298, ivtmp.749
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	mov	w3, 0	// iftmp.14_62,
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	cmp	w4, 0	// _130,
	ble	.L207		//,
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	sub	w3, w23, w8	// _26, stride, ivtmp.749
	add	w3, w3, w17	// _538, _26, _222
// src/cpp/cnn_internals.cpp:222:                             int ow_lo = num <= 0 ? 0 : (num + stride - 1) / stride;
	sdiv	w3, w3, w23	// iftmp.14_62, _538, stride
.L207:
// src/cpp/cnn_internals.cpp:223:                             int ow_hi = std::min(output_w, (input_w + padding - kw - 1) / stride + 1);
	sub	w4, w11, w2	// _270, _115, _298
// src/cpp/cnn_internals.cpp:226:                             float w_val = weight_ptr[w_idx];
	ldr	s1, [x13, x8, lsl 2]	//, MEM[(const float *)_297 + ivtmp.749_560 * 4]
// src/cpp/cnn_internals.cpp:223:                             int ow_hi = std::min(output_w, (input_w + padding - kw - 1) / stride + 1);
	sdiv	w4, w4, w23	// _23, _270, stride
// src/cpp/cnn_internals.cpp:223:                             int ow_hi = std::min(output_w, (input_w + padding - kw - 1) / stride + 1);
	add	w4, w4, 1	// _24, _23,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:238:       if (__b < __a)
	cmp	w4, w20	// _24, _2
	csel	w4, w4, w20, le	// _3, _24, _2,
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	cmp	w4, w3	// _3, iftmp.14_62
	ble	.L214		//,
	sub	w15, w4, w3	// _337, _3, iftmp.14_62
	sxtw	x6, w3	// ivtmp.730, iftmp.14_62
	mul	w12, w3, w23	// _319, iftmp.14_62, stride
	add	x12, x8, w12, sxtw	// _227, ivtmp.749, _319
	add	x2, x26, w3, sxtw 2	// _346, iftmp.18_56, iftmp.14_62,
	sub	x10, x15, #1	// _338, _337,
	add	x12, x12, x14	// _330, _227, _286
	sub	x16, x6, #1	// _188, ivtmp.730,
	cmp	w9, 0	// _370,
	mul	x10, x10, x24	// _340, _338, _463
	add	x16, x16, x15	// _354, _188, _337
	csel	x15, x10, xzr, ne	// _379, _340,,
	cmp	w18, 0	// _332,
	csel	x10, x10, xzr, ne	// _341, _340,,
	add	x15, x15, x12, lsl 2	// _380, _379, _330,
	sub	w3, w4, w3	// _336, _3, iftmp.14_62
	add	x16, x26, x16, lsl 2	// _356, iftmp.18_56, _354,
	add	x10, x10, x12, lsl 2	// _342, _341, _330,
	add	x15, x22, x15	// _381, _108, _380
	cmp	x16, x15	// _356, _381
	lsl	x15, x12, 2	// _331, _330,
	add	x10, x22, x10	// _343, _108, _342
	ccmp	x10, x2, 0, cs	// _343, _346,,
	bcs	.L210		//,
	sub	w4, w3, #1	// _429, _336,
	cmp	w4, 2	// _429,
	bls	.L238		//,
	dup	v26.4s, v1.s[0]	//,
	add	x15, x22, x15	// ivtmp.741, _108, _331
	lsr	w4, w3, 2	// bnd.676_432, _336,
	add	x4, x2, w4, uxtw 4	// _559, ivtmp.738, bnd.676_432,
	.p2align 5,,15
.L212:
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ldr	s28, [x15, x30]	// MEM[(const float *)_128 + _552 * 1], MEM[(const float *)_128 + _552 * 1]
	ldr	s3, [x15, x25, lsl 2]	//, MEM[(const float *)_128 + _333 * 4]
	ldr	s29, [x15, x27]	// MEM[(const float *)_128 + _555 * 1], MEM[(const float *)_128 + _555 * 1]
	ldr	s4, [x15]	//, MEM[(const float *)_128]
	add	x15, x15, x28	// ivtmp.741, ivtmp.741, _459
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ldr	q2, [x2]	//, MEM <vector(4) float> [(float *)_317]
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ins	v3.s[1], v29.s[0]	//, MEM[(const float *)_128 + _555 * 1]
	ins	v4.s[1], v28.s[0]	//, MEM[(const float *)_128 + _552 * 1]
	zip1	v3.4s, v4.4s, v3.4s	//,,
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	fmla	v2.4s, v3.4s, v26.4s	//,,
	str	q2, [x2], 16	//, MEM <vector(4) float> [(float *)_317]
	cmp	x2, x4	// ivtmp.738, _559
	bne	.L212		//,
	and	w4, w3, -4	// niters_vector_mult_vf.677, _336,
	tst	x3, 3	// _336,
	beq	.L214		//,
.L211:
	uxtw	x2, w4	// _495, niters_vector_mult_vf.677
	sub	w3, w3, w4	// _542, _336, niters_vector_mult_vf.677
	mov	z1.s, s1	//,
	whilelo	p7.s, xzr, x3	// max_mask_545,, _542
	add	x6, x6, x2	// _496, ivtmp.730, _495
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ld1w	z27.s, p7/z, [x26, x6, lsl 2]	//, max_mask_545,* iftmp.18_56
	madd	x2, x25, x2, x12	// _526, _333, _495, _330
	add	x2, x22, x2, lsl 2	// vectp.692, _108, _526,
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ld1w	z28.s, p7/z, [x2, z31.s, sxtw 2]	//, max_mask_545, vectp.692,,
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	fmad	z1.s, p6/m, z28.s, z27.s	//, tmp571,,
	st1w	z1.s, p7, [x26, x6, lsl 2]	//, max_mask_545,* iftmp.18_56
.L214:
// src/cpp/cnn_internals.cpp:220:                         for (int kw = 0; kw < kernel_w; ++kw) {
	add	x8, x8, 1	// ivtmp.749, ivtmp.749,
	cmp	x19, x8	// _129, ivtmp.749
	bne	.L204		//,
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	ldr	x2, [sp, 120]	// _42, %sfp
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	ldr	w15, [sp, 112]	//, %sfp
	ldr	x16, [sp, 104]	// ivtmp.767, %sfp
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	x13, x13, x2	// ivtmp.764, ivtmp.764, _42
	ldr	w2, [sp, 128]	//, %sfp
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	w15, w15, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:215:                     for (int kh = kh_lo; kh < kh_hi; ++kh) {
	add	x16, x16, x5	// ivtmp.767, ivtmp.767, _107
	cmp	w15, w2	// kh, _283
	bne	.L201		//,
	mov	x2, x1	// _251, _251
	add	x1, sp, 372	//,,
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	ldp	x13, x6, [sp, 264]	// _515, _539,
	mov	x3, x7	// _209, _209
	ldp	w12, w4, [x1, 4]	//,,
	ldp	w8, w7, [x1, -12]	//,,
	ldr	x1, [sp, 368]	// ivtmp.772, %sfp
	ldr	w10, [sp, 128]	//, %sfp
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	add	w7, w7, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	add	x1, x1, x6	// ivtmp.772, ivtmp.772, _539
	ldr	x6, [sp, 192]	// ivtmp.774, %sfp
	add	x6, x6, x13	// ivtmp.774, ivtmp.774, _515
	str	x6, [sp, 192]	// ivtmp.774, %sfp
	cmp	w8, w7	// in_channels, ic
	bgt	.L205		//,
	ldr	w1, [sp, 356]	//, %sfp
	mov	x13, x2	// _251, _251
	mov	w7, w8	// in_channels, in_channels
	mov	x14, x3	// _209, _209
// src/cpp/cnn_internals.cpp:236:                 int out_row = out_b_ch_size + out_oc_size + oh * output_w;
	ldr	w2, [sp, 132]	//, %sfp
	ldr	x8, [sp, 120]	// _42, %sfp
	ldr	x16, [sp, 344]	// ivtmp.800, %sfp
	add	w2, w2, w1	// _39, ivtmp.798, ivtmp.789
	ldr	w6, [sp, 352]	//, %sfp
// src/cpp/cnn_internals.cpp:237:                 for (int ow = 0; ow < output_w; ++ow) {
	cbz	w20, .L203	// _2,
.L202:
	add	x2, x16, w2, sxtw	// _233, ivtmp.800, _39
	ldr	x3, [sp, 152]	// _132, %sfp
	add	x5, x3, x2, lsl 2	// _231, _132, _233,
	add	x3, x26, 4	// _230, iftmp.18_56,
	sub	x3, x5, x3	// _229, _231, _230
	cmp	x3, 24	// _229,
	bls	.L220		//,
	ldr	w3, [sp, 232]	//, %sfp
	cmp	w3, 6	// _576,
	bls	.L239		//,
.L197:
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	mov	x3, 0	// ivtmp.721,
	add	x12, x26, 16	// _249, iftmp.18_56,
	add	x10, x5, 16	// _248, _231,
.L222:
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	ldr	q28, [x26, x3]	// tmp995, MEM <vector(4) float> [(float *)iftmp.18_563 + ivtmp.721_253 * 1]
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	ldr	q29, [x12, x3]	// MEM <vector(4) float> [(float *)_249 + ivtmp.721_253 * 1], MEM <vector(4) float> [(float *)_249 + ivtmp.721_253 * 1]
	ldr	x15, [sp, 280]	// _250, %sfp
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	str	q28, [x5, x3]	// tmp995, MEM <vector(4) float> [(float *)_300 + ivtmp.721_253 * 1]
	str	q29, [x10, x3]	// MEM <vector(4) float> [(float *)_249 + ivtmp.721_253 * 1], MEM <vector(4) float> [(float *)_248 + ivtmp.721_253 * 1]
	add	x3, x3, 32	// ivtmp.721, ivtmp.721,
	cmp	x15, x3	// _250, ivtmp.721
	bne	.L222		//,
	and	w3, w20, -8	// niters_vector_mult_vf.660, _2,
	cmp	w3, w20	// niters_vector_mult_vf.660, _2
	beq	.L203		//,
.L221:
	uxtw	x5, w3	// _54, niters_vector_mult_vf.660
	sub	w3, w20, w3	// bnd.669, _2, niters_vector_mult_vf.660
	whilelo	p5.s, wzr, w3	// max_mask_293,, bnd.669
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	ld1w	z0.s, p5/z, [x26, x5, lsl 2]	//, max_mask_293,* iftmp.18_56
	cntw	x10		// tmp997
	whilelo	p7.s, w10, w3	// next_mask_210, tmp997, bnd.669
	ldr	x3, [sp, 152]	// _132, %sfp
	add	x2, x5, x2	// _4, _54, _233
	add	x5, x26, x5, lsl 2	// vectp_iftmp.671, iftmp.18_56, _54,
	add	x2, x3, x2, lsl 2	// vectp.674, _132, _4,
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	st1w	z0.s, p5, [x2]	//, max_mask_293,* vectp.674
	b.none	.L203	//,
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	ld1w	z29.s, p7/z, [x5, #1, mul vl]	//, next_mask_210,
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	st1w	z29.s, p7, [x2, #1, mul vl]	//, next_mask_210,
.L203:
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w3, [sp, 188]	//, %sfp
	sub	w6, w6, w23	// ivtmp.787, ivtmp.787, stride
	add	w1, w1, w20	// ivtmp.789, ivtmp.789, _2
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w2, [sp, 220]	//, %sfp
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	add	w3, w3, w23	// ivtmp.791, ivtmp.791, stride
	str	w3, [sp, 188]	// ivtmp.791, %sfp
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	add	w2, w2, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w3, [sp, 172]	//, %sfp
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	str	w2, [sp, 220]	// oh, %sfp
// src/cpp/cnn_internals.cpp:204:             for (int oh = 0; oh < output_h; ++oh) {
	cmp	w3, w2	// output_h, oh
	bne	.L192		//,
// src/cpp/cnn_internals.cpp:199:         for (int oc = 0; oc < out_channels; ++oc) {
	ldr	w3, [sp, 132]	//, %sfp
	mov	w1, w4	// ivtmp.791, ivtmp.791
	mov	x10, x13	// _251, _251
	ldr	w4, [sp, 184]	//, %sfp
	ldr	x2, [sp, 200]	// ivtmp.796, %sfp
	ldr	x5, [sp, 336]	// _407, %sfp
	sub	w3, w3, w4	// ivtmp.798, ivtmp.798, out_size
	str	w3, [sp, 132]	// ivtmp.798, %sfp
	add	x2, x2, 4	// ivtmp.796, ivtmp.796,
	ldr	x3, [sp, 296]	// _411, %sfp
	str	x2, [sp, 200]	// ivtmp.796, %sfp
	add	x16, x16, x3	// ivtmp.800, ivtmp.800, _411
	ldr	x3, [sp, 160]	// ivtmp.802, %sfp
	add	x3, x3, x14	// ivtmp.802, ivtmp.802, _209
	str	x3, [sp, 160]	// ivtmp.802, %sfp
	cmp	x2, x5	// ivtmp.796, _407
	bne	.L218		//,
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	x4, [sp, 176]	// ivtmp.809, %sfp
	mov	x6, x13	// _251, _251
	mov	w2, w1	// ivtmp.791, ivtmp.791
	mov	x3, x5	// _407, _407
	mov	w16, w17	// _222, _222
	ldr	x13, [sp, 304]	// _176, %sfp
	mov	w17, w21	// padding, padding
	mov	x21, x19	// _129, _129
	mov	w19, w9	// _370, _370
	ldp	x12, x9, [sp, 320]	// ivtmp.808, _267,
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	w1, [sp, 216]	//, %sfp
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	add	x4, x4, x13	// ivtmp.809, ivtmp.809, _176
	add	x12, x12, x9	// ivtmp.808, ivtmp.808, _267
	ldr	w10, [sp, 312]	//, %sfp
	str	x4, [sp, 176]	// ivtmp.809, %sfp
	ldr	w5, [sp, 316]	//, %sfp
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	add	w1, w1, 1	// b, b,
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	w4, [sp, 148]	//, %sfp
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	str	w1, [sp, 216]	// b, %sfp
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	sub	w5, w5, w10	// ivtmp.807, ivtmp.807, out_ch_size
	cmp	w4, w1	// input_batches, b
	bgt	.L230		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:388: 	if (__p)
	cbz	x26, .L271	// iftmp.18_56,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	ldr	x1, [sp, 136]	//, %sfp
	mov	x0, x26	//, iftmp.18_56
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_remember_state
	.cfi_restore 28
	.cfi_restore 27
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
// src/cpp/cnn_internals.cpp:243: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 384	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	b	_ZdlPvm		//
	.p2align 2,,3
.L210:
	.cfi_restore_state
	add	x15, x22, x15	// ivtmp.733, _108, _331
	.p2align 5,,15
.L216:
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	ldr	s5, [x26, x6, lsl 2]	//, MEM[(float *)iftmp.18_563 + ivtmp.730_247 * 4]
	ldr	s6, [x15]	//, MEM[(const float *)_309]
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	add	x15, x15, x24	// ivtmp.733, ivtmp.733, _463
// src/cpp/cnn_internals.cpp:231:                                 acc_ptr[ow] += input_ptr[in_row_offset + iw] * w_val;
	fmadd	s5, s1, s6, s5	//,,,
	str	s5, [x26, x6, lsl 2]	//, MEM[(float *)iftmp.18_563 + ivtmp.730_247 * 4]
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	add	x6, x6, 1	// ivtmp.730, ivtmp.730,
	cmp	w4, w6	// _3, ivtmp.730
	bgt	.L216		//,
	b	.L214		//
.L238:
	mov	w4, 0	// niters_vector_mult_vf.677,
	b	.L211		//
.L195:
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w7, 0	// in_channels,
	bgt	.L196		//,
.L200:
// src/cpp/cnn_internals.cpp:236:                 int out_row = out_b_ch_size + out_oc_size + oh * output_w;
	ldr	w2, [sp, 132]	//, %sfp
	add	w2, w2, w1	// _39, ivtmp.798, ivtmp.789
	b	.L202		//
.L270:
	ldr	x3, [sp, 152]	// _132, %sfp
	ldr	w2, [sp, 132]	//, %sfp
	add	w2, w2, w1	// _214, ivtmp.798, ivtmp.789
	add	x2, x16, w2, sxtw	// _233, ivtmp.800, _214
	add	x5, x3, x2, lsl 2	// _231, _132, _233,
	add	x3, x26, 4	// _158, iftmp.18_56,
	sub	x3, x5, x3	// _323, _231, _158
	cmp	x3, 24	// _323,
	bhi	.L197		//,
.L220:
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	mov	x2, 0	// ivtmp.716,
	ldr	x3, [sp, 152]	// _132, %sfp
	add	x3, x3, w1, sxtw 2	// _256, _132, ivtmp.789,
.L226:
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	ldr	s29, [x26, x2]	// tmp1000, MEM[(float *)iftmp.18_563 + ivtmp.716_260 * 1]
// src/cpp/cnn_internals.cpp:237:                 for (int ow = 0; ow < output_w; ++ow) {
	ldr	x5, [sp, 248]	// _254, %sfp
// src/cpp/cnn_internals.cpp:238:                     out_ptr[out_row + ow] = acc_ptr[ow];
	str	s29, [x3, x2]	// tmp1000, MEM[(float *)_256 + ivtmp.716_260 * 1]
// src/cpp/cnn_internals.cpp:237:                 for (int ow = 0; ow < output_w; ++ow) {
	add	x2, x2, 4	// ivtmp.716, ivtmp.716,
	cmp	x5, x2	// _254, ivtmp.716
	bne	.L226		//,
	b	.L203		//
.L236:
// src/cpp/cnn_internals.cpp:205:                 for (int ow = 0; ow < output_w; ++ow) acc_ptr[ow] = b_val;
	mov	w2, 0	// _202,
	b	.L193		//
.L269:
// src/cpp/cnn_internals.cpp:211:                 for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w7, 0	// in_channels,
	ble	.L203		//,
	cmp	w12, w10	// _280, _283
	bge	.L203		//,
	ldr	w2, [sp, 144]	//, %sfp
	cmp	w2, 0	// kernel_w,
	bgt	.L231		//,
	b	.L203		//
.L239:
// src/cpp/cnn_internals.cpp:228:                             for (int ow = ow_lo; ow < ow_hi; ++ow) {
	mov	w3, 0	// niters_vector_mult_vf.660,
	b	.L221		//
.L271:
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
.L183:
// src/cpp/cnn_internals.cpp:243: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 384	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
.L189:
	.cfi_def_cfa_offset 384
	.cfi_offset 19, -368
	.cfi_offset 20, -360
	.cfi_offset 21, -352
	.cfi_offset 22, -344
	.cfi_offset 23, -336
	.cfi_offset 24, -328
	.cfi_offset 25, -320
	.cfi_offset 26, -312
	.cfi_offset 29, -384
	.cfi_offset 30, -376
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ldr	w0, [sp, 148]	//, %sfp
	cmp	w0, 0	// input_batches,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:400: 	this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
	mov	x0, 4	// _145,
	str	x0, [sp, 136]	// _145, %sfp
// src/cpp/cnn_internals.cpp:195:     for (int b = 0; b < input_batches; ++b) {
	ble	.L191		//,
	cmp	w23, 0	// out_channels,
	ble	.L191		//,
	ldr	w0, [sp, 184]	//, %sfp
	cmp	w0, 0	// out_size,
	bgt	.L187		//,
	b	.L191		//
.L268:
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	b	.L183		//
.L266:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1920: 	  __throw_length_error(
	adrp	x0, .LC0	// tmp374,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -312
	.cfi_offset 25, -320
	add	x0, x0, :lo12:.LC0	//, tmp374,
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -296
	.cfi_offset 27, -304
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1920: 	  __throw_length_error(
	bl	_ZSt20__throw_length_errorPKc		//
	.cfi_endproc
.LFE1531:
	.size	_Z22conv2d_forward_reorderRK6TensorS1_S1_RS_ii, .-_Z22conv2d_forward_reorderRK6TensorS1_S1_RS_ii
	.align	2
	.p2align 5,,15
	.global	_Z26conv2d_forward_specializedRK6TensorS1_S1_RS_
	.type	_Z26conv2d_forward_specializedRK6TensorS1_S1_RS_, %function
_Z26conv2d_forward_specializedRK6TensorS1_S1_RS_:
.LFB1532:
	.cfi_startproc
	sub	sp, sp, #528	//,,
	.cfi_def_cfa_offset 528
	mov	x5, x0	// input, tmp499
	mov	x0, x1	// weight, tmp500
	stp	x29, x30, [sp]	//,,
	.cfi_offset 29, -528
	.cfi_offset 30, -520
	mov	x29, sp	//,
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 23, -480
	.cfi_offset 24, -472
// src/cpp/cnn_internals.cpp:259:     int input_batches = input.batches;
	ldr	w23, [x5, 24]	//, input_45(D)->batches
// src/cpp/cnn_internals.cpp:251:     int out_channels = weight.batches;
	ldr	w6, [x1, 24]	//, weight_48(D)->batches
// src/cpp/cnn_internals.cpp:271:     for (int b = 0; b < input_batches; ++b) {
	cmp	w23, 0	// input_batches,
	ble	.L272		//,
	cmp	w6, 0	// out_channels,
	ble	.L272		//,
// src/cpp/cnn_internals.cpp:257:     int output_h     = output.height;
	ldr	w8, [x3, 32]	//, output_52(D)->height
	mov	x1, x3	// output, tmp502
	cmp	w8, 0	// output_h,
	ble	.L272		//,
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 20, -504
	.cfi_offset 19, -512
	mov	x7, x2	// bias, tmp501
// src/cpp/cnn_internals.cpp:304:                     out_ptr[out_row + ow] = acc[ow];
	mov	x11, 0	// ivtmp.986,
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 22, -488
	.cfi_offset 21, -496
	mov	w22, 0	// ivtmp.985,
// src/cpp/cnn_internals.cpp:271:     for (int b = 0; b < input_batches; ++b) {
	mov	w21, 0	// b,
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -456
	.cfi_offset 25, -464
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -440
	.cfi_offset 27, -448
// src/cpp/cnn_internals.cpp:254:     int kernel_w     = weight.width;
	ldr	w15, [x0, 36]	//, weight_48(D)->width
// src/cpp/cnn_internals.cpp:258:     int output_w     = output.width;
	ldr	w25, [x1, 36]	//, output_52(D)->width
// src/cpp/cnn_internals.cpp:252:     int in_channels  = weight.channels;
	ldp	w4, w18, [x0, 28]	// in_channels, kernel_h,
	sub	w2, w15, #3	// _566, kernel_w,
	sxtw	x19, w15	// _310, kernel_w
// src/cpp/cnn_internals.cpp:256:     int input_w      = input.width;
	ldp	w3, w10, [x5, 32]	// input_45(D)->height, input_w,
	lsr	w2, w2, 1	// _564, _566,
	sbfiz	x14, x15, 2, 32	// _102, kernel_w,,
	add	w2, w2, 2	// _561, _564,
	mov	x13, x14	// _102, _102
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x1, [x1]	// _53, MEM[(struct vector *)output_52(D)].D.33436._M_impl.D.32737._M_start
	lsl	x20, x2, 1	// _560, _561,
// src/cpp/cnn_internals.cpp:304:                     out_ptr[out_row + ow] = acc[ow];
	sub	w2, w25, #1	// _146, output_w,
// src/cpp/cnn_internals.cpp:265:     int weight_size = kernel_h * kernel_w;
	mul	w9, w18, w15	// weight_size, kernel_h, kernel_w
// src/cpp/cnn_internals.cpp:304:                     out_ptr[out_row + ow] = acc[ow];
	add	x2, x2, 1	// _139, _146,
	mov	x14, x19	// _310, _310
	lsl	x2, x2, 2	// _147, _139,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x24, [x0]	// _49, MEM[(const struct vector *)weight_48(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:263:     int out_size = output_h * output_w;
	mul	w0, w8, w25	// out_size, output_h, output_w
	mov	w19, w18	// kernel_h, kernel_h
// src/cpp/cnn_internals.cpp:261:     int in_size = input_h * input_w;
	mul	w3, w10, w3	// in_size, input_w, input_45(D)->height
	mov	w18, w15	// kernel_w, kernel_w
	sub	w28, w25, #1	// _451, output_w,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x26, [x5]	// _47, MEM[(const struct vector *)input_45(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:266:     int weight_ch_size = in_channels * weight_size;
	mul	w5, w4, w9	// weight_ch_size, in_channels, weight_size
	and	w27, w25, -4	// niters_vector_mult_vf.826, output_w,
// src/cpp/cnn_internals.cpp:304:                     out_ptr[out_row + ow] = acc[ow];
	str	x2, [sp, 176]	// _147, %sfp
// src/cpp/cnn_internals.cpp:261:     int in_size = input_h * input_w;
	stp	w3, w9, [sp, 168]	// in_size, weight_size,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x2, [x7]	// _51, MEM[(const struct vector *)bias_50(D)].D.33436._M_impl.D.32737._M_start
	sxtw	x5, w5	// _516, weight_ch_size
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	str	x1, [sp, 160]	// _53, %sfp
// src/cpp/cnn_internals.cpp:262:     int in_ch_size = in_channels * in_size;
	mul	w1, w4, w3	// in_ch_size_64, in_channels, in_size
// src/cpp/cnn_internals.cpp:264:     int out_ch_size = out_channels * out_size;
	mul	w3, w6, w0	// _246, out_channels, out_size
	add	x6, x2, w6, uxtw 2	// _190, _51, out_channels,
	sxtw	x7, w1	// _250, in_ch_size_64
	mov	x1, x7	// _250, _250
	mov	w7, w8	// output_h, output_h
	mov	w8, w23	// input_batches, input_batches
	mov	x23, x20	// _560, _560
	mov	x20, x2	// _51, _51
	mov	w2, w0	// out_size, out_size
.L317:
// src/cpp/cnn_internals.cpp:271:     for (int b = 0; b < input_batches; ++b) {
	mov	x0, x20	// ivtmp.977, _51
	mov	x12, x20	// _51, _51
	str	xzr, [sp, 136]	//, %sfp
	mov	w20, w18	// kernel_w, kernel_w
	mov	x18, x13	// _102, _102
	mov	x13, x1	// _250, _250
	mov	x1, x14	// _310, _310
	mov	w9, w22	// ivtmp.981, ivtmp.985
	mov	w16, w8	// input_batches, input_batches
	mov	w14, w3	// _246, _246
	mov	w8, w21	// b, b
	mov	w3, w22	// ivtmp.985, ivtmp.985
	mov	w15, w4	// in_channels, in_channels
	mov	w21, w19	// kernel_h, kernel_h
	mov	x22, x1	// _310, _310
.L275:
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, 0	// output_w,
	ble	.L318		//,
	str	d15, [sp, 96]	//,
	.cfi_offset 79, -432
// src/cpp/cnn_internals.cpp:278:             const float b_val = bias_ptr[oc];
	mov	w4, 0	// ivtmp.973,
	add	x19, sp, 272	// tmp459,,
	stp	wzr, w7, [sp, 144]	//, output_h,
	stp	w16, w2, [sp, 192]	// input_batches, out_size,
	stp	w8, w9, [sp, 208]	// b, ivtmp.981,
	mov	x8, x0	// ivtmp.977, ivtmp.977
	stp	w3, w14, [sp, 216]	// ivtmp.985, _246,
	mov	x3, x5	// _516, _516
	mov	x5, x22	// _310, _310
	ldr	s15, [x0]	// b_val, MEM[(const float *)_212]
	mov	x22, x18	// _102, _102
	str	w9, [sp, 132]	// ivtmp.981, %sfp
	str	x11, [sp, 152]	// ivtmp.986, %sfp
	str	x12, [sp, 184]	// _51, %sfp
	str	x6, [sp, 200]	// _190, %sfp
	str	x13, [sp, 224]	// _250, %sfp
.L315:
	cmp	w28, 7	// _451,
	bls	.L411		//,
	dup	v31.4s, v15.s[0]	//, b_val
	lsr	w0, w25, 3	// bnd.891, output_w,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	stp	q31, q31, [sp, 272]	//,,
	cmp	w0, 1	// bnd.891,
	beq	.L320		//,
	stp	q31, q31, [sp, 304]	//,,
	cmp	w0, 2	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 336]	//,,
	cmp	w0, 3	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 368]	//,,
	cmp	w0, 4	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 400]	//,,
	cmp	w0, 5	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 432]	//,,
	cmp	w0, 6	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 464]	//,,
	cmp	w0, 7	// bnd.891,
	beq	.L283		//,
	stp	q31, q31, [sp, 496]	//,,
.L283:
	and	w0, w25, -8	// tmp.893, output_w,
	cmp	w25, w0	// output_w, tmp.893
	beq	.L284		//,
.L282:
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 1	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w0, sxtw 2]	// b_val, acc[tmp.893_525]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
.L279:
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_202]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 2	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_182]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 3	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_108]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 4	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_461]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 5	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_519]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w1, w0, 6	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	add	w0, w0, 7	// ow, tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w1, sxtw 2]	// b_val, acc[ow_588]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w0	// output_w, ow
	ble	.L284		//,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [x19, w0, sxtw 2]	// b_val, acc[ow_243]
.L284:
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w15, 0	// in_channels,
	ble	.L281		//,
	cmp	w21, 0	// kernel_h,
	ble	.L281		//,
	cmp	w20, 0	// kernel_w,
	ble	.L281		//,
	ldpsw	x0, x16, [sp, 168]	// _256, _465,
	mov	x18, x8	// ivtmp.977, ivtmp.977
	mov	x11, x3	// _516, _516
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ptrue	p6.b, all	// tmp480
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	mov	w9, 0	// ic,
	sxtw	x14, w10	// _327, input_w
	str	w10, [sp, 232]	// input_w, %sfp
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	ldr	x2, [sp, 136]	// ivtmp.964, %sfp
	sub	x30, x24, #4	// _173, _49,
	lsr	w7, w25, 2	// bnd.851_332, output_w,
	mov	w8, w15	// in_channels, in_channels
	ldr	x1, [sp, 152]	// ivtmp.986, %sfp
	add	x17, x1, w4, sxtw	// ivtmp.962, ivtmp.986, ivtmp.973
	mov	x3, x0	// _256, _256
	mov	x0, x16	// _465, _465
.L296:
	add	x10, x30, x2, lsl 2	// ivtmp.951, _173, ivtmp.964,
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	mov	x1, x17	// ivtmp.946, ivtmp.962
	mov	w15, w2	// ivtmp.948, ivtmp.964
	stp	x17, x2, [sp, 240]	// ivtmp.962, ivtmp.964,
	mov	x13, x2	// ivtmp.950, ivtmp.964
// src/cpp/cnn_internals.cpp:287:                     for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w12, 0	// kh,
	mov	w16, w4	// ivtmp.973, ivtmp.973
	mov	x17, x0	// _465, _465
	str	w8, [sp, 256]	// in_channels, %sfp
	str	w9, [sp, 260]	// ic, %sfp
	str	x3, [sp, 264]	// _256, %sfp
	.p2align 5,,15
.L298:
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	mov	w2, 0	// kw,
	cmp	w20, 2	// kernel_w,
	ble	.L302		//,
	add	x8, x26, x1, lsl 2	// ivtmp.935, _47, ivtmp.946,
// src/cpp/cnn_internals.cpp:287:                     for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x4, 2	// ivtmp.928,
	sub	x9, x10, #4	// _330, ivtmp.951,
// src/cpp/cnn_internals.cpp:293:                             int w_idx  = out_oc_ch_size + ic_weight_size + kh_kernel_w + kw;
	stp	w21, w20, [sp, 124]	// kernel_h, kernel_w,
	sub	x6, x1, #2	// _137, ivtmp.946,
	sub	w3, w15, #1	// _326, ivtmp.948,
	.p2align 5,,15
.L307:
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	ldr	s24, [x9, x4, lsl 2]	// w_val, MEM[(const float *)_571 + ivtmp.928_595 * 4]
	cmp	w28, 2	// _451,
	bls	.L321		//,
	str	w27, [sp, 120]	// niters_vector_mult_vf.852, %sfp
.L304:
	ldr	s29, [x10, x4, lsl 2]	// D__lsm0.901, MEM[(const float *)_158 + ivtmp.928_338 * 4]
	dup	v30.4s, v24.s[0]	//, w_val
	add	x20, x8, 4	// ivtmp.920, ivtmp.935,
	mov	x0, x19	// ivtmp.915, tmp459
	add	x21, x8, w7, uxtw 4	// _596, ivtmp.935, bnd.851_332,
	mov	x2, x8	// ivtmp.918, ivtmp.935
	dup	v29.4s, v29.s[0]	//, D__lsm0.901
	.p2align 5,,15
.L313:
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q0, [x2], 16	//, MEM <const vector(4) float> [(const float *)_463]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q27, [x0]	//, MEM <vector(4) float> [(float *)_464]
	fmla	v27.4s, v0.4s, v30.4s	//,,
	str	q27, [x0]	//, MEM <vector(4) float> [(float *)_464]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q28, [x20], 16	//, MEM <const vector(4) float> [(const float *)_458]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	fmla	v27.4s, v29.4s, v28.4s	//,,
	str	q27, [x0], 16	//, MEM <vector(4) float> [(float *)_464]
	cmp	x2, x21	// ivtmp.918, _596
	bne	.L313		//,
	cmp	w27, w25	// niters_vector_mult_vf.826, output_w
	beq	.L412		//,
	ldr	w0, [sp, 120]	//, %sfp
	mov	x2, x4	// ivtmp.928, ivtmp.928
.L303:
	uxtw	x21, w0	// _385, niters_vector_mult_vf.852
	sub	w0, w25, w0	// bnd.872_382, output_w, niters_vector_mult_vf.852
	whilelo	p7.s, wzr, w0	// max_mask_441,, bnd.872_382
	mov	z24.s, s24	//, w_val
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ld1w	z2.s, p7/z, [x19, x21, lsl 2]	//, max_mask_441,
	add	x20, x4, x21	// _134, ivtmp.928, _385
	add	x0, x19, x21, lsl 2	// vectp_acc.874, tmp459, _385,
// src/cpp/cnn_internals.cpp:293:                             int w_idx  = out_oc_ch_size + ic_weight_size + kh_kernel_w + kw;
	add	w21, w3, w4	// _602, _326, ivtmp.928
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	add	x21, x24, w21, sxtw 2	// tmp388, _49, _602,
	add	x20, x20, x6	// _400, _134, _137
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ld1w	z1.s, p7/z, [x26, x20, lsl 2]	//, max_mask_441,* _47
	add	x4, x4, 2	// ivtmp.928, ivtmp.928,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	fmad	z24.s, p6/m, z1.s, z2.s	//, tmp480,,
	st1w	z24.s, p7, [x0]	//, max_mask_441,* vectp_acc.874
	add	x20, x26, x20, lsl 2	// _426, _47, _400,
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	ld1rw	z25.s, p6/z, [x21]	//, tmp480, *_315
	add	x8, x8, 8	// ivtmp.935, ivtmp.935,
	add	x20, x20, 4	// vectp.884, _426,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ld1w	z26.s, p7/z, [x20]	//, max_mask_441,* vectp.884
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	fmad	z25.s, p6/m, z26.s, z24.s	//, tmp480,,
	st1w	z25.s, p7, [x0]	//, max_mask_441,* vectp_acc.874
	cmp	x23, x4	// _560, ivtmp.928
	bne	.L307		//,
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	ldp	w21, w20, [sp, 124]	//,,
.L302:
	sxtw	x0, w2	// ivtmp.906, kw
	add	x8, x24, x13, lsl 2	// _322, _49, ivtmp.950,
	add	x2, x0, x1	// _18, ivtmp.906, ivtmp.946
	add	x2, x26, x2, lsl 2	// ivtmp.911, _47, _18,
.L312:
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	ldr	s23, [x8, x0, lsl 2]	//, MEM[(const float *)_322 + ivtmp.906_161 * 4]
	cmp	w28, 2	// _451,
	bls	.L323		//,
	mov	w3, w27	// niters_vector_mult_vf.826, niters_vector_mult_vf.826
	ldr	q22, [sp, 272]	//, MEM <vector(4) float> [(float *)&acc]
.L311:
	dup	v21.4s, v23.s[0]	//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q0, [x2]	//, MEM <const vector(4) float> [(const float *)_301]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	fmla	v22.4s, v0.4s, v23.s[0]	//,,
	str	q22, [sp, 272]	//, MEM <vector(4) float> [(float *)&acc]
	cmp	w7, 1	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q31, [x2, 16]	//, MEM <const vector(4) float> [(const float *)_301 + 16B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q18, [sp, 288]	//, MEM <vector(4) float> [(float *)&acc + 16B]
	fmla	v18.4s, v31.4s, v21.4s	//,,
	str	q18, [sp, 288]	//, MEM <vector(4) float> [(float *)&acc + 16B]
	cmp	w7, 2	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q17, [x2, 32]	//, MEM <const vector(4) float> [(const float *)_301 + 32B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q16, [sp, 304]	//, MEM <vector(4) float> [(float *)&acc + 32B]
	fmla	v16.4s, v17.4s, v21.4s	//,,
	str	q16, [sp, 304]	//, MEM <vector(4) float> [(float *)&acc + 32B]
	cmp	w7, 3	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q7, [x2, 48]	//, MEM <const vector(4) float> [(const float *)_301 + 48B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q6, [sp, 320]	//, MEM <vector(4) float> [(float *)&acc + 48B]
	fmla	v6.4s, v7.4s, v21.4s	//,,
	str	q6, [sp, 320]	//, MEM <vector(4) float> [(float *)&acc + 48B]
	cmp	w7, 4	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q5, [x2, 64]	//, MEM <const vector(4) float> [(const float *)_301 + 64B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q4, [sp, 336]	//, MEM <vector(4) float> [(float *)&acc + 64B]
	fmla	v4.4s, v5.4s, v21.4s	//,,
	str	q4, [sp, 336]	//, MEM <vector(4) float> [(float *)&acc + 64B]
	cmp	w7, 5	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q3, [x2, 80]	//, MEM <const vector(4) float> [(const float *)_301 + 80B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q20, [sp, 352]	//, MEM <vector(4) float> [(float *)&acc + 80B]
	fmla	v20.4s, v21.4s, v3.4s	//,,
	str	q20, [sp, 352]	//, MEM <vector(4) float> [(float *)&acc + 80B]
	cmp	w7, 6	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q19, [x2, 96]	//, MEM <const vector(4) float> [(const float *)_301 + 96B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q26, [sp, 368]	//, MEM <vector(4) float> [(float *)&acc + 96B]
	fmla	v26.4s, v21.4s, v19.4s	//,,
	str	q26, [sp, 368]	//, MEM <vector(4) float> [(float *)&acc + 96B]
	cmp	w7, 7	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q25, [x2, 112]	//, MEM <const vector(4) float> [(const float *)_301 + 112B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q24, [sp, 384]	//, MEM <vector(4) float> [(float *)&acc + 112B]
	fmla	v24.4s, v21.4s, v25.4s	//,,
	str	q24, [sp, 384]	//, MEM <vector(4) float> [(float *)&acc + 112B]
	cmp	w7, 8	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q2, [x2, 128]	//, MEM <const vector(4) float> [(const float *)_301 + 128B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q1, [sp, 400]	//, MEM <vector(4) float> [(float *)&acc + 128B]
	fmla	v1.4s, v21.4s, v2.4s	//,,
	str	q1, [sp, 400]	//, MEM <vector(4) float> [(float *)&acc + 128B]
	cmp	w7, 9	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q30, [x2, 144]	//, MEM <const vector(4) float> [(const float *)_301 + 144B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q29, [sp, 416]	//, MEM <vector(4) float> [(float *)&acc + 144B]
	fmla	v29.4s, v21.4s, v30.4s	//,,
	str	q29, [sp, 416]	//, MEM <vector(4) float> [(float *)&acc + 144B]
	cmp	w7, 10	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q28, [x2, 160]	//, MEM <const vector(4) float> [(const float *)_301 + 160B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q27, [sp, 432]	//, MEM <vector(4) float> [(float *)&acc + 160B]
	fmla	v27.4s, v28.4s, v21.4s	//,,
	str	q27, [sp, 432]	//, MEM <vector(4) float> [(float *)&acc + 160B]
	cmp	w7, 11	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q0, [x2, 176]	//, MEM <const vector(4) float> [(const float *)_301 + 176B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q31, [sp, 448]	//, MEM <vector(4) float> [(float *)&acc + 176B]
	fmla	v31.4s, v21.4s, v0.4s	//,,
	str	q31, [sp, 448]	//, MEM <vector(4) float> [(float *)&acc + 176B]
	cmp	w7, 12	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q18, [x2, 192]	//, MEM <const vector(4) float> [(const float *)_301 + 192B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q17, [sp, 464]	//, MEM <vector(4) float> [(float *)&acc + 192B]
	fmla	v17.4s, v21.4s, v18.4s	//,,
	str	q17, [sp, 464]	//, MEM <vector(4) float> [(float *)&acc + 192B]
	cmp	w7, 13	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q16, [x2, 208]	//, MEM <const vector(4) float> [(const float *)_301 + 208B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q7, [sp, 480]	//, MEM <vector(4) float> [(float *)&acc + 208B]
	fmla	v7.4s, v21.4s, v16.4s	//,,
	str	q7, [sp, 480]	//, MEM <vector(4) float> [(float *)&acc + 208B]
	cmp	w7, 14	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q6, [x2, 224]	//, MEM <const vector(4) float> [(const float *)_301 + 224B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q5, [sp, 496]	//, MEM <vector(4) float> [(float *)&acc + 224B]
	fmla	v5.4s, v21.4s, v6.4s	//,,
	str	q5, [sp, 496]	//, MEM <vector(4) float> [(float *)&acc + 224B]
	cmp	w7, 15	// bnd.851_332,
	beq	.L309		//,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q4, [x2, 240]	//, MEM <const vector(4) float> [(const float *)_301 + 240B]
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ldr	q3, [sp, 512]	//, MEM <vector(4) float> [(float *)&acc + 240B]
	fmla	v3.4s, v4.4s, v21.4s	//,,
	str	q3, [sp, 512]	//, MEM <vector(4) float> [(float *)&acc + 240B]
	.p2align 5,,15
.L309:
	cmp	w27, w25	// niters_vector_mult_vf.826, output_w
	beq	.L413		//,
.L308:
	uxtw	x4, w3	// _220, niters_vector_mult_vf.826
	add	x6, x1, x0	// _233, ivtmp.946, ivtmp.906
	mov	z23.s, s23	//,
	sub	w3, w25, w3	// bnd.839_217, output_w, niters_vector_mult_vf.826
	add	x6, x6, x4	// _235, _233, _220
	whilelo	p7.s, wzr, w3	// max_mask_252,, bnd.839_217
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ld1w	z20.s, p7/z, [x26, x6, lsl 2]	//, max_mask_252,* _47
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	ld1w	z19.s, p7/z, [x19, x4, lsl 2]	//, max_mask_252,
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	add	x0, x0, 1	// ivtmp.906, ivtmp.906,
// src/cpp/cnn_internals.cpp:297:                                 acc[ow] += input_ptr[in_row_offset + ow + kw] * w_val;
	fmad	z23.s, p6/m, z20.s, z19.s	//, tmp480,,
	st1w	z23.s, p7, [x19, x4, lsl 2]	//, max_mask_252,
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	add	x2, x2, 4	// ivtmp.911, ivtmp.911,
	cmp	w20, w0	// kernel_w, ivtmp.906
	bgt	.L312		//,
.L310:
// src/cpp/cnn_internals.cpp:287:                     for (int kh = 0; kh < kernel_h; ++kh) {
	add	w12, w12, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:287:                     for (int kh = 0; kh < kernel_h; ++kh) {
	add	x1, x1, x14	// ivtmp.946, ivtmp.946, _327
	add	w15, w15, w20	// ivtmp.948, ivtmp.948, kernel_w
	add	x13, x13, x5	// ivtmp.950, ivtmp.950, _310
	add	x10, x10, x22	// ivtmp.951, ivtmp.951, _102
	cmp	w21, w12	// kernel_h, kh
	bne	.L298		//,
	ldr	w9, [sp, 260]	//, %sfp
	mov	x0, x17	// _465, _465
	mov	w4, w16	// ivtmp.973, ivtmp.973
	ldp	x17, x2, [sp, 240]	// ivtmp.962, ivtmp.964,
	ldr	x3, [sp, 264]	// _256, %sfp
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	add	w9, w9, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	add	x2, x2, x0	// ivtmp.964, ivtmp.964, _465
	ldr	w8, [sp, 256]	//, %sfp
	add	x17, x17, x3	// ivtmp.962, ivtmp.962, _256
	cmp	w8, w9	// in_channels, ic
	bgt	.L296		//,
	ldr	w10, [sp, 232]	//, %sfp
	mov	w15, w8	// in_channels, in_channels
	mov	x3, x11	// _516, _516
	mov	x8, x18	// ivtmp.977, ivtmp.977
.L281:
	str	x3, [sp, 248]	// _516, %sfp
// src/cpp/cnn_internals.cpp:304:                     out_ptr[out_row + ow] = acc[ow];
	mov	x1, x19	//, tmp459
	ldr	x3, [sp, 160]	// _53, %sfp
	stp	w15, w10, [sp, 120]	// in_channels, input_w,
	ldr	x2, [sp, 176]	//, %sfp
	str	w4, [sp, 128]	// ivtmp.973, %sfp
	ldr	w0, [sp, 132]	//, %sfp
	add	x0, x3, w0, sxtw 2	//, _53, ivtmp.972,
	stp	x5, x8, [sp, 232]	// _310, ivtmp.977,
	bl	memcpy		//
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	ldp	w4, w0, [sp, 128]	//,,
	ldp	x5, x8, [sp, 232]	// _310, ivtmp.977,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	w1, [sp, 144]	//, %sfp
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w0, w0, w25	// ivtmp.972, ivtmp.972, output_w
	ldp	w15, w10, [sp, 120]	//,,
	str	w0, [sp, 132]	// ivtmp.972, %sfp
	ldr	w0, [sp, 148]	//, %sfp
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w1, w1, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	ldr	x3, [sp, 248]	// _516, %sfp
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	str	w1, [sp, 144]	// oh, %sfp
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w4, w4, w10	// ivtmp.973, ivtmp.973, input_w
	cmp	w0, w1	// output_h, oh
	bne	.L315		//,
	ldr	d15, [sp, 96]	//,
	.cfi_restore 79
	mov	x7, x0	//,
	mov	x18, x22	// _102, _102
	mov	x0, x8	// ivtmp.977, ivtmp.977
	mov	x22, x5	// _310, _310
	ldr	x11, [sp, 152]	// ivtmp.986, %sfp
	mov	x5, x3	// _516, _516
	ldr	x12, [sp, 184]	// _51, %sfp
	ldr	x6, [sp, 200]	// _190, %sfp
	ldr	x13, [sp, 224]	// _250, %sfp
	ldp	w16, w2, [sp, 192]	//,,
	ldp	w8, w9, [sp, 208]	//,,
	ldp	w3, w14, [sp, 216]	//,,
.L291:
// src/cpp/cnn_internals.cpp:275:         for (int oc = 0; oc < out_channels; ++oc) {
	add	x0, x0, 4	// ivtmp.977, ivtmp.977,
	add	w9, w9, w2	// ivtmp.981, ivtmp.981, out_size
	ldr	x1, [sp, 136]	// ivtmp.980, %sfp
	add	x1, x1, x5	// ivtmp.980, ivtmp.980, _516
	str	x1, [sp, 136]	// ivtmp.980, %sfp
	cmp	x6, x0	// _190, ivtmp.977
	bne	.L275		//,
	mov	w19, w21	// kernel_h, kernel_h
	mov	w21, w8	// b, b
	mov	x1, x13	// _250, _250
	mov	x0, x22	// _310, _310
// src/cpp/cnn_internals.cpp:271:     for (int b = 0; b < input_batches; ++b) {
	add	w21, w21, 1	// b, b,
	mov	w22, w3	// ivtmp.985, ivtmp.985
	mov	w3, w14	// _246, _246
	mov	x13, x18	// _102, _102
	mov	w4, w15	// in_channels, in_channels
	mov	w18, w20	// kernel_w, kernel_w
	mov	w8, w16	// input_batches, input_batches
	mov	x20, x12	// _51, _51
	mov	x14, x0	// _310, _310
// src/cpp/cnn_internals.cpp:271:     for (int b = 0; b < input_batches; ++b) {
	add	w22, w22, w3	// ivtmp.985, ivtmp.985, _246
	add	x11, x11, x1	// ivtmp.986, ivtmp.986, _250
	cmp	w16, w21	// input_batches, b
	bne	.L317		//,
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
.L272:
// src/cpp/cnn_internals.cpp:309: }
	ldp	x29, x30, [sp]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	add	sp, sp, 528	//,,
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L412:
	.cfi_def_cfa_offset 528
	.cfi_offset 19, -512
	.cfi_offset 20, -504
	.cfi_offset 21, -496
	.cfi_offset 22, -488
	.cfi_offset 23, -480
	.cfi_offset 24, -472
	.cfi_offset 25, -464
	.cfi_offset 26, -456
	.cfi_offset 27, -448
	.cfi_offset 28, -440
	.cfi_offset 29, -528
	.cfi_offset 30, -520
	.cfi_offset 79, -432
	add	x0, x4, 2	// ivtmp.928, ivtmp.928,
	add	x8, x8, 8	// ivtmp.935, ivtmp.935,
	cmp	x0, x23	// ivtmp.928, _560
	beq	.L414		//,
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	ldr	s24, [x9, x0, lsl 2]	// w_val, MEM[(const float *)_556 + ivtmp.928_345 * 4]
	mov	x4, x0	// ivtmp.928, ivtmp.928
	b	.L304		//
.L321:
	mov	x2, x4	// ivtmp.928, ivtmp.928
	mov	w0, 0	// niters_vector_mult_vf.852,
	b	.L303		//
.L413:
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	add	x0, x0, 1	// ivtmp.906, ivtmp.906,
	cmp	w20, w0	// kernel_w, ivtmp.906
	ble	.L310		//,
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	ldr	s23, [x8, x0, lsl 2]	//, MEM[(const float *)_322 + ivtmp.906_23 * 4]
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	add	x2, x2, 4	// ivtmp.911, ivtmp.911,
	b	.L311		//
.L323:
// src/cpp/cnn_internals.cpp:294:                             float w_val = weight_ptr[w_idx];
	mov	w3, 0	// niters_vector_mult_vf.826,
	b	.L308		//
.L414:
// src/cpp/cnn_internals.cpp:292:                         for (int kw = 0; kw < kernel_w; ++kw) {
	ldp	w21, w20, [sp, 124]	//,,
	mov	w2, w4	// kw, ivtmp.928
	b	.L302		//
.L320:
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	mov	w0, 8	// tmp.893,
	b	.L282		//
.L318:
	.cfi_restore 79
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	mov	w1, 0	// oh,
.L277:
// src/cpp/cnn_internals.cpp:283:                 for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w15, 0	// in_channels,
	bgt	.L300		//,
	b	.L415		//
.L292:
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w1, w1, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	cmp	w7, w1	// output_h, oh
	beq	.L291		//,
.L300:
	cmp	w21, 0	// kernel_h,
	ble	.L291		//,
.L299:
	cmp	w20, 0	// kernel_w,
	bgt	.L292		//,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w1, w1, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	cmp	w7, w1	// output_h, oh
	bne	.L299		//,
	b	.L291		//
.L415:
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	add	w1, w1, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:280:             for (int oh = 0; oh < output_h; ++oh) {
	cmp	w7, w1	// output_h, oh
	bne	.L277		//,
	b	.L291		//
.L411:
	.cfi_offset 79, -432
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	mov	w1, 1	// ow,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	str	s15, [sp, 272]	// b_val, acc[0]
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	mov	w0, 0	// tmp.893,
// src/cpp/cnn_internals.cpp:281:                 for (int ow = 0; ow < output_w; ++ow) acc[ow] = b_val;
	cmp	w25, w1	// output_w,
	bne	.L279		//,
	b	.L284		//
	.cfi_endproc
.LFE1532:
	.size	_Z26conv2d_forward_specializedRK6TensorS1_S1_RS_, .-_Z26conv2d_forward_specializedRK6TensorS1_S1_RS_
	.align	2
	.p2align 5,,15
	.global	_Z12relu_forwardR6Tensor
	.type	_Z12relu_forwardR6Tensor, %function
_Z12relu_forwardR6Tensor:
.LFB1548:
	.cfi_startproc
// src/cpp/cnn_internals.cpp:480:     int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
	ldp	w2, w4, [x0, 24]	// tensor_13(D)->batches, tensor_13(D)->channels,
// src/cpp/cnn_internals.cpp:480:     int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
	ldp	w3, w1, [x0, 32]	// tensor_13(D)->height, tensor_13(D)->width,
// src/cpp/cnn_internals.cpp:480:     int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
	mul	w2, w2, w4	// _3, tensor_13(D)->batches, tensor_13(D)->channels
// src/cpp/cnn_internals.cpp:480:     int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
	mul	w2, w2, w3	// _5, _3, tensor_13(D)->height
// src/cpp/cnn_internals.cpp:480:     int n = tensor.batches * tensor.channels * tensor.height * tensor.width;
	mul	w2, w2, w1	// n, _5, tensor_13(D)->width
// src/cpp/cnn_internals.cpp:481:     for (int i = 0; i < n; ++i)
	cmp	w2, 0	// n,
	ble	.L416		//,
	sub	w1, w2, #1	// _59, n,
	cnth	x3		// tmp143
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	ldr	x6, [x0]	// _16, MEM[(struct vector *)tensor_13(D)].D.33436._M_impl.D.32737._M_start
	sub	w4, w3, #1	// tmp142, tmp143,
	mov	w0, w1	// _59, _59
	mov	w1, 0	// ivtmp_81,
	cmp	w0, w4	// _59, tmp142
	bcc	.L418		//,
	sub	w5, w2, w3	// _80, n, tmp143
	mov	x0, x6	// ivtmp.1014, _16
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	ptrue	p7.b, all	// tmp146
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	mov	z31.s, #0	//
	cntb	x4, all, mul #2	// tmp159
	.p2align 5,,15
.L419:
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	ld1w	z0.s, p7/z, [x0, #1, mul vl]	//, tmp146, MEM <vector([4,4]) float> [(value_type &)_58 + POLY_INT_CST [16, 16]]
	ld1w	z30.s, p7/z, [x0]	//, tmp146, MEM <vector([4,4]) float> [(value_type &)_58]
	fcmlt	p5.s, p7/z, z0.s, #0.0	// mask__21.998, tmp146,
	fcmlt	p6.s, p7/z, z30.s, #0.0	// mask__21.998_72, tmp146,
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	st1w	z31.s, p5, [x0, #1, mul vl]	//, mask__21.998,
// src/cpp/cnn_internals.cpp:481:     for (int i = 0; i < n; ++i)
	add	w1, w1, w3	// ivtmp_81, ivtmp_81, tmp143
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	st1w	z31.s, p6, [x0]	//, mask__21.998_72,* ivtmp.1014
	add	x0, x0, x4	// ivtmp.1014, ivtmp.1014, tmp159
	cmp	w5, w1	// _80, ivtmp_81
	bcs	.L419		//,
	cmp	w2, w1	// n, ivtmp_81
	beq	.L416		//,
.L418:
	sub	w2, w2, w1	// bnd.1002, n, ivtmp_81
	mov	z29.s, #0	//
	whilelo	p7.s, wzr, w2	// max_mask_108,, bnd.1002
	add	x1, x6, w1, uxtw 2	// vectp.1004, _16, ivtmp_81,,
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	ld1w	z27.s, p7/z, [x1]	//, max_mask_108,* vectp.1004
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	fcmlt	p7.s, p7/z, z27.s, z29.s	// vec_mask_and_19, max_mask_108,,
	st1w	z29.s, p7, [x1]	//, vec_mask_and_19,* vectp.1004
	cntw	x0		// tmp167
	whilelo	p7.s, w0, w2	// next_mask_50, tmp167, bnd.1002
	b.none	.L416	//,
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	ld1w	z28.s, p7/z, [x1, #1, mul vl]	//, next_mask_50,
// src/cpp/cnn_internals.cpp:482:         if (tensor.data[i] < 0.0f) tensor.data[i] = 0.0f;
	fcmlt	p7.s, p7/z, z28.s, z29.s	// vec_mask_and_103, next_mask_50,,
	st1w	z29.s, p7, [x1, #1, mul vl]	//, vec_mask_and_103,
.L416:
// src/cpp/cnn_internals.cpp:483: }
	ret	
	.cfi_endproc
.LFE1548:
	.size	_Z12relu_forwardR6Tensor, .-_Z12relu_forwardR6Tensor
	.align	2
	.p2align 5,,15
	.global	_Z14linear_forwardRK6TensorS1_S1_RS_
	.type	_Z14linear_forwardRK6TensorS1_S1_RS_, %function
_Z14linear_forwardRK6TensorS1_S1_RS_:
.LFB1549:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	//,,,
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	//,
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 19, -48
	.cfi_offset 20, -40
// src/cpp/cnn_internals.cpp:490:     for (int b = 0; b < input.batches; ++b) {
	ldr	w20, [x0, 24]	//, input_24(D)->batches
// src/cpp/cnn_internals.cpp:487:     int out_features = weight.height;
	ldr	w10, [x1, 32]	//, weight_21(D)->height
// src/cpp/cnn_internals.cpp:490:     for (int b = 0; b < input.batches; ++b) {
	cmp	w20, 0	// _47,
	ble	.L424		//,
	cmp	w10, 0	// out_features,
	ble	.L424		//,
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 22, -24
	.cfi_offset 21, -32
	mov	x19, x1	// weight, tmp236
	mov	x21, x0	// input, tmp235
	ptrue	p6.b, all	// tmp224
	ubfiz	x10, x10, 2, 32	// _181, out_features,,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	mov	w18, 0	// ivtmp.1094,
	mov	x22, 0	// ivtmp.1093,
// src/cpp/cnn_internals.cpp:493:             for (int in_f = 0; in_f < in_features; ++in_f)
	cntw	x5		// tmp222
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -8
	.cfi_offset 23, -16
// src/cpp/cnn_internals.cpp:490:     for (int b = 0; b < input.batches; ++b) {
	mov	w30, 0	// b,
	mov	w17, 64	// tmp226,
// src/cpp/cnn_internals.cpp:486:     int in_features  = weight.width;
	ldr	w6, [x1, 36]	//, weight_21(D)->width
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	ldr	x12, [x2]	// _30, MEM[(const struct vector *)bias_26(D)].D.33436._M_impl.D.32737._M_start
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	ldr	x23, [x3]	// _43, MEM[(struct vector *)output_29(D)].D.33436._M_impl.D.32737._M_start
	sub	w15, w6, #1	// _49, in_features,
	lsr	w16, w6, 4	// bnd.1028_18, in_features,
	and	w9, w6, -16	// niters_vector_mult_vf.1029, in_features,
	.p2align 5,,15
.L426:
	sxtw	x13, w18	// _122, ivtmp.1094
	sbfiz	x14, x18, 2, 32	// _123, ivtmp.1094,,
// src/cpp/cnn_internals.cpp:485: void linear_forward(const Tensor& input, const Tensor& weight, const Tensor& bias, Tensor& output) {
	mov	x3, 0	// ivtmp.1088,
	mov	w4, 0	// ivtmp.1087,
	add	x11, x23, x22	// _39, _43, ivtmp.1093
.L434:
// src/cpp/cnn_internals.cpp:492:             float val = bias.data[out_f];
	ldr	s31, [x12, x3]	//, MEM[(const value_type &)_30 + ivtmp.1088_5 * 1]
// src/cpp/cnn_internals.cpp:493:             for (int in_f = 0; in_f < in_features; ++in_f)
	cmp	w6, 0	// in_features,
	bgt	.L441		//,
// src/cpp/cnn_internals.cpp:495:             output.data[b * out_features + out_f] = val;
	str	s31, [x11, x3]	//, MEM[(value_type &)_39 + ivtmp.1088_5 * 1]
// src/cpp/cnn_internals.cpp:491:         for (int out_f = 0; out_f < out_features; ++out_f) {
	add	x3, x3, 4	// ivtmp.1088, ivtmp.1088,
	add	w4, w4, w6	// ivtmp.1087, ivtmp.1087, in_features
	cmp	x3, x10	// ivtmp.1088, _181
	bne	.L434		//,
	.p2align 5,,15
.L432:
// src/cpp/cnn_internals.cpp:490:     for (int b = 0; b < input.batches; ++b) {
	add	w30, w30, 1	// b, b,
// src/cpp/cnn_internals.cpp:490:     for (int b = 0; b < input.batches; ++b) {
	add	x22, x22, x10	// ivtmp.1093, ivtmp.1093, _181
	add	w18, w18, w6	// ivtmp.1094, ivtmp.1094, in_features
	cmp	w30, w20	// b, _47
	bne	.L426		//,
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
.L424:
// src/cpp/cnn_internals.cpp:498: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x29, x30, [sp], 64	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L441:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	ldr	x7, [x19]	// _27, MEM[(const struct vector *)weight_21(D)].D.33436._M_impl.D.32737._M_start
	ldr	x8, [x21]	// _40, MEM[(const struct vector *)input_24(D)].D.33436._M_impl.D.32737._M_start
	cmp	w15, 14	// _49,
	bls	.L435		//,
	.p2align 5,,15
.L442:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	movi	v30.4s, 0	//
	add	x0, x8, x14	// ivtmp.1075, _40, _123
	add	x1, x7, w4, uxtw 2	// ivtmp.1078, _27, ivtmp.1087,,
	umaddl	x2, w16, w17, x0	// _76, bnd.1028_18, tmp226, ivtmp.1075
	mov	v1.16b, v30.16b	//,
	mov	v28.16b, v30.16b	//,
	mov	v0.16b, v30.16b	//,
	.p2align 5,,15
.L429:
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	ldp	q23, q22, [x1, 16]	//,,
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	ldp	q25, q24, [x0, 32]	//,,
	ldp	q20, q26, [x0], 64	//,, ivtmp.1075,
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	ldr	q21, [x1, 48]	//, MEM <const vector(4) float> [(const value_type &)_70 + 48]
	ldr	q2, [x1], 64	//, MEM <const vector(4) float> [(const value_type &)_70]
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	fmla	v1.4s, v25.4s, v22.4s	//,,
	fmla	v28.4s, v26.4s, v23.4s	//,,
	fmla	v30.4s, v24.4s, v21.4s	//,,
	fmla	v0.4s, v20.4s, v2.4s	//,,
	cmp	x0, x2	// ivtmp.1075, _76
	bne	.L429		//,
	mov	w1, w9	// niters_vector_mult_vf.1029, niters_vector_mult_vf.1029
	fadd	v1.4s, v1.4s, v30.4s	//,,
	fadd	v0.4s, v0.4s, v28.4s	//,,
	fadd	v0.4s, v1.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	faddp	v0.4s, v0.4s, v0.4s	//,,
	fadd	s31, s31, s0	//,,
	cmp	w9, w6	// niters_vector_mult_vf.1029, in_features
	beq	.L430		//,
.L428:
	uxtw	x2, w1	// _172, niters_vector_mult_vf.1029
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	mov	x0, 0	// ivtmp_192,
	mov	z19.s, #0	//
	add	x24, x13, x2	// _173, _122, _172
	add	w2, w4, w2	// _182, ivtmp.1087, _172
	add	x24, x8, x24, lsl 2	// vectp.1051, _40, _173,
	sub	w1, w6, w1	// bnd.1048, in_features, niters_vector_mult_vf.1029
	whilelo	p7.s, wzr, w1	// loop_mask_177,, bnd.1048
	add	x2, x7, x2, lsl 2	// vectp.1054, _27, _182,
.L431:
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	ld1w	z29.s, p7/z, [x24, x0, lsl 2]	//, loop_mask_177,* vectp.1051
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	ld1w	z27.s, p7/z, [x2, x0, lsl 2]	//, loop_mask_177,* vectp.1054
// src/cpp/cnn_internals.cpp:493:             for (int in_f = 0; in_f < in_features; ++in_f)
	add	x0, x0, x5	// ivtmp_192, ivtmp_192, tmp222
// src/cpp/cnn_internals.cpp:494:                 val += input.data[b * in_features + in_f] * weight.data[out_f * in_features + in_f];
	fmla	z19.s, p7/m, z29.s, z27.s	//, loop_mask_177,,
	whilelo	p7.s, w0, w1	// loop_mask_177, ivtmp_192, bnd.1048
	b.any	.L431	//,
	faddv	s19, p6, z19.s	//, tmp224,
	fadd	s31, s31, s19	//,,
.L430:
// src/cpp/cnn_internals.cpp:495:             output.data[b * out_features + out_f] = val;
	str	s31, [x11, x3]	//, MEM[(value_type &)_9 + ivtmp.1088_68 * 1]
// src/cpp/cnn_internals.cpp:491:         for (int out_f = 0; out_f < out_features; ++out_f) {
	add	x3, x3, 4	// ivtmp.1088, ivtmp.1088,
	add	w4, w4, w6	// ivtmp.1087, ivtmp.1087, in_features
	cmp	x3, x10	// ivtmp.1088, _181
	beq	.L432		//,
// src/cpp/cnn_internals.cpp:492:             float val = bias.data[out_f];
	ldr	s31, [x12, x3]	//, MEM[(const value_type &)_30 + ivtmp.1088_13 * 1]
	cmp	w15, 14	// _49,
	bhi	.L442		//,
.L435:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	mov	w1, 0	// niters_vector_mult_vf.1029,
	b	.L428		//
	.cfi_endproc
.LFE1549:
	.size	_Z14linear_forwardRK6TensorS1_S1_RS_, .-_Z14linear_forwardRK6TensorS1_S1_RS_
	.align	2
	.p2align 5,,15
	.global	_Z17maxpool2d_forwardRK6TensorRS_ii
	.type	_Z17maxpool2d_forwardRK6TensorRS_ii, %function
_Z17maxpool2d_forwardRK6TensorRS_ii:
.LFB1550:
	.cfi_startproc
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	ldr	w6, [x0, 24]	//, input_44(D)->batches
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	cmp	w6, 0	// _73,
	ble	.L472		//,
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	ldr	w17, [x0, 28]	//, input_44(D)->channels
	mov	x7, x0	// input, tmp204
	cmp	w17, 0	// _76,
	ble	.L472		//,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	ldr	w16, [x1, 32]	//, output_46(D)->height
	mov	w14, w2	// pool_size, tmp206
	mov	x5, x1	// output, tmp205
	mov	w2, w3	// stride, tmp207
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	mov	w11, 0	// b,
.L446:
	cmp	w16, 0	// _79,
	bgt	.L475		//,
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	add	w11, w11, 1	// b, b,
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	cmp	w11, w6	// b, _73
	bne	.L446		//,
.L472:
	ret	
.L475:
// src/cpp/cnn_internals.cpp:522:                     output.data[out_idx] = max_val;
	mov	w0, 27432	// tmp208,
// src/cpp/cnn_internals.cpp:500: void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride) {
	stp	x29, x30, [sp, -112]!	//,,,
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp	//,
// src/cpp/cnn_internals.cpp:522:                     output.data[out_idx] = max_val;
	movk	w0, 0xce6e, lsl 16	// tmp208,,
	mov	w4, w6	// _73, _73
	fmov	s29, w0	// tmp200, tmp208
// src/cpp/cnn_internals.cpp:500: void maxpool2d_forward(const Tensor& input, Tensor& output, int pool_size, int stride) {
	stp	x19, x20, [sp, 16]	//,,
	stp	x21, x22, [sp, 32]	//,,
	ldr	w15, [x5, 36]	//, output_46(D)->width
// src/cpp/cnn_internals.cpp:520:                                   c * (output.height * output.width) +
	mul	w12, w16, w15	// _86, _79, _82
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	sxtw	x21, w15	// _67, _82
.L461:
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	mov	w19, 0	// c,
.L463:
	cmp	w15, 0	// _82,
	bgt	.L476		//,
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	add	w19, w19, 1	// c, c,
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	cmp	w19, w17	// c, _76
	bne	.L463		//,
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	add	w11, w11, 1	// b, b,
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	cmp	w4, w11	// _73, b
	bne	.L461		//,
.L478:
// src/cpp/cnn_internals.cpp:527: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x29, x30, [sp], 112	//,,,
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L476:
	.cfi_restore_state
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -56
	.cfi_offset 23, -64
// src/cpp/cnn_internals.cpp:520:                                   c * (output.height * output.width) +
	mul	w22, w19, w12	// _80, c, _86
// src/cpp/cnn_internals.cpp:519:                     int out_idx = b * (output.channels * output.height * output.width) +
	mov	w10, w4	// _73, _73
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -40
	.cfi_offset 25, -48
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -24
	.cfi_offset 27, -32
	ldr	w0, [x5, 28]	//, output_46(D)->channels
	ldr	x6, [x5]	// _68, MEM[(struct vector *)output_46(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:519:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w0, w16, w0	// _16, _79, output_46(D)->channels
// src/cpp/cnn_internals.cpp:519:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w0, w0, w15	// _17, _16, _82
// src/cpp/cnn_internals.cpp:519:                     int out_idx = b * (output.channels * output.height * output.width) +
	mul	w8, w0, w11	// _18, _17, b
.L458:
// src/cpp/cnn_internals.cpp:519:                     int out_idx = b * (output.channels * output.height * output.width) +
	add	w24, w8, w22	// _21, _18, _80
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	mov	w20, w14	// ivtmp.1128, pool_size
	mov	w9, 0	// ivtmp.1129,
	mov	w4, 0	// ivtmp.1127,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	mov	w30, 0	// oh,
.L460:
// src/cpp/cnn_internals.cpp:520:                                   c * (output.height * output.width) +
	add	w0, w4, w24	// _23, ivtmp.1127, _21
	add	x3, x21, w0, sxtw	// _62, _67, _23
	add	x3, x6, x3, lsl 2	// _127, _68, _62,
	mov	w18, w14	// ivtmp.1122, pool_size
	add	x0, x6, w0, sxtw 2	// ivtmp.1120, _68, _23,
	mov	w23, 0	// ivtmp.1123,
.L455:
// src/cpp/cnn_internals.cpp:507:                     for (int ph = 0; ph < pool_size; ++ph) {
	cmp	w14, 0	// pool_size,
	bgt	.L477		//,
// src/cpp/cnn_internals.cpp:505:                 for (int ow = 0; ow < output.width; ++ow) {
	add	w18, w18, w2	// ivtmp.1122, ivtmp.1122, stride
	add	w23, w23, w2	// ivtmp.1123, ivtmp.1123, stride
// src/cpp/cnn_internals.cpp:522:                     output.data[out_idx] = max_val;
	str	s29, [x0], 4	// tmp200, MEM[(value_type &)_153]
// src/cpp/cnn_internals.cpp:505:                 for (int ow = 0; ow < output.width; ++ow) {
	cmp	x3, x0	// _127, ivtmp.1120
	bne	.L455		//,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	add	w30, w30, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	add	w4, w4, w15	// ivtmp.1127, ivtmp.1127, _82
	add	w20, w20, w2	// ivtmp.1128, ivtmp.1128, stride
	add	w9, w9, w2	// ivtmp.1129, ivtmp.1129, stride
	cmp	w30, w16	// oh, _79
	bne	.L460		//,
.L456:
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	add	w19, w19, 1	// c, c,
// src/cpp/cnn_internals.cpp:503:         for (int c = 0; c < input.channels; ++c) {
	cmp	w19, w17	// c, _76
	beq	.L469		//,
// src/cpp/cnn_internals.cpp:520:                                   c * (output.height * output.width) +
	mul	w22, w19, w12	// _80, c, _86
	b	.L458		//
.L477:
	ldr	w22, [x7, 32]	//, input_44(D)->height
// src/cpp/cnn_internals.cpp:512:                                 int in_idx = b * (input.channels * input.height * input.width) +
	mov	x1, x0	// ivtmp.1120, ivtmp.1120
	mul	w25, w17, w22	// _27, _76, _3
	.p2align 5,,15
.L453:
	mov	w13, 27432	// tmp209,
	mov	w0, w9	// ivtmp.1116, ivtmp.1129
	movk	w13, 0xce6e, lsl 16	// tmp209,,
	mov	w28, w9	// ivtmp.1129, ivtmp.1129
	fmov	s31, w13	// prephitmp_74, tmp209
	.p2align 5,,15
.L448:
	cmp	w22, w0	// _3, ivtmp.1116
	ble	.L452		//,
	ldr	w26, [x7, 36]	//, MEM[(int *)input_44(D) + 36B]
// src/cpp/cnn_internals.cpp:513:                                              c * (input.height * input.width) +
	mov	w9, w23	// ivtmp.1112, ivtmp.1123
	str	x1, [sp, 104]	// ivtmp.1120, %sfp
// src/cpp/cnn_internals.cpp:512:                                 int in_idx = b * (input.channels * input.height * input.width) +
	mul	w27, w25, w26	// _51, _27, input__width_lsm0.1105
// src/cpp/cnn_internals.cpp:513:                                              c * (input.height * input.width) +
	mul	w13, w22, w26	// _55, _3, input__width_lsm0.1105
// src/cpp/cnn_internals.cpp:512:                                 int in_idx = b * (input.channels * input.height * input.width) +
	mul	w27, w27, w11	// _110, _51, b
// src/cpp/cnn_internals.cpp:512:                                 int in_idx = b * (input.channels * input.height * input.width) +
	madd	w13, w13, w19, w27	// _70, _55, c, _110
	mov	w27, w0	// ivtmp.1116, ivtmp.1116
// src/cpp/cnn_internals.cpp:513:                                              c * (input.height * input.width) +
	madd	w13, w0, w26, w13	// _85, ivtmp.1116, input__width_lsm0.1105, _70
	.p2align 5,,15
.L450:
// src/cpp/cnn_internals.cpp:512:                                 int in_idx = b * (input.channels * input.height * input.width) +
	add	w0, w9, w13	// in_idx_84, ivtmp.1112, _85
// src/cpp/cnn_internals.cpp:511:                             if (ih < input.height && iw < input.width) {
	cmp	w9, w26	// ivtmp.1112, input__width_lsm0.1105
	bge	.L449		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	ldr	x1, [x7]	// tmp380, MEM[(const struct vector *)input_44(D)].D.33436._M_impl.D.32737._M_start
	ldr	s30, [x1, w0, sxtw 2]	// MEM[(const float &)_109], MEM[(const float &)_109]
	fmaxnm	s31, s31, s30	// prephitmp_74, prephitmp_74, MEM[(const float &)_109]
.L449:
// src/cpp/cnn_internals.cpp:508:                         for (int pw = 0; pw < pool_size; ++pw) {
	add	w9, w9, 1	// ivtmp.1112, ivtmp.1112,
	cmp	w18, w9	// ivtmp.1122, ivtmp.1112
	bne	.L450		//,
	ldr	x1, [sp, 104]	// ivtmp.1120, %sfp
	mov	w0, w27	// ivtmp.1116, ivtmp.1116
.L452:
// src/cpp/cnn_internals.cpp:507:                     for (int ph = 0; ph < pool_size; ++ph) {
	add	w0, w0, 1	// ivtmp.1116, ivtmp.1116,
	cmp	w0, w20	// ivtmp.1116, ivtmp.1128
	bne	.L448		//,
// src/cpp/cnn_internals.cpp:505:                 for (int ow = 0; ow < output.width; ++ow) {
	mov	w9, w28	// ivtmp.1129, ivtmp.1129
	add	w18, w18, w2	// ivtmp.1122, ivtmp.1122, stride
// src/cpp/cnn_internals.cpp:522:                     output.data[out_idx] = max_val;
	str	s31, [x1], 4	// prephitmp_74, MEM[(value_type &)_64]
// src/cpp/cnn_internals.cpp:505:                 for (int ow = 0; ow < output.width; ++ow) {
	add	w23, w23, w2	// ivtmp.1123, ivtmp.1123, stride
	cmp	x1, x3	// ivtmp.1120, _127
	bne	.L453		//,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	add	w30, w30, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:504:             for (int oh = 0; oh < output.height; ++oh) {
	add	w4, w4, w15	// ivtmp.1127, ivtmp.1127, _82
	add	w20, w20, w2	// ivtmp.1128, ivtmp.1128, stride
	add	w9, w9, w2	// ivtmp.1129, ivtmp.1129, stride
	cmp	w30, w16	// oh, _79
	bne	.L460		//,
	b	.L456		//
.L469:
	mov	w4, w10	// _73, _73
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	add	w11, w11, 1	// b, b,
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
// src/cpp/cnn_internals.cpp:502:     for (int b = 0; b < input.batches; ++b) {
	cmp	w4, w11	// _73, b
	bne	.L461		//,
	b	.L478		//
	.cfi_endproc
.LFE1550:
	.size	_Z17maxpool2d_forwardRK6TensorRS_ii, .-_Z17maxpool2d_forwardRK6TensorRS_ii
	.align	2
	.p2align 5,,15
	.global	_Z26adaptive_avgpool2d_forwardRK6TensorRS_
	.type	_Z26adaptive_avgpool2d_forwardRK6TensorRS_, %function
_Z26adaptive_avgpool2d_forwardRK6TensorRS_:
.LFB1551:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	//,,,
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	//,
	mov	x18, x0	// input, tmp230
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 19, -32
	.cfi_offset 20, -24
// src/cpp/cnn_internals.cpp:532:     for (int b = 0; b < input.batches; ++b) {
	ldr	w19, [x0, 24]	//, input_23(D)->batches
// src/cpp/cnn_internals.cpp:530:     int spatial_size = input.height * input.width;
	ldp	w6, w0, [x0, 32]	// input_23(D)->height, input_23(D)->width,
	mul	w6, w6, w0	// spatial_size, input_23(D)->height, input_23(D)->width
// src/cpp/cnn_internals.cpp:532:     for (int b = 0; b < input.batches; ++b) {
	cmp	w19, 0	// _39,
	ble	.L479		//,
// src/cpp/cnn_internals.cpp:537:             output.data[b * input.channels + c] = sum / spatial_size;
	scvtf	s5, w6	//, spatial_size
// src/cpp/cnn_internals.cpp:533:         for (int c = 0; c < input.channels; ++c) {
	ldr	w17, [x18, 28]	//, input_23(D)->channels
	fmov	s30, 1.0e+0	//,
// src/cpp/cnn_internals.cpp:536:                 sum += input.data[b * (input.channels * spatial_size) + c * spatial_size + i];
	mul	w20, w17, w6	// _42, _43, spatial_size
	fdiv	s30, s30, s5	//,,
	cmp	w17, 0	// _43,
	ble	.L479		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1131: 	return *(this->_M_impl._M_start + __n);
	ldr	x30, [x1]	// _35, MEM[(struct vector *)output_26(D)].D.33436._M_impl.D.32737._M_start
	ubfiz	x17, x17, 2, 32	// _68, _43,,
	sub	w11, w6, #1	// _20, spatial_size,
	ptrue	p6.b, all	// tmp219
	mov	w16, 0	// ivtmp.1193,
	mov	x14, 0	// ivtmp.1190,
	str	x21, [sp, 32]	//,
	.cfi_offset 21, -16
// src/cpp/cnn_internals.cpp:535:             for (int i = 0; i < spatial_size; ++i)
	cntw	x3		// tmp217
	lsr	w13, w6, 4	// bnd.1143_17, spatial_size,
// src/cpp/cnn_internals.cpp:532:     for (int b = 0; b < input.batches; ++b) {
	mov	w15, 0	// b,
	mov	w12, 64	// tmp221,
	and	w9, w6, -16	// niters_vector_mult_vf.1144, spatial_size,
	add	x21, x30, x17	// _113, _35, _68
	.p2align 5,,15
.L482:
	add	x4, x30, x14	// ivtmp.1184, _35, ivtmp.1190
	add	x10, x21, x14	// _64, _113, ivtmp.1190
// src/cpp/cnn_internals.cpp:534:             float sum = 0.0f;
	mov	w5, 0	// ivtmp.1186,
.L490:
// src/cpp/cnn_internals.cpp:535:             for (int i = 0; i < spatial_size; ++i)
	cmp	w6, 0	// spatial_size,
	bgt	.L501		//,
// src/cpp/cnn_internals.cpp:533:         for (int c = 0; c < input.channels; ++c) {
	add	w5, w5, w6	// ivtmp.1186, ivtmp.1186, spatial_size
// src/cpp/cnn_internals.cpp:537:             output.data[b * input.channels + c] = sum / spatial_size;
	str	wzr, [x4], 4	//, MEM[(value_type &)_120]
// src/cpp/cnn_internals.cpp:533:         for (int c = 0; c < input.channels; ++c) {
	cmp	x10, x4	// _64, ivtmp.1184
	bne	.L490		//,
	.p2align 5,,15
.L488:
// src/cpp/cnn_internals.cpp:532:     for (int b = 0; b < input.batches; ++b) {
	add	w15, w15, 1	// b, b,
// src/cpp/cnn_internals.cpp:532:     for (int b = 0; b < input.batches; ++b) {
	add	x14, x14, x17	// ivtmp.1190, ivtmp.1190, _68
	add	w16, w16, w20	// ivtmp.1193, ivtmp.1193, _42
	cmp	w15, w19	// b, _39
	bne	.L482		//,
	ldr	x21, [sp, 32]	//,
	.cfi_restore 21
.L479:
// src/cpp/cnn_internals.cpp:540: }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x29, x30, [sp], 48	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L501:
	.cfi_def_cfa_offset 48
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	.cfi_offset 21, -16
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	ldr	x8, [x18]	// _27, MEM[(const struct vector *)input_23(D)].D.33436._M_impl.D.32737._M_start
	sxtw	x7, w16	// _127, ivtmp.1193
	cmp	w11, 14	// _20,
	bls	.L491		//,
	.p2align 5,,15
.L502:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	movi	v29.4s, 0	//
	sxtw	x2, w5	// _128, ivtmp.1186
	add	x0, x7, x2	// _95, _127, _128
	add	x0, x8, x0, lsl 2	// ivtmp.1177, _27, _95,
	mov	v0.16b, v29.16b	//,
	mov	v27.16b, v29.16b	//,
	mov	v26.16b, v29.16b	//,
	umaddl	x1, w13, w12, x0	// _62, bnd.1143_17, tmp221, ivtmp.1177
	.p2align 5,,15
.L484:
// src/cpp/cnn_internals.cpp:536:                 sum += input.data[b * (input.channels * spatial_size) + c * spatial_size + i];
	ldp	q4, q3, [x0]	//,,* ivtmp.1177
	ldp	q2, q1, [x0, 32]	//,,
	add	x0, x0, 64	// ivtmp.1177, ivtmp.1177,
	fadd	v26.4s, v26.4s, v4.4s	//,,
	fadd	v27.4s, v27.4s, v3.4s	//,,
	fadd	v0.4s, v0.4s, v2.4s	//,,
	fadd	v29.4s, v29.4s, v1.4s	//,,
	cmp	x0, x1	// ivtmp.1177, _62
	bne	.L484		//,
	fadd	v0.4s, v0.4s, v29.4s	//,,
	mov	w1, w9	// niters_vector_mult_vf.1144, niters_vector_mult_vf.1144
	fadd	v26.4s, v26.4s, v27.4s	//,,
	fadd	v26.4s, v0.4s, v26.4s	//,,
	faddp	v26.4s, v26.4s, v26.4s	//,,
	faddp	v26.4s, v26.4s, v26.4s	//,,
	cmp	w9, w6	// niters_vector_mult_vf.1144, spatial_size
	beq	.L485		//,
.L483:
	add	x2, x7, x2	// _129, _127, _128
	add	x2, x2, w1, uxtw	// _131, _129, niters_vector_mult_vf.1144
	add	x2, x8, x2, lsl 2	// vectp.1159, _27, _131,
// src/cpp/cnn_internals.cpp:534:             float sum = 0.0f;
	mov	x0, 0	// ivtmp_141,
	mov	z31.s, #0	//
	sub	w1, w6, w1	// bnd.1156, spatial_size, niters_vector_mult_vf.1144
	whilelo	p7.s, wzr, w1	// loop_mask_135,, bnd.1156
.L486:
// src/cpp/cnn_internals.cpp:536:                 sum += input.data[b * (input.channels * spatial_size) + c * spatial_size + i];
	ld1w	z28.s, p7/z, [x2, x0, lsl 2]	//, loop_mask_135,* vectp.1159
// src/cpp/cnn_internals.cpp:535:             for (int i = 0; i < spatial_size; ++i)
	add	x0, x0, x3	// ivtmp_141, ivtmp_141, tmp217
// src/cpp/cnn_internals.cpp:536:                 sum += input.data[b * (input.channels * spatial_size) + c * spatial_size + i];
	fadd	z31.s, p7/m, z31.s, z28.s	//, loop_mask_135,
	whilelo	p7.s, w0, w1	// loop_mask_135, ivtmp_141, bnd.1156
	b.any	.L486	//,
	faddv	s31, p6, z31.s	//, tmp219,
	fadd	s26, s26, s31	//,,
.L485:
// src/cpp/cnn_internals.cpp:537:             output.data[b * input.channels + c] = sum / spatial_size;
	fmul	s26, s30, s26	//,,
// src/cpp/cnn_internals.cpp:533:         for (int c = 0; c < input.channels; ++c) {
	add	w5, w5, w6	// ivtmp.1186, ivtmp.1186, spatial_size
// src/cpp/cnn_internals.cpp:537:             output.data[b * input.channels + c] = sum / spatial_size;
	str	s26, [x4], 4	//, MEM[(value_type &)_71]
// src/cpp/cnn_internals.cpp:533:         for (int c = 0; c < input.channels; ++c) {
	cmp	x10, x4	// _64, ivtmp.1184
	beq	.L488		//,
	cmp	w11, 14	// _20,
	bhi	.L502		//,
.L491:
// src/cpp/cnn_internals.cpp:534:             float sum = 0.0f;
	movi	v26.2s, #0	//
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1150: 	return *(this->_M_impl._M_start + __n);
	mov	w1, 0	// niters_vector_mult_vf.1144,
	sxtw	x2, w5	// _128, ivtmp.1186
	b	.L483		//
	.cfi_endproc
.LFE1551:
	.size	_Z26adaptive_avgpool2d_forwardRK6TensorRS_, .-_Z26adaptive_avgpool2d_forwardRK6TensorRS_
	.section	.rodata._ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"vector::_M_fill_insert"
	.section	.text._ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf,"axG",@progbits,_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf,comdat
	.align	2
	.p2align 5,,15
	.weak	_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf
	.type	_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf, %function
_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf:
.LFB1615:
	.cfi_startproc
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:703:       if (__n != 0)
	cbz	x2, .L570	// __n,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:700:     vector<_Tp, _Alloc>::
	stp	x29, x30, [sp, -112]!	//,,,
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp	//,
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	mov	x19, x2	// __n, tmp350
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x22, x0	// this, tmp348
	mov	x21, x1	// __position, tmp349
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	mov	x24, x1	// tmp.1212, __position
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:706: 			- this->_M_impl._M_finish) >= __n)
	ldp	x23, x2, [x0, 8]	// _2, this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage,
	sub	x2, x2, x23	// _3, this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:705: 	  if (size_type(this->_M_impl._M_end_of_storage
	cmp	x19, x2, asr 2	// __n, _3,
	bhi	.L506		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_iterator.h:1328:     { return __lhs.base() - __rhs.base(); }
	sub	x20, x23, x1	// _35, _2, __position
	str	d15, [sp, 88]	//,
	.cfi_offset 79, -24
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_iterator.h:1328:     { return __lhs.base() - __rhs.base(); }
	asr	x0, x20, 2	// _33, _35,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:191: 	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
	ldr	s15, [x3]	// _46, MEM[(const type &)__x_32(D)]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:716: 	      if (__elems_after > __n)
	cmp	x19, x0	// __n, _33
	bcs	.L507		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:719: 		  std::__uninitialized_move_a(__old_finish - __n,
	lsl	x20, x19, 2	// _6, __n,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:719: 		  std::__uninitialized_move_a(__old_finish - __n,
	sub	x19, x23, x19, lsl 2	// _8, _2, __n,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x20, 4	// _6,
	ble	.L508		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:452: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	mov	x2, x20	//, _6
	mov	x1, x19	//, _8
	mov	x0, x23	//, _2
	bl	memmove		//
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:723: 		  this->_M_impl._M_finish += __n;
	ldr	x0, [x22, 8]	// prephitmp_126, this_21(D)->D.33436._M_impl.D.32737._M_finish
.L509:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:723: 		  this->_M_impl._M_finish += __n;
	add	x0, x0, x20	// _10, prephitmp_126, _6
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:764: 	  const ptrdiff_t _Num = __last - __first;
	sub	x2, x19, x21	// _114, _8, __position
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:723: 		  this->_M_impl._M_finish += __n;
	str	x0, [x22, 8]	// _10, this_21(D)->D.33436._M_impl.D.32737._M_finish
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:765: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x2, 4	// _114,
	ble	.L512		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:766: 	    __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
	sub	x0, x23, x2	//, _2, _114
	mov	x1, x21	//, __position
	bl	memmove		//
.L513:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:727: 		  std::fill(__position.base(), __position.base() + __n,
	add	x2, x21, x20	// _11, __position, _6
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x21	// _11, __position
	beq	.L590		//,
	sub	x20, x20, #4	// _49, _6,
	lsr	x3, x20, 2	// _135, _49,
	add	x3, x3, 1	// niters.1203, _135,
	cmp	x20, 28	// _49,
	bls	.L515		//,
	lsr	x1, x3, 3	// bnd.1204_31, niters.1203,
	dup	v28.4s, v15.s[0]	//, _46
	mov	x0, x21	// ivtmp.1236, __position
	add	x1, x21, x1, lsl 5	// _82, __position, bnd.1204_31,
	.p2align 5,,15
.L516:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	stp	q28, q28, [x0], 32	//,, ivtmp.1236,
	cmp	x1, x0	// _82, ivtmp.1236
	bne	.L516		//,
	and	x24, x3, -8	// niters_vector_mult_vf.1205_83, niters.1203,
	add	x24, x21, x24, lsl 2	// tmp.1212, __position, niters_vector_mult_vf.1205_83,
	tst	x3, 7	// niters.1203,
	beq	.L590		//,
.L515:
	mov	x0, x24	// __first_48, tmp.1212
	str	s15, [x0], 4	// _46, *__first_70
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_48
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 8	// __first_196, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 4]	// _46, MEM[(float *)__first_70 + 4B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_196
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 12	// __first_144, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 8]	// _46, MEM[(float *)__first_70 + 8B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_144
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 16	// __first_100, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 12]	// _46, MEM[(float *)__first_70 + 12B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_100
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 20	// __first_250, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 16]	// _46, MEM[(float *)__first_70 + 16B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_250
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 24	// __first_254, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 20]	// _46, MEM[(float *)__first_70 + 20B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_254
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 28	// __first_258, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 24]	// _46, MEM[(float *)__first_70 + 24B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x0	// _11, __first_258
	beq	.L590		//,
.L591:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 28]	// _46,
	ldr	d15, [sp, 88]	//,
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:799:     }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 112	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L570:
	ret	
	.p2align 2,,3
.L507:
	.cfi_def_cfa_offset 112
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	.cfi_offset 79, -24
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1146:       if (__n <= 0)
	subs	x1, x19, x0	// _12, __n, _33
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1147: 	return __first;
	mov	x0, x23	// _63, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1146:       if (__n <= 0)
	beq	.L519		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1151:       std::__fill_a(__first, __first + __n, __value);
	add	x2, x23, x1, lsl 2	// _63, _2, _12,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1151:       std::__fill_a(__first, __first + __n, __value);
	lsl	x1, x1, 2	// _59, _12,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1151:       std::__fill_a(__first, __first + __n, __value);
	mov	x0, x2	// _63, _63
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x2	// _2, _63
	beq	.L519		//,
	sub	x0, x1, #4	// _189, _59,
	lsr	x1, x0, 2	// _190, _189,
	add	x1, x1, 1	// niters.1215, _190,
	cmp	x0, 28	// _189,
	bls	.L545		//,
	lsr	x0, x1, 3	// bnd.1216_203, niters.1215,
	dup	v30.4s, v15.s[0]	//, _46
	mov	x3, x23	// ivtmp.1248, _2
	add	x0, x23, x0, lsl 5	// _221, _2, bnd.1216_203,
	.p2align 5,,15
.L521:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	stp	q30, q30, [x3], 32	//,, ivtmp.1248,
	cmp	x3, x0	// ivtmp.1248, _221
	bne	.L521		//,
	and	x0, x1, -8	// niters_vector_mult_vf.1217_204, niters.1215,
	add	x0, x23, x0, lsl 2	// tmp.1218, _2, niters_vector_mult_vf.1217_204,
	tst	x1, 7	// niters.1215,
	beq	.L522		//,
.L520:
	mov	x1, x0	// __first_290, tmp.1218
	str	s15, [x1], 4	// _46, *__first_201
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_290
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 8	// __first_294, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 4]	// _46, MEM[(float *)__first_201 + 4B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_294
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 12	// __first_298, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 8]	// _46, MEM[(float *)__first_201 + 8B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_298
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 16	// __first_302, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 12]	// _46, MEM[(float *)__first_201 + 12B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_302
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 20	// __first_306, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 16]	// _46, MEM[(float *)__first_201 + 16B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_306
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 24	// __first_310, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 20]	// _46, MEM[(float *)__first_201 + 20B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_310
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x0, 28	// __first_314, tmp.1218,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 24]	// _46, MEM[(float *)__first_201 + 24B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x2, x1	// _63, __first_314
	beq	.L522		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x0, 28]	// _46, MEM[(float *)__first_201 + 28B]
.L522:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1152:       return __first + __n;
	mov	x0, x2	// _63, _63
.L519:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:733: 		  this->_M_impl._M_finish =
	str	x0, [x22, 8]	// _63, this_21(D)->D.33436._M_impl.D.32737._M_finish
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x20, 4	// _35,
	ble	.L523		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:452: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	mov	x2, x20	//, _35
	mov	x1, x21	//, __position
	bl	memmove		//
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:742: 		  this->_M_impl._M_finish += __elems_after;
	ldr	x0, [x22, 8]	// _63, this_21(D)->D.33436._M_impl.D.32737._M_finish
.L524:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:742: 		  this->_M_impl._M_finish += __elems_after;
	add	x0, x0, x20	// _14, _63, _35
	str	x0, [x22, 8]	// _14, this_21(D)->D.33436._M_impl.D.32737._M_finish
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x21	// _2, __position
	beq	.L590		//,
	sub	x1, x23, x21	// _195, _2, __position
	mov	x0, x21	// ivtmp.1241, __position
	sub	x1, x1, #4	// _159, _195,
	lsr	x2, x1, 2	// _160, _159,
	add	x2, x2, 1	// niters.1209, _160,
	cmp	x1, 28	// _159,
	bls	.L527		//,
	lsr	x1, x2, 3	// bnd.1210_173, niters.1209,
	dup	v29.4s, v15.s[0]	//, _46
	add	x1, x21, x1, lsl 5	// _299, __position, bnd.1210_173,
	.p2align 5,,15
.L528:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	stp	q29, q29, [x0], 32	//,, ivtmp.1241,
	cmp	x0, x1	// ivtmp.1241, _299
	bne	.L528		//,
	and	x24, x2, -8	// niters_vector_mult_vf.1211_174, niters.1209,
	add	x24, x21, x24, lsl 2	// tmp.1212, __position, niters_vector_mult_vf.1211_174,
	tst	x2, 7	// niters.1209,
	beq	.L590		//,
.L527:
	mov	x0, x24	// __first_262, tmp.1212
	str	s15, [x0], 4	// _46, *__first_171
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_262
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 8	// __first_266, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 4]	// _46, MEM[(float *)__first_171 + 4B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_266
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 12	// __first_270, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 8]	// _46, MEM[(float *)__first_171 + 8B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_270
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 16	// __first_274, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 12]	// _46, MEM[(float *)__first_171 + 12B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_274
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 20	// __first_278, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 16]	// _46, MEM[(float *)__first_171 + 16B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_278
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 24	// __first_282, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 20]	// _46, MEM[(float *)__first_171 + 20B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_282
	beq	.L590		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x0, x24, 28	// __first_286, tmp.1212,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s15, [x24, 24]	// _46, MEM[(float *)__first_171 + 24B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x23, x0	// _2, __first_286
	bne	.L591		//,
.L590:
	ldr	d15, [sp, 88]	//,
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:799:     }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 112	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L506:
	.cfi_def_cfa_offset 112
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -40
	.cfi_offset 25, -48
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1908: 	if (max_size() - size() < __n)
	mov	x1, 2305843009213693951	// tmp305,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:751: 	      pointer __old_start = this->_M_impl._M_start;
	ldr	x26, [x0]	// __old_start, this_21(D)->D.33436._M_impl.D.32737._M_start
	str	x27, [sp, 80]	//,
	.cfi_offset 27, -32
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:993:       { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
	sub	x4, x23, x26	// _127, _2, __old_start
	asr	x4, x4, 2	// _128, _127,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1908: 	if (max_size() - size() < __n)
	sub	x0, x1, x4	// _130, tmp305, _128
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1908: 	if (max_size() - size() < __n)
	cmp	x19, x0	// __n, _130
	bhi	.L592		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:262:       if (__a < __b)
	cmp	x19, x4	// __n, _128
	csel	x0, x19, x4, cs	// _132, __n, _128,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:757: 	      const size_type __elems_before = __pos - __old_start;
	sub	x24, x21, x26	// _23, __position, __old_start
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1912: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	adds	x4, x4, x0	// tmp309, _128, _132
	bcs	.L546		//,
	mov	x20, 0	// _66,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:380: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	mov	x25, 0	// iftmp.18_84,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:380: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	cbnz	x4, .L593	// tmp309,
.L535:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1151:       std::__fill_a(__first, __first + __n, __value);
	lsl	x27, x19, 2	// _77, __n,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:763: 		  std::__uninitialized_fill_n_a(__new_start + __elems_before,
	add	x4, x25, x24	// tmp.1224, iftmp.18_84, _23
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:950:       const _Tp __tmp = __value;
	ldr	s30, [x3]	// __tmp, MEM[(const float &)__x_32(D)]
	sub	x1, x27, #4	// _219, _77,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:1151:       std::__fill_a(__first, __first + __n, __value);
	add	x0, x4, x19, lsl 2	// _78, tmp.1224, __n,
	and	x19, x19, 4611686018427387903	// _248, __n,
	cmp	x1, 28	// _219,
	bls	.L536		//,
	dup	v31.4s, v30.s[0]	//, __tmp
	and	x1, x27, -32	// _319, _77,
	mov	x3, x4	// ivtmp.1255, tmp.1224
	add	x1, x1, x4	// _239, _319, tmp.1224
	.p2align 5,,15
.L537:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	stp	q31, q31, [x3], 32	//,, ivtmp.1255,
	cmp	x1, x3	// _239, ivtmp.1255
	bne	.L537		//,
	and	x1, x19, -8	// niters_vector_mult_vf.1223_234, _248,
	add	x4, x4, x1, lsl 2	// tmp.1224, tmp.1224, niters_vector_mult_vf.1223_234,
	tst	x19, 7	// _248,
	beq	.L538		//,
.L536:
	mov	x1, x4	// __first_318, tmp.1224
	str	s30, [x1], 4	// __tmp, *__first_231
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_318
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 8	// __first_322, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 4]	// __tmp, MEM[(float *)__first_231 + 4B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_322
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 12	// __first_326, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 8]	// __tmp, MEM[(float *)__first_231 + 8B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_326
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 16	// __first_330, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 12]	// __tmp, MEM[(float *)__first_231 + 12B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_330
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 20	// __first_334, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 16]	// __tmp, MEM[(float *)__first_231 + 16B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_334
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 24	// __first_338, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 20]	// __tmp, MEM[(float *)__first_231 + 20B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_338
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	add	x1, x4, 28	// __first_342, tmp.1224,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 24]	// __tmp, MEM[(float *)__first_231 + 24B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	cmp	x0, x1	// _78, __first_342
	beq	.L538		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:952: 	*__first = __tmp;
	str	s30, [x4, 28]	// __tmp, MEM[(float *)__first_231 + 28B]
.L538:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x24, 4	// _23,
	ble	.L539		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:452: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	mov	x2, x24	//, _23
	mov	x1, x26	//, __old_start
	mov	x0, x25	//, iftmp.18_84
	bl	memmove		//
.L540:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:772: 		  __new_finish += __n;
	add	x24, x24, x27	// _27, _23, _77
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:450: 	  const ptrdiff_t _Num = __last - __first;
	sub	x23, x23, x21	// _105, _2, __position
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:772: 		  __new_finish += __n;
	add	x24, x25, x24	// __new_finish, iftmp.18_84, _27
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x23, 4	// _105,
	ble	.L541		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:452: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	mov	x1, x21	//, __position
	mov	x2, x23	//, _105
	mov	x0, x24	//, __new_finish
	bl	memcpy		//
.L542:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:456: 	  return __result + _Num;
	add	x24, x24, x23	// _71, __new_finish, _105
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:388: 	if (__p)
	cbz	x26, .L543	// __old_start,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:793: 			    this->_M_impl._M_end_of_storage - __old_start);
	ldr	x1, [x22, 16]	// this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage, this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	mov	x0, x26	//, __old_start
	sub	x1, x1, x26	//, this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage, __old_start
	bl	_ZdlPvm		//
.L543:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:794: 	      this->_M_impl._M_start = __new_start;
	stp	x25, x24, [x22]	// iftmp.18_84, _71,* this
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:796: 	      this->_M_impl._M_end_of_storage = __new_start + __len;
	ldr	x27, [sp, 80]	//,
	.cfi_remember_state
	.cfi_restore 27
	str	x20, [x22, 16]	// _66, this_21(D)->D.33436._M_impl.D.32737._M_end_of_storage
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:799:     }
	ldp	x19, x20, [sp, 16]	//,,
	ldp	x21, x22, [sp, 32]	//,,
	ldp	x23, x24, [sp, 48]	//,,
	ldp	x29, x30, [sp], 112	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L546:
	.cfi_restore_state
	mov	x20, 9223372036854775804	// prephitmp_44,
.L534:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	mov	x0, x20	//, prephitmp_44
	str	x3, [sp, 104]	// __x, %sfp
	bl	_Znwm		//
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:796: 	      this->_M_impl._M_end_of_storage = __new_start + __len;
	ldr	x3, [sp, 104]	// __x, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	mov	x25, x0	// iftmp.18_84, tmp352
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:796: 	      this->_M_impl._M_end_of_storage = __new_start + __len;
	add	x20, x0, x20	// _66, iftmp.18_84, prephitmp_44
	b	.L535		//
	.p2align 2,,3
.L593:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1912: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	cmp	x4, x1	// tmp309, tmp305
	csel	x4, x4, x1, ls	// _134, tmp309, tmp305,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	lsl	x20, x4, 2	// prephitmp_44, _134,
	b	.L534		//
	.p2align 2,,3
.L512:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_offset 79, -24
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:767: 	  else if (_Num == 1)
	bne	.L513		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	ldr	s31, [x21]	// tmp388, MEM[(type &)__position_76]
	str	s31, [x23, -4]	// tmp388, MEM[(float *)_2 + -4B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	b	.L513		//
	.p2align 2,,3
.L508:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:453: 	  else if (_Num == 1)
	beq	.L510		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:700:     vector<_Tp, _Alloc>::
	mov	x0, x23	// prephitmp_126, _2
	b	.L509		//
	.p2align 2,,3
.L510:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	ldr	s31, [x19]	// tmp387, MEM[(type &)_8]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:700:     vector<_Tp, _Alloc>::
	mov	x0, x23	// prephitmp_126, _2
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	str	s31, [x23]	// tmp387, *_2
	b	.L509		//
	.p2align 2,,3
.L523:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:453: 	  else if (_Num == 1)
	bne	.L524		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	ldr	s31, [x21]	// tmp389, MEM[(type &)__position_76]
	str	s31, [x0]	// tmp389, *_63
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	b	.L524		//
	.p2align 2,,3
.L541:
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	.cfi_offset 27, -32
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:453: 	  else if (_Num == 1)
	bne	.L542		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	ldr	s31, [x21]	// tmp391, MEM[(type &)__position_76]
	str	s31, [x24]	// tmp391, *__new_finish_34
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	b	.L542		//
	.p2align 2,,3
.L539:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:453: 	  else if (_Num == 1)
	bne	.L540		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	ldr	s31, [x26]	// tmp390, MEM[(type &)__old_start_22]
	str	s31, [x25]	// tmp390, *iftmp.18_84
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:438: 	{ *__to = std::move(*__from); }
	b	.L540		//
.L545:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_offset 79, -24
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:951:       for (; __first != __last; ++__first)
	mov	x0, x23	// tmp.1218, _2
	b	.L520		//
.L592:
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	.cfi_offset 27, -32
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1909: 	  __throw_length_error(__N(__s));
	adrp	x0, .LC1	// tmp307,
	str	d15, [sp, 88]	//,
	.cfi_offset 79, -24
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1909: 	  __throw_length_error(__N(__s));
	add	x0, x0, :lo12:.LC1	//, tmp307,
	bl	_ZSt20__throw_length_errorPKc		//
	.cfi_endproc
.LFE1615:
	.size	_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf, .-_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf
	.text
	.align	2
	.p2align 5,,15
	.global	_Z34conv2d_forward_specialized_blockedRK6TensorS1_S1_RS_
	.type	_Z34conv2d_forward_specialized_blockedRK6TensorS1_S1_RS_, %function
_Z34conv2d_forward_specialized_blockedRK6TensorS1_S1_RS_:
.LFB1536:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1536
	sub	sp, sp, #2064	//,,
	.cfi_def_cfa_offset 2064
	stp	x29, x30, [sp]	//,,
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	mov	x29, sp	//,
// src/cpp/cnn_internals.cpp:435:     const int OH = output.height,  OW = output.width;
	ldr	w13, [x3, 36]	//, output_33(D)->width
// src/cpp/cnn_internals.cpp:431: {
	str	x2, [sp, 200]	// tmp4605, %sfp
// src/cpp/cnn_internals.cpp:444:     if (OW > 28) { conv2d_specialized_reference(input, weight, bias, output); return; }
	cmp	w13, 28	// OW,
	bgt	.L1186		//,
	stp	x27, x28, [sp, 80]	//,,
	.cfi_offset 28, -1976
	.cfi_offset 27, -1984
	mov	x27, x0	// input, tmp4603
	stp	x19, x20, [sp, 16]	//,,
	.cfi_offset 20, -2040
	.cfi_offset 19, -2048
	mov	x19, x1	// weight, tmp4604
// src/cpp/cnn_internals.cpp:446:     const int OW_PAD = ((OW + 3) / 4) * 4;
	add	w20, w13, 3	// _1, OW,
// src/cpp/cnn_internals.cpp:446:     const int OW_PAD = ((OW + 3) / 4) * 4;
	negs	w0, w20	// tmp2917, _1
	and	w1, w20, 3	// tmp2918, _1,
	and	w0, w0, 3	// tmp2919, tmp2917,
	csneg	w0, w1, w0, mi	// tmp2916, tmp2918, tmp2919,
	sub	w20, w20, w0	// OW_PAD, _1, tmp2916
	stp	x21, x22, [sp, 32]	//,,
	.cfi_offset 22, -2024
	.cfi_offset 21, -2032
	mov	x21, x3	// output, tmp4606
// src/cpp/cnn_internals.cpp:449:     const std::size_t slack = (std::size_t)(OW_PAD - OW);
	sub	w0, w20, w13	// _10, OW_PAD, OW
// src/cpp/cnn_internals.cpp:449:     const std::size_t slack = (std::size_t)(OW_PAD - OW);
	sxtw	x1, w0	// slack, _10
	stp	x23, x24, [sp, 48]	//,,
	.cfi_offset 24, -2008
	.cfi_offset 23, -2016
	stp	x25, x26, [sp, 64]	//,,
	.cfi_offset 26, -1992
	.cfi_offset 25, -2000
// src/cpp/cnn_internals.cpp:434:     const int IH = input.height,   IW = input.width;
	ldp	w24, w26, [x27, 32]	// IH, IW,
// src/cpp/cnn_internals.cpp:435:     const int OH = output.height,  OW = output.width;
	ldr	w12, [x3, 32]	//, output_33(D)->height
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x28, [x27]	// in_ptr, MEM[(const struct vector *)input_30(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:448:     const std::size_t numel = (std::size_t)input.batches * IC * IH * IW;
	sxtw	x2, w26	// IW, IW
	str	x2, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:432:     const int OC = weight.batches, IC = weight.channels;
	ldp	w2, w3, [x19, 24]	// OC, IC,
	stp	w2, w3, [sp, 164]	// OC, IC,
// src/cpp/cnn_internals.cpp:433:     const int KH = weight.height,  KW = weight.width;
	ldp	w2, w18, [x19, 32]	// KH, KW,
	str	w2, [sp, 176]	// KH, %sfp
// src/cpp/cnn_internals.cpp:452:     if (slack && input.data.size() < numel + slack) {
	cbnz	w0, .L1187	// _10,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	str	xzr, [sp, 1632]	//, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	str	xzr, [sp, 1640]	//, %sfp
.L596:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x1, [x19]	// _63, MEM[(const struct vector *)weight_25(D)].D.33436._M_impl.D.32737._M_start
// src/cpp/cnn_internals.cpp:466:     switch (OW_PAD) {
	sub	w0, w13, #13	// _11831, OW,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1263:       { return _M_data_ptr(this->_M_impl._M_start); }
	ldr	x25, [x21]	// out_b, MEM[(struct vector *)output_33(D)].D.33436._M_impl.D.32737._M_start
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1268:       { return _M_data_ptr(this->_M_impl._M_start); }
	str	x1, [sp, 448]	// _63, %sfp
	ldr	x1, [sp, 200]	// bias, %sfp
	ldr	x1, [x1]	// _62, MEM[(const struct vector *)bias_46(D)].D.33436._M_impl.D.32737._M_start
	str	x1, [sp, 208]	// _62, %sfp
// src/cpp/cnn_internals.cpp:466:     switch (OW_PAD) {
	cmp	w0, 3	// _11831,
	bls	.L604		//,
	cmp	w20, 16	// OW_PAD,
	bgt	.L605		//,
	sub	w0, w13, #5	// _11832, OW,
	cmp	w0, 3	// _11832,
	bls	.L606		//,
	sub	w0, w13, #9	// _12075, OW,
	cmp	w0, 3	// _12075,
	bls	.L607		//,
	sub	w0, w13, #1	// _9777, OW,
	cmp	w0, 3	// _9777,
	bhi	.L609		//,
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w2, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w1, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w0, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w3, w5, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:467:         case 4:  DISPATCH(4,  8)    //  8 accumulator vectors   (conv3: OW=3)
	ldr	w27, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w4, w2, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w8, w3, w0	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w2, w5, w1	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w7, w5, w4	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w27, 0	// _12,
	ble	.L614		//,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x21, w7	// _196, weight_ch_size
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x15, w2	// _9381, in_ch_size
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x2, x21, w7, sxtw 1	// _1818, _196, weight_ch_size,
	str	x2, [sp, 1056]	// _1818, %sfp
	lsl	x10, x21, 2	// _1830, _196,
	cmp	w12, 0	// OH,
	ble	.L614		//,
	sub	w5, w3, #8	// _9437, OC,
	mov	w6, 24	// tmp2962,
	ldr	x11, [sp, 448]	// _63, %sfp
	add	x14, x11, w7, sxtw 4	// _11369, _63, weight_ch_size,
	and	w9, w5, -8	// _8174, _9437,
	cmp	w3, 7	// OC,
	stp	d8, d9, [sp, 96]	//,,
	.cfi_offset 73, -1960
	.cfi_offset 72, -1968
	add	w9, w9, 8	// oc0, _8174,
	ldr	x3, [sp, 208]	// _62, %sfp
	csel	w17, w9, wzr, gt	// oc0, oc0,,
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x1, w1	// _9385, in_size
	smull	x9, w0, w6	// _4964, out_size, tmp2962
	sbfiz	x19, x0, 3, 32	// _4482, out_size,,
	mov	w6, 32	// tmp2956,
	stp	d10, d11, [sp, 112]	//,,
	.cfi_offset 75, -1944
	.cfi_offset 74, -1952
	str	x1, [sp, 1072]	// _9385, %sfp
	lsr	w7, w5, 3	// _2034, _9437,
	sbfiz	x20, x0, 4, 32	// _5031, out_size,,
	add	x26, x11, x21, lsl 3	// _2579, _63, _196,
	mov	x16, x25	// ivtmp.3940, out_b
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	mov	w2, 0	// b,
	stp	d12, d13, [sp, 128]	//,,
	.cfi_offset 77, -1928
	.cfi_offset 76, -1936
	add	x1, x9, 12	// _5628, _4964,
	add	x25, x10, x11	// _9558, _1830, _63
	stp	d14, d15, [sp, 144]	//,,
	.cfi_offset 79, -1912
	.cfi_offset 78, -1920
	add	x5, x3, 32	// _9072, _62,
	smull	x3, w17, w0	// _11308, oc0, out_size
	add	x22, x9, 4	// _2934, _4964,
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	str	xzr, [sp, 896]	//, %sfp
	str	x1, [sp, 1344]	// _5628, %sfp
	add	x1, x19, 12	// _4446, _4482,
	add	x30, x9, 8	// _5631, _4964,
	umaddl	x5, w7, w6, x5	// _4501, _2034, tmp2956, _9072
	lsr	w6, w18, 3	// _10943, KW,
	add	x23, x19, 4	// _4464, _4482,
	str	w4, [sp, 1232]	// weight_size, %sfp
	str	x1, [sp, 1296]	// _4446, %sfp
	add	x1, x20, 8	// _5007, _5031,
	add	x24, x20, 4	// _5022, _5031,
	str	x3, [sp, 1408]	// _11308, %sfp
	sxtw	x3, w17	// ivtmp.3778, oc0
	add	x11, x19, 8	// _4449, _4482,
	str	x1, [sp, 1328]	// _5007, %sfp
	add	x1, x20, 12	// _5004, _5031,
	str	x5, [sp, 1168]	// _4501, %sfp
	lsr	w5, w18, 2	// _11220, KW,
	str	x1, [sp, 1312]	// _5004, %sfp
	lsl	x1, x5, 4	// _11219, _11220,
	mov	w5, w18	// KW, KW
	str	x3, [sp, 1376]	// ivtmp.3778, %sfp
	mul	x3, x21, x3	// ivtmp.3783, _196, ivtmp.3778
	str	x1, [sp, 1088]	// _11219, %sfp
	lsl	x1, x6, 5	// _10942, _10943,
	str	x26, [sp, 1464]	// _2579, %sfp
	str	x1, [sp, 1440]	// _10942, %sfp
	sbfiz	x1, x0, 5, 32	// _2098, out_size,,
	sbfiz	x0, x0, 2, 32	// _7334, out_size,,
	str	x3, [sp, 1392]	// ivtmp.3783, %sfp
	sbfiz	x3, x8, 2, 32	// _10973, out_ch_size,,
	sbfiz	x8, x18, 2, 32	// _11213, KW,,
	str	x0, [sp, 1184]	// _7334, %sfp
	lsl	x0, x21, 3	// _8538, _196,
	str	x1, [sp, 1280]	// _2098, %sfp
	mov	x1, x15	// _9381, _9381
	str	x0, [sp, 1216]	// _8538, %sfp
	sxtw	x0, w18	// _9388, KW
	str	x25, [sp, 1472]	// _9558, %sfp
	str	x0, [sp, 1360]	// _9388, %sfp
	ldr	x0, [sp, 192]	// IW, %sfp
	str	x14, [sp, 1488]	// _11369, %sfp
	lsl	x0, x0, 2	// _2469, IW,
	str	x0, [sp, 1152]	// _2469, %sfp
	sub	w0, w18, #1	// _7730, KW,
	str	w0, [sp, 1200]	// _7730, %sfp
	sxtw	x0, w13	// _12516, OW
	str	x0, [sp, 200]	// _12516, %sfp
	and	w0, w18, -4	// _2661, KW,
	str	w0, [sp, 1104]	// _2661, %sfp
	and	w0, w18, 3	// _9299, KW,
	mov	x18, x28	// in_ptr, in_ptr
	mov	w28, w5	// KW, KW
	str	w0, [sp, 1120]	// _9299, %sfp
	mov	w0, w27	// _12, _12
	mov	x27, x8	// _11213, _11213
.L655:
	ldr	x4, [sp, 896]	// ivtmp.3941, %sfp
	mov	x10, x30	// _5631, _5631
	mov	x30, x18	// in_ptr, in_ptr
	str	w12, [sp, 1248]	// OH, %sfp
	mov	x12, x11	// _4449, _4449
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w15, 0	// oh,
	ldr	x11, [sp, 1328]	// _5007, %sfp
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x14, 0	// ivtmp.3935,
	mov	x5, 0	// ivtmp.3929,
	str	w17, [sp, 1264]	// oc0, %sfp
	mov	x17, x21	// _196, _196
	mov	w21, w28	// KW, KW
	ldr	x26, [sp, 1472]	// _9558, %sfp
	mov	w7, w13	// OW, OW
	add	x4, x18, x4, lsl 2	// _10673, in_ptr, ivtmp.3941,
	mov	x18, x27	// _11213, _11213
	str	w0, [sp, 1496]	// _12, %sfp
	mov	x0, x5	// ivtmp.3929, ivtmp.3929
	ldr	x27, [sp, 448]	// _63, %sfp
	str	w2, [sp, 1504]	// b, %sfp
	mov	w2, w15	// oh, oh
	mov	x15, x14	// ivtmp.3935, ivtmp.3935
	str	x4, [sp, 976]	// _10673, %sfp
	ldr	x4, [sp, 1184]	// _7334, %sfp
	str	x1, [sp, 1512]	// _9381, %sfp
	ldr	x28, [sp, 1488]	// _11369, %sfp
	str	x3, [sp, 1520]	// _10973, %sfp
	add	x4, x4, x16	// _9269, _7334, ivtmp.3940
	mov	x13, x4	// _9269, _9269
.L616:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w1, [sp, 164]	//, %sfp
	cmp	w1, 7	// OC,
	ble	.L654		//,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	ldrsw	x1, [sp, 1232]	// _9386, %sfp
	add	x4, x13, x0, lsl 2	// ivtmp.3914, _9269, ivtmp.3929,
	str	w2, [sp, 1528]	// oh, %sfp
	add	x5, x16, x0, lsl 2	// ivtmp.3921, ivtmp.3940, ivtmp.3929,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x6, [sp, 208]	// ivtmp.3912, %sfp
	str	x30, [sp, 1024]	// in_ptr, %sfp
	mov	x30, x26	// _9558, _9558
	ldr	x8, [sp, 1056]	// ivtmp.3923, %sfp
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	str	x1, [sp, 1424]	// _9386, %sfp
	ldr	x1, [sp, 976]	// _10673, %sfp
	str	x4, [sp, 864]	// ivtmp.3914, %sfp
	ldr	x2, [sp, 1280]	// _2098, %sfp
	str	x5, [sp, 880]	// ivtmp.3921, %sfp
	str	w21, [sp, 1040]	// KW, %sfp
	add	x1, x1, 12	// _9173, _10673,
	str	x0, [sp, 1536]	// ivtmp.3929, %sfp
	str	x1, [sp, 1008]	// _9173, %sfp
.L631:
	ldr	x0, [sp, 1056]	// _1818, %sfp
	sub	x1, x8, x0	// ivtmp.3872, ivtmp.3923, _1818
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	w0, w3, [x6]	// bv, acc$1$0,* ivtmp.3912
	str	w3, [sp, 304]	// acc$1$0, %sfp
	str	w0, [sp, 416]	// bv, %sfp
	ldp	w0, w3, [x6, 8]	// acc$2$0, acc$3$0,
	str	w3, [sp, 272]	// acc$3$0, %sfp
	str	w0, [sp, 288]	// acc$2$0, %sfp
	ldp	w0, w3, [x6, 16]	// acc$4$0, acc$5$0,
	str	w3, [sp, 240]	// acc$5$0, %sfp
	str	w0, [sp, 256]	// acc$4$0, %sfp
	ldp	w0, w3, [x6, 24]	// acc$6$0, acc$7$0,
	str	w0, [sp, 224]	// acc$6$0, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	str	w3, [sp, 216]	// acc$7$0, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	w3, [sp, 528]	// acc$7$0, %sfp
	fmov	s31, w3	// acc$7$0, acc$7$0
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w0, 0	// IC,
	ble	.L1188		//,
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	s31, [sp, 368]	// acc$7$0, %sfp
	add	x5, sp, 1552	//,,
	add	x26, x17, x8	// ivtmp.3880, _196, ivtmp.3923
	str	s31, [sp, 456]	// acc$7$0, %sfp
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	mov	x25, x8	// ivtmp.3878, ivtmp.3923
	mov	x0, x15	// ivtmp.3888, ivtmp.3935
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	wzr, [sp, 1136]	//, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	w7, [sp, 1544]	// OW, %sfp
	add	x7, sp, 1584	//,,
	str	s31, [sp, 384]	// acc$6$0, %sfp
	str	s31, [sp, 464]	// acc$6$0, %sfp
	str	s31, [sp, 624]	// acc$6$0, %sfp
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [sp, 400]	// acc$5$0, %sfp
	str	s31, [sp, 504]	// acc$5$0, %sfp
	str	s31, [sp, 544]	// acc$5$0, %sfp
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [sp, 336]	// acc$4$0, %sfp
	str	s31, [sp, 496]	// acc$4$0, %sfp
	str	s31, [sp, 552]	// acc$4$0, %sfp
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [sp, 352]	// acc$3$0, %sfp
	str	s31, [sp, 472]	// acc$3$0, %sfp
	str	s31, [sp, 560]	// acc$3$0, %sfp
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	str	s31, [sp, 432]	// acc$2$0, %sfp
	str	s31, [sp, 512]	// acc$2$0, %sfp
	str	s31, [sp, 576]	// acc$2$0, %sfp
	ldr	s31, [sp, 304]	// acc$1$0, %sfp
	str	s31, [sp, 320]	// acc$1$0, %sfp
	str	s31, [sp, 480]	// acc$1$0, %sfp
	str	s31, [sp, 592]	// acc$1$0, %sfp
	ldr	s31, [sp, 416]	// bv, %sfp
	str	s31, [sp, 608]	// bv, %sfp
	str	s31, [sp, 640]	// bv, %sfp
	str	s31, [sp, 1456]	// bv, %sfp
	stp	x17, x8, [x5]	// _196, ivtmp.3923,
	add	x8, sp, 1616	//,,
	stp	x2, x22, [x5, 16]	// _2098, _2934,
	stp	x12, x23, [x7]	// _4449, _4464,
	stp	x19, x9, [x7, 16]	// _4482, _4964,
	add	x9, sp, 1664	//,,
	stp	x11, x24, [x8]	// _5007, _5022,
	stp	x20, x15, [x8, 32]	// _5031, ivtmp.3935,
	stp	x10, x6, [x9]	// _5631, ivtmp.3912,
	stp	x13, x16, [x9, 16]	// _9269, ivtmp.3940,
	ldr	x22, [sp, 1464]	// _2579, %sfp
	.p2align 5,,15
.L624:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w2, [sp, 176]	//, %sfp
	cmp	w2, 0	// KH,
	ble	.L617		//,
	ldr	x2, [sp, 976]	// _10673, %sfp
	add	x7, x30, x26, lsl 2	// ivtmp.3843, _9558, ivtmp.3880,
	mov	x21, x0	// ivtmp.3848, ivtmp.3888
	add	x6, x22, x26, lsl 2	// ivtmp.3845, _2579, ivtmp.3880,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	wzr, [sp, 944]	//, %sfp
	add	x12, x27, x1, lsl 2	// ivtmp.3833, _63, ivtmp.3872,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x14, x7	// ivtmp.3856, ivtmp.3843
	add	x11, x30, x1, lsl 2	// ivtmp.3835, _9558, ivtmp.3872,
	mov	x13, x6	// ivtmp.3857, ivtmp.3845
	add	x10, x22, x1, lsl 2	// ivtmp.3837, _2579, ivtmp.3872,
	mov	x20, x12	// ivtmp.3851, ivtmp.3833
	str	x6, [sp, 912]	// ivtmp.3845, %sfp
	add	x4, x2, x0, lsl 2	// ivtmp.3859, _10673, ivtmp.3888,
	ldr	x2, [sp, 1008]	// _9173, %sfp
	mov	x19, x11	// ivtmp.3852, ivtmp.3835
	add	x9, x27, x25, lsl 2	// ivtmp.3839, _63, ivtmp.3878,
	mov	x17, x10	// ivtmp.3853, ivtmp.3837
	add	x8, x28, x1, lsl 2	// ivtmp.3841, _11369, ivtmp.3872,
	mov	x3, x4	// ivtmp.3861, ivtmp.3859
	add	x5, x28, x25, lsl 2	// ivtmp.3847, _11369, ivtmp.3878,
	mov	x16, x9	// ivtmp.3854, ivtmp.3839
	mov	x15, x8	// ivtmp.3855, ivtmp.3841
	add	x24, x2, x0, lsl 2	// ivtmp.3849, _9173, ivtmp.3888,
	mov	x23, x5	// ivtmp.3858, ivtmp.3847
	str	x24, [sp, 928]	// ivtmp.3849, %sfp
	mov	x24, x7	// ivtmp.3843, ivtmp.3843
	.p2align 5,,15
.L623:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w2, [sp, 1040]	//, %sfp
	cmp	w2, 0	// KW,
	ble	.L618		//,
	ldr	w2, [sp, 1200]	//, %sfp
	cmp	w2, 3	// _7730,
	bls	.L898		//,
	movi	v31.4s, 0	// vect_acc_7_3_1417.1901
	add	x6, x3, 4	// vectp.1954, ivtmp.3861,
	mov	x2, 0	// ivtmp.3805,
	str	x0, [sp, 992]	// ivtmp.3888, %sfp
	add	x7, x3, 8	// vectp.1981, ivtmp.3861,
	str	x6, [sp, 960]	// vectp.1954, %sfp
	add	x6, x3, 12	// vectp.2008, ivtmp.3861,
	mov	v19.16b, v31.16b	// vect_acc_7_2_896.1900, vect_acc_7_3_1417.1901
	mov	v27.16b, v31.16b	// vect_acc_7_1_1449.1899, vect_acc_7_3_1417.1901
	str	q31, [sp, 848]	// vect_acc_7_3_1417.1901, %sfp
	mov	v12.16b, v31.16b	// vect_acc_6_3_3263.1897, vect_acc_7_3_1417.1901
	mov	v20.16b, v31.16b	// vect_acc_6_2_1454.1896, vect_acc_7_3_1417.1901
	mov	v28.16b, v31.16b	// vect_acc_6_1_956.1895, vect_acc_7_3_1417.1901
	mov	v13.16b, v31.16b	// vect_acc_5_3_847.1893, vect_acc_7_3_1417.1901
	mov	v21.16b, v31.16b	// vect_acc_5_2_729.1892, vect_acc_7_3_1417.1901
	mov	v29.16b, v31.16b	// vect_acc_5_1_1473.1891, vect_acc_7_3_1417.1901
	mov	v14.16b, v31.16b	// vect_acc_4_3_1464.1889, vect_acc_7_3_1417.1901
	mov	v22.16b, v31.16b	// vect_acc_4_2_3353.1888, vect_acc_7_3_1417.1901
	mov	v30.16b, v31.16b	// vect_acc_4_1_3955.1887, vect_acc_7_3_1417.1901
	mov	v15.16b, v31.16b	// vect_acc_3_3_1487.1885, vect_acc_7_3_1417.1901
	mov	v23.16b, v31.16b	// vect_acc_3_2_1467.1884, vect_acc_7_3_1417.1901
	mov	v16.16b, v31.16b	// vect_acc_2_3_1246.1881, vect_acc_7_3_1417.1901
	mov	v24.16b, v31.16b	// vect_acc_2_2_3419.1880, vect_acc_7_3_1417.1901
	mov	v17.16b, v31.16b	// vect_acc_1_3_1510.1877, vect_acc_7_3_1417.1901
	mov	v25.16b, v31.16b	// vect_acc_1_2_1181.1876, vect_acc_7_3_1417.1901
	mov	v18.16b, v31.16b	// vect_acc_0_3_2945.1873, vect_acc_7_3_1417.1901
	mov	v26.16b, v31.16b	// vect_acc_0_2_1526.1872, vect_acc_7_3_1417.1901
	stp	q31, q31, [sp, 656]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	stp	q31, q31, [sp, 688]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	stp	q31, q31, [sp, 720]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	stp	q31, q31, [sp, 752]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	stp	q31, q31, [sp, 784]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	stp	q31, q31, [sp, 816]	// vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901,
	.p2align 5,,15
.L620:
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q8, [x4, x2]	// MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q0, [x20, x2]	// MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q11, [sp, 832]	// vect_acc_0_0_1102.1870, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q5, [x14, x2]	// MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q31, [sp, 752]	// vect_acc_5_0_709.1890, %sfp
	fmla	v11.4s, v8.4s, v0.4s	// vect_acc_0_0_1102.1870, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q1, [x19, x2]	// MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1]
	ldr	q6, [x13, x2]	// MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v8.4s, v5.4s	// vect_acc_5_0_709.1890, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q2, [x17, x2]	// MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1]
	ldr	q7, [x23, x2]	// MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x0, [sp, 960]	// vectp.1954, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q11, [sp, 832]	// vect_acc_0_0_1102.1870, %sfp
	ldr	q11, [sp, 816]	// vect_acc_1_0_1330.1874, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q3, [x16, x2]	// MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q31, [sp, 752]	// vect_acc_5_0_709.1890, %sfp
	ldr	q31, [sp, 736]	// vect_acc_6_0_1460.1894, %sfp
	fmla	v11.4s, v8.4s, v1.4s	// vect_acc_1_0_1330.1874, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q9, [x0, x2]	// MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q4, [x15, x2]	// MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v8.4s, v6.4s	// vect_acc_6_0_1460.1894, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q10, [x7, x2]	// MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v29.4s, v9.4s, v5.4s	// vect_acc_5_1_1473.1891, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1]
	str	q11, [sp, 816]	// vect_acc_1_0_1330.1874, %sfp
	ldr	q11, [sp, 800]	// vect_acc_2_0_1290.1878, %sfp
	fmla	v26.4s, v10.4s, v0.4s	// vect_acc_0_2_1526.1872, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 736]	// vect_acc_6_0_1460.1894, %sfp
	fmla	v25.4s, v10.4s, v1.4s	// vect_acc_1_2_1181.1876, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1]
	ldr	q31, [sp, 720]	// vect_acc_7_0_912.1898, %sfp
	fmla	v11.4s, v8.4s, v2.4s	// vect_acc_2_0_1290.1878, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1]
	fmla	v24.4s, v10.4s, v2.4s	// vect_acc_2_2_3419.1880, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1]
	fmla	v31.4s, v8.4s, v7.4s	// vect_acc_7_0_912.1898, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1]
	str	q11, [sp, 800]	// vect_acc_2_0_1290.1878, %sfp
	fmla	v23.4s, v10.4s, v3.4s	// vect_acc_3_2_1467.1884, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1]
	ldr	q11, [sp, 784]	// vect_acc_3_0_1499.1882, %sfp
	fmla	v22.4s, v10.4s, v4.4s	// vect_acc_4_2_3353.1888, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 720]	// vect_acc_7_0_912.1898, %sfp
	fmla	v21.4s, v10.4s, v5.4s	// vect_acc_5_2_729.1892, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1]
	ldr	q31, [sp, 704]	// vect_acc_0_1_995.1871, %sfp
	fmla	v11.4s, v8.4s, v3.4s	// vect_acc_3_0_1499.1882, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1]
	fmla	v20.4s, v10.4s, v6.4s	// vect_acc_6_2_1454.1896, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1]
	fmla	v31.4s, v9.4s, v0.4s	// vect_acc_0_1_995.1871, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1]
	str	q11, [sp, 784]	// vect_acc_3_0_1499.1882, %sfp
	fmla	v19.4s, v10.4s, v7.4s	// vect_acc_7_2_896.1900, MEM <const vector(4) float> [(const float *)vectp.1981_7490 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1]
	ldr	q11, [sp, 768]	// vect_acc_4_0_1113.1886, %sfp
	fmla	v30.4s, v9.4s, v4.4s	// vect_acc_4_1_3955.1887, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 704]	// vect_acc_0_1_995.1871, %sfp
	fmla	v28.4s, v9.4s, v6.4s	// vect_acc_6_1_956.1895, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1]
	ldr	q31, [sp, 688]	// vect_acc_1_1_94.1875, %sfp
	fmla	v11.4s, v8.4s, v4.4s	// vect_acc_4_0_1113.1886, MEM <const vector(4) float> [(const float *)vectp.1927_7585 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1]
	fmla	v27.4s, v9.4s, v7.4s	// vect_acc_7_1_1449.1899, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1]
	fmla	v31.4s, v9.4s, v1.4s	// vect_acc_1_1_94.1875, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1]
	str	q11, [sp, 768]	// vect_acc_4_0_1113.1886, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q11, [x6, x2]	// MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1]
	add	x2, x2, 16	// ivtmp.3805, ivtmp.3805,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q31, [sp, 688]	// vect_acc_1_1_94.1875, %sfp
	ldr	q31, [sp, 672]	// vect_acc_2_1_1504.1879, %sfp
	fmla	v18.4s, v11.4s, v0.4s	// vect_acc_0_3_2945.1873, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1903_7661 + ivtmp.3805_11222 * 1]
	ldr	x0, [sp, 1088]	// _11219, %sfp
	fmla	v17.4s, v11.4s, v1.4s	// vect_acc_1_3_1510.1877, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1906_7654 + ivtmp.3805_11222 * 1]
	fmla	v31.4s, v9.4s, v2.4s	// vect_acc_2_1_1504.1879, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1]
	fmla	v16.4s, v11.4s, v2.4s	// vect_acc_2_3_1246.1881, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1909_7645 + ivtmp.3805_11222 * 1]
	fmla	v15.4s, v11.4s, v3.4s	// vect_acc_3_3_1487.1885, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 672]	// vect_acc_2_1_1504.1879, %sfp
	fmla	v14.4s, v11.4s, v4.4s	// vect_acc_4_3_1464.1889, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1915_7625 + ivtmp.3805_11222 * 1]
	ldr	q31, [sp, 656]	// vect_acc_3_1_1230.1883, %sfp
	fmla	v13.4s, v11.4s, v5.4s	// vect_acc_5_3_847.1893, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1918_7615 + ivtmp.3805_11222 * 1]
	fmla	v12.4s, v11.4s, v6.4s	// vect_acc_6_3_3263.1897, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1921_7605 + ivtmp.3805_11222 * 1]
	fmla	v31.4s, v9.4s, v3.4s	// vect_acc_3_1_1230.1883, MEM <const vector(4) float> [(const float *)vectp.1954_7538 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1912_7635 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 656]	// vect_acc_3_1_1230.1883, %sfp
	ldr	q31, [sp, 848]	// vect_acc_7_3_1417.1901, %sfp
	fmla	v31.4s, v11.4s, v7.4s	// vect_acc_7_3_1417.1901, MEM <const vector(4) float> [(const float *)vectp.2008_7442 + ivtmp.3805_11222 * 1], MEM <const vector(4) float> [(const float *)vectp.1924_7595 + ivtmp.3805_11222 * 1]
	str	q31, [sp, 848]	// vect_acc_7_3_1417.1901, %sfp
	cmp	x0, x2	// _11219, ivtmp.3805
	bne	.L620		//,
	faddp	v30.4s, v30.4s, v30.4s	// tmp3003, vect_acc_4_1_3955.1887, vect_acc_4_1_3955.1887
	ldr	x0, [sp, 992]	// ivtmp.3888, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp2984, vect_acc_7_3_1417.1901, vect_acc_7_3_1417.1901
	ldp	q11, q10, [sp, 656]	// vect_acc_3_1_1230.1883, vect_acc_2_1_1504.1879,
	faddp	v12.4s, v12.4s, v12.4s	// tmp2985, vect_acc_6_3_3263.1897, vect_acc_6_3_3263.1897
	faddp	v13.4s, v13.4s, v13.4s	// tmp2986, vect_acc_5_3_847.1893, vect_acc_5_3_847.1893
	ldr	w2, [sp, 1104]	//, %sfp
	faddp	v14.4s, v14.4s, v14.4s	// tmp2987, vect_acc_4_3_1464.1889, vect_acc_4_3_1464.1889
	faddp	v30.4s, v30.4s, v30.4s	// tmp3003, tmp3003, tmp3003
	faddp	v31.4s, v31.4s, v31.4s	// tmp2984, tmp2984, tmp2984
	faddp	v15.4s, v15.4s, v15.4s	// tmp2988, vect_acc_3_3_1487.1885, vect_acc_3_3_1487.1885
	faddp	v12.4s, v12.4s, v12.4s	// tmp2985, tmp2985, tmp2985
	faddp	v13.4s, v13.4s, v13.4s	// tmp2986, tmp2986, tmp2986
	faddp	v14.4s, v14.4s, v14.4s	// tmp2987, tmp2987, tmp2987
	str	q30, [sp, 656]	// tmp3003, %sfp
	faddp	v16.4s, v16.4s, v16.4s	// tmp2989, vect_acc_2_3_1246.1881, vect_acc_2_3_1246.1881
	ldr	s30, [sp, 528]	// acc$7$3, %sfp
	faddp	v17.4s, v17.4s, v17.4s	// tmp2990, vect_acc_1_3_1510.1877, vect_acc_1_3_1510.1877
	faddp	v15.4s, v15.4s, v15.4s	// tmp2988, tmp2988, tmp2988
	faddp	v18.4s, v18.4s, v18.4s	// tmp2991, vect_acc_0_3_2945.1873, vect_acc_0_3_2945.1873
	faddp	v19.4s, v19.4s, v19.4s	// tmp2992, vect_acc_7_2_896.1900, vect_acc_7_2_896.1900
	faddp	v20.4s, v20.4s, v20.4s	// tmp2993, vect_acc_6_2_1454.1896, vect_acc_6_2_1454.1896
	faddp	v16.4s, v16.4s, v16.4s	// tmp2989, tmp2989, tmp2989
	fadd	s31, s30, s31	// acc$7$3, acc$7$3, tmp2984
	ldp	q9, q8, [sp, 688]	// vect_acc_1_1_94.1875, vect_acc_0_1_995.1871,
	faddp	v17.4s, v17.4s, v17.4s	// tmp2990, tmp2990, tmp2990
	faddp	v18.4s, v18.4s, v18.4s	// tmp2991, tmp2991, tmp2991
	faddp	v19.4s, v19.4s, v19.4s	// tmp2992, tmp2992, tmp2992
	ldp	q7, q6, [sp, 720]	// vect_acc_7_0_912.1898, vect_acc_6_0_1460.1894,
	faddp	v20.4s, v20.4s, v20.4s	// tmp2993, tmp2993, tmp2993
	str	s31, [sp, 528]	// acc$7$3, %sfp
	faddp	v21.4s, v21.4s, v21.4s	// tmp2994, vect_acc_5_2_729.1892, vect_acc_5_2_729.1892
	ldr	s31, [sp, 624]	// acc$6$3, %sfp
	faddp	v22.4s, v22.4s, v22.4s	// tmp2995, vect_acc_4_2_3353.1888, vect_acc_4_2_3353.1888
	faddp	v23.4s, v23.4s, v23.4s	// tmp2996, vect_acc_3_2_1467.1884, vect_acc_3_2_1467.1884
	ldp	q5, q4, [sp, 752]	// vect_acc_5_0_709.1890, vect_acc_4_0_1113.1886,
	faddp	v24.4s, v24.4s, v24.4s	// tmp2997, vect_acc_2_2_3419.1880, vect_acc_2_2_3419.1880
	ldp	q3, q2, [sp, 784]	// vect_acc_3_0_1499.1882, vect_acc_2_0_1290.1878,
	faddp	v21.4s, v21.4s, v21.4s	// tmp2994, tmp2994, tmp2994
	fadd	s31, s31, s12	// acc$6$3, acc$6$3, tmp2985
	ldp	q1, q0, [sp, 816]	// vect_acc_1_0_1330.1874, vect_acc_0_0_1102.1870,
	faddp	v22.4s, v22.4s, v22.4s	// tmp2995, tmp2995, tmp2995
	faddp	v23.4s, v23.4s, v23.4s	// tmp2996, tmp2996, tmp2996
	faddp	v24.4s, v24.4s, v24.4s	// tmp2997, tmp2997, tmp2997
	faddp	v25.4s, v25.4s, v25.4s	// tmp2998, vect_acc_1_2_1181.1876, vect_acc_1_2_1181.1876
	faddp	v26.4s, v26.4s, v26.4s	// tmp2999, vect_acc_0_2_1526.1872, vect_acc_0_2_1526.1872
	str	s31, [sp, 624]	// acc$6$3, %sfp
	faddp	v27.4s, v27.4s, v27.4s	// tmp3000, vect_acc_7_1_1449.1899, vect_acc_7_1_1449.1899
	ldr	s31, [sp, 544]	// acc$5$3, %sfp
	faddp	v28.4s, v28.4s, v28.4s	// tmp3001, vect_acc_6_1_956.1895, vect_acc_6_1_956.1895
	faddp	v29.4s, v29.4s, v29.4s	// tmp3002, vect_acc_5_1_1473.1891, vect_acc_5_1_1473.1891
	faddp	v11.4s, v11.4s, v11.4s	// tmp3004, vect_acc_3_1_1230.1883, vect_acc_3_1_1230.1883
	faddp	v25.4s, v25.4s, v25.4s	// tmp2998, tmp2998, tmp2998
	faddp	v26.4s, v26.4s, v26.4s	// tmp2999, tmp2999, tmp2999
	faddp	v27.4s, v27.4s, v27.4s	// tmp3000, tmp3000, tmp3000
	fadd	s31, s31, s13	// acc$5$3, acc$5$3, tmp2986
	faddp	v28.4s, v28.4s, v28.4s	// tmp3001, tmp3001, tmp3001
	faddp	v29.4s, v29.4s, v29.4s	// tmp3002, tmp3002, tmp3002
	faddp	v11.4s, v11.4s, v11.4s	// tmp3004, tmp3004, tmp3004
	faddp	v10.4s, v10.4s, v10.4s	// tmp3005, vect_acc_2_1_1504.1879, vect_acc_2_1_1504.1879
	faddp	v9.4s, v9.4s, v9.4s	// tmp3006, vect_acc_1_1_94.1875, vect_acc_1_1_94.1875
	str	s31, [sp, 544]	// acc$5$3, %sfp
	faddp	v8.4s, v8.4s, v8.4s	// tmp3007, vect_acc_0_1_995.1871, vect_acc_0_1_995.1871
	ldr	s31, [sp, 552]	// acc$4$3, %sfp
	faddp	v7.4s, v7.4s, v7.4s	// tmp3008, vect_acc_7_0_912.1898, vect_acc_7_0_912.1898
	faddp	v6.4s, v6.4s, v6.4s	// tmp3009, vect_acc_6_0_1460.1894, vect_acc_6_0_1460.1894
	faddp	v5.4s, v5.4s, v5.4s	// tmp3010, vect_acc_5_0_709.1890, vect_acc_5_0_709.1890
	faddp	v10.4s, v10.4s, v10.4s	// tmp3005, tmp3005, tmp3005
	faddp	v9.4s, v9.4s, v9.4s	// tmp3006, tmp3006, tmp3006
	faddp	v8.4s, v8.4s, v8.4s	// tmp3007, tmp3007, tmp3007
	fadd	s31, s31, s14	// acc$4$3, acc$4$3, tmp2987
	faddp	v7.4s, v7.4s, v7.4s	// tmp3008, tmp3008, tmp3008
	faddp	v6.4s, v6.4s, v6.4s	// tmp3009, tmp3009, tmp3009
	faddp	v5.4s, v5.4s, v5.4s	// tmp3010, tmp3010, tmp3010
	faddp	v4.4s, v4.4s, v4.4s	// tmp3011, vect_acc_4_0_1113.1886, vect_acc_4_0_1113.1886
	faddp	v3.4s, v3.4s, v3.4s	// tmp3012, vect_acc_3_0_1499.1882, vect_acc_3_0_1499.1882
	str	s31, [sp, 552]	// acc$4$3, %sfp
	faddp	v2.4s, v2.4s, v2.4s	// tmp3013, vect_acc_2_0_1290.1878, vect_acc_2_0_1290.1878
	ldr	s31, [sp, 560]	// acc$3$3, %sfp
	faddp	v1.4s, v1.4s, v1.4s	// tmp3014, vect_acc_1_0_1330.1874, vect_acc_1_0_1330.1874
	faddp	v0.4s, v0.4s, v0.4s	// tmp3015, vect_acc_0_0_1102.1870, vect_acc_0_0_1102.1870
	faddp	v4.4s, v4.4s, v4.4s	// tmp3011, tmp3011, tmp3011
	faddp	v3.4s, v3.4s, v3.4s	// tmp3012, tmp3012, tmp3012
	faddp	v2.4s, v2.4s, v2.4s	// tmp3013, tmp3013, tmp3013
	fadd	s31, s31, s15	// acc$3$3, acc$3$3, tmp2988
	faddp	v1.4s, v1.4s, v1.4s	// tmp3014, tmp3014, tmp3014
	faddp	v0.4s, v0.4s, v0.4s	// tmp3015, tmp3015, tmp3015
	str	s31, [sp, 560]	// acc$3$3, %sfp
	ldr	s31, [sp, 576]	// acc$2$3, %sfp
	fadd	s31, s31, s16	// acc$2$3, acc$2$3, tmp2989
	str	s31, [sp, 576]	// acc$2$3, %sfp
	ldr	s31, [sp, 592]	// acc$1$3, %sfp
	fadd	s31, s31, s17	// acc$1$3, acc$1$3, tmp2990
	str	s31, [sp, 592]	// acc$1$3, %sfp
	ldr	s31, [sp, 1456]	// acc$0$3, %sfp
	fadd	s31, s31, s18	// acc$0$3, acc$0$3, tmp2991
	str	s31, [sp, 1456]	// acc$0$3, %sfp
	ldr	s31, [sp, 456]	// acc$7$2, %sfp
	fadd	s31, s31, s19	// acc$7$2, acc$7$2, tmp2992
	str	s31, [sp, 456]	// acc$7$2, %sfp
	ldr	s31, [sp, 464]	// acc$6$2, %sfp
	ldr	s30, [sp, 656]	// tmp10261, %sfp
	fadd	s31, s31, s20	// acc$6$2, acc$6$2, tmp2993
	str	s31, [sp, 464]	// acc$6$2, %sfp
	ldr	s31, [sp, 504]	// acc$5$2, %sfp
	fadd	s31, s31, s21	// acc$5$2, acc$5$2, tmp2994
	str	s31, [sp, 504]	// acc$5$2, %sfp
	ldr	s31, [sp, 496]	// acc$4$2, %sfp
	fadd	s31, s31, s22	// acc$4$2, acc$4$2, tmp2995
	str	s31, [sp, 496]	// acc$4$2, %sfp
	ldr	s31, [sp, 472]	// acc$3$2, %sfp
	fadd	s31, s31, s23	// acc$3$2, acc$3$2, tmp2996
	str	s31, [sp, 472]	// acc$3$2, %sfp
	ldr	s31, [sp, 512]	// acc$2$2, %sfp
	fadd	s31, s31, s24	// acc$2$2, acc$2$2, tmp2997
	str	s31, [sp, 512]	// acc$2$2, %sfp
	ldr	s31, [sp, 480]	// acc$1$2, %sfp
	fadd	s31, s31, s25	// acc$1$2, acc$1$2, tmp2998
	str	s31, [sp, 480]	// acc$1$2, %sfp
	ldr	s31, [sp, 640]	// acc$0$2, %sfp
	fadd	s31, s31, s26	// acc$0$2, acc$0$2, tmp2999
	str	s31, [sp, 640]	// acc$0$2, %sfp
	ldr	s31, [sp, 368]	// acc$7$1, %sfp
	fadd	s31, s31, s27	// acc$7$1, acc$7$1, tmp3000
	str	s31, [sp, 368]	// acc$7$1, %sfp
	ldr	s31, [sp, 384]	// acc$6$1, %sfp
	fadd	s31, s31, s28	// acc$6$1, acc$6$1, tmp3001
	str	s31, [sp, 384]	// acc$6$1, %sfp
	ldr	s31, [sp, 400]	// acc$5$1, %sfp
	fadd	s31, s31, s29	// acc$5$1, acc$5$1, tmp3002
	str	s31, [sp, 400]	// acc$5$1, %sfp
	ldr	s31, [sp, 336]	// acc$4$1, %sfp
	fadd	s31, s31, s30	// acc$4$1, acc$4$1, tmp10261
	str	s31, [sp, 336]	// acc$4$1, %sfp
	ldr	s31, [sp, 352]	// acc$3$1, %sfp
	fadd	s31, s31, s11	// acc$3$1, acc$3$1, tmp3004
	str	s31, [sp, 352]	// acc$3$1, %sfp
	ldr	s31, [sp, 432]	// acc$2$1, %sfp
	fadd	s31, s31, s10	// acc$2$1, acc$2$1, tmp3005
	str	s31, [sp, 432]	// acc$2$1, %sfp
	ldr	s31, [sp, 320]	// acc$1$1, %sfp
	fadd	s31, s31, s9	// acc$1$1, acc$1$1, tmp3006
	str	s31, [sp, 320]	// acc$1$1, %sfp
	ldr	s31, [sp, 608]	// acc$0$1, %sfp
	fadd	s31, s31, s8	// acc$0$1, acc$0$1, tmp3007
	str	s31, [sp, 608]	// acc$0$1, %sfp
	ldr	s31, [sp, 216]	// acc$7$0, %sfp
	fadd	s31, s31, s7	// acc$7$0, acc$7$0, tmp3008
	str	s31, [sp, 216]	// acc$7$0, %sfp
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	ldr	w6, [sp, 1120]	//, %sfp
	fadd	s31, s31, s6	// acc$6$0, acc$6$0, tmp3009
	str	s31, [sp, 224]	// acc$6$0, %sfp
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	fadd	s31, s31, s5	// acc$5$0, acc$5$0, tmp3010
	str	s31, [sp, 240]	// acc$5$0, %sfp
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	fadd	s31, s31, s4	// acc$4$0, acc$4$0, tmp3011
	str	s31, [sp, 256]	// acc$4$0, %sfp
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	fadd	s31, s31, s3	// acc$3$0, acc$3$0, tmp3012
	str	s31, [sp, 272]	// acc$3$0, %sfp
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	fadd	s31, s31, s2	// acc$2$0, acc$2$0, tmp3013
	str	s31, [sp, 288]	// acc$2$0, %sfp
	ldr	s31, [sp, 304]	// acc$1$0, %sfp
	fadd	s31, s31, s1	// acc$1$0, acc$1$0, tmp3014
	str	s31, [sp, 304]	// acc$1$0, %sfp
	ldr	s31, [sp, 416]	// bv, %sfp
	fadd	s31, s31, s0	// bv, bv, tmp3015
	str	s31, [sp, 416]	// bv, %sfp
	cbz	w6, .L618	// _9299,
.L619:
	ldr	x6, [sp, 896]	// ivtmp.3941, %sfp
	sxtw	x2, w2	// ivtmp.3787, _2661
	ldr	x7, [sp, 1024]	// in_ptr, %sfp
	str	x2, [sp, 656]	// ivtmp.3787, %sfp
	add	x6, x21, x6	// _9779, ivtmp.3848, ivtmp.3941
	add	x6, x6, x2	// _2214, _9779, ivtmp.3787
	add	x2, x7, x6, lsl 2	// _4145, in_ptr, _2214,
	ldr	s28, [x7, x6, lsl 2]	// D__lsm0.3645, *_4145
	add	x6, x2, 4	// tmp10259, _4145,
	ldr	x2, [sp, 656]	// ivtmp.3787, %sfp
	ldp	s30, s31, [x6]	// D__lsm1.3646, D__lsm2.3647,
.L622:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s26, [x12, x2, lsl 2]	// _7896, MEM[(const float *)_11261 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	s25, [sp, 416]	// bv, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x6, [sp, 928]	// ivtmp.3849, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s27, [x11, x2, lsl 2]	// _7889, MEM[(const float *)_11259 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s25, s28, s26, s25	// bv, D__lsm0.3645, _7896, bv
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s22, [x10, x2, lsl 2]	// _7881, MEM[(const float *)_11256 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s29, [x6, x2, lsl 2]	// xv, MEM[(const float *)_11224 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	s21, [sp, 512]	// acc$2$2, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x6, [sp, 912]	// ivtmp.3845, %sfp
	ldr	s23, [x9, x2, lsl 2]	// _7877, MEM[(const float *)_11254 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s25, [sp, 416]	// bv, %sfp
	fmadd	s21, s31, s22, s21	// acc$2$2, D__lsm2.3647, _7881, acc$2$2
	ldr	s25, [sp, 608]	// acc$0$1, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s24, [x8, x2, lsl 2]	// _7873, MEM[(const float *)_11244 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s25, s30, s26, s25	// acc$0$1, D__lsm1.3646, _7896, acc$0$1
	str	s25, [sp, 608]	// acc$0$1, %sfp
	ldr	s25, [sp, 640]	// acc$0$2, %sfp
	fmadd	s25, s31, s26, s25	// acc$0$2, D__lsm2.3647, _7896, acc$0$2
	str	s25, [sp, 640]	// acc$0$2, %sfp
	ldr	s25, [sp, 1456]	// acc$0$3, %sfp
	fmadd	s26, s29, s26, s25	// acc$0$3, xv, _7896, acc$0$3
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s25, [x24, x2, lsl 2]	// _7869, MEM[(const float *)_11241 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s26, [sp, 1456]	// acc$0$3, %sfp
	ldr	s26, [sp, 304]	// acc$1$0, %sfp
	fmadd	s26, s28, s27, s26	// acc$1$0, D__lsm0.3645, _7889, acc$1$0
	str	s26, [sp, 304]	// acc$1$0, %sfp
	ldr	s26, [sp, 320]	// acc$1$1, %sfp
	fmadd	s26, s30, s27, s26	// acc$1$1, D__lsm1.3646, _7889, acc$1$1
	str	s26, [sp, 320]	// acc$1$1, %sfp
	ldr	s26, [sp, 480]	// acc$1$2, %sfp
	fmadd	s26, s31, s27, s26	// acc$1$2, D__lsm2.3647, _7889, acc$1$2
	str	s26, [sp, 480]	// acc$1$2, %sfp
	ldr	s26, [sp, 592]	// acc$1$3, %sfp
	fmadd	s27, s29, s27, s26	// acc$1$3, xv, _7889, acc$1$3
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s26, [x6, x2, lsl 2]	// _7865, MEM[(const float *)_11239 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s27, [sp, 592]	// acc$1$3, %sfp
	ldr	s27, [sp, 288]	// acc$2$0, %sfp
	fmadd	s27, s28, s22, s27	// acc$2$0, D__lsm0.3645, _7881, acc$2$0
	str	s27, [sp, 288]	// acc$2$0, %sfp
	ldr	s27, [sp, 432]	// acc$2$1, %sfp
	fmadd	s27, s30, s22, s27	// acc$2$1, D__lsm1.3646, _7881, acc$2$1
	str	s27, [sp, 432]	// acc$2$1, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s27, [x5, x2, lsl 2]	// _7858, MEM[(const float *)_11236 + ivtmp.3787_11266 * 4]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	x2, x2, 1	// ivtmp.3787, ivtmp.3787,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s21, [sp, 512]	// acc$2$2, %sfp
	ldr	s21, [sp, 576]	// acc$2$3, %sfp
	fmadd	s22, s29, s22, s21	// acc$2$3, xv, _7881, acc$2$3
	str	s22, [sp, 576]	// acc$2$3, %sfp
	ldr	s22, [sp, 272]	// acc$3$0, %sfp
	fmadd	s22, s28, s23, s22	// acc$3$0, D__lsm0.3645, _7877, acc$3$0
	str	s22, [sp, 272]	// acc$3$0, %sfp
	ldr	s22, [sp, 352]	// acc$3$1, %sfp
	fmadd	s22, s30, s23, s22	// acc$3$1, D__lsm1.3646, _7877, acc$3$1
	str	s22, [sp, 352]	// acc$3$1, %sfp
	ldr	s22, [sp, 472]	// acc$3$2, %sfp
	fmadd	s22, s31, s23, s22	// acc$3$2, D__lsm2.3647, _7877, acc$3$2
	str	s22, [sp, 472]	// acc$3$2, %sfp
	ldr	s22, [sp, 560]	// acc$3$3, %sfp
	fmadd	s23, s29, s23, s22	// acc$3$3, xv, _7877, acc$3$3
	str	s23, [sp, 560]	// acc$3$3, %sfp
	ldr	s23, [sp, 256]	// acc$4$0, %sfp
	fmadd	s23, s28, s24, s23	// acc$4$0, D__lsm0.3645, _7873, acc$4$0
	str	s23, [sp, 256]	// acc$4$0, %sfp
	ldr	s23, [sp, 336]	// acc$4$1, %sfp
	fmadd	s23, s30, s24, s23	// acc$4$1, D__lsm1.3646, _7873, acc$4$1
	str	s23, [sp, 336]	// acc$4$1, %sfp
	ldr	s23, [sp, 496]	// acc$4$2, %sfp
	fmadd	s23, s31, s24, s23	// acc$4$2, D__lsm2.3647, _7873, acc$4$2
	str	s23, [sp, 496]	// acc$4$2, %sfp
	ldr	s23, [sp, 552]	// acc$4$3, %sfp
	fmadd	s24, s29, s24, s23	// acc$4$3, xv, _7873, acc$4$3
	str	s24, [sp, 552]	// acc$4$3, %sfp
	ldr	s24, [sp, 240]	// acc$5$0, %sfp
	fmadd	s24, s28, s25, s24	// acc$5$0, D__lsm0.3645, _7869, acc$5$0
	str	s24, [sp, 240]	// acc$5$0, %sfp
	ldr	s24, [sp, 400]	// acc$5$1, %sfp
	fmadd	s24, s30, s25, s24	// acc$5$1, D__lsm1.3646, _7869, acc$5$1
	str	s24, [sp, 400]	// acc$5$1, %sfp
	ldr	s24, [sp, 504]	// acc$5$2, %sfp
	fmadd	s24, s31, s25, s24	// acc$5$2, D__lsm2.3647, _7869, acc$5$2
	str	s24, [sp, 504]	// acc$5$2, %sfp
	ldr	s24, [sp, 544]	// acc$5$3, %sfp
	fmadd	s25, s29, s25, s24	// acc$5$3, xv, _7869, acc$5$3
	str	s25, [sp, 544]	// acc$5$3, %sfp
	ldr	s25, [sp, 224]	// acc$6$0, %sfp
	fmadd	s25, s28, s26, s25	// acc$6$0, D__lsm0.3645, _7865, acc$6$0
	str	s25, [sp, 224]	// acc$6$0, %sfp
	ldr	s25, [sp, 384]	// acc$6$1, %sfp
	fmadd	s25, s30, s26, s25	// acc$6$1, D__lsm1.3646, _7865, acc$6$1
	str	s25, [sp, 384]	// acc$6$1, %sfp
	ldr	s25, [sp, 464]	// acc$6$2, %sfp
	fmadd	s25, s31, s26, s25	// acc$6$2, D__lsm2.3647, _7865, acc$6$2
	str	s25, [sp, 464]	// acc$6$2, %sfp
	ldr	s25, [sp, 624]	// acc$6$3, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w6, [sp, 1040]	//, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s26, s29, s26, s25	// acc$6$3, xv, _7865, acc$6$3
	str	s26, [sp, 624]	// acc$6$3, %sfp
	ldr	s26, [sp, 216]	// acc$7$0, %sfp
	fmadd	s28, s28, s27, s26	// acc$7$0, D__lsm0.3645, _7858, acc$7$0
	str	s28, [sp, 216]	// acc$7$0, %sfp
	ldr	s28, [sp, 368]	// acc$7$1, %sfp
	fmadd	s28, s30, s27, s28	// acc$7$1, D__lsm1.3646, _7858, acc$7$1
	str	s28, [sp, 368]	// acc$7$1, %sfp
	ldr	s28, [sp, 456]	// acc$7$2, %sfp
	fmadd	s28, s31, s27, s28	// acc$7$2, D__lsm2.3647, _7858, acc$7$2
	str	s28, [sp, 456]	// acc$7$2, %sfp
	ldr	s28, [sp, 528]	// acc$7$3, %sfp
	fmadd	s28, s29, s27, s28	// acc$7$3, xv, _7858, acc$7$3
	str	s28, [sp, 528]	// acc$7$3, %sfp
	fmov	s28, s30	// D__lsm0.3645, D__lsm1.3646
	fmov	s30, s31	// D__lsm1.3646, D__lsm2.3647
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w6, w2	// KW, ivtmp.3787
	ble	.L618		//,
	fmov	s31, s29	// D__lsm2.3647, xv
	b	.L622		//
.L1186:
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// src/cpp/cnn_internals.cpp:477: }
	ldp	x29, x30, [sp]	//,,
	add	sp, sp, 2064	//,,
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
// src/cpp/cnn_internals.cpp:444:     if (OW > 28) { conv2d_specialized_reference(input, weight, bias, output); return; }
	b	_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_		//
.L1187:
	.cfi_def_cfa_offset 2064
	.cfi_offset 19, -2048
	.cfi_offset 20, -2040
	.cfi_offset 21, -2032
	.cfi_offset 22, -2024
	.cfi_offset 23, -2016
	.cfi_offset 24, -2008
	.cfi_offset 25, -2000
	.cfi_offset 26, -1992
	.cfi_offset 27, -1984
	.cfi_offset 28, -1976
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
// src/cpp/cnn_internals.cpp:448:     const std::size_t numel = (std::size_t)input.batches * IC * IH * IW;
	ldr	w2, [x27, 24]	//, input_30(D)->batches
	smull	x0, w24, w26	// _9162, IH, IW
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	str	xzr, [sp, 1632]	//, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:993:       { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
	ldr	x25, [x27, 8]	// MEM[(const struct vector *)input_30(D)].D.33436._M_impl.D.32737._M_finish, MEM[(const struct vector *)input_30(D)].D.33436._M_impl.D.32737._M_finish
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	str	xzr, [sp, 1640]	//, %sfp
// src/cpp/cnn_internals.cpp:448:     const std::size_t numel = (std::size_t)input.batches * IC * IH * IW;
	smull	x2, w3, w2	// _9145, IC, input_30(D)->batches
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:993:       { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
	sub	x25, x25, x28	// _44, MEM[(const struct vector *)input_30(D)].D.33436._M_impl.D.32737._M_finish, in_ptr
// src/cpp/cnn_internals.cpp:452:     if (slack && input.data.size() < numel + slack) {
	madd	x22, x2, x0, x1	// _11, _9145, _9162, slack
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:993:       { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
	asr	x23, x25, 2	// _39, _44,
// src/cpp/cnn_internals.cpp:452:     if (slack && input.data.size() < numel + slack) {
	cmp	x22, x23	// _11, _39
	bls	.L596		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:325: 	if (__len > capacity())
	cbz	x25, .L897	// _44,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1919: 	if (__n > _S_max_size(_Tp_alloc_type(__a)))
	mov	x0, 9223372036854775804	// tmp2927,
	cmp	x25, x0	// _44, tmp2927
	bhi	.L1189		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	mov	x0, x25	//, _44
	str	w18, [sp, 208]	// KW, %sfp
	str	w12, [sp, 216]	// OH, %sfp
	str	w13, [sp, 224]	// OW, %sfp
.LEHB0:
	bl	_Znwm		//
.LEHE0:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	cmp	x25, 4	// _44,
	ldr	w18, [sp, 208]	//, %sfp
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:151: 	return static_cast<_Tp*>(_GLIBCXX_OPERATOR_NEW(__n * sizeof(_Tp)));
	mov	x3, x0	// _143, tmp4607
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:451: 	  if (__builtin_expect(_Num > 1, true))
	ldr	w12, [sp, 216]	//, %sfp
	ldr	w13, [sp, 224]	//, %sfp
	beq	.L1190		//,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:452: 	    __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
	mov	x1, x28	//, in_ptr
	mov	x2, x25	//, _44
	str	w18, [sp, 208]	// KW, %sfp
	str	w12, [sp, 216]	// OH, %sfp
	str	w13, [sp, 224]	// OW, %sfp
	str	x0, [sp, 240]	// _143, %sfp
	bl	memcpy		//
	ldr	x3, [sp, 240]	// _143, %sfp
	ldr	w18, [sp, 208]	//, %sfp
	ldr	w12, [sp, 216]	//, %sfp
	ldr	w13, [sp, 224]	//, %sfp
.L603:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/vector.tcc:339: 	    this->_M_impl._M_finish = this->_M_impl._M_start + __len;
	add	x1, x3, x25	// padded$_M_finish, _143, _44
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1037: 	  _M_fill_insert(end(), __new_size - size(), __x);
	sub	x22, x22, x23	// _11, _11, _39
.L597:
	mov	x2, x22	//, _11
	add	x0, sp, 1808	//,,
	str	x3, [sp, 1808]	// _143, MEM <float *> [(struct vector *)&padded]
	add	x3, sp, 1840	//,,
	str	w18, [sp, 208]	// KW, %sfp
	str	w12, [sp, 216]	// OH, %sfp
	str	w13, [sp, 224]	// OW, %sfp
	str	x1, [sp, 1816]	// padded$_M_finish, MEM <float *> [(struct vector *)&padded + 8B]
	str	x1, [sp, 1824]	// padded$_M_finish, MEM <float *> [(struct vector *)&padded + 16B]
// src/cpp/cnn_internals.cpp:454:         padded.resize(numel + slack, 0.0f);
	str	wzr, [sp, 1840]	//, MEM[(float *)_520]
.LEHB1:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1037: 	  _M_fill_insert(end(), __new_size - size(), __x);
	bl	_ZNSt6vectorIfSaIfEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPfS1_EEmRKf		//
.LEHE1:
	ldr	x28, [sp, 1808]	// in_ptr, MEM <float *> [(struct vector *)&padded]
	ldr	x0, [sp, 1824]	// padded$_M_end_of_storage, MEM <float *> [(struct vector *)&padded + 16B]
	ldr	w18, [sp, 208]	//, %sfp
	str	x28, [sp, 1632]	// in_ptr, %sfp
	ldr	w12, [sp, 216]	//, %sfp
	str	x0, [sp, 1640]	// padded$_M_end_of_storage, %sfp
	ldr	w13, [sp, 224]	//, %sfp
	b	.L596		//
.L605:
// src/cpp/cnn_internals.cpp:466:     switch (OW_PAD) {
	sub	w0, w13, #21	// _9132, OW,
	cmp	w0, 3	// _9132,
	bls	.L610		//,
	sub	w0, w13, #25	// _12527, OW,
	cmp	w0, 3	// _12527,
	bls	.L611		//,
	sub	w0, w13, #17	// _1806, OW,
	cmp	w0, 3	// _1806,
	bhi	.L609		//,
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w1, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w15, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w4, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w8, w2, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:471:         case 20: DISPATCH(20, 2)    // 10
	ldr	w0, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w1, w1, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w7, w2, w15	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w6, w8, w4	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w2, w2, w1	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w0, 0	// _16,
	ble	.L614		//,
	sub	w3, w18, #3	// _11946, KW,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 20	// OW,
	mov	w5, w3	// _11946, _11946
	sbfiz	x6, x6, 2, 32	// _12072, out_ch_size,,
	mov	w3, 20	// tmp3618,
	csel	w3, w13, w3, le	// _5200, OW, tmp3618,
	sub	w3, w3, #1	// _5209, _5200,
	add	x3, x3, 1	// _5211, _5209,
	cmp	w13, 0	// OW,
	str	x6, [sp, 528]	// _12072, %sfp
	lsl	x3, x3, 2	// _5212, _5211,
	mov	x6, 4	// tmp3622,
	csel	x3, x3, x6, gt	// _5218, _5212, tmp3622,
	str	x3, [sp, 288]	// _5218, %sfp
	ldr	x3, [sp, 208]	// _62, %sfp
	sub	w19, w8, #2	// _12047, OC,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x21, w1	// _7955, weight_size
	str	w5, [sp, 480]	// _11946, %sfp
	lsr	w5, w5, 1	// _11947, _11946,
	sbfiz	x1, x1, 2, 32	// _12012, weight_size,,
	add	w5, w5, 2	// _11949, _11947,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x7, w7	// _7947, in_ch_size
	lsl	x5, x5, 1	// _11950, _11949,
	str	x1, [sp, 336]	// _12012, %sfp
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x1, w18	// _7957, KW
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	str	x7, [sp, 464]	// _7947, %sfp
	mov	x26, x25	// ivtmp.4806, out_b
	sbfiz	x9, x4, 3, 32	// _12032, out_size,,
	add	x3, x3, 8	// _9423, _62,
	str	x5, [sp, 320]	// _11950, %sfp
	lsr	w5, w19, 1	// _12048, _12047,
	add	x6, x3, w5, uxtw 3	// _12053, _9423, _12048,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x3, w2	// _7950, weight_ch_size
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	str	x1, [sp, 304]	// _7957, %sfp
	sbfiz	x1, x18, 2, 32	// _11964, KW,,
	sbfiz	x8, x2, 1, 32	// _12039, weight_ch_size,,
	sbfiz	x10, x2, 2, 32	// _12020, weight_ch_size,,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	str	x3, [sp, 368]	// _7950, %sfp
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	sxtw	x3, w4	// _7951, out_size
	sbfiz	x7, x2, 3, 32	// _12042, weight_ch_size,,
	str	x1, [sp, 504]	// _11964, %sfp
	str	x3, [sp, 472]	// _7951, %sfp
	sbfiz	x3, x4, 2, 32	// _12065, out_size,,
	str	x3, [sp, 400]	// _12065, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	cmp	w12, 0	// OH,
	ble	.L614		//,
	mov	x22, 0	// ivtmp.4807,
	mov	w27, 0	// b,
	str	w0, [sp, 552]	// _16, %sfp
	sxtw	x1, w13	// _12516, OW
	mov	w3, w12	// OH, OH
	str	x22, [sp, 224]	// ivtmp.4807, %sfp
	mov	x24, x25	// out_b, out_b
	mov	x12, x9	// _12032, _12032
	ldr	x22, [sp, 448]	// _63, %sfp
	mov	x9, x8	// _12039, _12039
	mov	w25, w18	// KW, KW
	mov	x8, x7	// _12042, _12042
	mov	w23, w27	// b, b
	str	x1, [sp, 200]	// _12516, %sfp
	mov	w14, w15	// in_size, in_size
	mov	x7, x6	// _12053, _12053
.L824:
	ldr	x0, [sp, 400]	// _12065, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x6, 0	// ivtmp.4801,
	mov	x27, 0	// ivtmp.4800,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w20, 0	// oh,
	add	x0, x26, x0	// _12067, ivtmp.4806, _12065
	str	x0, [sp, 512]	// _12067, %sfp
	ldr	x0, [sp, 224]	// ivtmp.4807, %sfp
	add	x0, x28, x0, lsl 2	// _11996, in_ptr, ivtmp.4807,
	str	x0, [sp, 384]	// _11996, %sfp
.L791:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, 1	// OC,
	ble	.L823		//,
.L822:
	sub	x0, x22, #8	// ivtmp.5003, _63,
	ldr	w11, [sp, 168]	//, %sfp
	and	w4, w19, -2	// _9017, _12047,
	str	w3, [sp, 448]	// OH, %sfp
	mov	w3, w20	// oh, oh
	str	x0, [sp, 560]	// ivtmp.5003, %sfp
	mov	x0, x12	// _12032, _12032
	mov	x12, x26	// ivtmp.4806, ivtmp.4806
	mov	x26, x10	// _12020, _12020
	mov	x10, x6	// ivtmp.4801, ivtmp.4801
	str	w23, [sp, 416]	// b, %sfp
	mov	x6, x0	// _12032, _12032
	str	w19, [sp, 432]	// _12047, %sfp
	str	x24, [sp, 576]	// out_b, %sfp
.L805:
	ldr	x0, [sp, 512]	// _12067, %sfp
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	mov	x23, 0	// ivtmp.4789,
	mov	x18, x12	// ivtmp.4806, ivtmp.4806
	mov	w15, w4	// _9017, _9017
	str	x10, [sp, 352]	// ivtmp.4801, %sfp
	mov	w10, w13	// OW, OW
	ldr	x19, [sp, 208]	// ivtmp.4785, %sfp
	str	w3, [sp, 456]	// oh, %sfp
	ldr	x24, [sp, 560]	// ivtmp.4791, %sfp
	add	x20, x0, x27, lsl 2	// ivtmp.4787, _12067, ivtmp.4800,
	mov	x0, x27	// ivtmp.4800, ivtmp.4800
	mov	w27, w11	// IC, IC
	mov	x11, x0	// ivtmp.4800, ivtmp.4800
.L803:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	s28, s29, [x19]	// bv, bv,* ivtmp.4785
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	add	x12, sp, 1912	//,,
	add	x13, sp, 1992	//,,
	dup	v31.4s, v28.s[0]	//, bv
	dup	v30.4s, v29.s[0]	//, bv
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	stp	s28, s28, [x12, -8]	// bv, bv,
	stp	s28, s28, [x12]	// bv, bv,
	str	q30, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q30, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q30, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q30, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	stp	s29, s29, [x13, -8]	// bv, bv,
	stp	s29, s29, [x13]	// bv, bv,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w27, 0	// IC,
	ble	.L795		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x16, w14	// _7954, in_size
	cmp	w0, 0	// KH,
	ble	.L795		//,
	cmp	w25, 0	// KW,
	ble	.L795		//,
	ldr	x0, [sp, 368]	// _7950, %sfp
	mov	v27.16b, v30.16b	//,
	mov	v26.16b, v31.16b	//,
	mov	x1, x24	// ivtmp.4767, ivtmp.4791
	mov	x3, x23	// ivtmp.4764, ivtmp.4789
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x7, [sp, 656]	// _12053, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v25.16b, v30.16b	//,
	mov	v24.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x30, x24	// ivtmp.4791, ivtmp.4791
	add	x17, x26, 4	// _9440, _12020,
	ldr	q29, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v23.16b, v30.16b	//,
	mov	v22.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w2, 0	// ic,
	mov	x12, x6	// _12032, _12032
	mov	x24, x9	// _12039, _12039
	str	x20, [sp, 624]	// ivtmp.4787, %sfp
	mov	x20, x18	// ivtmp.4806, ivtmp.4806
	ldr	q28, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
	add	x5, x0, x23	// ivtmp.4765, _7950, ivtmp.4789
	str	x23, [sp, 640]	// ivtmp.4789, %sfp
	mov	x23, x8	// _12042, _12042
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	ldr	x4, [sp, 352]	// ivtmp.4766, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w10, [sp, 592]	// OW, %sfp
	ldr	x7, [sp, 504]	// _11964, %sfp
	str	w14, [sp, 608]	// in_size, %sfp
	str	x19, [sp, 1456]	// ivtmp.4785, %sfp
	.p2align 5,,15
.L797:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w19, 0	// kh,
	add	x10, x1, x26	// ivtmp.4752, ivtmp.4767, _12020
	str	x1, [sp, 216]	// ivtmp.4750, %sfp
	add	x9, x17, x1	// ivtmp.4754, _9440, ivtmp.4767
	add	x8, x1, 4	// ivtmp.4755, ivtmp.4767,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x18, x4	// ivtmp.4748, ivtmp.4766
	mov	x14, x5	// ivtmp.4747, ivtmp.4765
	str	w19, [sp, 272]	// kh, %sfp
	mov	x19, x3	// ivtmp.4746, ivtmp.4746
	.p2align 5,,15
.L796:
	ldr	x0, [sp, 384]	// _11996, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x13, 2	// ivtmp.4737,
	add	x0, x0, x18, lsl 2	// ivtmp.4741, _11996, ivtmp.4748,
	cmp	w25, 2	// KW,
	ble	.L1191		//,
	ldr	x6, [sp, 216]	// ivtmp.4750, %sfp
	str	w2, [sp, 240]	// ic, %sfp
	ldr	x2, [sp, 320]	// _11950, %sfp
	str	x1, [sp, 256]	// ivtmp.4767, %sfp
	b	.L800		//
	.p2align 2,,3
.L919:
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	x13, x1	// ivtmp.4737, ivtmp.4737
.L800:
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q17, q2, [x0]	//,,* ivtmp.4741
	add	x1, x13, 2	// ivtmp.4737, ivtmp.4737,
	ldp	q5, q0, [x0, 32]	//,,
	add	x0, x0, 8	// ivtmp.4741, ivtmp.4741,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s21, [x6, x13, lsl 2]	//, MEM[(const float *)_11925 + ivtmp.4737_11913 * 4]
	ldr	s20, [x10, x13, lsl 2]	//, MEM[(const float *)_11931 + ivtmp.4737_11913 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q4, [x0, 56]	//, MEM <const vector(4) float> [(const float *)_11935 + 64B]
	ldr	q16, [x0, -4]	//, MEM <const vector(4) float> [(const float *)_11935 + 4B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v17.4s, v21.s[0]	//,,
	ldr	s18, [x8, x13, lsl 2]	//, MEM[(const float *)_11928 + ivtmp.4737_11913 * 4]
	fmla	v30.4s, v17.4s, v20.s[0]	//,,
	ldr	s19, [x9, x13, lsl 2]	//, MEM[(const float *)_11934 + ivtmp.4737_11913 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q6, [x0, 12]	//, MEM <const vector(4) float> [(const float *)_11935 + 20B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v2.4s, v21.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x0, 28]	//, MEM <const vector(4) float> [(const float *)_11935 + 36B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v23.4s, v2.4s, v20.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q7, [x0, 44]	//, MEM <const vector(4) float> [(const float *)_11935 + 52B]
	ldr	q3, [x0, 60]	//, MEM <const vector(4) float> [(const float *)_11935 + 68B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v24.4s, v5.4s, v21.s[0]	//,,
	fmla	v25.4s, v5.4s, v20.s[0]	//,,
	fmla	v26.4s, v0.4s, v21.s[0]	//,,
	fmla	v27.4s, v0.4s, v20.s[0]	//,,
	fmla	v29.4s, v4.4s, v21.s[0]	//,,
	fmla	v28.4s, v4.4s, v20.s[0]	//,,
	fmla	v31.4s, v16.4s, v18.s[0]	//,,
	fmla	v30.4s, v16.4s, v19.s[0]	//,,
	fmla	v22.4s, v6.4s, v18.s[0]	//,,
	fmla	v23.4s, v6.4s, v19.s[0]	//,,
	fmla	v24.4s, v1.4s, v18.s[0]	//,,
	fmla	v25.4s, v1.4s, v19.s[0]	//,,
	fmla	v26.4s, v7.4s, v18.s[0]	//,,
	fmla	v27.4s, v7.4s, v19.s[0]	//,,
	fmla	v29.4s, v3.4s, v18.s[0]	//,,
	fmla	v28.4s, v3.4s, v19.s[0]	//,,
	cmp	x1, x2	// ivtmp.4737, _11950
	bne	.L919		//,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	x1, [sp, 256]	// ivtmp.4767, %sfp
	str	x6, [sp, 216]	// ivtmp.4750, %sfp
	ldr	w2, [sp, 240]	//, %sfp
.L801:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w13	// _11467, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w13, w13, 1	// kw, kw,
	ldr	x6, [sp, 224]	// ivtmp.4807, %sfp
	str	x0, [sp, 240]	// _11467, %sfp
	str	w13, [sp, 496]	// kw, %sfp
	add	x6, x6, x18	// _9489, ivtmp.4807, ivtmp.4748
	add	x0, x6, x0	// _11478, _9489, _11467
	str	x6, [sp, 256]	// _9489, %sfp
	add	x13, x28, x0, lsl 2	// vectp.3341, in_ptr, _11478,
	lsl	x0, x0, 2	// _11479, _11478,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x6, [sp, 240]	// _11467, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x28, x0]	//, MEM <const vector(4) float> [(const float *)vectp.3341_11480]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x6, x19	// tmp3637, _11467, ivtmp.4746
	str	x6, [sp, 544]	// tmp3637, %sfp
	ldr	x6, [sp, 240]	// _11467, %sfp
	ldr	x0, [sp, 544]	// tmp3637, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q6, q1, [x13, 16]	//,,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x6, x14	// tmp3638, _11467, ivtmp.4747
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q4, [x13, 48]	//,,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s17, [x22, x0, lsl 2]	//, *_11470
	ldr	s16, [x22, x6, lsl 2]	//, *_11474
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w13, [sp, 496]	//, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v2.4s, v17.s[0]	//,,
	fmla	v30.4s, v2.4s, v16.s[0]	//,,
	fmla	v22.4s, v6.4s, v17.s[0]	//,,
	fmla	v23.4s, v6.4s, v16.s[0]	//,,
	fmla	v24.4s, v1.4s, v17.s[0]	//,,
	fmla	v25.4s, v1.4s, v16.s[0]	//,,
	fmla	v26.4s, v0.4s, v17.s[0]	//,,
	fmla	v27.4s, v0.4s, v16.s[0]	//,,
	fmla	v29.4s, v4.4s, v17.s[0]	//,,
	fmla	v28.4s, v4.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w13	// KW, kw
	ble	.L799		//,
	ldr	x6, [sp, 256]	// _9489, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w13	// _9052, kw
	add	x13, x0, x6	// _10380, _9052, _9489
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x0, x19	// tmp3652, _9052, ivtmp.4746
	add	x0, x0, x14	// tmp3653, _9052, ivtmp.4747
	str	x6, [sp, 256]	// tmp3652, %sfp
	add	x6, x28, x13, lsl 2	// vectp.3341, in_ptr, _10380,
	lsl	x13, x13, 2	// _10381, _10380,
	ldr	s7, [x22, x0, lsl 2]	//, *_9065
	str	x6, [sp, 240]	// vectp.3341, %sfp
	ldr	x6, [sp, 256]	// tmp3652, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q3, [x28, x13]	//, MEM <const vector(4) float> [(const float *)vectp.3341_10376]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s5, [x22, x6, lsl 2]	//, *_9059
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x6, [sp, 240]	// vectp.3341, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v3.4s, v7.s[0]	//,,
	fmla	v31.4s, v3.4s, v5.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	add	x0, x6, 16	// tmp9434, vectp.3341,
	ldp	q2, q1, [x0]	//,,
	add	x0, x6, 48	// tmp9438, vectp.3341,
	ldp	q0, q6, [x0]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v2.4s, v5.s[0]	//,,
	fmla	v23.4s, v2.4s, v7.s[0]	//,,
	fmla	v24.4s, v1.4s, v5.s[0]	//,,
	fmla	v25.4s, v1.4s, v7.s[0]	//,,
	fmla	v26.4s, v0.4s, v5.s[0]	//,,
	fmla	v27.4s, v0.4s, v7.s[0]	//,,
	fmla	v29.4s, v6.4s, v5.s[0]	//,,
	fmla	v28.4s, v6.4s, v7.s[0]	//,,
.L799:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x6, [sp, 304]	// _7957, %sfp
	add	x10, x10, x7	// ivtmp.4752, ivtmp.4752, _11964
	add	x9, x9, x7	// ivtmp.4754, ivtmp.4754, _11964
	add	x8, x8, x7	// ivtmp.4755, ivtmp.4755, _11964
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 272]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x19, x19, x6	// ivtmp.4746, ivtmp.4746, _7957
	add	x14, x14, x6	// ivtmp.4747, ivtmp.4747, _7957
	ldr	x6, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w0, w0, 1	// kh, kh,
	str	w0, [sp, 272]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x18, x18, x6	// ivtmp.4748, ivtmp.4748, IW
	ldr	x6, [sp, 216]	// ivtmp.4750, %sfp
	add	x6, x6, x7	// ivtmp.4750, ivtmp.4750, _11964
	str	x6, [sp, 216]	// ivtmp.4750, %sfp
	ldr	w6, [sp, 176]	//, %sfp
	cmp	w6, w0	// KH, kh
	bne	.L796		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 336]	// _12012, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w2, w2, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x3, x3, x21	// ivtmp.4764, ivtmp.4764, _7955
	add	x5, x5, x21	// ivtmp.4765, ivtmp.4765, _7955
	add	x4, x4, x16	// ivtmp.4766, ivtmp.4766, _7954
	add	x1, x1, x0	// ivtmp.4767, ivtmp.4767, _12012
	cmp	w27, w2	// IC, ic
	bne	.L797		//,
	ldr	x7, [sp, 656]	// _12053, %sfp
	mov	x18, x20	// ivtmp.4806, ivtmp.4806
	mov	x8, x23	// _12042, _12042
	mov	x9, x24	// _12039, _12039
	mov	x6, x12	// _12032, _12032
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	ldr	x20, [sp, 624]	// ivtmp.4787, %sfp
	mov	x24, x30	// ivtmp.4791, ivtmp.4791
	str	q22, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	ldr	x23, [sp, 640]	// ivtmp.4789, %sfp
	str	q24, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	ldr	x19, [sp, 1456]	// ivtmp.4785, %sfp
	str	q26, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	ldr	w10, [sp, 592]	//, %sfp
	str	q29, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	ldr	w14, [sp, 608]	//, %sfp
	str	q30, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q23, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q25, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q27, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q28, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
.L795:
	cmp	w10, 0	// OW,
	ble	.L1192		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x0, [sp, 400]	// _12065, %sfp
	add	x1, sp, 1840	//,,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	x19, x19, 8	// ivtmp.4785, ivtmp.4785,
	str	w10, [sp, 216]	// OW, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x2, [sp, 288]	//, %sfp
	str	w14, [sp, 240]	// in_size, %sfp
	str	x18, [sp, 256]	// ivtmp.4806, %sfp
	sub	x0, x20, x0	//, ivtmp.4787, _12065
	str	x6, [sp, 272]	// _12032, %sfp
	str	x9, [sp, 496]	// _12039, %sfp
	str	x8, [sp, 544]	// _12042, %sfp
	str	x7, [sp, 592]	// _12053, %sfp
	str	w15, [sp, 608]	// _9017, %sfp
	str	x11, [sp, 1456]	// ivtmp.4800, %sfp
	bl	memcpy		//
	ldr	x2, [sp, 288]	//, %sfp
	mov	x0, x20	//, ivtmp.4787
	add	x1, sp, 1920	//,,
	bl	memcpy		//
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x6, [sp, 272]	// _12032, %sfp
	ldr	x9, [sp, 496]	// _12039, %sfp
	ldr	x8, [sp, 544]	// _12042, %sfp
	add	x20, x20, x6	// ivtmp.4787, ivtmp.4787, _12032
	ldr	x7, [sp, 592]	// _12053, %sfp
	add	x23, x23, x9	// ivtmp.4789, ivtmp.4789, _12039
	ldr	x18, [sp, 256]	// ivtmp.4806, %sfp
	add	x24, x24, x8	// ivtmp.4791, ivtmp.4791, _12042
	ldr	x11, [sp, 1456]	// ivtmp.4800, %sfp
	ldr	w10, [sp, 216]	//, %sfp
	ldr	w14, [sp, 240]	//, %sfp
	ldr	w15, [sp, 608]	//, %sfp
	cmp	x19, x7	// ivtmp.4785, _12053
	bne	.L803		//,
.L1181:
	mov	x0, x11	// ivtmp.4800, ivtmp.4800
	mov	w11, w27	// IC, IC
	mov	x27, x0	// ivtmp.4800, ivtmp.4800
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	add	w2, w15, 2	// oc0, _9017,
	mov	w13, w10	// OW, OW
	mov	x12, x18	// ivtmp.4806, ivtmp.4806
	ldr	x10, [sp, 352]	// ivtmp.4801, %sfp
	mov	w4, w15	// _9017, _9017
	ldr	w3, [sp, 456]	//, %sfp
	cmp	w0, w2	// OC, oc0
	ble	.L1193		//,
	ldr	x24, [sp, 576]	// out_b, %sfp
	mov	w20, w3	// oh, oh
	mov	x3, x21	// _7955, _7955
	mov	x19, x10	// ivtmp.4801, ivtmp.4801
	mov	w23, w13	// OW, OW
	ldr	w4, [sp, 416]	//, %sfp
	mov	x10, x26	// _12020, _12020
	mov	x5, x18	// ivtmp.4806, ivtmp.4806
	mov	w26, w14	// in_size, in_size
	mov	x12, x6	// _12032, _12032
	ldr	w11, [sp, 432]	//, %sfp
	ldr	w21, [sp, 448]	//, %sfp
.L808:
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	add	x6, sp, 1912	//,,
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	sxtw	x13, w2	// _929, oc0
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x0, [sp, 208]	// _62, %sfp
	ldr	s30, [x0, w2, uxtw 2]	// bv, *_931
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
	dup	v31.4s, v30.s[0]	//, bv
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	stp	s30, s30, [x6, -8]	// bv, bv,
	stp	s30, s30, [x6]	// bv, bv,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w0, 0	// IC,
	ble	.L812		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x1, w26	// _7988, in_size
	cmp	w0, 0	// KH,
	ble	.L812		//,
	cmp	w25, 0	// KW,
	ble	.L812		//,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	ldr	x2, [sp, 368]	// _7950, %sfp
	mov	v29.16b, v31.16b	//,
	mov	v28.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w17, 0	// ic,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	x16, x19	// ivtmp.4729, ivtmp.4801
	mov	v27.16b, v31.16b	//,
	str	x24, [sp, 216]	// out_b, %sfp
	ldr	w0, [sp, 480]	//, %sfp
	ldr	q30, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	mul	x18, x13, x2	// ivtmp.4728, _929, _7950
	and	w0, w0, -2	// _11886, _11946,
	add	w6, w0, 2	// kw, _11886,
.L814:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x24, x16	// ivtmp.4721, ivtmp.4729
	mov	x14, x18	// ivtmp.4720, ivtmp.4728
	str	w21, [sp, 240]	// OH, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w30, 0	// kh,
	str	w23, [sp, 256]	// OW, %sfp
.L813:
	cmp	w25, 2	// KW,
	ble	.L1194		//,
	ldr	x2, [sp, 384]	// _11996, %sfp
	add	x15, x22, x14, lsl 2	// ivtmp.4714, _63, ivtmp.4720,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w21, 0	// kw,
	mov	w0, w6	// kw, kw
	add	x2, x2, x24, lsl 2	// ivtmp.4715, _11996, ivtmp.4721,
	.p2align 5,,15
.L817:
	ld1r	{v26.4s}, [x15]	//, MEM[(const float *)_11872]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w21, w21, 2	// kw, kw,
	add	x15, x15, 8	// ivtmp.4714, ivtmp.4714,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q3, q22, [x2]	//,,* ivtmp.4715
	ldp	q0, q20, [x2, 32]	//,,
	add	x2, x2, 8	// ivtmp.4715, ivtmp.4715,
	ldr	q18, [x2, 56]	//, MEM <const vector(4) float> [(const float *)_11874 + 64B]
	ldr	s25, [x15, -4]	//, MEM[(const float *)_11872 + 4B]
	ldr	q2, [x2, -4]	//, MEM <const vector(4) float> [(const float *)_11874 + 4B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v3.4s, v26.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x2, 12]	//, MEM <const vector(4) float> [(const float *)_11874 + 20B]
	ldr	q21, [x2, 28]	//, MEM <const vector(4) float> [(const float *)_11874 + 36B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v22.4s, v26.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x2, 44]	//, MEM <const vector(4) float> [(const float *)_11874 + 52B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v28.4s, v0.4s, v26.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q17, [x2, 60]	//, MEM <const vector(4) float> [(const float *)_11874 + 68B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v29.4s, v20.4s, v26.4s	//,,
	fmla	v30.4s, v18.4s, v26.4s	//,,
	fmla	v31.4s, v2.4s, v25.s[0]	//,,
	fmla	v27.4s, v1.4s, v25.s[0]	//,,
	fmla	v28.4s, v21.4s, v25.s[0]	//,,
	fmla	v29.4s, v19.4s, v25.s[0]	//,,
	fmla	v30.4s, v17.4s, v25.s[0]	//,,
	cmp	w21, w6	// kw, kw
	bne	.L817		//,
.L818:
	ldr	x2, [sp, 224]	// ivtmp.4807, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x23, w0	// _11423, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w0, w0, 1	// kw, kw,
	add	x2, x2, x24	// _9541, ivtmp.4807, ivtmp.4721
	add	x21, x2, x23	// _11430, _9541, _11423
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x23, x23, x14	// tmp3698, _11423, ivtmp.4720
	add	x15, x28, x21, lsl 2	// vectp.3310, in_ptr, _11430,
	lsl	x21, x21, 2	// _11431, _11430,
	ldr	s23, [x22, x23, lsl 2]	//, *_11426
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q7, q6, [x15, 16]	//,,
	ldp	q5, q4, [x15, 48]	//,,
	ldr	q16, [x28, x21]	//, MEM <const vector(4) float> [(const float *)vectp.3310_11432]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v7.4s, v23.s[0]	//,,
	fmla	v31.4s, v16.4s, v23.s[0]	//,,
	fmla	v28.4s, v6.4s, v23.s[0]	//,,
	fmla	v29.4s, v5.4s, v23.s[0]	//,,
	fmla	v30.4s, v4.4s, v23.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w0	// KW, kw
	ble	.L816		//,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w0	// _9131, kw
	add	x2, x0, x2	// _10307, _9131, _9541
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x0, x0, x14	// tmp3709, _9131, ivtmp.4720
	add	x15, x28, x2, lsl 2	// vectp.3310, in_ptr, _10307,
	lsl	x2, x2, 2	// _10308, _10307,
	ldr	s24, [x22, x0, lsl 2]	//, *_9138
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q2, q1, [x15, 16]	//,,
	ldp	q0, q22, [x15, 48]	//,,
	ldr	q3, [x28, x2]	//, MEM <const vector(4) float> [(const float *)vectp.3310_10303]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v2.4s, v24.s[0]	//,,
	fmla	v31.4s, v3.4s, v24.s[0]	//,,
	fmla	v28.4s, v1.4s, v24.s[0]	//,,
	fmla	v29.4s, v0.4s, v24.s[0]	//,,
	fmla	v30.4s, v22.4s, v24.s[0]	//,,
.L816:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x0, [sp, 304]	// _7957, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w30, w30, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x14, x14, x0	// ivtmp.4720, ivtmp.4720, _7957
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x24, x24, x0	// ivtmp.4721, ivtmp.4721, IW
	ldr	w0, [sp, 176]	//, %sfp
	cmp	w0, w30	// KH, kh
	bne	.L813		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w17, w17, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x18, x18, x3	// ivtmp.4728, ivtmp.4728, _7955
	add	x16, x16, x1	// ivtmp.4729, ivtmp.4729, _7988
	ldr	w21, [sp, 240]	//, %sfp
	ldr	w23, [sp, 256]	//, %sfp
	cmp	w0, w17	// IC, ic
	bne	.L814		//,
	ldr	x24, [sp, 216]	// out_b, %sfp
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q27, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q28, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q29, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q30, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
.L812:
	cmp	w23, 0	// OW,
	ble	.L811		//,
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	ldr	x0, [sp, 472]	// _7951, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	add	x1, sp, 1840	//,,
	str	w4, [sp, 216]	// b, %sfp
	ldr	x2, [sp, 288]	//, %sfp
	str	x5, [sp, 240]	// ivtmp.4806, %sfp
	str	x3, [sp, 256]	// _7955, %sfp
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	madd	x0, x13, x0, x27	// _987, _929, _7951, ivtmp.4800
	str	x10, [sp, 272]	// _12020, %sfp
	str	x9, [sp, 352]	// _12039, %sfp
	str	x8, [sp, 416]	// _12042, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	add	x0, x24, x0, lsl 2	//, out_b, _987,
	str	w11, [sp, 432]	// _12047, %sfp
	stp	x12, x7, [sp, 448]	// _12032, _12053,
	bl	memcpy		//
	ldr	x5, [sp, 240]	// ivtmp.4806, %sfp
	ldp	x12, x7, [sp, 448]	// _12032, _12053,
	ldr	x3, [sp, 256]	// _7955, %sfp
	ldr	x10, [sp, 272]	// _12020, %sfp
	ldr	x9, [sp, 352]	// _12039, %sfp
	ldr	x8, [sp, 416]	// _12042, %sfp
	ldr	w4, [sp, 216]	//, %sfp
	ldr	w11, [sp, 432]	//, %sfp
.L811:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
	add	x27, x27, x0	// ivtmp.4800, ivtmp.4800, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x19, x19, x0	// ivtmp.4801, ivtmp.4801, IW
	cmp	w21, w20	// OH, oh
	beq	.L1195		//,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w2, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	cmp	w0, 1	// OC,
	beq	.L808		//,
	mov	x0, x3	// _7955, _7955
	mov	w13, w23	// OW, OW
	mov	x6, x19	// ivtmp.4801, ivtmp.4801
	mov	w14, w26	// in_size, in_size
	mov	w3, w21	// OH, OH
	mov	w23, w4	// b, b
	mov	x26, x5	// ivtmp.4806, ivtmp.4806
	mov	w19, w11	// _12047, _12047
	mov	x21, x0	// _7955, _7955
	b	.L822		//
.L604:
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w19, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w2, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w3, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w5, w4, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:470:         case 16: DISPATCH(16, 3)    // 12
	ldr	w9, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w1, w19, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w0, w4, w2	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w8, w5, w3	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w7, w4, w1	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w9, 0	// _15,
	ble	.L614		//,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x0, w0	// _8011, in_ch_size
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x14, w7	// _697, weight_ch_size
	cmp	w12, 0	// OH,
	ble	.L614		//,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x17, w1	// _8016, weight_size
	sbfiz	x1, x1, 2, 32	// _8876, weight_size,,
	str	w12, [sp, 1664]	// OH, %sfp
	ptrue	p6.b, all	// tmp4594
	sbfiz	x10, x8, 2, 32	// _11848, out_ch_size,,
	ldr	x8, [sp, 192]	// IW, %sfp
	mov	w5, 12	// tmp3420,
	str	x1, [sp, 1608]	// _8876, %sfp
	lsl	x1, x14, 2	// _11815, _697,
	lsr	w4, w18, 2	// _5243, KW,
	sub	w30, w18, #1	// _9806, KW,
	lsl	x27, x4, 4	// _5244, _5243,
	smull	x7, w7, w5	// _8025, weight_ch_size, tmp3420
	stp	d8, d9, [sp, 96]	//,,
	.cfi_offset 73, -1960
	.cfi_offset 72, -1968
	str	x1, [sp, 1616]	// _11815, %sfp
	lsl	x1, x14, 3	// _11818, _697,
	smull	x4, w3, w5	// _8036, out_size, tmp3420
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	mov	x26, 0	// ivtmp.4701,
	sbfiz	x23, x18, 2, 32	// _6134, KW,,
	mov	x16, x25	// ivtmp.4700, out_b
	str	w30, [sp, 1576]	// _9806, %sfp
	str	x1, [sp, 1624]	// _11818, %sfp
	sxtw	x1, w13	// _12516, OW
	and	w25, w18, -4	// kw, KW,
	lsl	x24, x8, 2	// _9799, IW,
	lsl	x11, x0, 2	// _11857, _8011,
	stp	d10, d11, [sp, 112]	//,,
	.cfi_offset 75, -1944
	.cfi_offset 74, -1952
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	sxtw	x20, w3	// _8014, out_size
	sbfiz	x22, x3, 2, 32	// _565, out_size,,
	str	x1, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x3, w2	// _8015, in_size
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x21, w18	// _8018, KW
	stp	d12, d13, [sp, 128]	//,,
	.cfi_offset 77, -1928
	.cfi_offset 76, -1936
	sbfiz	x2, x2, 2, 32	// _7033, in_size,,
	mov	x30, x27	// _5244, _5244
	stp	d14, d15, [sp, 144]	//,,
	.cfi_offset 79, -1912
	.cfi_offset 78, -1920
	mov	x27, x26	// ivtmp.4701, ivtmp.4701
	mov	x15, 0	// ivtmp.4702,
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	str	x3, [sp, 1520]	// _8015, %sfp
	mov	w26, w25	// kw, kw
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	mov	w6, 0	// b,
	str	x7, [sp, 1560]	// _8025, %sfp
	mov	x25, x24	// _9799, _9799
	mov	x5, x14	// _697, _697
	str	x4, [sp, 1568]	// _8036, %sfp
	mov	w24, w18	// KW, KW
	mov	x12, x28	// ivtmp.4703, ivtmp.4703
	str	x2, [sp, 1600]	// _7033, %sfp
	mov	x18, x23	// _6134, _6134
	mov	x1, x11	// _11857, _11857
	mov	w23, w19	// KH, KH
.L790:
	sub	x2, x12, x27, lsl 2	// _11839, ivtmp.4703, ivtmp.4701,
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x11, x27	// ivtmp.4688, ivtmp.4701
	str	x27, [sp, 1528]	// ivtmp.4701, %sfp
	mov	x14, 0	// ivtmp.4687,
	ldr	w27, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w19, 0	// oh,
	add	x4, x2, 28	// _9392, _11839,
	mov	w2, w26	// kw, kw
	str	w13, [sp, 1544]	// OW, %sfp
	mov	x3, x4	// _9392, _9392
	mov	x26, x30	// _5244, _5244
	str	x21, [sp, 1584]	// _8018, %sfp
	mov	x4, x5	// _697, _697
	mov	x13, x0	// _8011, _8011
	str	w6, [sp, 1680]	// b, %sfp
	mov	x0, x22	// _565, _565
	mov	w30, w2	// kw, kw
	str	w9, [sp, 1672]	// _15, %sfp
	mov	x5, x3	// _9392, _9392
	mov	x22, x18	// _6134, _6134
	mov	x21, x10	// _11848, _11848
	mov	x6, x12	// ivtmp.4703, ivtmp.4703
.L746:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w2, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w12, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	cmp	w2, 2	// OC,
	ble	.L789		//,
	add	x3, x5, x11, lsl 2	// _11842, _9392, ivtmp.4688,
	ldr	x2, [sp, 208]	// ivtmp.4673, %sfp
	mov	x18, x16	// ivtmp.4700, ivtmp.4700
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w12, 0	// oc0,
	add	x10, x16, x14, lsl 2	// ivtmp.4675, ivtmp.4700, ivtmp.4687,
	str	w19, [sp, 1688]	// oh, %sfp
	mov	x19, x14	// ivtmp.4687, ivtmp.4687
	mov	x14, x1	// _11857, _11857
	ldr	x9, [sp, 448]	// ivtmp.4677, %sfp
	mov	x16, x6	// ivtmp.4703, ivtmp.4703
	str	x3, [sp, 1648]	// _11842, %sfp
	add	x3, x28, x11, lsl 2	// _11845, in_ptr, ivtmp.4688,
	ldr	w1, [sp, 1544]	//, %sfp
	str	w23, [sp, 1552]	// KH, %sfp
	mov	x23, x20	// _8014, _8014
	mov	x20, x17	// _8016, _8016
	mov	x17, x21	// _11848, _11848
	mov	w21, w27	// IC, IC
	str	x3, [sp, 1656]	// _11845, %sfp
	mov	x27, x25	// _9799, _9799
	mov	x3, x15	// ivtmp.4702, ivtmp.4702
	str	x26, [sp, 1536]	// _5244, %sfp
	mov	x15, x13	// _8011, _8011
	mov	x13, x5	// _9392, _9392
	str	x8, [sp, 1592]	// IW, %sfp
	str	x4, [sp, 1696]	// _697, %sfp
.L766:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	w4, w5, [x2]	// acc_I_I_lsm.1674, acc_I_I_lsm.1676,* ivtmp.4673
	ldr	s31, [x2, 8]	// acc_I_I_lsm.1678, MEM[(const float *)_7943 + 8B]
	fmov	s30, w4	// acc_I_I_lsm.1674, acc_I_I_lsm.1674
	str	w5, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	str	w4, [sp, 192]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	dup	v31.4s, v31.s[0]	// tmp3517, acc_I_I_lsm.1678
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1968]	// tmp3517, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q31, [sp, 1984]	// tmp3517, MEM <vector(4) float> [(float *)_520 + 144B]
	dup	v29.4s, v30.s[0]	// tmp3511, acc_I_I_lsm.1674
	fmov	s30, w5	// acc_I_I_lsm.1676, acc_I_I_lsm.1676
	str	q31, [sp, 2000]	// tmp3517, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q31, [sp, 2016]	// tmp3517, MEM <vector(4) float> [(float *)_520 + 176B]
	str	q29, [sp, 1840]	// tmp3511, MEM <vector(4) float> [(float *)_520]
	str	q29, [sp, 1856]	// tmp3511, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q29, [sp, 1872]	// tmp3511, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q29, [sp, 1888]	// tmp3511, MEM <vector(4) float> [(float *)_520 + 48B]
	dup	v30.4s, v30.s[0]	// tmp3514, acc_I_I_lsm.1676
	str	q30, [sp, 1904]	// tmp3514, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q30, [sp, 1920]	// tmp3514, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q30, [sp, 1936]	// tmp3514, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q30, [sp, 1952]	// tmp3514, MEM <vector(4) float> [(float *)_520 + 112B]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w21, 0	// IC,
	ble	.L756		//,
	fmov	s30, w5	// acc_I_I_lsm.1676, acc_I_I_lsm.1676
	add	x25, x11, x3	// ivtmp.4651, ivtmp.4688, ivtmp.4702
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w26, 0	// ic,
	fmov	s29, w4	// acc_I_I_lsm.1674, acc_I_I_lsm.1674
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	s31, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	str	wzr, [sp, 224]	//, %sfp
	ldr	x4, [sp, 1616]	// _11815, %sfp
	ldr	x5, [sp, 1648]	// ivtmp.4652, %sfp
	str	s31, [sp, 432]	// acc_I_I_lsm.1678, %sfp
	add	x8, x9, x4	// ivtmp.4648, ivtmp.4677, _11815
	ldr	x4, [sp, 1624]	// _11818, %sfp
	str	s29, [sp, 416]	// acc_I_I_lsm.1674, %sfp
	str	s30, [sp, 456]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 464]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 472]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 480]	// acc_I_I_lsm.1674, %sfp
	add	x7, x9, x4	// ivtmp.4650, ivtmp.4677, _11818
	mov	x4, x9	// ivtmp.4646, ivtmp.4677
	str	s30, [sp, 496]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 504]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 512]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 528]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 544]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 552]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 800]	// acc_I_I_lsm.1674, %sfp
	str	s30, [sp, 832]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 880]	// acc_I_I_lsm.1678, %sfp
	str	s31, [sp, 896]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 912]	// acc_I_I_lsm.1674, %sfp
	str	s30, [sp, 928]	// acc_I_I_lsm.1676, %sfp
	str	s30, [sp, 944]	// acc_I_I_lsm.1676, %sfp
	str	s30, [sp, 960]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 976]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 992]	// acc_I_I_lsm.1678, %sfp
	str	s31, [sp, 1008]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 1024]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 1040]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 1056]	// acc_I_I_lsm.1676, %sfp
	ldr	x6, [sp, 1656]	// ivtmp.4655, %sfp
	str	s29, [sp, 560]	// acc_I_I_lsm.1674, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x0, [sp, 1712]	// _565, %sfp
	add	x0, sp, 1736	//,,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	s31, [sp, 576]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 592]	// acc_I_I_lsm.1676, %sfp
	str	s30, [sp, 608]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 624]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 640]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 656]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 672]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 688]	// acc_I_I_lsm.1674, %sfp
	str	s30, [sp, 704]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 720]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 736]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 752]	// acc_I_I_lsm.1678, %sfp
	str	s29, [sp, 768]	// acc_I_I_lsm.1674, %sfp
	str	s30, [sp, 784]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 816]	// acc_I_I_lsm.1678, %sfp
	str	s30, [sp, 848]	// acc_I_I_lsm.1676, %sfp
	str	s29, [sp, 864]	// acc_I_I_lsm.1674, %sfp
	str	s29, [sp, 1456]	// acc_I_I_lsm.1674, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w1, [sp, 1704]	// OW, %sfp
	add	x1, sp, 1768	//,,
	str	x2, [sp, 1720]	// ivtmp.4673, %sfp
	str	w12, [sp, 1728]	// oc0, %sfp
	stp	x10, x9, [x0]	// ivtmp.4675, ivtmp.4677,
	stp	x15, x23, [x0, 16]	// _8011, _8014,
	mov	x23, x3	// ivtmp.4702, ivtmp.4702
	stp	x20, x19, [x1]	// _8016, ivtmp.4687,
	mov	x19, x14	// _11857, _11857
	stp	x11, x18, [x1, 16]	// ivtmp.4688, ivtmp.4700,
	mov	x18, x16	// ivtmp.4703, ivtmp.4703
	mov	x1, x13	// _9392, _9392
	str	x17, [sp, 1800]	// _11848, %sfp
	.p2align 5,,15
.L754:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 1552]	//, %sfp
	cmp	w0, 0	// KH,
	ble	.L747		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w17, 0	// kh,
	add	x16, x5, 32	// ivtmp.4615, ivtmp.4652,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x2, x6	// ivtmp.4621, ivtmp.4655
	mov	x0, x6	// ivtmp.4619, ivtmp.4655
	mov	x11, x7	// ivtmp.4618, ivtmp.4650
	mov	x10, x8	// ivtmp.4617, ivtmp.4648
	str	w17, [sp, 1504]	// kh, %sfp
	mov	x9, x4	// ivtmp.4616, ivtmp.4646
	mov	x15, x5	// ivtmp.4613, ivtmp.4652
	str	x16, [sp, 1464]	// ivtmp.4615, %sfp
	mov	x3, x25	// ivtmp.4612, ivtmp.4651
	mov	x12, x4	// ivtmp.4607, ivtmp.4646
	mov	x20, x7	// ivtmp.4611, ivtmp.4611
	mov	x17, x8	// ivtmp.4609, ivtmp.4609
	.p2align 5,,15
.L753:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w24, 0	// KW,
	ble	.L748		//,
	ldr	w13, [sp, 1576]	//, %sfp
	cmp	w13, 3	// _9806,
	bls	.L913		//,
	ldr	q30, [x0, 4]	// vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 4B]
	movi	v31.4s, 0	// vect__5559.3307
	add	x13, x2, 48	// vectp.3262, ivtmp.4621,
	add	x16, x2, 56	// vectp.3286, ivtmp.4621,
	add	x14, x2, 60	// vectp.3298, ivtmp.4621,
	str	x13, [sp, 1488]	// vectp.3262, %sfp
	add	x13, x2, 52	// vectp.3274, ivtmp.4621,
	str	q31, [sp, 1328]	// vect__5559.3307, %sfp
	mov	v15.16b, v31.16b	// vect__5534.3292, vect__5559.3307
	mov	v16.16b, v31.16b	// vect__5530.3289, vect__5559.3307
	str	q31, [sp, 1344]	// vect__5559.3307, %sfp
	mov	v17.16b, v31.16b	// vect__5517.3283, vect__5559.3307
	mov	v18.16b, v31.16b	// vect__5513.3280, vect__5559.3307
	str	q30, [sp, 384]	// vectp.3273__lsm0.3618, %sfp
	mov	v19.16b, v31.16b	// vect__5509.3277, vect__5559.3307
	mov	v20.16b, v31.16b	// vect__5496.3271, vect__5559.3307
	ldr	q30, [x0, 8]	// vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 8B]
	mov	v21.16b, v31.16b	// vect__5492.3268, vect__5559.3307
	mov	v22.16b, v31.16b	// vect__5488.3265, vect__5559.3307
	str	q31, [sp, 1360]	// vect__5559.3307, %sfp
	mov	v23.16b, v31.16b	// vect__5475.3259, vect__5559.3307
	mov	v14.16b, v31.16b	// vect__5446.3241, vect__5559.3307
	str	x13, [sp, 1496]	// vectp.3274, %sfp
	mov	v13.16b, v31.16b	// vect__5433.3235, vect__5559.3307
	mov	v12.16b, v31.16b	// vect__5429.3232, vect__5559.3307
	mov	x13, 0	// ivtmp.4563,
	mov	v11.16b, v31.16b	// vect__5425.3229, vect__5559.3307
	mov	v10.16b, v31.16b	// vect__5412.3223, vect__5559.3307
	mov	v9.16b, v31.16b	// vect__5408.3220, vect__5559.3307
	mov	v8.16b, v31.16b	// vect__5404.3217, vect__5559.3307
	mov	v7.16b, v31.16b	// vect__5391.3211, vect__5559.3307
	mov	v6.16b, v31.16b	// vect__5387.3208, vect__5559.3307
	str	q30, [sp, 368]	// vectp.3285__lsm0.3615, %sfp
	mov	v5.16b, v31.16b	// vect__5383.3205, vect__5559.3307
	mov	v4.16b, v31.16b	// vect__5370.3199, vect__5559.3307
	ldr	q30, [x0, 12]	// vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 12B]
	mov	v3.16b, v31.16b	// vect__5366.3196, vect__5559.3307
	mov	v2.16b, v31.16b	// vect__5362.3193, vect__5559.3307
	mov	v1.16b, v31.16b	// vect__5349.3187, vect__5559.3307
	mov	v0.16b, v31.16b	// vect__5236.3121, vect__5559.3307
	str	q30, [sp, 352]	// vectp.3297__lsm0.3612, %sfp
	ldp	q30, q29, [x0]	// vectp.3261__lsm0.3621, vectp.3261__lsm0.3621,* ivtmp.4619
	str	q31, [sp, 1248]	// vect__5559.3307, %sfp
	str	q31, [sp, 1264]	// vect__5559.3307, %sfp
	str	q31, [sp, 1280]	// vect__5559.3307, %sfp
	str	q31, [sp, 1296]	// vect__5559.3307, %sfp
	str	q31, [sp, 1312]	// vect__5559.3307, %sfp
	str	q30, [sp, 400]	// vectp.3261__lsm0.3621, %sfp
	ldr	q30, [x0, 20]	// vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 20B]
	str	q29, [sp, 240]	// vectp.3261__lsm0.3621, %sfp
	str	q30, [sp, 272]	// vectp.3273__lsm0.3618, %sfp
	ldr	q30, [x0, 24]	// vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 24B]
	str	q30, [sp, 304]	// vectp.3285__lsm0.3615, %sfp
	ldr	q30, [x0, 28]	// vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 28B]
	str	q30, [sp, 336]	// vectp.3297__lsm0.3612, %sfp
	ldr	q30, [x0, 32]	// vectp.3261__lsm2.3623, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 32B]
	str	q30, [sp, 224]	// vectp.3261__lsm2.3623, %sfp
	ldr	q30, [x0, 36]	// vectp.3273__lsm2.3620, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 36B]
	str	q30, [sp, 256]	// vectp.3273__lsm2.3620, %sfp
	ldr	q30, [x0, 40]	// vectp.3285__lsm2.3617, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 40B]
	str	q30, [sp, 288]	// vectp.3285__lsm2.3617, %sfp
	str	q31, [sp, 1232]	// vect__5559.3307, %sfp
	ldr	q30, [x0, 44]	// vectp.3297__lsm2.3614, MEM <const vector(4) float> [(const float *)vectp.3118_9934 + 44B]
	str	q31, [sp, 1072]	// vect__5559.3307, %sfp
	str	q31, [sp, 1088]	// vect__5559.3307, %sfp
	str	q31, [sp, 1104]	// vect__5559.3307, %sfp
	str	q31, [sp, 1120]	// vect__5559.3307, %sfp
	str	q31, [sp, 1136]	// vect__5559.3307, %sfp
	str	q30, [sp, 320]	// vectp.3297__lsm2.3614, %sfp
	str	q31, [sp, 1152]	// vect__5559.3307, %sfp
	str	q31, [sp, 1168]	// vect__5559.3307, %sfp
	str	q31, [sp, 1184]	// vect__5559.3307, %sfp
	str	q31, [sp, 1200]	// vect__5559.3307, %sfp
	str	q31, [sp, 1216]	// vect__5559.3307, %sfp
	str	q31, [sp, 1376]	// vect__5450.3244, %sfp
	str	q31, [sp, 1392]	// vect__5454.3247, %sfp
	str	q31, [sp, 1408]	// vect__5467.3253, %sfp
	str	q31, [sp, 1424]	// vect__5471.3256, %sfp
	str	q31, [sp, 1440]	// vect__5559.3307, %sfp
	str	x0, [sp, 1512]	// ivtmp.4619, %sfp
	b	.L750		//
	.p2align 2,,3
.L914:
	ldr	q31, [sp, 240]	// vectp.3261__lsm0.3621, %sfp
	str	q31, [sp, 400]	// vectp.3261__lsm0.3621, %sfp
	ldr	q31, [sp, 272]	// vectp.3273__lsm0.3618, %sfp
	str	q31, [sp, 384]	// vectp.3273__lsm0.3618, %sfp
	ldr	q31, [sp, 304]	// vectp.3285__lsm0.3615, %sfp
	str	q31, [sp, 368]	// vectp.3285__lsm0.3615, %sfp
	ldr	q31, [sp, 336]	// vectp.3297__lsm0.3612, %sfp
	str	q31, [sp, 352]	// vectp.3297__lsm0.3612, %sfp
	ldr	q31, [sp, 224]	// vectp.3261__lsm2.3623, %sfp
	stp	q25, q31, [sp, 224]	// MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1], vectp.3261__lsm2.3623,
	ldr	q31, [sp, 256]	// vectp.3273__lsm2.3620, %sfp
	stp	q26, q31, [sp, 256]	// MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1], vectp.3273__lsm2.3620,
	ldr	q31, [sp, 288]	// vectp.3285__lsm2.3617, %sfp
	stp	q27, q31, [sp, 288]	// MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1], vectp.3285__lsm2.3617,
	ldr	q31, [sp, 320]	// vectp.3297__lsm2.3614, %sfp
	str	q31, [sp, 336]	// vectp.3297__lsm2.3614, %sfp
	ldr	q31, [sp, 1472]	// MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1], %sfp
	str	q31, [sp, 320]	// MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1], %sfp
.L750:
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldp	q27, q31, [sp, 384]	// vectp.3273__lsm0.3618, vectp.3261__lsm0.3621,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q28, [x9, x13]	// MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q24, [x14, x13]	// MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1]
	ldr	x0, [sp, 1488]	// vectp.3262, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x10, x13]	// MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v0.4s, v31.4s, v28.4s	// vect__5236.3121, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 1104]	// vect__5257.3133, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	str	q24, [sp, 1472]	// MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1], %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q24, [sp, 1152]	// vect__5278.3145, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q25, [x0, x13]	// MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v27.4s, v28.4s	// vect__5257.3133, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x0, [sp, 1496]	// vectp.3274, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q30, [x11, x13]	// MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q27, [x16, x13]	// MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v28.4s, v25.4s	// vect__5488.3265, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q26, [x0, x13]	// MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1]
	add	x13, x13, 16	// ivtmp.4563, ivtmp.4563,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v21.4s, v29.4s, v25.4s	// vect__5492.3268, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1]
	str	q31, [sp, 1104]	// vect__5257.3133, %sfp
	ldr	q31, [sp, 368]	// vectp.3285__lsm0.3615, %sfp
	fmla	v20.4s, v30.4s, v25.4s	// vect__5496.3271, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3262_10209 + ivtmp.4563_5239 * 1]
	fmla	v19.4s, v28.4s, v26.4s	// vect__5509.3277, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1]
	fmla	v24.4s, v31.4s, v28.4s	// vect__5278.3145, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 352]	// vectp.3297__lsm0.3612, %sfp
	fmla	v18.4s, v29.4s, v26.4s	// vect__5513.3280, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1]
	fmla	v17.4s, v30.4s, v26.4s	// vect__5517.3283, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3274_10232 + ivtmp.4563_5239 * 1]
	str	q24, [sp, 1152]	// vect__5278.3145, %sfp
	fmla	v16.4s, v28.4s, v27.4s	// vect__5530.3289, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1]
	ldr	q24, [sp, 1200]	// vect__5299.3157, %sfp
	fmla	v15.4s, v29.4s, v27.4s	// vect__5534.3292, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1]
	fmla	v24.4s, v31.4s, v28.4s	// vect__5299.3157, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 240]	// vectp.3261__lsm0.3621, %sfp
	str	q24, [sp, 1200]	// vect__5299.3157, %sfp
	ldr	q24, [sp, 1248]	// vect__5320.3169, %sfp
	fmla	v24.4s, v31.4s, v28.4s	// vect__5320.3169, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 272]	// vectp.3273__lsm0.3618, %sfp
	str	q24, [sp, 1248]	// vect__5320.3169, %sfp
	ldr	q24, [sp, 1296]	// vect__5341.3181, %sfp
	fmla	v24.4s, v31.4s, v28.4s	// vect__5341.3181, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 304]	// vectp.3285__lsm0.3615, %sfp
	fmla	v2.4s, v31.4s, v28.4s	// vect__5362.3193, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 336]	// vectp.3297__lsm0.3612, %sfp
	str	q24, [sp, 1296]	// vect__5341.3181, %sfp
	ldr	q24, [sp, 1408]	// vect__5467.3253, %sfp
	fmla	v5.4s, v31.4s, v28.4s	// vect__5383.3205, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 224]	// vectp.3261__lsm2.3623, %sfp
	fmla	v8.4s, v31.4s, v28.4s	// vect__5404.3217, vectp.3261__lsm2.3623, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 256]	// vectp.3273__lsm2.3620, %sfp
	fmla	v11.4s, v31.4s, v28.4s	// vect__5425.3229, vectp.3273__lsm2.3620, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 288]	// vectp.3285__lsm2.3617, %sfp
	fmla	v14.4s, v31.4s, v28.4s	// vect__5446.3241, vectp.3285__lsm2.3617, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 320]	// vectp.3297__lsm2.3614, %sfp
	fmla	v24.4s, v31.4s, v28.4s	// vect__5467.3253, vectp.3297__lsm2.3614, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 400]	// vectp.3261__lsm0.3621, %sfp
	str	q24, [sp, 1408]	// vect__5467.3253, %sfp
	ldr	q24, [sp, 1072]	// vect__5240.3124, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5240.3124, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 384]	// vectp.3273__lsm0.3618, %sfp
	str	q24, [sp, 1072]	// vect__5240.3124, %sfp
	ldr	q24, [sp, 1120]	// vect__5261.3136, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5261.3136, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 368]	// vectp.3285__lsm0.3615, %sfp
	str	q24, [sp, 1120]	// vect__5261.3136, %sfp
	ldr	q24, [sp, 1168]	// vect__5282.3148, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5282.3148, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 352]	// vectp.3297__lsm0.3612, %sfp
	str	q24, [sp, 1168]	// vect__5282.3148, %sfp
	ldr	q24, [sp, 1216]	// vect__5303.3160, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5303.3160, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 240]	// vectp.3261__lsm0.3621, %sfp
	str	q24, [sp, 1216]	// vect__5303.3160, %sfp
	ldr	q24, [sp, 1264]	// vect__5324.3172, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5324.3172, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 272]	// vectp.3273__lsm0.3618, %sfp
	str	q24, [sp, 1264]	// vect__5324.3172, %sfp
	ldr	q24, [sp, 1312]	// vect__5345.3184, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5345.3184, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 304]	// vectp.3285__lsm0.3615, %sfp
	fmla	v3.4s, v31.4s, v29.4s	// vect__5366.3196, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 336]	// vectp.3297__lsm0.3612, %sfp
	str	q24, [sp, 1312]	// vect__5345.3184, %sfp
	ldr	q24, [sp, 1376]	// vect__5450.3244, %sfp
	fmla	v6.4s, v31.4s, v29.4s	// vect__5387.3208, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 224]	// vectp.3261__lsm2.3623, %sfp
	fmla	v9.4s, v31.4s, v29.4s	// vect__5408.3220, vectp.3261__lsm2.3623, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 256]	// vectp.3273__lsm2.3620, %sfp
	fmla	v12.4s, v31.4s, v29.4s	// vect__5429.3232, vectp.3273__lsm2.3620, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 288]	// vectp.3285__lsm2.3617, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5450.3244, vectp.3285__lsm2.3617, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 320]	// vectp.3297__lsm2.3614, %sfp
	str	q24, [sp, 1376]	// vect__5450.3244, %sfp
	ldr	q24, [sp, 1424]	// vect__5471.3256, %sfp
	fmla	v24.4s, v31.4s, v29.4s	// vect__5471.3256, vectp.3297__lsm2.3614, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 400]	// vectp.3261__lsm0.3621, %sfp
	str	q24, [sp, 1424]	// vect__5471.3256, %sfp
	ldr	q24, [sp, 1088]	// vect__5244.3127, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5244.3127, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	str	q24, [sp, 1088]	// vect__5244.3127, %sfp
	ldr	q31, [sp, 384]	// vectp.3273__lsm0.3618, %sfp
	ldr	q24, [sp, 1136]	// vect__5265.3139, %sfp
	ldr	x0, [sp, 1536]	// _5244, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5265.3139, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 368]	// vectp.3285__lsm0.3615, %sfp
	str	q24, [sp, 1136]	// vect__5265.3139, %sfp
	ldr	q24, [sp, 1184]	// vect__5286.3151, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5286.3151, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 352]	// vectp.3297__lsm0.3612, %sfp
	str	q24, [sp, 1184]	// vect__5286.3151, %sfp
	ldr	q24, [sp, 1232]	// vect__5307.3163, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5307.3163, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 240]	// vectp.3261__lsm0.3621, %sfp
	str	q24, [sp, 1232]	// vect__5307.3163, %sfp
	ldr	q24, [sp, 1280]	// vect__5328.3175, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5328.3175, vectp.3261__lsm0.3621, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 272]	// vectp.3273__lsm0.3618, %sfp
	fmla	v1.4s, v31.4s, v30.4s	// vect__5349.3187, vectp.3273__lsm0.3618, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 304]	// vectp.3285__lsm0.3615, %sfp
	str	q24, [sp, 1280]	// vect__5328.3175, %sfp
	ldr	q24, [sp, 1392]	// vect__5454.3247, %sfp
	fmla	v4.4s, v31.4s, v30.4s	// vect__5370.3199, vectp.3285__lsm0.3615, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 336]	// vectp.3297__lsm0.3612, %sfp
	fmla	v7.4s, v31.4s, v30.4s	// vect__5391.3211, vectp.3297__lsm0.3612, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 224]	// vectp.3261__lsm2.3623, %sfp
	fmla	v10.4s, v31.4s, v30.4s	// vect__5412.3223, vectp.3261__lsm2.3623, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 256]	// vectp.3273__lsm2.3620, %sfp
	fmla	v13.4s, v31.4s, v30.4s	// vect__5433.3235, vectp.3273__lsm2.3620, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 288]	// vectp.3285__lsm2.3617, %sfp
	fmla	v24.4s, v31.4s, v30.4s	// vect__5454.3247, vectp.3285__lsm2.3617, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 320]	// vectp.3297__lsm2.3614, %sfp
	fmla	v23.4s, v31.4s, v30.4s	// vect__5475.3259, vectp.3297__lsm2.3614, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1]
	ldr	q31, [sp, 1328]	// vect__5538.3295, %sfp
	str	q24, [sp, 1392]	// vect__5454.3247, %sfp
	ldr	q24, [sp, 1472]	// MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1], %sfp
	fmla	v31.4s, v30.4s, v27.4s	// vect__5538.3295, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3286_10255 + ivtmp.4563_5239 * 1]
	str	q31, [sp, 1328]	// vect__5538.3295, %sfp
	ldr	q31, [sp, 1344]	// vect__5551.3301, %sfp
	fmla	v31.4s, v28.4s, v24.4s	// vect__5551.3301, MEM <const vector(4) float> [(const float *)vectp.3109_9908 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1]
	str	q31, [sp, 1344]	// vect__5551.3301, %sfp
	ldr	q31, [sp, 1360]	// vect__5555.3304, %sfp
	fmla	v31.4s, v29.4s, v24.4s	// vect__5555.3304, MEM <const vector(4) float> [(const float *)vectp.3112_9915 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1]
	str	q31, [sp, 1360]	// vect__5555.3304, %sfp
	ldr	q31, [sp, 1440]	// vect__5559.3307, %sfp
	fmla	v31.4s, v30.4s, v24.4s	// vect__5559.3307, MEM <const vector(4) float> [(const float *)vectp.3115_9924 + ivtmp.4563_5239 * 1], MEM <const vector(4) float> [(const float *)vectp.3298_10278 + ivtmp.4563_5239 * 1]
	str	q31, [sp, 1440]	// vect__5559.3307, %sfp
	cmp	x13, x0	// ivtmp.4563, _5244
	bne	.L914		//,
	ldr	q30, [sp, 1360]	// vect__5555.3304, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3452, vect__5559.3307, vect__5559.3307
	sxtw	x14, w30	//, kw
	faddp	v15.4s, v15.4s, v15.4s	// tmp3456, vect__5534.3292, vect__5534.3292
	ldr	q28, [sp, 1328]	// vect__5538.3295, %sfp
	faddp	v16.4s, v16.4s, v16.4s	// tmp3457, vect__5530.3289, vect__5530.3289
	faddp	v17.4s, v17.4s, v17.4s	// tmp3458, vect__5517.3283, vect__5517.3283
	ldr	q29, [sp, 1344]	// vect__5551.3301, %sfp
	faddp	v18.4s, v18.4s, v18.4s	// tmp3459, vect__5513.3280, vect__5513.3280
	faddp	v19.4s, v19.4s, v19.4s	// tmp3460, vect__5509.3277, vect__5509.3277
	str	q31, [sp, 224]	// tmp3452, %sfp
	faddp	v31.4s, v30.4s, v30.4s	// tmp3453, vect__5555.3304, vect__5555.3304
	ldr	q27, [sp, 1376]	// vect__5450.3244, %sfp
	faddp	v15.4s, v15.4s, v15.4s	// tmp3456, tmp3456, tmp3456
	faddp	v28.4s, v28.4s, v28.4s	// tmp3455, vect__5538.3295, vect__5538.3295
	ldr	q26, [sp, 1392]	// vect__5454.3247, %sfp
	faddp	v16.4s, v16.4s, v16.4s	// tmp3457, tmp3457, tmp3457
	faddp	v29.4s, v29.4s, v29.4s	// tmp3454, vect__5551.3301, vect__5551.3301
	ldr	q25, [sp, 1408]	// vect__5467.3253, %sfp
	faddp	v17.4s, v17.4s, v17.4s	// tmp3458, tmp3458, tmp3458
	str	q31, [sp, 240]	// tmp3453, %sfp
	faddp	v18.4s, v18.4s, v18.4s	// tmp3459, tmp3459, tmp3459
	ldr	q31, [sp, 1312]	// vect__5345.3184, %sfp
	faddp	v19.4s, v19.4s, v19.4s	// tmp3460, tmp3460, tmp3460
	faddp	v28.4s, v28.4s, v28.4s	// tmp3455, tmp3455, tmp3455
	ldr	q24, [sp, 1424]	// vect__5471.3256, %sfp
	faddp	v20.4s, v20.4s, v20.4s	// tmp3461, vect__5496.3271, vect__5496.3271
	faddp	v29.4s, v29.4s, v29.4s	// tmp3454, tmp3454, tmp3454
	ldr	x0, [sp, 1512]	// ivtmp.4619, %sfp
	faddp	v21.4s, v21.4s, v21.4s	// tmp3462, vect__5492.3268, vect__5492.3268
	faddp	v22.4s, v22.4s, v22.4s	// tmp3463, vect__5488.3265, vect__5488.3265
	faddp	v31.4s, v31.4s, v31.4s	// tmp3483, vect__5345.3184, vect__5345.3184
	faddp	v23.4s, v23.4s, v23.4s	// tmp3464, vect__5475.3259, vect__5475.3259
	faddp	v20.4s, v20.4s, v20.4s	// tmp3461, tmp3461, tmp3461
	faddp	v24.4s, v24.4s, v24.4s	// tmp3465, vect__5471.3256, vect__5471.3256
	faddp	v21.4s, v21.4s, v21.4s	// tmp3462, tmp3462, tmp3462
	faddp	v22.4s, v22.4s, v22.4s	// tmp3463, tmp3463, tmp3463
	str	q31, [sp, 256]	// tmp3483, %sfp
	faddp	v25.4s, v25.4s, v25.4s	// tmp3466, vect__5467.3253, vect__5467.3253
	ldr	q31, [sp, 1296]	// vect__5341.3181, %sfp
	faddp	v23.4s, v23.4s, v23.4s	// tmp3464, tmp3464, tmp3464
	faddp	v26.4s, v26.4s, v26.4s	// tmp3467, vect__5454.3247, vect__5454.3247
	faddp	v24.4s, v24.4s, v24.4s	// tmp3465, tmp3465, tmp3465
	faddp	v27.4s, v27.4s, v27.4s	// tmp3468, vect__5450.3244, vect__5450.3244
	faddp	v14.4s, v14.4s, v14.4s	// tmp3469, vect__5446.3241, vect__5446.3241
	faddp	v25.4s, v25.4s, v25.4s	// tmp3466, tmp3466, tmp3466
	faddp	v31.4s, v31.4s, v31.4s	// tmp3484, vect__5341.3181, vect__5341.3181
	faddp	v26.4s, v26.4s, v26.4s	// tmp3467, tmp3467, tmp3467
	faddp	v13.4s, v13.4s, v13.4s	// tmp3470, vect__5433.3235, vect__5433.3235
	faddp	v27.4s, v27.4s, v27.4s	// tmp3468, tmp3468, tmp3468
	faddp	v14.4s, v14.4s, v14.4s	// tmp3469, tmp3469, tmp3469
	faddp	v12.4s, v12.4s, v12.4s	// tmp3471, vect__5429.3232, vect__5429.3232
	str	q31, [sp, 272]	// tmp3484, %sfp
	faddp	v11.4s, v11.4s, v11.4s	// tmp3472, vect__5425.3229, vect__5425.3229
	ldr	q31, [sp, 1280]	// vect__5328.3175, %sfp
	faddp	v10.4s, v10.4s, v10.4s	// tmp3473, vect__5412.3223, vect__5412.3223
	faddp	v13.4s, v13.4s, v13.4s	// tmp3470, tmp3470, tmp3470
	faddp	v9.4s, v9.4s, v9.4s	// tmp3474, vect__5408.3220, vect__5408.3220
	faddp	v8.4s, v8.4s, v8.4s	// tmp3475, vect__5404.3217, vect__5404.3217
	faddp	v12.4s, v12.4s, v12.4s	// tmp3471, tmp3471, tmp3471
	faddp	v11.4s, v11.4s, v11.4s	// tmp3472, tmp3472, tmp3472
	faddp	v31.4s, v31.4s, v31.4s	// tmp3485, vect__5328.3175, vect__5328.3175
	faddp	v10.4s, v10.4s, v10.4s	// tmp3473, tmp3473, tmp3473
	faddp	v9.4s, v9.4s, v9.4s	// tmp3474, tmp3474, tmp3474
	faddp	v8.4s, v8.4s, v8.4s	// tmp3475, tmp3475, tmp3475
	faddp	v7.4s, v7.4s, v7.4s	// tmp3476, vect__5391.3211, vect__5391.3211
	faddp	v6.4s, v6.4s, v6.4s	// tmp3477, vect__5387.3208, vect__5387.3208
	str	q31, [sp, 288]	// tmp3485, %sfp
	faddp	v5.4s, v5.4s, v5.4s	// tmp3478, vect__5383.3205, vect__5383.3205
	ldr	q31, [sp, 1264]	// vect__5324.3172, %sfp
	faddp	v4.4s, v4.4s, v4.4s	// tmp3479, vect__5370.3199, vect__5370.3199
	faddp	v3.4s, v3.4s, v3.4s	// tmp3480, vect__5366.3196, vect__5366.3196
	faddp	v2.4s, v2.4s, v2.4s	// tmp3481, vect__5362.3193, vect__5362.3193
	faddp	v7.4s, v7.4s, v7.4s	// tmp3476, tmp3476, tmp3476
	faddp	v6.4s, v6.4s, v6.4s	// tmp3477, tmp3477, tmp3477
	faddp	v5.4s, v5.4s, v5.4s	// tmp3478, tmp3478, tmp3478
	faddp	v31.4s, v31.4s, v31.4s	// tmp3486, vect__5324.3172, vect__5324.3172
	faddp	v4.4s, v4.4s, v4.4s	// tmp3479, tmp3479, tmp3479
	faddp	v3.4s, v3.4s, v3.4s	// tmp3480, tmp3480, tmp3480
	faddp	v2.4s, v2.4s, v2.4s	// tmp3481, tmp3481, tmp3481
	faddp	v1.4s, v1.4s, v1.4s	// tmp3482, vect__5349.3187, vect__5349.3187
	faddp	v0.4s, v0.4s, v0.4s	// tmp3499, vect__5236.3121, vect__5236.3121
	str	q31, [sp, 304]	// tmp3486, %sfp
	ldr	q31, [sp, 1248]	// vect__5320.3169, %sfp
	faddp	v1.4s, v1.4s, v1.4s	// tmp3482, tmp3482, tmp3482
	faddp	v0.4s, v0.4s, v0.4s	// tmp3499, tmp3499, tmp3499
	faddp	v31.4s, v31.4s, v31.4s	// tmp3487, vect__5320.3169, vect__5320.3169
	str	q31, [sp, 320]	// tmp3487, %sfp
	ldr	q31, [sp, 1232]	// vect__5307.3163, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3488, vect__5307.3163, vect__5307.3163
	str	q31, [sp, 336]	// tmp3488, %sfp
	ldr	q31, [sp, 1216]	// vect__5303.3160, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3489, vect__5303.3160, vect__5303.3160
	str	q31, [sp, 352]	// tmp3489, %sfp
	ldr	q31, [sp, 1200]	// vect__5299.3157, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3490, vect__5299.3157, vect__5299.3157
	str	q31, [sp, 368]	// tmp3490, %sfp
	ldr	q31, [sp, 1184]	// vect__5286.3151, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3491, vect__5286.3151, vect__5286.3151
	str	q31, [sp, 384]	// tmp3491, %sfp
	ldr	q31, [sp, 1168]	// vect__5282.3148, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3492, vect__5282.3148, vect__5282.3148
	str	q31, [sp, 400]	// tmp3492, %sfp
	ldr	q31, [sp, 1152]	// vect__5278.3145, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3493, vect__5278.3145, vect__5278.3145
	str	q31, [sp, 1152]	// tmp3493, %sfp
	ldr	q31, [sp, 1136]	// vect__5265.3139, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3494, vect__5265.3139, vect__5265.3139
	str	q31, [sp, 1136]	// tmp3494, %sfp
	ldr	q31, [sp, 1120]	// vect__5261.3136, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3495, vect__5261.3136, vect__5261.3136
	str	q31, [sp, 1120]	// tmp3495, %sfp
	ldr	q31, [sp, 1104]	// vect__5257.3133, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3496, vect__5257.3133, vect__5257.3133
	str	q31, [sp, 1104]	// tmp3496, %sfp
	ldr	q31, [sp, 1088]	// vect__5244.3127, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3497, vect__5244.3127, vect__5244.3127
	str	q31, [sp, 1088]	// tmp3497, %sfp
	ldr	q31, [sp, 1072]	// vect__5240.3124, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3498, vect__5240.3124, vect__5240.3124
	mov	v30.16b, v31.16b	// tmp3498, tmp3498
	ldr	q31, [sp, 224]	// tmp3452, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3452, tmp3452, tmp3452
	str	q31, [sp, 224]	// tmp3452, %sfp
	ldr	q31, [sp, 240]	// tmp3453, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3453, tmp3453, tmp3453
	str	q31, [sp, 240]	// tmp3453, %sfp
	ldr	q31, [sp, 256]	// tmp3483, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3483, tmp3483, tmp3483
	str	q31, [sp, 256]	// tmp3483, %sfp
	ldr	q31, [sp, 272]	// tmp3484, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3484, tmp3484, tmp3484
	str	q31, [sp, 272]	// tmp3484, %sfp
	ldr	q31, [sp, 288]	// tmp3485, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3485, tmp3485, tmp3485
	str	q31, [sp, 288]	// tmp3485, %sfp
	ldr	q31, [sp, 304]	// tmp3486, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3486, tmp3486, tmp3486
	str	q31, [sp, 304]	// tmp3486, %sfp
	ldr	q31, [sp, 320]	// tmp3487, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3487, tmp3487, tmp3487
	str	q31, [sp, 320]	// tmp3487, %sfp
	ldr	q31, [sp, 336]	// tmp3488, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3488, tmp3488, tmp3488
	str	q31, [sp, 336]	// tmp3488, %sfp
	ldr	q31, [sp, 352]	// tmp3489, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3489, tmp3489, tmp3489
	str	q31, [sp, 352]	// tmp3489, %sfp
	ldr	q31, [sp, 368]	// tmp3490, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3490, tmp3490, tmp3490
	str	q31, [sp, 368]	// tmp3490, %sfp
	ldr	q31, [sp, 384]	// tmp3491, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3491, tmp3491, tmp3491
	str	q31, [sp, 384]	// tmp3491, %sfp
	ldr	q31, [sp, 400]	// tmp3492, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3492, tmp3492, tmp3492
	str	q31, [sp, 400]	// tmp3492, %sfp
	ldr	q31, [sp, 1152]	// tmp3493, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3493, tmp3493, tmp3493
	str	q31, [sp, 1152]	// tmp3493, %sfp
	ldr	q31, [sp, 1136]	// tmp3494, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3494, tmp3494, tmp3494
	str	q31, [sp, 1136]	// tmp3494, %sfp
	ldr	q31, [sp, 1120]	// tmp3495, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3495, tmp3495, tmp3495
	str	q31, [sp, 1120]	// tmp3495, %sfp
	ldr	q31, [sp, 1104]	// tmp3496, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3496, tmp3496, tmp3496
	str	q31, [sp, 1104]	// tmp3496, %sfp
	ldr	q31, [sp, 1088]	// tmp3497, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3497, tmp3497, tmp3497
	str	q31, [sp, 1088]	// tmp3497, %sfp
	faddp	v31.4s, v30.4s, v30.4s	// tmp3498, tmp3498, tmp3498
	ldr	s30, [sp, 880]	// acc_I_I_lsm.1768, %sfp
	str	q31, [sp, 1072]	// tmp3498, %sfp
	ldr	s31, [sp, 224]	// tmp10227, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1768, acc_I_I_lsm.1768, tmp10227
	ldr	s31, [sp, 240]	// tmp10223, %sfp
	str	s30, [sp, 880]	// acc_I_I_lsm.1768, %sfp
	ldr	s30, [sp, 928]	// acc_I_I_lsm.1766, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1766, acc_I_I_lsm.1766, tmp10223
	str	s30, [sp, 928]	// acc_I_I_lsm.1766, %sfp
	ldr	s30, [sp, 912]	// acc_I_I_lsm.1764, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1764, acc_I_I_lsm.1764, tmp3454
	str	s30, [sp, 912]	// acc_I_I_lsm.1764, %sfp
	ldr	s30, [sp, 896]	// acc_I_I_lsm.1762, %sfp
	fadd	s30, s30, s28	// acc_I_I_lsm.1762, acc_I_I_lsm.1762, tmp3455
	str	s30, [sp, 896]	// acc_I_I_lsm.1762, %sfp
	ldr	s30, [sp, 960]	// acc_I_I_lsm.1760, %sfp
	fadd	s30, s30, s15	// acc_I_I_lsm.1760, acc_I_I_lsm.1760, tmp3456
	str	s30, [sp, 960]	// acc_I_I_lsm.1760, %sfp
	ldr	s30, [sp, 976]	// acc_I_I_lsm.1758, %sfp
	fadd	s30, s30, s16	// acc_I_I_lsm.1758, acc_I_I_lsm.1758, tmp3457
	str	s30, [sp, 976]	// acc_I_I_lsm.1758, %sfp
	ldr	s30, [sp, 992]	// acc_I_I_lsm.1756, %sfp
	fadd	s30, s30, s17	// acc_I_I_lsm.1756, acc_I_I_lsm.1756, tmp3458
	str	s30, [sp, 992]	// acc_I_I_lsm.1756, %sfp
	ldr	s30, [sp, 944]	// acc_I_I_lsm.1754, %sfp
	fadd	s30, s30, s18	// acc_I_I_lsm.1754, acc_I_I_lsm.1754, tmp3459
	str	s30, [sp, 944]	// acc_I_I_lsm.1754, %sfp
	ldr	s30, [sp, 800]	// acc_I_I_lsm.1752, %sfp
	fadd	s30, s30, s19	// acc_I_I_lsm.1752, acc_I_I_lsm.1752, tmp3460
	str	s30, [sp, 800]	// acc_I_I_lsm.1752, %sfp
	ldr	s30, [sp, 1008]	// acc_I_I_lsm.1750, %sfp
	fadd	s30, s30, s20	// acc_I_I_lsm.1750, acc_I_I_lsm.1750, tmp3461
	str	s30, [sp, 1008]	// acc_I_I_lsm.1750, %sfp
	ldr	s30, [sp, 832]	// acc_I_I_lsm.1748, %sfp
	fadd	s30, s30, s21	// acc_I_I_lsm.1748, acc_I_I_lsm.1748, tmp3462
	str	s30, [sp, 832]	// acc_I_I_lsm.1748, %sfp
	ldr	s30, [sp, 1024]	// acc_I_I_lsm.1746, %sfp
	fadd	s30, s30, s22	// acc_I_I_lsm.1746, acc_I_I_lsm.1746, tmp3463
	str	s30, [sp, 1024]	// acc_I_I_lsm.1746, %sfp
	ldr	s30, [sp, 1040]	// acc_I_I_lsm.1744, %sfp
	fadd	s30, s30, s23	// acc_I_I_lsm.1744, acc_I_I_lsm.1744, tmp3464
	str	s30, [sp, 1040]	// acc_I_I_lsm.1744, %sfp
	ldr	s30, [sp, 1056]	// acc_I_I_lsm.1742, %sfp
	fadd	s30, s30, s24	// acc_I_I_lsm.1742, acc_I_I_lsm.1742, tmp3465
	str	s30, [sp, 1056]	// acc_I_I_lsm.1742, %sfp
	ldr	s30, [sp, 416]	// acc_I_I_lsm.1740, %sfp
	fadd	s30, s30, s25	// acc_I_I_lsm.1740, acc_I_I_lsm.1740, tmp3466
	str	s30, [sp, 416]	// acc_I_I_lsm.1740, %sfp
	ldr	s30, [sp, 432]	// acc_I_I_lsm.1738, %sfp
	fadd	s30, s30, s26	// acc_I_I_lsm.1738, acc_I_I_lsm.1738, tmp3467
	str	s30, [sp, 432]	// acc_I_I_lsm.1738, %sfp
	ldr	s30, [sp, 456]	// acc_I_I_lsm.1736, %sfp
	fadd	s30, s30, s27	// acc_I_I_lsm.1736, acc_I_I_lsm.1736, tmp3468
	str	s30, [sp, 456]	// acc_I_I_lsm.1736, %sfp
	ldr	s30, [sp, 464]	// acc_I_I_lsm.1734, %sfp
	fadd	s30, s30, s14	// acc_I_I_lsm.1734, acc_I_I_lsm.1734, tmp3469
	str	s30, [sp, 464]	// acc_I_I_lsm.1734, %sfp
	ldr	s30, [sp, 472]	// acc_I_I_lsm.1732, %sfp
	fadd	s30, s30, s13	// acc_I_I_lsm.1732, acc_I_I_lsm.1732, tmp3470
	str	s30, [sp, 472]	// acc_I_I_lsm.1732, %sfp
	ldr	s30, [sp, 496]	// acc_I_I_lsm.1730, %sfp
	fadd	s30, s30, s12	// acc_I_I_lsm.1730, acc_I_I_lsm.1730, tmp3471
	str	s30, [sp, 496]	// acc_I_I_lsm.1730, %sfp
	ldr	s30, [sp, 480]	// acc_I_I_lsm.1728, %sfp
	fadd	s30, s30, s11	// acc_I_I_lsm.1728, acc_I_I_lsm.1728, tmp3472
	str	s30, [sp, 480]	// acc_I_I_lsm.1728, %sfp
	ldr	s30, [sp, 504]	// acc_I_I_lsm.1726, %sfp
	fadd	s30, s30, s10	// acc_I_I_lsm.1726, acc_I_I_lsm.1726, tmp3473
	str	s30, [sp, 504]	// acc_I_I_lsm.1726, %sfp
	ldr	s30, [sp, 512]	// acc_I_I_lsm.1724, %sfp
	fadd	s30, s30, s9	// acc_I_I_lsm.1724, acc_I_I_lsm.1724, tmp3474
	str	s30, [sp, 512]	// acc_I_I_lsm.1724, %sfp
	ldr	s30, [sp, 528]	// acc_I_I_lsm.1722, %sfp
	fadd	s30, s30, s8	// acc_I_I_lsm.1722, acc_I_I_lsm.1722, tmp3475
	str	s30, [sp, 528]	// acc_I_I_lsm.1722, %sfp
	ldr	s30, [sp, 544]	// acc_I_I_lsm.1720, %sfp
	fadd	s30, s30, s7	// acc_I_I_lsm.1720, acc_I_I_lsm.1720, tmp3476
	str	s30, [sp, 544]	// acc_I_I_lsm.1720, %sfp
	ldr	s30, [sp, 552]	// acc_I_I_lsm.1718, %sfp
	fadd	s30, s30, s6	// acc_I_I_lsm.1718, acc_I_I_lsm.1718, tmp3477
	str	s30, [sp, 552]	// acc_I_I_lsm.1718, %sfp
	ldr	s30, [sp, 560]	// acc_I_I_lsm.1716, %sfp
	ldr	s29, [sp, 256]	// tmp9109, %sfp
	fadd	s30, s30, s5	// acc_I_I_lsm.1716, acc_I_I_lsm.1716, tmp3478
	str	s30, [sp, 560]	// acc_I_I_lsm.1716, %sfp
	ldr	s30, [sp, 576]	// acc_I_I_lsm.1714, %sfp
	fadd	s30, s30, s4	// acc_I_I_lsm.1714, acc_I_I_lsm.1714, tmp3479
	str	s30, [sp, 576]	// acc_I_I_lsm.1714, %sfp
	ldr	s30, [sp, 592]	// acc_I_I_lsm.1712, %sfp
	fadd	s30, s30, s3	// acc_I_I_lsm.1712, acc_I_I_lsm.1712, tmp3480
	str	s30, [sp, 592]	// acc_I_I_lsm.1712, %sfp
	ldr	s30, [sp, 1456]	// acc_I_I_lsm.1710, %sfp
	fadd	s30, s30, s2	// acc_I_I_lsm.1710, acc_I_I_lsm.1710, tmp3481
	str	s30, [sp, 1456]	// acc_I_I_lsm.1710, %sfp
	ldr	s30, [sp, 624]	// acc_I_I_lsm.1708, %sfp
	fadd	s30, s30, s1	// acc_I_I_lsm.1708, acc_I_I_lsm.1708, tmp3482
	str	s30, [sp, 624]	// acc_I_I_lsm.1708, %sfp
	ldr	s30, [sp, 608]	// acc_I_I_lsm.1706, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1706, acc_I_I_lsm.1706, tmp9109
	ldr	s29, [sp, 272]	// tmp9112, %sfp
	str	s30, [sp, 608]	// acc_I_I_lsm.1706, %sfp
	ldr	s30, [sp, 640]	// acc_I_I_lsm.1704, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1704, acc_I_I_lsm.1704, tmp9112
	ldr	s29, [sp, 288]	// tmp9115, %sfp
	str	s30, [sp, 640]	// acc_I_I_lsm.1704, %sfp
	ldr	s30, [sp, 656]	// acc_I_I_lsm.1702, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1702, acc_I_I_lsm.1702, tmp9115
	ldr	s29, [sp, 304]	// tmp9118, %sfp
	str	s30, [sp, 656]	// acc_I_I_lsm.1702, %sfp
	ldr	s30, [sp, 672]	// acc_I_I_lsm.1700, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1700, acc_I_I_lsm.1700, tmp9118
	ldr	s29, [sp, 320]	// tmp9121, %sfp
	str	s30, [sp, 672]	// acc_I_I_lsm.1700, %sfp
	ldr	s30, [sp, 688]	// acc_I_I_lsm.1698, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1698, acc_I_I_lsm.1698, tmp9121
	ldr	s29, [sp, 336]	// tmp9124, %sfp
	str	s30, [sp, 688]	// acc_I_I_lsm.1698, %sfp
	ldr	s30, [sp, 720]	// acc_I_I_lsm.1696, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1696, acc_I_I_lsm.1696, tmp9124
	ldr	s29, [sp, 352]	// tmp9127, %sfp
	str	s30, [sp, 720]	// acc_I_I_lsm.1696, %sfp
	ldr	s30, [sp, 704]	// acc_I_I_lsm.1694, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1694, acc_I_I_lsm.1694, tmp9127
	str	s30, [sp, 704]	// acc_I_I_lsm.1694, %sfp
	ldr	s30, [sp, 736]	// acc_I_I_lsm.1692, %sfp
	ldr	s29, [sp, 368]	// tmp9130, %sfp
	ldr	s31, [sp, 1072]	// tmp9154, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1692, acc_I_I_lsm.1692, tmp9130
	ldr	s29, [sp, 384]	// tmp9133, %sfp
	str	s30, [sp, 736]	// acc_I_I_lsm.1692, %sfp
	ldr	s30, [sp, 752]	// acc_I_I_lsm.1690, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1690, acc_I_I_lsm.1690, tmp9133
	ldr	s29, [sp, 400]	// tmp9136, %sfp
	str	s30, [sp, 752]	// acc_I_I_lsm.1690, %sfp
	ldr	s30, [sp, 784]	// acc_I_I_lsm.1688, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1688, acc_I_I_lsm.1688, tmp9136
	ldr	s29, [sp, 1152]	// tmp9139, %sfp
	str	s30, [sp, 784]	// acc_I_I_lsm.1688, %sfp
	ldr	s30, [sp, 768]	// acc_I_I_lsm.1686, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1686, acc_I_I_lsm.1686, tmp9139
	ldr	s29, [sp, 1136]	// tmp9142, %sfp
	str	s30, [sp, 768]	// acc_I_I_lsm.1686, %sfp
	ldr	s30, [sp, 816]	// acc_I_I_lsm.1684, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1684, acc_I_I_lsm.1684, tmp9142
	ldr	s29, [sp, 1120]	// tmp9145, %sfp
	str	s30, [sp, 816]	// acc_I_I_lsm.1684, %sfp
	ldr	s30, [sp, 848]	// acc_I_I_lsm.1682, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1682, acc_I_I_lsm.1682, tmp9145
	ldr	s29, [sp, 1104]	// tmp9148, %sfp
	str	s30, [sp, 848]	// acc_I_I_lsm.1682, %sfp
	ldr	s30, [sp, 864]	// acc_I_I_lsm.1680, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1680, acc_I_I_lsm.1680, tmp9148
	ldr	s29, [sp, 1088]	// tmp9151, %sfp
	str	s30, [sp, 864]	// acc_I_I_lsm.1680, %sfp
	ldr	s30, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1678, acc_I_I_lsm.1678, tmp9151
	str	s30, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	ldr	s30, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	fadd	s31, s30, s31	// acc_I_I_lsm.1676, acc_I_I_lsm.1676, tmp9154
	str	s31, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	ldr	s31, [sp, 192]	// acc_I_I_lsm.1674, %sfp
	fadd	s31, s31, s0	// acc_I_I_lsm.1674, acc_I_I_lsm.1674, tmp3499
	str	s31, [sp, 192]	// acc_I_I_lsm.1674, %sfp
	cmp	w24, w30	// KW, kw
	beq	.L751		//,
.L749:
	ldr	x13, [sp, 1528]	// ivtmp.4701, %sfp
	add	x16, x3, x13	// _10468, ivtmp.4612, ivtmp.4701
	add	x16, x16, x14	// _1102, _10468, ivtmp.4549
	add	x13, x28, x16, lsl 2	// _1783, in_ptr, _1102,
	ldr	s13, [x28, x16, lsl 2]	// D__lsm0.3672, *_1783
	ldr	s28, [x13, 56]	// D__lsm6.3671, MEM[(const float *)_1783 + 56B]
	ldp	s18, s17, [x13, 4]	// D__lsm1.3673, D__lsm2.3674,
	ldp	s20, s19, [x13, 12]	// D__lsm3.3675, D__lsm4.3676,
	ldp	s21, s27, [x13, 20]	// D__lsm5.3677, D__lsm6.3678,
	ldp	s14, s22, [x13, 32]	// D__lsm0.3665, D__lsm1.3666,
	ldp	s24, s23, [x13, 40]	// D__lsm2.3667, D__lsm3.3668,
	ldp	s26, s25, [x13, 48]	// D__lsm4.3669, D__lsm5.3670,
.L752:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s29, [x12, x14, lsl 2]	// _5481, MEM[(const float *)_3121 + ivtmp.4549_3109 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	s12, [sp, 768]	// acc_I_I_lsm.1686, %sfp
	ldr	s16, [sp, 192]	// acc_I_I_lsm.1674, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x13, [sp, 1464]	// ivtmp.4615, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s12, s17, s29, s12	// acc_I_I_lsm.1686, D__lsm2.3674, _5481, acc_I_I_lsm.1686
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s30, [x17, x14, lsl 2]	// _3807, MEM[(const float *)_3131 + ivtmp.4549_3109 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s16, s13, s29, s16	// acc_I_I_lsm.1674, D__lsm0.3672, _5481, acc_I_I_lsm.1674
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s31, [x20, x14, lsl 2]	// _3949, MEM[(const float *)_3133 + ivtmp.4549_3109 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s15, [x15, x14, lsl 2]	// xv, MEM[(const float *)_5231 + ivtmp.4549_3109 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s12, [sp, 768]	// acc_I_I_lsm.1686, %sfp
	ldr	s12, [sp, 464]	// acc_I_I_lsm.1734, %sfp
	str	s16, [sp, 192]	// acc_I_I_lsm.1674, %sfp
	ldr	s16, [sp, 528]	// acc_I_I_lsm.1722, %sfp
	fmadd	s12, s24, s29, s12	// acc_I_I_lsm.1734, D__lsm2.3667, _5481, acc_I_I_lsm.1734
	fmadd	s16, s14, s29, s16	// acc_I_I_lsm.1722, D__lsm0.3665, _5481, acc_I_I_lsm.1722
	str	s12, [sp, 464]	// acc_I_I_lsm.1734, %sfp
	ldr	s12, [sp, 736]	// acc_I_I_lsm.1692, %sfp
	str	s16, [sp, 528]	// acc_I_I_lsm.1722, %sfp
	ldr	s16, [sp, 864]	// acc_I_I_lsm.1680, %sfp
	fmadd	s12, s20, s29, s12	// acc_I_I_lsm.1692, D__lsm3.3675, _5481, acc_I_I_lsm.1692
	fmadd	s16, s18, s29, s16	// acc_I_I_lsm.1680, D__lsm1.3673, _5481, acc_I_I_lsm.1680
	str	s12, [sp, 736]	// acc_I_I_lsm.1692, %sfp
	ldr	s12, [sp, 416]	// acc_I_I_lsm.1740, %sfp
	str	s16, [sp, 864]	// acc_I_I_lsm.1680, %sfp
	ldr	s16, [sp, 480]	// acc_I_I_lsm.1728, %sfp
	fmadd	s12, s23, s29, s12	// acc_I_I_lsm.1740, D__lsm3.3668, _5481, acc_I_I_lsm.1740
	fmadd	s16, s22, s29, s16	// acc_I_I_lsm.1728, D__lsm1.3666, _5481, acc_I_I_lsm.1728
	str	s12, [sp, 416]	// acc_I_I_lsm.1740, %sfp
	ldr	s12, [sp, 688]	// acc_I_I_lsm.1698, %sfp
	str	s16, [sp, 480]	// acc_I_I_lsm.1728, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s16, [x13, x14, lsl 2]	// xv, MEM[(const float *)_5236 + ivtmp.4549_3109 * 4]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	x14, x14, 1	// ivtmp.4549, ivtmp.4549,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s12, s19, s29, s12	// acc_I_I_lsm.1698, D__lsm4.3676, _5481, acc_I_I_lsm.1698
	str	s12, [sp, 688]	// acc_I_I_lsm.1698, %sfp
	ldr	s12, [sp, 1024]	// acc_I_I_lsm.1746, %sfp
	fmadd	s12, s26, s29, s12	// acc_I_I_lsm.1746, D__lsm4.3669, _5481, acc_I_I_lsm.1746
	str	s12, [sp, 1024]	// acc_I_I_lsm.1746, %sfp
	ldr	s12, [sp, 640]	// acc_I_I_lsm.1704, %sfp
	fmadd	s12, s21, s29, s12	// acc_I_I_lsm.1704, D__lsm5.3677, _5481, acc_I_I_lsm.1704
	str	s12, [sp, 640]	// acc_I_I_lsm.1704, %sfp
	ldr	s12, [sp, 800]	// acc_I_I_lsm.1752, %sfp
	fmadd	s12, s25, s29, s12	// acc_I_I_lsm.1752, D__lsm5.3670, _5481, acc_I_I_lsm.1752
	str	s12, [sp, 800]	// acc_I_I_lsm.1752, %sfp
	ldr	s12, [sp, 1456]	// acc_I_I_lsm.1710, %sfp
	fmadd	s12, s27, s29, s12	// acc_I_I_lsm.1710, D__lsm6.3678, _5481, acc_I_I_lsm.1710
	str	s12, [sp, 1456]	// acc_I_I_lsm.1710, %sfp
	ldr	s12, [sp, 976]	// acc_I_I_lsm.1758, %sfp
	fmadd	s12, s28, s29, s12	// acc_I_I_lsm.1758, D__lsm6.3671, _5481, acc_I_I_lsm.1758
	str	s12, [sp, 976]	// acc_I_I_lsm.1758, %sfp
	ldr	s12, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	fmadd	s12, s30, s13, s12	// acc_I_I_lsm.1676, _3807, D__lsm0.3672, acc_I_I_lsm.1676
	str	s12, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	ldr	s12, [sp, 512]	// acc_I_I_lsm.1724, %sfp
	fmadd	s12, s30, s14, s12	// acc_I_I_lsm.1724, _3807, D__lsm0.3665, acc_I_I_lsm.1724
	str	s12, [sp, 512]	// acc_I_I_lsm.1724, %sfp
	ldr	s12, [sp, 848]	// acc_I_I_lsm.1682, %sfp
	fmadd	s12, s30, s18, s12	// acc_I_I_lsm.1682, _3807, D__lsm1.3673, acc_I_I_lsm.1682
	str	s12, [sp, 848]	// acc_I_I_lsm.1682, %sfp
	ldr	s12, [sp, 496]	// acc_I_I_lsm.1730, %sfp
	fmadd	s12, s30, s22, s12	// acc_I_I_lsm.1730, _3807, D__lsm1.3666, acc_I_I_lsm.1730
	str	s12, [sp, 496]	// acc_I_I_lsm.1730, %sfp
	ldr	s12, [sp, 784]	// acc_I_I_lsm.1688, %sfp
	fmadd	s12, s30, s17, s12	// acc_I_I_lsm.1688, _3807, D__lsm2.3674, acc_I_I_lsm.1688
	str	s12, [sp, 784]	// acc_I_I_lsm.1688, %sfp
	ldr	s12, [sp, 456]	// acc_I_I_lsm.1736, %sfp
	fmadd	s12, s30, s24, s12	// acc_I_I_lsm.1736, _3807, D__lsm2.3667, acc_I_I_lsm.1736
	str	s12, [sp, 456]	// acc_I_I_lsm.1736, %sfp
	ldr	s12, [sp, 704]	// acc_I_I_lsm.1694, %sfp
	fmadd	s12, s30, s20, s12	// acc_I_I_lsm.1694, _3807, D__lsm3.3675, acc_I_I_lsm.1694
	str	s12, [sp, 704]	// acc_I_I_lsm.1694, %sfp
	ldr	s12, [sp, 1056]	// acc_I_I_lsm.1742, %sfp
	fmadd	s12, s30, s23, s12	// acc_I_I_lsm.1742, _3807, D__lsm3.3668, acc_I_I_lsm.1742
	str	s12, [sp, 1056]	// acc_I_I_lsm.1742, %sfp
	ldr	s12, [sp, 672]	// acc_I_I_lsm.1700, %sfp
	fmadd	s12, s30, s19, s12	// acc_I_I_lsm.1700, _3807, D__lsm4.3676, acc_I_I_lsm.1700
	str	s12, [sp, 672]	// acc_I_I_lsm.1700, %sfp
	ldr	s12, [sp, 832]	// acc_I_I_lsm.1748, %sfp
	fmadd	s12, s30, s26, s12	// acc_I_I_lsm.1748, _3807, D__lsm4.3669, acc_I_I_lsm.1748
	str	s12, [sp, 832]	// acc_I_I_lsm.1748, %sfp
	ldr	s12, [sp, 608]	// acc_I_I_lsm.1706, %sfp
	fmadd	s12, s30, s21, s12	// acc_I_I_lsm.1706, _3807, D__lsm5.3677, acc_I_I_lsm.1706
	str	s12, [sp, 608]	// acc_I_I_lsm.1706, %sfp
	ldr	s12, [sp, 944]	// acc_I_I_lsm.1754, %sfp
	fmadd	s12, s30, s25, s12	// acc_I_I_lsm.1754, _3807, D__lsm5.3670, acc_I_I_lsm.1754
	str	s12, [sp, 944]	// acc_I_I_lsm.1754, %sfp
	ldr	s12, [sp, 592]	// acc_I_I_lsm.1712, %sfp
	fmadd	s12, s30, s27, s12	// acc_I_I_lsm.1712, _3807, D__lsm6.3678, acc_I_I_lsm.1712
	str	s12, [sp, 592]	// acc_I_I_lsm.1712, %sfp
	ldr	s12, [sp, 960]	// acc_I_I_lsm.1760, %sfp
	fmadd	s12, s30, s28, s12	// acc_I_I_lsm.1760, _3807, D__lsm6.3671, acc_I_I_lsm.1760
	str	s12, [sp, 960]	// acc_I_I_lsm.1760, %sfp
	ldr	s12, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	fmadd	s13, s13, s31, s12	// acc_I_I_lsm.1678, D__lsm0.3672, _3949, acc_I_I_lsm.1678
	str	s13, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	ldr	s13, [sp, 504]	// acc_I_I_lsm.1726, %sfp
	fmadd	s14, s14, s31, s13	// acc_I_I_lsm.1726, D__lsm0.3665, _3949, acc_I_I_lsm.1726
	fmov	s13, s18	// D__lsm0.3672, D__lsm1.3673
	str	s14, [sp, 504]	// acc_I_I_lsm.1726, %sfp
	ldr	s14, [sp, 816]	// acc_I_I_lsm.1684, %sfp
	fmadd	s14, s18, s31, s14	// acc_I_I_lsm.1684, D__lsm1.3673, _3949, acc_I_I_lsm.1684
	fmov	s18, s17	// D__lsm1.3673, D__lsm2.3674
	str	s14, [sp, 816]	// acc_I_I_lsm.1684, %sfp
	ldr	s14, [sp, 472]	// acc_I_I_lsm.1732, %sfp
	fmadd	s14, s22, s31, s14	// acc_I_I_lsm.1732, D__lsm1.3666, _3949, acc_I_I_lsm.1732
	str	s14, [sp, 472]	// acc_I_I_lsm.1732, %sfp
	ldr	s14, [sp, 752]	// acc_I_I_lsm.1690, %sfp
	fmadd	s14, s17, s31, s14	// acc_I_I_lsm.1690, D__lsm2.3674, _3949, acc_I_I_lsm.1690
	fmov	s17, s20	// D__lsm2.3674, D__lsm3.3675
	str	s14, [sp, 752]	// acc_I_I_lsm.1690, %sfp
	ldr	s14, [sp, 432]	// acc_I_I_lsm.1738, %sfp
	fmadd	s14, s24, s31, s14	// acc_I_I_lsm.1738, D__lsm2.3667, _3949, acc_I_I_lsm.1738
	str	s14, [sp, 432]	// acc_I_I_lsm.1738, %sfp
	ldr	s14, [sp, 720]	// acc_I_I_lsm.1696, %sfp
	fmadd	s14, s20, s31, s14	// acc_I_I_lsm.1696, D__lsm3.3675, _3949, acc_I_I_lsm.1696
	fmov	s20, s19	// D__lsm3.3675, D__lsm4.3676
	str	s14, [sp, 720]	// acc_I_I_lsm.1696, %sfp
	ldr	s14, [sp, 1040]	// acc_I_I_lsm.1744, %sfp
	fmadd	s14, s23, s31, s14	// acc_I_I_lsm.1744, D__lsm3.3668, _3949, acc_I_I_lsm.1744
	str	s14, [sp, 1040]	// acc_I_I_lsm.1744, %sfp
	fmov	s14, s22	// D__lsm0.3665, D__lsm1.3666
	ldr	s22, [sp, 656]	// acc_I_I_lsm.1702, %sfp
	fmadd	s22, s19, s31, s22	// acc_I_I_lsm.1702, D__lsm4.3676, _3949, acc_I_I_lsm.1702
	fmov	s19, s21	// D__lsm4.3676, D__lsm5.3677
	str	s22, [sp, 656]	// acc_I_I_lsm.1702, %sfp
	fmov	s22, s24	// D__lsm1.3666, D__lsm2.3667
	ldr	s24, [sp, 1008]	// acc_I_I_lsm.1750, %sfp
	fmadd	s24, s26, s31, s24	// acc_I_I_lsm.1750, D__lsm4.3669, _3949, acc_I_I_lsm.1750
	str	s24, [sp, 1008]	// acc_I_I_lsm.1750, %sfp
	fmov	s24, s23	// D__lsm2.3667, D__lsm3.3668
	ldr	s23, [sp, 624]	// acc_I_I_lsm.1708, %sfp
	fmadd	s23, s21, s31, s23	// acc_I_I_lsm.1708, D__lsm5.3677, _3949, acc_I_I_lsm.1708
	fmov	s21, s27	// D__lsm5.3677, D__lsm6.3678
	str	s23, [sp, 624]	// acc_I_I_lsm.1708, %sfp
	ldr	s23, [sp, 992]	// acc_I_I_lsm.1756, %sfp
	fmadd	s23, s25, s31, s23	// acc_I_I_lsm.1756, D__lsm5.3670, _3949, acc_I_I_lsm.1756
	str	s23, [sp, 992]	// acc_I_I_lsm.1756, %sfp
	fmov	s23, s26	// D__lsm3.3668, D__lsm4.3669
	ldr	s26, [sp, 576]	// acc_I_I_lsm.1714, %sfp
	fmadd	s26, s27, s31, s26	// acc_I_I_lsm.1714, D__lsm6.3678, _3949, acc_I_I_lsm.1714
	str	s26, [sp, 576]	// acc_I_I_lsm.1714, %sfp
	ldr	s26, [sp, 896]	// acc_I_I_lsm.1762, %sfp
	fmadd	s26, s28, s31, s26	// acc_I_I_lsm.1762, D__lsm6.3671, _3949, acc_I_I_lsm.1762
	str	s26, [sp, 896]	// acc_I_I_lsm.1762, %sfp
	fmov	s26, s25	// D__lsm4.3669, D__lsm5.3670
	ldr	s25, [sp, 560]	// acc_I_I_lsm.1716, %sfp
	fmadd	s25, s15, s29, s25	// acc_I_I_lsm.1716, xv, _5481, acc_I_I_lsm.1716
	str	s25, [sp, 560]	// acc_I_I_lsm.1716, %sfp
	fmov	s25, s28	// D__lsm5.3670, D__lsm6.3671
	ldr	s28, [sp, 552]	// acc_I_I_lsm.1718, %sfp
	fmadd	s28, s15, s30, s28	// acc_I_I_lsm.1718, xv, _3807, acc_I_I_lsm.1718
	str	s28, [sp, 552]	// acc_I_I_lsm.1718, %sfp
	ldr	s28, [sp, 544]	// acc_I_I_lsm.1720, %sfp
	fmadd	s28, s15, s31, s28	// acc_I_I_lsm.1720, xv, _3949, acc_I_I_lsm.1720
	str	s28, [sp, 544]	// acc_I_I_lsm.1720, %sfp
	ldr	s28, [sp, 912]	// acc_I_I_lsm.1764, %sfp
	fmadd	s29, s29, s16, s28	// acc_I_I_lsm.1764, _5481, xv, acc_I_I_lsm.1764
	str	s29, [sp, 912]	// acc_I_I_lsm.1764, %sfp
	ldr	s29, [sp, 928]	// acc_I_I_lsm.1766, %sfp
	fmadd	s30, s30, s16, s29	// acc_I_I_lsm.1766, _3807, xv, acc_I_I_lsm.1766
	str	s30, [sp, 928]	// acc_I_I_lsm.1766, %sfp
	ldr	s30, [sp, 880]	// acc_I_I_lsm.1768, %sfp
	fmadd	s31, s31, s16, s30	// acc_I_I_lsm.1768, _3949, xv, acc_I_I_lsm.1768
	str	s31, [sp, 880]	// acc_I_I_lsm.1768, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w24, w14	// KW, ivtmp.4549
	ble	.L751		//,
	fmov	s27, s15	// D__lsm6.3678, xv
	fmov	s28, s16	// D__lsm6.3671, xv
	b	.L752		//
	.p2align 2,,3
.L913:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x14, 0	//,
	b	.L749		//
	.p2align 2,,3
.L751:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w13, 1	// acc_I_I_lsm_flag.1675,
	str	w13, [sp, 224]	// acc_I_I_lsm_flag.1675, %sfp
.L748:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x14, [sp, 1592]	// IW, %sfp
	add	x12, x12, x22	// ivtmp.4607, ivtmp.4607, _6134
	add	x17, x17, x22	// ivtmp.4609, ivtmp.4609, _6134
	add	x20, x20, x22	// ivtmp.4611, ivtmp.4611, _6134
	add	x15, x15, x27	// ivtmp.4613, ivtmp.4613, _9799
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w13, [sp, 1504]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x9, x9, x22	// ivtmp.4616, ivtmp.4616, _6134
	add	x10, x10, x22	// ivtmp.4617, ivtmp.4617, _6134
	add	x11, x11, x22	// ivtmp.4618, ivtmp.4618, _6134
	add	x0, x0, x27	// ivtmp.4619, ivtmp.4619, _9799
	add	x2, x2, x27	// ivtmp.4621, ivtmp.4621, _9799
	add	x3, x3, x14	// ivtmp.4612, ivtmp.4612, IW
	ldr	x14, [sp, 1464]	// ivtmp.4615, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w13, w13, 1	// kh, kh,
	str	w13, [sp, 1504]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x14, x14, x27	// ivtmp.4615, ivtmp.4615, _9799
	str	x14, [sp, 1464]	// ivtmp.4615, %sfp
	ldr	w14, [sp, 1552]	//, %sfp
	cmp	w14, w13	// KH, kh
	bne	.L753		//,
.L747:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 1608]	// _8876, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w26, w26, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x4, x4, x0	// ivtmp.4646, ivtmp.4646, _8876
	add	x8, x8, x0	// ivtmp.4648, ivtmp.4648, _8876
	add	x7, x7, x0	// ivtmp.4650, ivtmp.4650, _8876
	ldr	x0, [sp, 1520]	// _8015, %sfp
	add	x25, x25, x0	// ivtmp.4651, ivtmp.4651, _8015
	ldr	x0, [sp, 1600]	// _7033, %sfp
	add	x5, x5, x0	// ivtmp.4652, ivtmp.4652, _7033
	add	x6, x6, x0	// ivtmp.4655, ivtmp.4655, _7033
	cmp	w21, w26	// IC, ic
	bne	.L754		//,
	add	x15, sp, 1712	//,,
	add	x17, sp, 1752	//,,
	ldr	w4, [sp, 224]	//, %sfp
	ldp	x0, x2, [x15]	// _565, ivtmp.4673,
	mov	x3, x23	// ivtmp.4702, ivtmp.4702
	mov	x16, x18	// ivtmp.4703, ivtmp.4703
	mov	x14, x19	// _11857, _11857
	mov	x13, x1	// _9392, _9392
	ldp	x10, x9, [x15, 24]	// ivtmp.4675, ivtmp.4677,
	ldp	x20, x19, [x17, 16]	// _8016, ivtmp.4687,
	ldp	x15, x23, [x17]	// _8011, _8014,
	ldr	x11, [sp, 1784]	// ivtmp.4688, %sfp
	ldr	x18, [sp, 1792]	// ivtmp.4700, %sfp
	ldr	x17, [sp, 1800]	// _11848, %sfp
	ldr	w1, [sp, 1704]	//, %sfp
	ldr	w12, [sp, 1728]	//, %sfp
	cbz	w4, .L756	// acc_I_I_lsm_flag.1675,
	ldr	s31, [sp, 1456]	// acc_I_I_lsm.1710, %sfp
	str	s31, [sp, 1864]	// acc_I_I_lsm.1710, MEM[(float[3][16] *)_520][0][6]
	ldr	s31, [sp, 560]	// acc_I_I_lsm.1716, %sfp
	str	s31, [sp, 1868]	// acc_I_I_lsm.1716, MEM[(float[3][16] *)_520][0][7]
	ldr	s31, [sp, 528]	// acc_I_I_lsm.1722, %sfp
	str	s31, [sp, 1872]	// acc_I_I_lsm.1722, MEM[(float[3][16] *)_520][0][8]
	ldr	s31, [sp, 480]	// acc_I_I_lsm.1728, %sfp
	str	s31, [sp, 1876]	// acc_I_I_lsm.1728, MEM[(float[3][16] *)_520][0][9]
	ldr	s31, [sp, 464]	// acc_I_I_lsm.1734, %sfp
	str	s31, [sp, 1880]	// acc_I_I_lsm.1734, MEM[(float[3][16] *)_520][0][10]
	ldr	s31, [sp, 416]	// acc_I_I_lsm.1740, %sfp
	str	s31, [sp, 1884]	// acc_I_I_lsm.1740, MEM[(float[3][16] *)_520][0][11]
	ldr	s31, [sp, 1024]	// acc_I_I_lsm.1746, %sfp
	str	s31, [sp, 1888]	// acc_I_I_lsm.1746, MEM[(float[3][16] *)_520][0][12]
	ldr	s31, [sp, 800]	// acc_I_I_lsm.1752, %sfp
	str	s31, [sp, 1892]	// acc_I_I_lsm.1752, MEM[(float[3][16] *)_520][0][13]
	ldr	s31, [sp, 976]	// acc_I_I_lsm.1758, %sfp
	str	s31, [sp, 1896]	// acc_I_I_lsm.1758, MEM[(float[3][16] *)_520][0][14]
	ldr	s31, [sp, 912]	// acc_I_I_lsm.1764, %sfp
	str	s31, [sp, 1900]	// acc_I_I_lsm.1764, MEM[(float[3][16] *)_520][0][15]
	ldr	s31, [sp, 608]	// acc_I_I_lsm.1706, %sfp
	str	s31, [sp, 1924]	// acc_I_I_lsm.1706, MEM[(float[3][16] *)_520][1][5]
	ldr	s31, [sp, 592]	// acc_I_I_lsm.1712, %sfp
	str	s31, [sp, 1928]	// acc_I_I_lsm.1712, MEM[(float[3][16] *)_520][1][6]
	ldr	s31, [sp, 552]	// acc_I_I_lsm.1718, %sfp
	str	s31, [sp, 1932]	// acc_I_I_lsm.1718, MEM[(float[3][16] *)_520][1][7]
	ldr	s31, [sp, 512]	// acc_I_I_lsm.1724, %sfp
	str	s31, [sp, 1936]	// acc_I_I_lsm.1724, MEM[(float[3][16] *)_520][1][8]
	ldr	s31, [sp, 496]	// acc_I_I_lsm.1730, %sfp
	str	s31, [sp, 1940]	// acc_I_I_lsm.1730, MEM[(float[3][16] *)_520][1][9]
	ldr	s31, [sp, 456]	// acc_I_I_lsm.1736, %sfp
	str	s31, [sp, 1944]	// acc_I_I_lsm.1736, MEM[(float[3][16] *)_520][1][10]
	ldr	s31, [sp, 1056]	// acc_I_I_lsm.1742, %sfp
	str	s31, [sp, 1948]	// acc_I_I_lsm.1742, MEM[(float[3][16] *)_520][1][11]
	ldr	s31, [sp, 832]	// acc_I_I_lsm.1748, %sfp
	str	s31, [sp, 1952]	// acc_I_I_lsm.1748, MEM[(float[3][16] *)_520][1][12]
	ldr	s31, [sp, 944]	// acc_I_I_lsm.1754, %sfp
	str	s31, [sp, 1956]	// acc_I_I_lsm.1754, MEM[(float[3][16] *)_520][1][13]
	ldr	s31, [sp, 960]	// acc_I_I_lsm.1760, %sfp
	str	s31, [sp, 1960]	// acc_I_I_lsm.1760, MEM[(float[3][16] *)_520][1][14]
	ldr	s31, [sp, 928]	// acc_I_I_lsm.1766, %sfp
	str	s31, [sp, 1964]	// acc_I_I_lsm.1766, MEM[(float[3][16] *)_520][1][15]
	ldr	s31, [sp, 624]	// acc_I_I_lsm.1708, %sfp
	str	s31, [sp, 1988]	// acc_I_I_lsm.1708, MEM[(float[3][16] *)_520][2][5]
	ldr	s31, [sp, 576]	// acc_I_I_lsm.1714, %sfp
	str	s31, [sp, 1992]	// acc_I_I_lsm.1714, MEM[(float[3][16] *)_520][2][6]
	ldr	s31, [sp, 544]	// acc_I_I_lsm.1720, %sfp
	str	s31, [sp, 1996]	// acc_I_I_lsm.1720, MEM[(float[3][16] *)_520][2][7]
	ldr	s31, [sp, 504]	// acc_I_I_lsm.1726, %sfp
	str	s31, [sp, 2000]	// acc_I_I_lsm.1726, MEM[(float[3][16] *)_520][2][8]
	ldr	s31, [sp, 472]	// acc_I_I_lsm.1732, %sfp
	str	s31, [sp, 2004]	// acc_I_I_lsm.1732, MEM[(float[3][16] *)_520][2][9]
	ldr	s31, [sp, 432]	// acc_I_I_lsm.1738, %sfp
	str	s31, [sp, 2008]	// acc_I_I_lsm.1738, MEM[(float[3][16] *)_520][2][10]
	ldr	s31, [sp, 1040]	// acc_I_I_lsm.1744, %sfp
	str	s31, [sp, 2012]	// acc_I_I_lsm.1744, MEM[(float[3][16] *)_520][2][11]
	ldr	s31, [sp, 1008]	// acc_I_I_lsm.1750, %sfp
	str	s31, [sp, 2016]	// acc_I_I_lsm.1750, MEM[(float[3][16] *)_520][2][12]
	ldr	s31, [sp, 992]	// acc_I_I_lsm.1756, %sfp
	str	s31, [sp, 2020]	// acc_I_I_lsm.1756, MEM[(float[3][16] *)_520][2][13]
	ldr	s31, [sp, 896]	// acc_I_I_lsm.1762, %sfp
	str	s31, [sp, 2024]	// acc_I_I_lsm.1762, MEM[(float[3][16] *)_520][2][14]
	ldr	s31, [sp, 880]	// acc_I_I_lsm.1768, %sfp
	str	s31, [sp, 2028]	// acc_I_I_lsm.1768, MEM[(float[3][16] *)_520][2][15]
	ldr	s31, [sp, 640]	// acc_I_I_lsm.1704, %sfp
	str	s31, [sp, 1860]	// acc_I_I_lsm.1704, MEM[(float[3][16] *)_520][0][5]
	ldr	s31, [sp, 192]	// acc_I_I_lsm.1674, %sfp
	str	s31, [sp, 1840]	// acc_I_I_lsm.1674, MEM[(float[3][16] *)_520][0][0]
	ldr	s31, [sp, 864]	// acc_I_I_lsm.1680, %sfp
	str	s31, [sp, 1844]	// acc_I_I_lsm.1680, MEM[(float[3][16] *)_520][0][1]
	ldr	s31, [sp, 768]	// acc_I_I_lsm.1686, %sfp
	str	s31, [sp, 1848]	// acc_I_I_lsm.1686, MEM[(float[3][16] *)_520][0][2]
	ldr	s31, [sp, 736]	// acc_I_I_lsm.1692, %sfp
	str	s31, [sp, 1852]	// acc_I_I_lsm.1692, MEM[(float[3][16] *)_520][0][3]
	ldr	s31, [sp, 688]	// acc_I_I_lsm.1698, %sfp
	str	s31, [sp, 1856]	// acc_I_I_lsm.1698, MEM[(float[3][16] *)_520][0][4]
	ldr	s31, [sp, 176]	// acc_I_I_lsm.1676, %sfp
	str	s31, [sp, 1904]	// acc_I_I_lsm.1676, MEM[(float[3][16] *)_520][1][0]
	ldr	s31, [sp, 848]	// acc_I_I_lsm.1682, %sfp
	str	s31, [sp, 1908]	// acc_I_I_lsm.1682, MEM[(float[3][16] *)_520][1][1]
	ldr	s31, [sp, 784]	// acc_I_I_lsm.1688, %sfp
	str	s31, [sp, 1912]	// acc_I_I_lsm.1688, MEM[(float[3][16] *)_520][1][2]
	ldr	s31, [sp, 704]	// acc_I_I_lsm.1694, %sfp
	str	s31, [sp, 1916]	// acc_I_I_lsm.1694, MEM[(float[3][16] *)_520][1][3]
	ldr	s31, [sp, 672]	// acc_I_I_lsm.1700, %sfp
	str	s31, [sp, 1920]	// acc_I_I_lsm.1700, MEM[(float[3][16] *)_520][1][4]
	ldr	s31, [sp, 216]	// acc_I_I_lsm.1678, %sfp
	str	s31, [sp, 1968]	// acc_I_I_lsm.1678, MEM[(float[3][16] *)_520][2][0]
	ldr	s31, [sp, 816]	// acc_I_I_lsm.1684, %sfp
	str	s31, [sp, 1972]	// acc_I_I_lsm.1684, MEM[(float[3][16] *)_520][2][1]
	ldr	s31, [sp, 752]	// acc_I_I_lsm.1690, %sfp
	str	s31, [sp, 1976]	// acc_I_I_lsm.1690, MEM[(float[3][16] *)_520][2][2]
	ldr	s31, [sp, 720]	// acc_I_I_lsm.1696, %sfp
	str	s31, [sp, 1980]	// acc_I_I_lsm.1696, MEM[(float[3][16] *)_520][2][3]
	ldr	s31, [sp, 656]	// acc_I_I_lsm.1702, %sfp
	str	s31, [sp, 1984]	// acc_I_I_lsm.1702, MEM[(float[3][16] *)_520][2][4]
.L756:
	cmp	w1, 0	// OW,
	ble	.L757		//,
	cmp	w1, 1	// OW,
	beq	.L1196		//,
	cmp	w1, 2	// OW,
	beq	.L1197		//,
	add	x4, sp, 1840	// ivtmp.4544,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x5, x10	// ivtmp.4545, ivtmp.4675
.L765:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x4]	// tmp9319, MEM <vector(2) float> [(float *)_5844]
	str	d31, [x5]	// tmp9319, MEM <vector(2) float> [(float *)_5804]
	ldr	s31, [x4, 8]	// tmp9320, MEM[(float *)_5844 + 8B]
	str	s31, [x5, 8]	// tmp9320, MEM[(float *)_5804 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 3	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 12]	// tmp9321, MEM[(float *)_5844 + 12B]
	str	s31, [x5, 12]	// tmp9321, MEM[(float *)_5804 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 4	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 16]	// tmp9322, MEM[(float *)_5844 + 16B]
	str	s31, [x5, 16]	// tmp9322, MEM[(float *)_5804 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 5	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 20]	// tmp9323, MEM[(float *)_5844 + 20B]
	str	s31, [x5, 20]	// tmp9323, MEM[(float *)_5804 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 6	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 24]	// tmp9324, MEM[(float *)_5844 + 24B]
	str	s31, [x5, 24]	// tmp9324, MEM[(float *)_5804 + 24B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 7	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 28]	// tmp9325, MEM[(float *)_5844 + 28B]
	str	s31, [x5, 28]	// tmp9325, MEM[(float *)_5804 + 28B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 8	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 32]	// tmp9326, MEM[(float *)_5844 + 32B]
	str	s31, [x5, 32]	// tmp9326, MEM[(float *)_5804 + 32B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 9	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 36]	// tmp9327, MEM[(float *)_5844 + 36B]
	str	s31, [x5, 36]	// tmp9327, MEM[(float *)_5804 + 36B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 10	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 40]	// tmp9328, MEM[(float *)_5844 + 40B]
	str	s31, [x5, 40]	// tmp9328, MEM[(float *)_5804 + 40B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 11	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 44]	// tmp9329, MEM[(float *)_5844 + 44B]
	str	s31, [x5, 44]	// tmp9329, MEM[(float *)_5804 + 44B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 12	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 48]	// tmp9330, MEM[(float *)_5844 + 48B]
	str	s31, [x5, 48]	// tmp9330, MEM[(float *)_5804 + 48B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 13	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 52]	// tmp9331, MEM[(float *)_5844 + 52B]
	str	s31, [x5, 52]	// tmp9331, MEM[(float *)_5804 + 52B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 14	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 56]	// tmp9332, MEM[(float *)_5844 + 56B]
	str	s31, [x5, 56]	// tmp9332, MEM[(float *)_5804 + 56B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w1, 15	// OW,
	beq	.L763		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x4, 60]	// tmp9333, MEM[(float *)_5844 + 60B]
	str	s31, [x5, 60]	// tmp9333, MEM[(float *)_5804 + 60B]
.L763:
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x4, x4, 64	// ivtmp.4544, ivtmp.4544,
	add	x6, sp, 2032	// tmp9334,,
	add	x5, x5, x0	// ivtmp.4545, ivtmp.4545, _565
	cmp	x4, x6	// ivtmp.4544, tmp9334
	bne	.L765		//,
.L757:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x5, [sp, 1568]	// _8036, %sfp
	add	w4, w12, 5	// _11811, oc0,
	add	x2, x2, 12	// ivtmp.4673, ivtmp.4673,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	w12, w12, 3	// oc0, oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	x10, x10, x5	// ivtmp.4675, ivtmp.4675, _8036
	ldr	x5, [sp, 1560]	// _8025, %sfp
	add	x9, x9, x5	// ivtmp.4677, ivtmp.4677, _8025
	ldr	w5, [sp, 164]	//, %sfp
	cmp	w5, w4	// OC, _11811
	bgt	.L766		//,
	ldr	x26, [sp, 1536]	// _5244, %sfp
	mov	x25, x27	// _9799, _9799
	mov	x1, x14	// _11857, _11857
	mov	w27, w21	// IC, IC
	mov	x14, x19	// ivtmp.4687, ivtmp.4687
	ldr	x8, [sp, 1592]	// IW, %sfp
	mov	x21, x17	// _11848, _11848
	mov	x17, x20	// _8016, _8016
	mov	x20, x23	// _8014, _8014
	mov	x6, x16	// ivtmp.4703, ivtmp.4703
	ldr	x4, [sp, 1696]	// _697, %sfp
	mov	x5, x13	// _9392, _9392
	mov	x16, x18	// ivtmp.4700, ivtmp.4700
	mov	x13, x15	// _8011, _8011
	mov	x15, x3	// ivtmp.4702, ivtmp.4702
	ldr	w23, [sp, 1552]	//, %sfp
	ldr	w19, [sp, 1688]	//, %sfp
.L789:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w2, [sp, 164]	//, %sfp
	cmp	w2, w12	// OC, oc0
	ble	.L787		//,
	sxtw	x2, w12	// ivtmp.4514, oc0
	mov	x7, x22	// _6134, _6134
	ldr	x22, [sp, 448]	// _63, %sfp
	stp	x13, x21, [sp, 464]	// _8011, _11848,
	mov	x13, x14	// ivtmp.4687, ivtmp.4687
	mov	x18, x20	// _8014, _8014
	madd	x3, x2, x20, x14	// _4834, ivtmp.4514, _8014, ivtmp.4687
	mov	x14, x15	// ivtmp.4702, ivtmp.4702
	mov	x15, x6	// ivtmp.4703, ivtmp.4703
	mov	x6, x5	// _9392, _9392
	mul	x9, x4, x2	// ivtmp.4519, _697, ivtmp.4514
	mov	x10, x1	// _11857, _11857
	ldr	x21, [sp, 1584]	// _8018, %sfp
	add	x3, x16, x3, lsl 2	// ivtmp.4518, ivtmp.4700, _4834,
	str	w19, [sp, 456]	// oh, %sfp
	ldr	w5, [sp, 1544]	//, %sfp
.L786:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x1, [sp, 208]	// _62, %sfp
	ldr	s31, [x1, x2, lsl 2]	// bv, MEM[(const float *)_62 + ivtmp.4514_4806 * 4]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w27, 0	// IC,
	ble	.L770		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	cmp	w23, 0	// KH,
	ble	.L770		//,
	ldr	w1, [sp, 1576]	//, %sfp
	fmov	s4, s31	// acc$0$4, bv
	fmov	s5, s31	// acc$0$5, bv
	mov	w20, 0	// ic,
	mov	x12, x11	// ivtmp.4507, ivtmp.4688
	fmov	s12, s31	// acc$0$1, bv
	fmov	s14, s31	// acc$0$3, bv
	mov	x19, x9	// ivtmp.4506, ivtmp.4519
	str	x0, [sp, 480]	// _565, %sfp
	fmov	s13, s31	// acc$0$0, bv
	fmov	s2, s31	// acc$0$14, bv
	str	w5, [sp, 496]	// OW, %sfp
	fmov	s6, s31	// acc$0$6, bv
	fmov	s8, s31	// acc$0$8, bv
	stp	x4, x2, [sp, 504]	// _697, ivtmp.4514,
	fmov	s11, s31	// acc$0$2, bv
	fmov	s1, s31	// acc$0$13, bv
	fmov	s3, s31	// acc$0$15, bv
	fmov	s7, s31	// acc$0$7, bv
	fmov	s9, s31	// acc$0$9, bv
	fmov	s10, s31	// acc$0$10, bv
	str	x3, [sp, 528]	// ivtmp.4518, %sfp
	fmov	s0, s31	// acc$0$12, bv
.L778:
	add	x2, x28, x12, lsl 2	// ivtmp.4484, in_ptr, ivtmp.4507,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w3, 0	// kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x5, x12	// ivtmp.4482, ivtmp.4507
	mov	x4, x19	// ivtmp.4481, ivtmp.4506
.L777:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w24, 0	// KW,
	bgt	.L1198		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w3, w3, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x4, x4, x21	// ivtmp.4481, ivtmp.4481, _8018
	add	x5, x5, x8	// ivtmp.4482, ivtmp.4482, IW
	add	x2, x2, x25	// ivtmp.4484, ivtmp.4484, _9799
	cmp	w23, w3	// KH, kh
	bne	.L777		//,
.L776:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 1520]	// _8015, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w20, w20, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x19, x19, x17	// ivtmp.4506, ivtmp.4506, _8016
	add	x12, x12, x0	// ivtmp.4507, ivtmp.4507, _8015
	cmp	w27, w20	// IC, ic
	bne	.L778		//,
	fmov	s30, s31	// acc$0$12, acc$0$12
	ldr	x0, [sp, 480]	// _565, %sfp
	fmov	s31, s13	// bv, bv
	ldp	x4, x2, [sp, 504]	// _697, ivtmp.4514,
	fmov	s13, s1	// acc$0$0, acc$0$0
	fmov	s1, s10	// acc$0$13, acc$0$13
	fmov	s10, s8	// acc$0$10, acc$0$10
	fmov	s8, s3	// acc$0$8, acc$0$8
	fmov	s3, s7	// acc$0$15, acc$0$15
	fmov	s7, s6	// acc$0$7, acc$0$7
	fmov	s6, s12	// acc$0$6, acc$0$6
	fmov	s12, s5	// acc$0$1, acc$0$1
	ldr	x3, [sp, 528]	// ivtmp.4518, %sfp
	fmov	s5, s14	// acc$0$5, acc$0$5
	fmov	s14, s9	// acc$0$3, acc$0$3
	fmov	s9, s2	// acc$0$9, acc$0$9
	fmov	s2, s11	// acc$0$14, acc$0$14
	ldr	w5, [sp, 496]	//, %sfp
	fmov	s11, s4	// acc$0$2, acc$0$2
	fmov	s4, s0	// acc$0$4, acc$0$4
	fmov	s0, s30	// acc$0$12, acc$0$12
.L779:
	cmp	w5, 15	// OW,
	ble	.L780		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s13, s12, [x3]	// acc$0$0, acc$0$1,* ivtmp.4518
	stp	s11, s14, [x3, 8]	// acc$0$2, acc$0$3,
	stp	s4, s5, [x3, 16]	// acc$0$4, acc$0$5,
	stp	s6, s7, [x3, 24]	// acc$0$6, acc$0$7,
	stp	s8, s9, [x3, 32]	// acc$0$8, acc$0$9,
	stp	s10, s31, [x3, 40]	// acc$0$10, bv,
	stp	s0, s1, [x3, 48]	// acc$0$12, acc$0$13,
	stp	s2, s3, [x3, 56]	// acc$0$14, acc$0$15,
.L781:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w1, [sp, 164]	//, %sfp
	add	x2, x2, 1	// ivtmp.4514, ivtmp.4514,
	add	x3, x3, x0	// ivtmp.4518, ivtmp.4518, _565
	add	x9, x9, x4	// ivtmp.4519, ivtmp.4519, _697
	cmp	w1, w2	// OC, ivtmp.4514
	bgt	.L786		//,
	mov	x5, x6	// _9392, _9392
	ldr	w19, [sp, 456]	//, %sfp
	mov	x6, x15	// ivtmp.4703, ivtmp.4703
	mov	x15, x14	// ivtmp.4702, ivtmp.4702
	mov	x14, x13	// ivtmp.4687, ivtmp.4687
	ldp	x13, x21, [sp, 464]	// _8011, _11848,
	mov	x22, x7	// _6134, _6134
	mov	x20, x18	// _8014, _8014
	mov	x1, x10	// _11857, _11857
.L787:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w19, w19, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x11, x11, x8	// ivtmp.4688, ivtmp.4688, IW
	ldr	x2, [sp, 200]	// _12516, %sfp
	add	x14, x14, x2	// ivtmp.4687, ivtmp.4687, _12516
	ldr	w2, [sp, 1664]	//, %sfp
	cmp	w2, w19	// OH, oh
	bne	.L746		//,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	x12, x6, x1	// ivtmp.4703, ivtmp.4703, _11857
	ldr	w6, [sp, 1680]	//, %sfp
	mov	w2, w30	// kw, kw
	mov	x18, x22	// _6134, _6134
	mov	x22, x0	// _565, _565
	ldr	x27, [sp, 1528]	// ivtmp.4701, %sfp
	mov	x0, x13	// _8011, _8011
	mov	x10, x21	// _11848, _11848
	mov	x30, x26	// _5244, _5244
	add	x16, x16, x21	// ivtmp.4700, ivtmp.4700, _11848
	ldr	w9, [sp, 1672]	//, %sfp
	sub	x15, x15, x13	// ivtmp.4702, ivtmp.4702, _8011
	mov	x5, x4	// _697, _697
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w6, w6, 1	// b, b,
	mov	w26, w2	// kw, kw
	ldr	x21, [sp, 1584]	// _8018, %sfp
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	x27, x27, x0	// ivtmp.4701, ivtmp.4701, _8011
	ldr	w13, [sp, 1544]	//, %sfp
	cmp	w9, w6	// _15, b
	bne	.L790		//,
.L1185:
	ldp	d8, d9, [sp, 96]	//,,
	.cfi_restore 73
	.cfi_restore 72
	ldp	d10, d11, [sp, 112]	//,,
	.cfi_restore 75
	.cfi_restore 74
	ldp	d12, d13, [sp, 128]	//,,
	.cfi_restore 77
	.cfi_restore 76
	ldp	d14, d15, [sp, 144]	//,,
	.cfi_restore 79
	.cfi_restore 78
.L614:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:388: 	if (__p)
	ldr	x0, [sp, 1632]	// padded$_M_start, %sfp
	cbz	x0, .L594	// padded$_M_start,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	ldr	x1, [sp, 1640]	// padded$_M_end_of_storage, %sfp
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	sub	x1, x1, x0	//, padded$_M_end_of_storage, padded$_M_start
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
// src/cpp/cnn_internals.cpp:477: }
	ldp	x29, x30, [sp]	//,,
	add	sp, sp, 2064	//,,
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	b	_ZdlPvm		//
	.p2align 2,,3
.L1198:
	.cfi_def_cfa_offset 2064
	.cfi_offset 19, -2048
	.cfi_offset 20, -2040
	.cfi_offset 21, -2032
	.cfi_offset 22, -2024
	.cfi_offset 23, -2016
	.cfi_offset 24, -2008
	.cfi_offset 25, -2000
	.cfi_offset 26, -1992
	.cfi_offset 27, -1984
	.cfi_offset 28, -1976
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	.cfi_offset 72, -1968
	.cfi_offset 73, -1960
	.cfi_offset 74, -1952
	.cfi_offset 75, -1944
	.cfi_offset 76, -1936
	.cfi_offset 77, -1928
	.cfi_offset 78, -1920
	.cfi_offset 79, -1912
	fmov	s30, s13	// bv, bv
	fmov	s13, s12	// acc$0$6, acc$0$6
	str	w27, [sp, 192]	// IC, %sfp
	str	x12, [sp, 216]	// ivtmp.4507, %sfp
	str	w20, [sp, 224]	// ic, %sfp
	str	x19, [sp, 240]	// ivtmp.4506, %sfp
	fmov	s12, s30	// bv, bv
	str	x9, [sp, 256]	// ivtmp.4519, %sfp
	.p2align 5,,15
.L775:
	cmp	w1, 2	// _9806,
	bls	.L917		//,
	ldr	q28, [x2, 8]	// vectp.2927__lsm0.3627, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 8B]
	movi	v29.4s, 0	// vect_acc_0_15_300.2839
	add	x27, x22, x4, lsl 2	// vectp.2841, _63, ivtmp.4481,
	add	x20, x2, 48	// vectp.2916, ivtmp.4484,
	add	x19, x2, 52	// vectp.2922, ivtmp.4484,
	add	x12, x2, 56	// vectp.2928, ivtmp.4484,
	add	x9, x2, 60	// vectp.2934, ivtmp.4484,
	ldr	q27, [x2, 12]	// vectp.2933__lsm0.3624, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 12B]
	mov	x0, 0	// ivtmp.4442,
	ldr	q24, [x2, 24]	// vectp.2927__lsm0.3627, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 24B]
	mov	v19.16b, v29.16b	// vect_acc_0_14_2239.2838, vect_acc_0_15_300.2839
	mov	v20.16b, v29.16b	// vect_acc_0_13_358.2837, vect_acc_0_15_300.2839
	mov	v21.16b, v29.16b	// vect_acc_0_12_1315.2836, vect_acc_0_15_300.2839
	mov	v22.16b, v29.16b	// vect_acc_0_11_101.2835, vect_acc_0_15_300.2839
	ldr	q30, [x2, 4]	// vectp.2921__lsm0.3630, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 4B]
	mov	v23.16b, v29.16b	// vect_acc_0_10_116.2834, vect_acc_0_15_300.2839
	mov	v25.16b, v29.16b	// vect_acc_0_8_125.2832, vect_acc_0_15_300.2839
	mov	v26.16b, v29.16b	// vect_acc_0_7_2055.2831, vect_acc_0_15_300.2839
	mov	v15.16b, v29.16b	// vect_acc_0_0_3669.2824, vect_acc_0_15_300.2839
	ldr	q16, [x2, 20]	// vectp.2921__lsm0.3630, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 20B]
	stp	q27, q28, [sp, 416]	// vectp.2933__lsm0.3624, vectp.2927__lsm0.3627,
	ldp	q18, q17, [x2]	// vectp.2915__lsm0.3633, vectp.2915__lsm0.3633,* ivtmp.4484
	mov	v27.16b, v29.16b	// vect_acc_0_6_1592.2830, vect_acc_0_15_300.2839
	str	q24, [sp, 352]	// vectp.2927__lsm0.3627, %sfp
	mov	v28.16b, v29.16b	// vect_acc_0_5_3065.2829, vect_acc_0_15_300.2839
	ldr	q24, [x2, 28]	// vectp.2933__lsm0.3624, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 28B]
	str	q16, [sp, 320]	// vectp.2921__lsm0.3630, %sfp
	mov	v16.16b, v29.16b	// vect_acc_0_1_2707.2825, vect_acc_0_15_300.2839
	str	q29, [sp, 400]	// vect_acc_0_15_300.2839, %sfp
	str	s2, [sp, 544]	// acc$0$9, %sfp
	str	s1, [sp, 552]	// acc$0$0, %sfp
	str	s0, [sp, 560]	// acc$0$4, %sfp
	str	q24, [sp, 384]	// vectp.2933__lsm0.3624, %sfp
	ldr	q24, [x2, 32]	// vectp.2915__lsm1.3634, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 32B]
	str	q18, [sp, 176]	// vectp.2915__lsm0.3633, %sfp
	mov	v18.16b, v29.16b	// vect_acc_0_3_3268.2827, vect_acc_0_15_300.2839
	str	q17, [sp, 288]	// vectp.2915__lsm0.3633, %sfp
	mov	v17.16b, v29.16b	// vect_acc_0_2_1355.2826, vect_acc_0_15_300.2839
	str	s10, [sp, 576]	// acc$0$13, %sfp
	str	s9, [sp, 592]	// acc$0$3, %sfp
	ldr	q9, [sp, 352]	// vectp.2927__lsm0.3627, %sfp
	str	q24, [sp, 272]	// vectp.2915__lsm1.3634, %sfp
	ldr	q24, [x2, 36]	// vectp.2921__lsm2.3632, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 36B]
	str	s8, [sp, 352]	// acc$0$10, %sfp
	str	q24, [sp, 304]	// vectp.2921__lsm2.3632, %sfp
	ldr	q24, [x2, 40]	// vectp.2927__lsm2.3629, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 40B]
	str	q24, [sp, 336]	// vectp.2927__lsm2.3629, %sfp
	ldr	q24, [x2, 44]	// vectp.2933__lsm2.3626, MEM <const vector(4) float> [(const float *)vectp.2844_581 + 44B]
	str	q24, [sp, 368]	// vectp.2933__lsm2.3626, %sfp
	mov	v24.16b, v29.16b	// vect_acc_0_9_1534.2833, vect_acc_0_15_300.2839
	ldr	q8, [sp, 368]	// vectp.2933__lsm2.3626, %sfp
	str	s7, [sp, 368]	// acc$0$15, %sfp
	str	s5, [sp, 400]	// acc$0$1, %sfp
	ldr	q7, [sp, 384]	// vectp.2933__lsm0.3624, %sfp
	str	s6, [sp, 384]	// acc$0$7, %sfp
	mov	v6.16b, v29.16b	// vect_acc_0_4_4952.2828, vect_acc_0_9_1534.2833
	ldr	q5, [sp, 416]	// vectp.2933__lsm0.3624, %sfp
	str	s4, [sp, 416]	// acc$0$2, %sfp
	ldr	q4, [sp, 432]	// vectp.2927__lsm0.3627, %sfp
	str	s3, [sp, 432]	// acc$0$8, %sfp
	mov	v3.16b, v30.16b	// vectp.2921__lsm0.3630, vectp.2921__lsm0.3630
	str	s14, [sp, 1456]	// acc$0$5, %sfp
	ldr	q14, [sp, 288]	// vectp.2915__lsm0.3633, %sfp
	str	s11, [sp, 288]	// acc$0$14, %sfp
	ldr	q11, [sp, 336]	// vectp.2927__lsm2.3629, %sfp
	str	s13, [sp, 336]	// acc$0$6, %sfp
	ldr	q13, [sp, 304]	// vectp.2921__lsm2.3632, %sfp
	str	s12, [sp, 304]	// bv, %sfp
	ldr	q12, [sp, 320]	// vectp.2921__lsm0.3630, %sfp
	str	s31, [sp, 320]	// acc$0$12, %sfp
	ldr	q31, [sp, 272]	// vectp.2915__lsm1.3634, %sfp
	b	.L773		//
	.p2align 2,,3
.L918:
	mov	v3.16b, v12.16b	// vectp.2921__lsm0.3630, vectp.2921__lsm0.3630
	mov	v4.16b, v9.16b	// vectp.2927__lsm0.3627, vectp.2927__lsm0.3627
	str	q14, [sp, 176]	// vectp.2915__lsm0.3633, %sfp
	mov	v5.16b, v7.16b	// vectp.2933__lsm0.3624, vectp.2933__lsm0.3624
	mov	v12.16b, v13.16b	// vectp.2921__lsm0.3630, vectp.2921__lsm2.3632
	mov	v9.16b, v11.16b	// vectp.2927__lsm0.3627, vectp.2927__lsm2.3629
	mov	v7.16b, v8.16b	// vectp.2933__lsm0.3624, vectp.2933__lsm2.3626
	mov	v14.16b, v31.16b	// vectp.2915__lsm0.3633, vectp.2915__lsm1.3634
	mov	v13.16b, v1.16b	// vectp.2921__lsm2.3632, MEM <const vector(4) float> [(const float *)vectp.2922_2118 + ivtmp.4442_5080 * 1]
	mov	v11.16b, v2.16b	// vectp.2927__lsm2.3629, MEM <const vector(4) float> [(const float *)vectp.2928_5614 + ivtmp.4442_5080 * 1]
	mov	v8.16b, v10.16b	// vectp.2933__lsm2.3626, MEM <const vector(4) float> [(const float *)vectp.2934_4849 + ivtmp.4442_5080 * 1]
	mov	v31.16b, v0.16b	// vectp.2915__lsm1.3634, MEM <const vector(4) float> [(const float *)vectp.2916_4100 + ivtmp.4442_5080 * 1]
.L773:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q30, [x27, x0]	// MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q10, [sp, 176]	// vectp.2915__lsm0.3633, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x20, x0]	// MEM <const vector(4) float> [(const float *)vectp.2916_4100 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2916_4100 + ivtmp.4442_5080 * 1]
	ldr	q1, [x19, x0]	// MEM <const vector(4) float> [(const float *)vectp.2922_2118 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2922_2118 + ivtmp.4442_5080 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v16.4s, v3.4s, v30.4s	// vect_acc_0_1_2707.2825, vectp.2921__lsm0.3630, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x12, x0]	// MEM <const vector(4) float> [(const float *)vectp.2928_5614 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2928_5614 + ivtmp.4442_5080 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v15.4s, v10.4s, v30.4s	// vect_acc_0_0_3669.2824, vectp.2915__lsm0.3633, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q10, [x9, x0]	// MEM <const vector(4) float> [(const float *)vectp.2934_4849 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2934_4849 + ivtmp.4442_5080 * 1]
	add	x0, x0, 16	// ivtmp.4442, ivtmp.4442,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v17.4s, v4.4s, v30.4s	// vect_acc_0_2_1355.2826, vectp.2927__lsm0.3627, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v18.4s, v5.4s, v30.4s	// vect_acc_0_3_3268.2827, vectp.2933__lsm0.3624, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v6.4s, v14.4s, v30.4s	// vect_acc_0_4_4952.2828, vectp.2915__lsm0.3633, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v28.4s, v12.4s, v30.4s	// vect_acc_0_5_3065.2829, vectp.2921__lsm0.3630, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v27.4s, v9.4s, v30.4s	// vect_acc_0_6_1592.2830, vectp.2927__lsm0.3627, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v26.4s, v7.4s, v30.4s	// vect_acc_0_7_2055.2831, vectp.2933__lsm0.3624, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v25.4s, v31.4s, v30.4s	// vect_acc_0_8_125.2832, vectp.2915__lsm1.3634, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v24.4s, v13.4s, v30.4s	// vect_acc_0_9_1534.2833, vectp.2921__lsm2.3632, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v23.4s, v11.4s, v30.4s	// vect_acc_0_10_116.2834, vectp.2927__lsm2.3629, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v22.4s, v8.4s, v30.4s	// vect_acc_0_11_101.2835, vectp.2933__lsm2.3626, MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v21.4s, v0.4s, v30.4s	// vect_acc_0_12_1315.2836, MEM <const vector(4) float> [(const float *)vectp.2916_4100 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v20.4s, v1.4s, v30.4s	// vect_acc_0_13_358.2837, MEM <const vector(4) float> [(const float *)vectp.2922_2118 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v19.4s, v2.4s, v30.4s	// vect_acc_0_14_2239.2838, MEM <const vector(4) float> [(const float *)vectp.2928_5614 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	fmla	v29.4s, v10.4s, v30.4s	// vect_acc_0_15_300.2839, MEM <const vector(4) float> [(const float *)vectp.2934_4849 + ivtmp.4442_5080 * 1], MEM <const vector(4) float> [(const float *)vectp.2841_5987 + ivtmp.4442_5080 * 1]
	cmp	x0, x26	// ivtmp.4442, _5244
	bne	.L918		//,
	ldr	s11, [sp, 288]	// acc$0$14, %sfp
	mov	w0, w30	// niters_vector_mult_vf.2822, kw
	faddp	v30.4s, v6.4s, v6.4s	// tmp3556, vect_acc_0_4_4952.2828, vect_acc_0_4_4952.2828
	ldr	s12, [sp, 304]	// bv, %sfp
	faddp	v29.4s, v29.4s, v29.4s	// tmp3545, vect_acc_0_15_300.2839, vect_acc_0_15_300.2839
	faddp	v19.4s, v19.4s, v19.4s	// tmp3546, vect_acc_0_14_2239.2838, vect_acc_0_14_2239.2838
	ldr	s31, [sp, 320]	// acc$0$12, %sfp
	faddp	v20.4s, v20.4s, v20.4s	// tmp3547, vect_acc_0_13_358.2837, vect_acc_0_13_358.2837
	faddp	v21.4s, v21.4s, v21.4s	// tmp3548, vect_acc_0_12_1315.2836, vect_acc_0_12_1315.2836
	ldr	s13, [sp, 336]	// acc$0$6, %sfp
	faddp	v22.4s, v22.4s, v22.4s	// tmp3549, vect_acc_0_11_101.2835, vect_acc_0_11_101.2835
	faddp	v23.4s, v23.4s, v23.4s	// tmp3550, vect_acc_0_10_116.2834, vect_acc_0_10_116.2834
	ldr	s8, [sp, 352]	// acc$0$10, %sfp
	faddp	v24.4s, v24.4s, v24.4s	// tmp3551, vect_acc_0_9_1534.2833, vect_acc_0_9_1534.2833
	faddp	v25.4s, v25.4s, v25.4s	// tmp3552, vect_acc_0_8_125.2832, vect_acc_0_8_125.2832
	ldr	s7, [sp, 368]	// acc$0$15, %sfp
	faddp	v26.4s, v26.4s, v26.4s	// tmp3553, vect_acc_0_7_2055.2831, vect_acc_0_7_2055.2831
	faddp	v27.4s, v27.4s, v27.4s	// tmp3554, vect_acc_0_6_1592.2830, vect_acc_0_6_1592.2830
	ldr	s6, [sp, 384]	// acc$0$7, %sfp
	faddp	v28.4s, v28.4s, v28.4s	// tmp3555, vect_acc_0_5_3065.2829, vect_acc_0_5_3065.2829
	faddp	v18.4s, v18.4s, v18.4s	// tmp3557, vect_acc_0_3_3268.2827, vect_acc_0_3_3268.2827
	ldr	s5, [sp, 400]	// acc$0$1, %sfp
	faddp	v17.4s, v17.4s, v17.4s	// tmp3558, vect_acc_0_2_1355.2826, vect_acc_0_2_1355.2826
	faddp	v16.4s, v16.4s, v16.4s	// tmp3559, vect_acc_0_1_2707.2825, vect_acc_0_1_2707.2825
	ldr	s4, [sp, 416]	// acc$0$2, %sfp
	faddp	v15.4s, v15.4s, v15.4s	// tmp3560, vect_acc_0_0_3669.2824, vect_acc_0_0_3669.2824
	ldr	s3, [sp, 432]	// acc$0$8, %sfp
	faddp	v29.4s, v29.4s, v29.4s	// tmp3545, tmp3545, tmp3545
	faddp	v19.4s, v19.4s, v19.4s	// tmp3546, tmp3546, tmp3546
	ldr	s2, [sp, 544]	// acc$0$9, %sfp
	faddp	v20.4s, v20.4s, v20.4s	// tmp3547, tmp3547, tmp3547
	faddp	v21.4s, v21.4s, v21.4s	// tmp3548, tmp3548, tmp3548
	ldr	s1, [sp, 552]	// acc$0$0, %sfp
	faddp	v22.4s, v22.4s, v22.4s	// tmp3549, tmp3549, tmp3549
	faddp	v23.4s, v23.4s, v23.4s	// tmp3550, tmp3550, tmp3550
	ldr	s0, [sp, 560]	// acc$0$4, %sfp
	faddp	v24.4s, v24.4s, v24.4s	// tmp3551, tmp3551, tmp3551
	faddp	v25.4s, v25.4s, v25.4s	// tmp3552, tmp3552, tmp3552
	ldr	s10, [sp, 576]	// acc$0$13, %sfp
	faddp	v26.4s, v26.4s, v26.4s	// tmp3553, tmp3553, tmp3553
	faddp	v27.4s, v27.4s, v27.4s	// tmp3554, tmp3554, tmp3554
	ldr	s9, [sp, 592]	// acc$0$3, %sfp
	faddp	v28.4s, v28.4s, v28.4s	// tmp3555, tmp3555, tmp3555
	faddp	v30.4s, v30.4s, v30.4s	// tmp3556, tmp3556, tmp3556
	ldr	s14, [sp, 1456]	// acc$0$5, %sfp
	faddp	v18.4s, v18.4s, v18.4s	// tmp3557, tmp3557, tmp3557
	faddp	v17.4s, v17.4s, v17.4s	// tmp3558, tmp3558, tmp3558
	faddp	v16.4s, v16.4s, v16.4s	// tmp3559, tmp3559, tmp3559
	faddp	v15.4s, v15.4s, v15.4s	// tmp3560, tmp3560, tmp3560
	fadd	s7, s7, s29	// acc$0$15, acc$0$15, tmp3545
	fadd	s11, s11, s19	// acc$0$14, acc$0$14, tmp3546
	fadd	s10, s10, s20	// acc$0$13, acc$0$13, tmp3547
	fadd	s31, s31, s21	// acc$0$12, acc$0$12, tmp3548
	fadd	s12, s12, s22	// bv, bv, tmp3549
	fadd	s8, s8, s23	// acc$0$10, acc$0$10, tmp3550
	fadd	s2, s2, s24	// acc$0$9, acc$0$9, tmp3551
	fadd	s3, s3, s25	// acc$0$8, acc$0$8, tmp3552
	fadd	s6, s6, s26	// acc$0$7, acc$0$7, tmp3553
	fadd	s13, s13, s27	// acc$0$6, acc$0$6, tmp3554
	fadd	s14, s14, s28	// acc$0$5, acc$0$5, tmp3555
	fadd	s0, s0, s30	// acc$0$4, acc$0$4, tmp3556
	fadd	s9, s9, s18	// acc$0$3, acc$0$3, tmp3557
	fadd	s4, s4, s17	// acc$0$2, acc$0$2, tmp3558
	fadd	s5, s5, s16	// acc$0$1, acc$0$1, tmp3559
	fadd	s1, s1, s15	// acc$0$0, acc$0$0, tmp3560
	cmp	w30, w24	// kw, KW
	beq	.L774		//,
.L772:
	uxtw	x9, w0	// _2419, niters_vector_mult_vf.2822
	sub	w0, w24, w0	// bnd.2940_2391, KW, niters_vector_mult_vf.2822
	whilelo	p7.s, wzr, w0	// max_mask_5856,, bnd.2940_2391
	add	x0, x5, x9	// _4251, ivtmp.4482, _2419
	add	x9, x4, x9	// _2422, ivtmp.4481, _2419
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x28, x0, lsl 2]	// vect_xv_1672.2962, max_mask_5856,* in_ptr
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ld1w	z30.s, p7/z, [x22, x9, lsl 2]	// vect__2668.2959, max_mask_5856,* _63
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11405, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11405, max_mask_5856, vect__2668.2959
	lsl	x0, x0, 2	// _2378, _4251,
	faddv	s29, p6, z29.s	// _642, tmp4594, _11405
	fadd	s1, s1, s29	// acc$0$0, acc$0$0, _642
	add	x9, x0, 4	// _2259, _2378,
	add	x12, x0, 8	// _2291, _2378,
	add	x9, x28, x9	// vectp.2967, in_ptr, _2259
	add	x19, x0, 12	// _2328, _2378,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_2482.2968, max_mask_5856,* vectp.2967
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11406, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11406, max_mask_5856, vect__2668.2959
	faddv	s29, p6, z29.s	// _2278, tmp4594, _11406
	add	x9, x28, x12	// vectp.2973, in_ptr, _2291
	add	x20, x0, 16	// _2359, _2378,
	fadd	s5, s5, s29	// acc$0$1, acc$0$1, _2278
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_2370.2974, max_mask_5856,* vectp.2973
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11407, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11407, max_mask_5856, vect__2668.2959
	add	x9, x28, x19	// vectp.2979, in_ptr, _2328
	faddv	s29, p6, z29.s	// _2309, tmp4594, _11407
	add	x27, x0, 20	// _2646, _2378,
	fadd	s4, s4, s29	// acc$0$2, acc$0$2, _2309
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_3435.2980, max_mask_5856,* vectp.2979
	add	x9, x28, x20	// vectp.2985, in_ptr, _2359
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11408, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11408, max_mask_5856, vect__2668.2959
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x9]	// vect_xv_3899.2986, max_mask_5856,* vectp.2985
	faddv	s29, p6, z29.s	// _2341, tmp4594, _11408
	add	x9, x28, x27	// vectp.2991, in_ptr, _2646
	fadd	s9, s9, s29	// acc$0$3, acc$0$3, _2341
	ld1w	z29.s, p7/z, [x9]	// vect_xv_3706.2992, max_mask_5856,* vectp.2991
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11409, max_mask_5856
	fmul	z28.s, p7/m, z28.s, z30.s	// _11409, max_mask_5856, vect__2668.2959
	faddv	s28, p6, z28.s	// _2635, tmp4594, _11409
	add	x9, x0, 24	// _3907, _2378,
	fadd	s0, s0, s28	// acc$0$4, acc$0$4, _2635
	add	x12, x0, 28	// _1735, _2378,
	movprfx	z29.s, p7/z, z29.s	// _11410, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11410, max_mask_5856, vect__2668.2959
	faddv	s29, p6, z29.s	// _2655, tmp4594, _11410
	add	x9, x28, x9	// vectp.2997, in_ptr, _3907
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x9]	// vect_xv_3446.2998, max_mask_5856,* vectp.2997
	add	x19, x0, 32	// _688, _2378,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11411, max_mask_5856
	fmul	z28.s, p7/m, z28.s, z30.s	// _11411, max_mask_5856, vect__2668.2959
	fadd	s14, s14, s29	// acc$0$5, acc$0$5, _2655
	add	x9, x0, 44	// _5479, _2378,
	add	x20, x0, 36	// _4076, _2378,
	faddv	s28, p6, z28.s	// _3468, tmp4594, _11411
	fadd	s13, s13, s28	// acc$0$6, acc$0$6, _3468
	add	x27, x0, 40	// _1768, _2378,
	str	x9, [sp, 176]	// _5479, %sfp
	add	x9, x28, x12	// vectp.3003, in_ptr, _1735
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_2388.3004, max_mask_5856,* vectp.3003
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11412, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11412, max_mask_5856, vect__2668.2959
	faddv	s29, p6, z29.s	// _3930, tmp4594, _11412
	add	x9, x28, x19	// vectp.3009, in_ptr, _688
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x9]	// vect_xv_1724.3010, max_mask_5856,* vectp.3009
	add	x12, x0, 48	// _5798, _2378,
	fadd	s6, s6, s29	// acc$0$7, acc$0$7, _3930
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11413, max_mask_5856
	fmul	z28.s, p7/m, z28.s, z30.s	// _11413, max_mask_5856, vect__2668.2959
	add	x9, x28, x20	// vectp.3015, in_ptr, _4076
	add	x19, x0, 52	// _5813, _2378,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_2320.3016, max_mask_5856,* vectp.3015
	faddv	s28, p6, z28.s	// _4850, tmp4594, _11413
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11414, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11414, max_mask_5856, vect__2668.2959
	add	x9, x0, 56	// _5828, _2378,
	add	x20, x0, 60	// _5843, _2378,
	ldr	x0, [sp, 176]	// _5479, %sfp
	faddv	s29, p6, z29.s	// _3632, tmp4594, _11414
	fadd	s3, s3, s28	// acc$0$8, acc$0$8, _4850
	fadd	s2, s2, s29	// acc$0$9, acc$0$9, _3632
	add	x27, x28, x27	// vectp.3021, in_ptr, _1768
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x27]	// vect_xv_2218.3022, max_mask_5856,* vectp.3021
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11415, max_mask_5856
	fmul	z28.s, p7/m, z28.s, z30.s	// _11415, max_mask_5856, vect__2668.2959
	faddv	s28, p6, z28.s	// _68, tmp4594, _11415
	add	x12, x28, x12	// vectp.3033, in_ptr, _5798
	fadd	s8, s8, s28	// acc$0$10, acc$0$10, _68
	add	x19, x28, x19	// vectp.3039, in_ptr, _5813
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x12]	// vect_xv_5908.3034, max_mask_5856,* vectp.3033
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11417, max_mask_5856
	fmul	z28.s, p7/m, z28.s, z30.s	// _11417, max_mask_5856, vect__2668.2959
	faddv	s28, p6, z28.s	// _5805, tmp4594, _11417
	add	x9, x28, x9	// vectp.3045, in_ptr, _5828
	fadd	s31, s31, s28	// acc$0$12, acc$0$12, _5805
	add	x0, x28, x0	// vectp.3027, in_ptr, _5479
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x0]	// vect_xv_5901.3028, max_mask_5856,* vectp.3027
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11416, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11416, max_mask_5856, vect__2668.2959
	faddv	s29, p6, z29.s	// _4749, tmp4594, _11416
	fadd	s12, s12, s29	// bv, bv, _4749
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x19]	// vect_xv_5914.3040, max_mask_5856,* vectp.3039
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11418, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11418, max_mask_5856, vect__2668.2959
	faddv	s29, p6, z29.s	// _5820, tmp4594, _11418
	add	x0, x28, x20	// vectp.3051, in_ptr, _5843
	fadd	s10, s10, s29	// acc$0$13, acc$0$13, _5820
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x0]	// vect_xv_5926.3052, max_mask_5856,* vectp.3051
	ld1w	z29.s, p7/z, [x9]	// vect_xv_5920.3046, max_mask_5856,* vectp.3045
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11419, max_mask_5856
	fmul	z29.s, p7/m, z29.s, z30.s	// _11419, max_mask_5856, vect__2668.2959
	movprfx	z30.s, p7/z, z30.s	// _11420, max_mask_5856
	fmul	z30.s, p7/m, z30.s, z28.s	// _11420, max_mask_5856, vect_xv_5926.3052
	faddv	s29, p6, z29.s	// _5835, tmp4594, _11419
	faddv	s30, p6, z30.s	// _5851, tmp4594, _11420
	fadd	s11, s11, s29	// acc$0$14, acc$0$14, _5835
	fadd	s7, s7, s30	// acc$0$15, acc$0$15, _5851
.L774:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w3, w3, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x4, x4, x21	// ivtmp.4481, ivtmp.4481, _8018
	add	x5, x5, x8	// ivtmp.4482, ivtmp.4482, IW
	add	x2, x2, x25	// ivtmp.4484, ivtmp.4484, _9799
	cmp	w23, w3	// KH, kh
	bne	.L775		//,
	fmov	s30, s12	// bv, bv
	ldr	x12, [sp, 216]	// ivtmp.4507, %sfp
	fmov	s12, s13	// acc$0$6, acc$0$6
	ldr	x19, [sp, 240]	// ivtmp.4506, %sfp
	ldr	x9, [sp, 256]	// ivtmp.4519, %sfp
	fmov	s13, s30	// bv, bv
	ldr	w27, [sp, 192]	//, %sfp
	ldr	w20, [sp, 224]	//, %sfp
	b	.L776		//
.L917:
	mov	w0, 0	// niters_vector_mult_vf.2822,
	b	.L772		//
.L780:
	cmp	w5, 0	// OW,
	ble	.L781		//,
	cmp	w5, 1	// OW,
	beq	.L1199		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s13, s12, [x3]	// acc$0$0, acc$0$1,* ivtmp.4518
	cmp	w5, 2	// OW,
	beq	.L781		//,
	str	s11, [x3, 8]	// acc$0$2, MEM[(float *)_4857 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 3	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s14, [x3, 12]	// acc$0$3, MEM[(float *)_4857 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 4	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s4, [x3, 16]	// acc$0$4, MEM[(float *)_4857 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 5	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s5, [x3, 20]	// acc$0$5, MEM[(float *)_4857 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 6	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s6, [x3, 24]	// acc$0$6, MEM[(float *)_4857 + 24B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 7	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s7, [x3, 28]	// acc$0$7, MEM[(float *)_4857 + 28B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 8	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s8, [x3, 32]	// acc$0$8, MEM[(float *)_4857 + 32B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 9	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s9, [x3, 36]	// acc$0$9, MEM[(float *)_4857 + 36B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 10	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s10, [x3, 40]	// acc$0$10, MEM[(float *)_4857 + 40B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 11	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s31, [x3, 44]	// bv, MEM[(float *)_4857 + 44B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 12	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s0, [x3, 48]	// acc$0$12, MEM[(float *)_4857 + 48B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 13	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s1, [x3, 52]	// acc$0$13, MEM[(float *)_4857 + 52B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w5, 14	// OW,
	beq	.L781		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s2, [x3, 56]	// acc$0$14, MEM[(float *)_4857 + 56B]
	b	.L781		//
.L770:
	fmov	s3, s31	// acc$0$15, bv
	fmov	s2, s31	// acc$0$14, bv
	fmov	s1, s31	// acc$0$13, bv
	fmov	s0, s31	// acc$0$12, bv
	fmov	s10, s31	// acc$0$10, bv
	fmov	s9, s31	// acc$0$9, bv
	fmov	s8, s31	// acc$0$8, bv
	fmov	s7, s31	// acc$0$7, bv
	fmov	s6, s31	// acc$0$6, bv
	fmov	s5, s31	// acc$0$5, bv
	fmov	s4, s31	// acc$0$4, bv
	fmov	s14, s31	// acc$0$3, bv
	fmov	s11, s31	// acc$0$2, bv
	fmov	s12, s31	// acc$0$1, bv
	fmov	s13, s31	// acc$0$0, bv
	b	.L779		//
.L594:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
	ldp	x19, x20, [sp, 16]	//,,
	.cfi_remember_state
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]	//,,
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]	//,,
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]	//,,
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]	//,,
	.cfi_restore 28
	.cfi_restore 27
// src/cpp/cnn_internals.cpp:477: }
	ldp	x29, x30, [sp]	//,,
	add	sp, sp, 2064	//,,
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret	
	.p2align 2,,3
.L1192:
	.cfi_restore_state
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	x19, x19, 8	// ivtmp.4785, ivtmp.4785,
	add	x20, x20, x6	// ivtmp.4787, ivtmp.4787, _12032
	add	x23, x23, x9	// ivtmp.4789, ivtmp.4789, _12039
	add	x24, x24, x8	// ivtmp.4791, ivtmp.4791, _12042
	cmp	x19, x7	// ivtmp.4785, _12053
	bne	.L803		//,
	b	.L1181		//
	.p2align 2,,3
.L1191:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w13, 0	// kw,
	b	.L801		//
.L1194:
	mov	w0, 0	// kw,
	b	.L818		//
.L1193:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w3, w3, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x27, x27, x0	// ivtmp.4800, ivtmp.4800, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x10, x10, x0	// ivtmp.4801, ivtmp.4801, IW
	ldr	w0, [sp, 448]	//, %sfp
	cmp	w0, w3	// OH, oh
	bne	.L805		//,
	ldr	w23, [sp, 416]	//, %sfp
	mov	x10, x26	// _12020, _12020
	mov	x3, x0	//,
	mov	x26, x18	// ivtmp.4806, ivtmp.4806
	mov	x12, x6	// _12032, _12032
	ldr	w19, [sp, 432]	//, %sfp
.L806:
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w23, w23, 1	// b, b,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	ldr	x0, [sp, 528]	// _12072, %sfp
	ldr	x1, [sp, 464]	// _7947, %sfp
	add	x26, x26, x0	// ivtmp.4806, ivtmp.4806, _12072
	ldr	x0, [sp, 224]	// ivtmp.4807, %sfp
	add	x0, x0, x1	// ivtmp.4807, ivtmp.4807, _7947
	str	x0, [sp, 224]	// ivtmp.4807, %sfp
	ldr	w0, [sp, 552]	//, %sfp
	cmp	w0, w23	// _16, b
	beq	.L614		//,
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x24, x26	// out_b, ivtmp.4806
	b	.L824		//
.L823:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	beq	.L1200		//,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x27, x27, x0	// ivtmp.4800, ivtmp.4800, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x6, x6, x0	// ivtmp.4801, ivtmp.4801, IW
	cmp	w3, w20	// OH, oh
	bne	.L791		//,
	b	.L806		//
.L1195:
	mov	x0, x3	// _7955, _7955
	mov	w13, w23	// OW, OW
	mov	w14, w26	// in_size, in_size
	mov	w3, w21	// OH, OH
	mov	w23, w4	// b, b
	mov	x26, x5	// ivtmp.4806, ivtmp.4806
	mov	w19, w11	// _12047, _12047
	mov	x21, x0	// _7955, _7955
	b	.L806		//
.L609:
// src/cpp/cnn_internals.cpp:474:         default: conv2d_specialized_reference(input, weight, bias, output);
	ldr	x2, [sp, 200]	//, %sfp
	mov	x3, x21	//, output
	mov	x1, x19	//, weight
	mov	x0, x27	//, input
	bl	_ZL28conv2d_specialized_referenceRK6TensorS1_S1_RS_		//
	b	.L614		//
.L610:
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w1, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w15, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w4, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w8, w2, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:472:         case 24: DISPATCH(24, 2)    // 12
	ldr	w0, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w1, w1, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w7, w2, w15	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w6, w8, w4	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w2, w2, w1	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w0, 0	// _17,
	ble	.L614		//,
	sub	w3, w18, #3	// _12172, KW,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 24	// OW,
	mov	w5, w3	// _12172, _12172
	sbfiz	x6, x6, 2, 32	// _12298, out_ch_size,,
	mov	w3, 24	// tmp3775,
	csel	w3, w13, w3, le	// _6216, OW, tmp3775,
	sub	w3, w3, #1	// _7176, _6216,
	add	x3, x3, 1	// _7177, _7176,
	cmp	w13, 0	// OW,
	str	x6, [sp, 544]	// _12298, %sfp
	lsl	x3, x3, 2	// _7178, _7177,
	mov	x6, 4	// tmp3779,
	csel	x3, x3, x6, gt	// _7179, _7178, tmp3779,
	str	x3, [sp, 288]	// _7179, %sfp
	ldr	x3, [sp, 208]	// _62, %sfp
	sub	w19, w8, #2	// _12273, OC,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x21, w1	// _7891, weight_size
	str	w5, [sp, 504]	// _12172, %sfp
	lsr	w5, w5, 1	// _12173, _12172,
	sbfiz	x1, x1, 2, 32	// _12238, weight_size,,
	add	w5, w5, 2	// _12175, _12173,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x7, w7	// _7883, in_ch_size
	lsl	x5, x5, 1	// _12176, _12175,
	str	x1, [sp, 336]	// _12238, %sfp
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x1, w18	// _7893, KW
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	str	x7, [sp, 472]	// _7883, %sfp
	mov	x26, x25	// ivtmp.4912, out_b
	sbfiz	x9, x4, 3, 32	// _12258, out_size,,
	add	x3, x3, 8	// _9719, _62,
	str	x5, [sp, 320]	// _12176, %sfp
	lsr	w5, w19, 1	// _12274, _12273,
	add	x6, x3, w5, uxtw 3	// _12279, _9719, _12274,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x3, w2	// _7886, weight_ch_size
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	str	x1, [sp, 304]	// _7893, %sfp
	sbfiz	x1, x18, 2, 32	// _12190, KW,,
	sbfiz	x8, x2, 1, 32	// _12265, weight_ch_size,,
	sbfiz	x10, x2, 2, 32	// _12246, weight_ch_size,,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	str	x3, [sp, 368]	// _7886, %sfp
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	sxtw	x3, w4	// _7887, out_size
	sbfiz	x7, x2, 3, 32	// _12268, weight_ch_size,,
	str	x1, [sp, 512]	// _12190, %sfp
	str	x3, [sp, 496]	// _7887, %sfp
	sbfiz	x3, x4, 2, 32	// _12291, out_size,,
	str	x3, [sp, 400]	// _12291, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	cmp	w12, 0	// OH,
	ble	.L614		//,
	mov	x22, 0	// ivtmp.4913,
	mov	w27, 0	// b,
	str	w0, [sp, 560]	// _17, %sfp
	sxtw	x1, w13	// _12516, OW
	mov	w4, w12	// OH, OH
	str	x22, [sp, 224]	// ivtmp.4913, %sfp
	mov	x24, x25	// out_b, out_b
	mov	x12, x9	// _12258, _12258
	ldr	x22, [sp, 448]	// _63, %sfp
	mov	x9, x8	// _12265, _12265
	mov	w25, w18	// KW, KW
	mov	x8, x7	// _12268, _12268
	mov	w14, w15	// in_size, in_size
	str	x1, [sp, 200]	// _12516, %sfp
	mov	w23, w27	// b, b
	mov	x7, x6	// _12279, _12279
.L858:
	ldr	x0, [sp, 400]	// _12291, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x6, 0	// ivtmp.4907,
	mov	x27, 0	// ivtmp.4906,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w20, 0	// oh,
	add	x0, x26, x0	// _12293, ivtmp.4912, _12291
	str	x0, [sp, 528]	// _12293, %sfp
	ldr	x0, [sp, 224]	// ivtmp.4913, %sfp
	add	x0, x28, x0, lsl 2	// _12222, in_ptr, ivtmp.4913,
	str	x0, [sp, 384]	// _12222, %sfp
.L825:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, 1	// OC,
	ble	.L857		//,
.L856:
	ldr	w11, [sp, 168]	//, %sfp
	and	w5, w19, -2	// _9032, _12273,
	sub	x0, x22, #8	// ivtmp.5003, _63,
	mov	x15, x26	// ivtmp.4912, ivtmp.4912
	mov	x26, x10	// _12246, _12246
	str	w4, [sp, 448]	// OH, %sfp
	mov	w10, w5	// _9032, _9032
	mov	w4, w20	// oh, oh
	str	w23, [sp, 416]	// b, %sfp
	mov	x5, x27	// ivtmp.4906, ivtmp.4906
	mov	x27, x7	// _12279, _12279
	str	w19, [sp, 432]	// _12273, %sfp
	mov	x7, x6	// ivtmp.4907, ivtmp.4907
	mov	x6, x12	// _12258, _12258
	str	x0, [sp, 576]	// ivtmp.5003, %sfp
	str	x24, [sp, 592]	// out_b, %sfp
.L839:
	ldr	x0, [sp, 528]	// _12293, %sfp
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	mov	x18, x15	// ivtmp.4912, ivtmp.4912
	mov	x23, 0	// ivtmp.4895,
	mov	w15, w10	// _9032, _9032
	mov	w19, w11	// IC, IC
	str	x7, [sp, 352]	// ivtmp.4907, %sfp
	ldr	x24, [sp, 576]	// ivtmp.4897, %sfp
	mov	w10, w13	// OW, OW
	str	x5, [sp, 456]	// ivtmp.4906, %sfp
	str	w4, [sp, 464]	// oh, %sfp
	add	x20, x0, x5, lsl 2	// ivtmp.4893, _12293, ivtmp.4906,
	ldr	x0, [sp, 208]	// _62, %sfp
	mov	x7, x0	// ivtmp.4891, ivtmp.4891
.L837:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	s30, [x7, 4]	// bv, MEM[(const float *)_12271 + 4B]
	ld1r	{v31.4s}, [x7]	//, MEM[(const float *)_12271]
	dup	v30.4s, v30.s[0]	//, bv
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q30, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q31, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q31, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q30, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q30, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q30, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q30, [sp, 2000]	//, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q30, [sp, 2016]	//, MEM <vector(4) float> [(float *)_520 + 176B]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w19, 0	// IC,
	ble	.L829		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x16, w14	// _7890, in_size
	cmp	w0, 0	// KH,
	ble	.L829		//,
	cmp	w25, 0	// KW,
	ble	.L829		//,
	ldr	x0, [sp, 368]	// _7886, %sfp
	mov	v29.16b, v30.16b	//,
	mov	v28.16b, v31.16b	//,
	mov	x1, x24	// ivtmp.4873, ivtmp.4897
	mov	x3, x23	// ivtmp.4870, ivtmp.4895
	mov	v27.16b, v30.16b	//,
	mov	v26.16b, v31.16b	//,
	add	x17, x26, 4	// _9723, _12246,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w2, 0	// ic,
	str	x23, [sp, 624]	// ivtmp.4895, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	ldr	x4, [sp, 352]	// ivtmp.4872, %sfp
	mov	v25.16b, v30.16b	//,
	mov	v24.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x30, x18	// ivtmp.4912, ivtmp.4912
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v23.16b, v30.16b	//,
	mov	v22.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x20, [sp, 640]	// ivtmp.4893, %sfp
	mov	x20, x8	// _12268, _12268
	ldr	x11, [sp, 512]	// _12190, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v21.16b, v30.16b	//,
	mov	v20.16b, v31.16b	//,
	add	x5, x0, x23	// ivtmp.4871, _7886, ivtmp.4895
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x23, x24	// ivtmp.4897, ivtmp.4897
	str	w10, [sp, 1456]	// OW, %sfp
	mov	x24, x9	// _12265, _12265
	mov	x10, x6	// _12258, _12258
	str	w14, [sp, 608]	// in_size, %sfp
	str	x7, [sp, 656]	// ivtmp.4891, %sfp
	.p2align 5,,15
.L831:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w18, 0	// kh,
	add	x9, x1, x26	// ivtmp.4858, ivtmp.4873, _12246
	str	x1, [sp, 216]	// ivtmp.4856, %sfp
	add	x8, x17, x1	// ivtmp.4860, _9723, ivtmp.4873
	add	x7, x1, 4	// ivtmp.4861, ivtmp.4873,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x14, x4	// ivtmp.4854, ivtmp.4872
	mov	x13, x5	// ivtmp.4853, ivtmp.4871
	str	w18, [sp, 272]	// kh, %sfp
	mov	x18, x3	// ivtmp.4852, ivtmp.4852
	.p2align 5,,15
.L830:
	ldr	x0, [sp, 384]	// _12222, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x12, 2	// ivtmp.4842,
	add	x0, x0, x14, lsl 2	// ivtmp.4847, _12222, ivtmp.4854,
	cmp	w25, 2	// KW,
	ble	.L1201		//,
	ldr	x6, [sp, 216]	// ivtmp.4856, %sfp
	str	w2, [sp, 240]	// ic, %sfp
	ldr	x2, [sp, 320]	// _12176, %sfp
	str	x1, [sp, 256]	// ivtmp.4873, %sfp
	b	.L834		//
	.p2align 2,,3
.L920:
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	x12, x1	// ivtmp.4842, ivtmp.4842
.L834:
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q7, q2, [x0]	//,,* ivtmp.4847
	add	x1, x12, 2	// ivtmp.4842, ivtmp.4842,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s19, [x6, x12, lsl 2]	//, MEM[(const float *)_12149 + ivtmp.4842_12137 * 4]
	ldr	s18, [x9, x12, lsl 2]	//, MEM[(const float *)_12155 + ivtmp.4842_12137 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q3, q6, [x0, 32]	//,,
	ldr	s16, [x7, x12, lsl 2]	//, MEM[(const float *)_12152 + ivtmp.4842_12137 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v2.4s, v19.s[0]	//,,
	ldr	s17, [x8, x12, lsl 2]	//, MEM[(const float *)_12158 + ivtmp.4842_12137 * 4]
	fmla	v21.4s, v2.4s, v18.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x0, 4]	//, MEM <const vector(4) float> [(const float *)_12159 + 4B]
	ldp	q4, q2, [x0, 64]	//,,
	add	x0, x0, 8	// ivtmp.4847, ivtmp.4847,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v7.4s, v19.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x0, 12]	//, MEM <const vector(4) float> [(const float *)_12159 + 20B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v7.4s, v18.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q7, [x0, 28]	//, MEM <const vector(4) float> [(const float *)_12159 + 36B]
	ldr	q5, [x0, 44]	//, MEM <const vector(4) float> [(const float *)_12159 + 52B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v0.4s, v16.s[0]	//,,
	fmla	v30.4s, v0.4s, v17.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x0, 60]	//, MEM <const vector(4) float> [(const float *)_12159 + 68B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v1.4s, v16.s[0]	//,,
	fmla	v21.4s, v1.4s, v17.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x0, 76]	//, MEM <const vector(4) float> [(const float *)_12159 + 84B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v3.4s, v19.s[0]	//,,
	fmla	v23.4s, v3.4s, v18.s[0]	//,,
	fmla	v24.4s, v6.4s, v19.s[0]	//,,
	fmla	v25.4s, v6.4s, v18.s[0]	//,,
	fmla	v26.4s, v4.4s, v19.s[0]	//,,
	fmla	v27.4s, v4.4s, v18.s[0]	//,,
	fmla	v28.4s, v2.4s, v19.s[0]	//,,
	fmla	v29.4s, v2.4s, v18.s[0]	//,,
	fmla	v22.4s, v7.4s, v16.s[0]	//,,
	fmla	v23.4s, v7.4s, v17.s[0]	//,,
	fmla	v24.4s, v5.4s, v16.s[0]	//,,
	fmla	v25.4s, v5.4s, v17.s[0]	//,,
	fmla	v26.4s, v0.4s, v16.s[0]	//,,
	fmla	v27.4s, v0.4s, v17.s[0]	//,,
	fmla	v28.4s, v1.4s, v16.s[0]	//,,
	fmla	v29.4s, v1.4s, v17.s[0]	//,,
	cmp	x1, x2	// ivtmp.4842, _12176
	bne	.L920		//,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	x1, [sp, 256]	// ivtmp.4873, %sfp
	str	x6, [sp, 216]	// ivtmp.4856, %sfp
	ldr	w2, [sp, 240]	//, %sfp
.L835:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w12	// _11586, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w12, w12, 1	// kw, kw,
	ldr	x6, [sp, 224]	// ivtmp.4913, %sfp
	str	x0, [sp, 240]	// _11586, %sfp
	str	w12, [sp, 480]	// kw, %sfp
	add	x6, x6, x14	// _9733, ivtmp.4913, ivtmp.4854
	add	x0, x6, x0	// _11597, _9733, _11586
	str	x6, [sp, 256]	// _9733, %sfp
	add	x12, x28, x0, lsl 2	// vectp.3423, in_ptr, _11597,
	lsl	x0, x0, 2	// _11598, _11597,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x6, [sp, 240]	// _11586, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q3, [x28, x0]	//, MEM <const vector(4) float> [(const float *)vectp.3423_11599]
	ldr	q1, [x12, 80]	//, MEM <const vector(4) float> [(const float *)vectp.3423_11599 + 80B]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x6, x18	// tmp3794, _11586, ivtmp.4852
	str	x6, [sp, 552]	// tmp3794, %sfp
	ldr	x6, [sp, 240]	// _11586, %sfp
	ldr	x0, [sp, 552]	// tmp3794, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q7, q6, [x12, 16]	//,,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x6, x13	// tmp3795, _11586, ivtmp.4853
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q2, [x12, 48]	//,,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s5, [x22, x0, lsl 2]	//, *_11589
	ldr	s4, [x22, x6, lsl 2]	//, *_11593
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w12, [sp, 480]	//, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v3.4s, v5.s[0]	//,,
	fmla	v30.4s, v3.4s, v4.s[0]	//,,
	fmla	v20.4s, v7.4s, v5.s[0]	//,,
	fmla	v21.4s, v7.4s, v4.s[0]	//,,
	fmla	v22.4s, v6.4s, v5.s[0]	//,,
	fmla	v23.4s, v6.4s, v4.s[0]	//,,
	fmla	v24.4s, v0.4s, v5.s[0]	//,,
	fmla	v25.4s, v0.4s, v4.s[0]	//,,
	fmla	v26.4s, v2.4s, v5.s[0]	//,,
	fmla	v27.4s, v2.4s, v4.s[0]	//,,
	fmla	v28.4s, v1.4s, v5.s[0]	//,,
	fmla	v29.4s, v1.4s, v4.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w12	// KW, kw
	ble	.L833		//,
	ldr	x6, [sp, 256]	// _9733, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w12	// _9175, kw
	add	x12, x0, x6	// _10564, _9175, _9733
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x6, x0, x18	// tmp3810, _9175, ivtmp.4852
	add	x0, x0, x13	// tmp3811, _9175, ivtmp.4853
	str	x6, [sp, 256]	// tmp3810, %sfp
	add	x6, x28, x12, lsl 2	// vectp.3423, in_ptr, _10564,
	lsl	x12, x12, 2	// _10565, _10564,
	ldr	s7, [x22, x0, lsl 2]	//, *_9196
	str	x6, [sp, 240]	// vectp.3423, %sfp
	ldr	x6, [sp, 256]	// tmp3810, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x28, x12]	//, MEM <const vector(4) float> [(const float *)vectp.3423_10560]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s3, [x22, x6, lsl 2]	//, *_9190
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x6, [sp, 240]	// vectp.3423, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v0.4s, v7.s[0]	//,,
	fmla	v31.4s, v0.4s, v3.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	add	x0, x6, 16	// tmp9526, vectp.3423,
	ldp	q6, q2, [x0]	//,,
	add	x0, x6, 48	// tmp9530, vectp.3423,
	ldp	q1, q0, [x0]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v6.4s, v3.s[0]	//,,
	fmla	v21.4s, v6.4s, v7.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q6, [x6, 80]	//, MEM <const vector(4) float> [(const float *)vectp.3423_10560 + 80B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v2.4s, v3.s[0]	//,,
	fmla	v23.4s, v2.4s, v7.s[0]	//,,
	fmla	v24.4s, v1.4s, v3.s[0]	//,,
	fmla	v25.4s, v1.4s, v7.s[0]	//,,
	fmla	v26.4s, v0.4s, v3.s[0]	//,,
	fmla	v27.4s, v0.4s, v7.s[0]	//,,
	fmla	v28.4s, v6.4s, v3.s[0]	//,,
	fmla	v29.4s, v6.4s, v7.s[0]	//,,
.L833:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x6, [sp, 304]	// _7893, %sfp
	add	x9, x9, x11	// ivtmp.4858, ivtmp.4858, _12190
	add	x8, x8, x11	// ivtmp.4860, ivtmp.4860, _12190
	add	x7, x7, x11	// ivtmp.4861, ivtmp.4861, _12190
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 272]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x18, x18, x6	// ivtmp.4852, ivtmp.4852, _7893
	add	x13, x13, x6	// ivtmp.4853, ivtmp.4853, _7893
	ldr	x6, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w0, w0, 1	// kh, kh,
	str	w0, [sp, 272]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x14, x14, x6	// ivtmp.4854, ivtmp.4854, IW
	ldr	x6, [sp, 216]	// ivtmp.4856, %sfp
	add	x6, x6, x11	// ivtmp.4856, ivtmp.4856, _12190
	str	x6, [sp, 216]	// ivtmp.4856, %sfp
	ldr	w6, [sp, 176]	//, %sfp
	cmp	w6, w0	// KH, kh
	bne	.L830		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 336]	// _12238, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w2, w2, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x3, x3, x21	// ivtmp.4870, ivtmp.4870, _7891
	add	x5, x5, x21	// ivtmp.4871, ivtmp.4871, _7891
	add	x4, x4, x16	// ivtmp.4872, ivtmp.4872, _7890
	add	x1, x1, x0	// ivtmp.4873, ivtmp.4873, _12238
	cmp	w19, w2	// IC, ic
	bne	.L831		//,
	ldr	x7, [sp, 656]	// ivtmp.4891, %sfp
	mov	x6, x10	// _12258, _12258
	mov	x9, x24	// _12265, _12265
	mov	x8, x20	// _12268, _12268
	mov	x24, x23	// ivtmp.4897, ivtmp.4897
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	ldr	x23, [sp, 624]	// ivtmp.4895, %sfp
	mov	x18, x30	// ivtmp.4912, ivtmp.4912
	str	q20, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	ldr	x20, [sp, 640]	// ivtmp.4893, %sfp
	str	q22, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	ldr	w14, [sp, 608]	//, %sfp
	str	q24, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	ldr	w10, [sp, 1456]	//, %sfp
	str	q26, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q28, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q30, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q21, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q23, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q25, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q27, [sp, 2000]	//, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q29, [sp, 2016]	//, MEM <vector(4) float> [(float *)_520 + 176B]
.L829:
	cmp	w10, 0	// OW,
	ble	.L1202		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x0, [sp, 400]	// _12291, %sfp
	add	x1, sp, 1840	//,,
	str	w10, [sp, 216]	// OW, %sfp
	ldr	x2, [sp, 288]	//, %sfp
	str	w14, [sp, 240]	// in_size, %sfp
	str	x7, [sp, 256]	// ivtmp.4891, %sfp
	sub	x0, x20, x0	//, ivtmp.4893, _12291
	str	x18, [sp, 272]	// ivtmp.4912, %sfp
	str	x6, [sp, 480]	// _12258, %sfp
	str	x9, [sp, 552]	// _12265, %sfp
	str	w15, [sp, 608]	// _9032, %sfp
	str	x8, [sp, 1456]	// _12268, %sfp
	bl	memcpy		//
	ldr	x2, [sp, 288]	//, %sfp
	mov	x0, x20	//, ivtmp.4893
	add	x1, sp, 1936	//,,
	bl	memcpy		//
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x7, [sp, 256]	// ivtmp.4891, %sfp
	ldr	x6, [sp, 480]	// _12258, %sfp
	ldr	x9, [sp, 552]	// _12265, %sfp
	add	x7, x7, 8	// ivtmp.4891, ivtmp.4891,
	ldr	x8, [sp, 1456]	// _12268, %sfp
	add	x20, x20, x6	// ivtmp.4893, ivtmp.4893, _12258
	ldr	x18, [sp, 272]	// ivtmp.4912, %sfp
	add	x23, x23, x9	// ivtmp.4895, ivtmp.4895, _12265
	ldr	w10, [sp, 216]	//, %sfp
	add	x24, x24, x8	// ivtmp.4897, ivtmp.4897, _12268
	ldr	w14, [sp, 240]	//, %sfp
	ldr	w15, [sp, 608]	//, %sfp
	cmp	x7, x27	// ivtmp.4891, _12279
	bne	.L837		//,
.L1182:
	mov	w13, w10	// OW, OW
	mov	w10, w15	// _9032, _9032
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	add	w3, w10, 2	// oc0, _9032,
	mov	w11, w19	// IC, IC
	mov	x15, x18	// ivtmp.4912, ivtmp.4912
	ldr	x7, [sp, 352]	// ivtmp.4907, %sfp
	ldr	x5, [sp, 456]	// ivtmp.4906, %sfp
	ldr	w4, [sp, 464]	//, %sfp
	cmp	w0, w3	// OC, oc0
	ble	.L1203		//,
	mov	w23, w13	// OW, OW
	mov	x19, x7	// ivtmp.4907, ivtmp.4907
	ldr	x24, [sp, 592]	// out_b, %sfp
	mov	w20, w4	// oh, oh
	mov	x7, x27	// _12279, _12279
	mov	x4, x21	// _7891, _7891
	mov	x27, x5	// ivtmp.4906, ivtmp.4906
	ldr	w13, [sp, 432]	//, %sfp
	mov	x10, x26	// _12246, _12246
	mov	x11, x18	// ivtmp.4912, ivtmp.4912
	mov	w26, w14	// in_size, in_size
	mov	x12, x6	// _12258, _12258
	ldr	w5, [sp, 416]	//, %sfp
	ldr	w21, [sp, 448]	//, %sfp
.L842:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	sxtw	x2, w3	// _1096, oc0
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x0, [sp, 208]	// _62, %sfp
	ldr	s31, [x0, w3, uxtw 2]	// bv, *_1098
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
	dup	v31.4s, v31.s[0]	//, bv
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q31, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q31, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w0, 0	// IC,
	ble	.L846		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x1, w26	// _7924, in_size
	cmp	w0, 0	// KH,
	ble	.L846		//,
	cmp	w25, 0	// KW,
	ble	.L846		//,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	ldr	x3, [sp, 368]	// _7886, %sfp
	mov	v30.16b, v31.16b	//,
	mov	v29.16b, v31.16b	//,
	mov	x17, x19	// ivtmp.4835, ivtmp.4907
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w16, 0	// ic,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	v28.16b, v31.16b	//,
	mov	v27.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x24, [sp, 216]	// out_b, %sfp
	ldr	w0, [sp, 504]	//, %sfp
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	v26.16b, v31.16b	//,
	mul	x18, x2, x3	// ivtmp.4834, _1096, _7886
	and	w0, w0, -2	// _12110, _12172,
	add	w6, w0, 2	// kw, _12110,
.L848:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x24, x17	// ivtmp.4827, ivtmp.4835
	mov	x15, x18	// ivtmp.4826, ivtmp.4834
	str	w21, [sp, 240]	// OH, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w30, 0	// kh,
	str	w23, [sp, 256]	// OW, %sfp
.L847:
	cmp	w25, 2	// KW,
	ble	.L1204		//,
	ldr	x3, [sp, 384]	// _12222, %sfp
	add	x14, x22, x15, lsl 2	// ivtmp.4820, _63, ivtmp.4826,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w21, 0	// kw,
	mov	w0, w6	// kw, kw
	add	x3, x3, x24, lsl 2	// ivtmp.4821, _12222, ivtmp.4827,
	.p2align 5,,15
.L851:
	ld1r	{v25.4s}, [x14]	//, MEM[(const float *)_12094]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w21, w21, 2	// kw, kw,
	add	x14, x14, 8	// ivtmp.4820, ivtmp.4820,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q7, q6, [x3]	//,,* ivtmp.4821
	ldp	q4, q2, [x3, 32]	//,,
	ldp	q21, q20, [x3, 64]	//,,
	add	x3, x3, 8	// ivtmp.4821, ivtmp.4821,
	ldr	s24, [x14, -4]	//, MEM[(const float *)_12094 + 4B]
	ldr	q22, [x3, -4]	//, MEM <const vector(4) float> [(const float *)_12096 + 4B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v7.4s, v25.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q5, [x3, 12]	//, MEM <const vector(4) float> [(const float *)_12096 + 20B]
	ldr	q3, [x3, 28]	//, MEM <const vector(4) float> [(const float *)_12096 + 36B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v6.4s, v25.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x3, 44]	//, MEM <const vector(4) float> [(const float *)_12096 + 52B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v4.4s, v25.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x3, 60]	//, MEM <const vector(4) float> [(const float *)_12096 + 68B]
	ldr	q19, [x3, 76]	//, MEM <const vector(4) float> [(const float *)_12096 + 84B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v28.4s, v2.4s, v25.4s	//,,
	fmla	v29.4s, v21.4s, v25.4s	//,,
	fmla	v30.4s, v20.4s, v25.4s	//,,
	fmla	v31.4s, v22.4s, v24.s[0]	//,,
	fmla	v26.4s, v5.4s, v24.s[0]	//,,
	fmla	v27.4s, v3.4s, v24.s[0]	//,,
	fmla	v28.4s, v1.4s, v24.s[0]	//,,
	fmla	v29.4s, v0.4s, v24.s[0]	//,,
	fmla	v30.4s, v19.4s, v24.s[0]	//,,
	cmp	w21, w6	// kw, kw
	bne	.L851		//,
.L852:
	ldr	x3, [sp, 224]	// ivtmp.4913, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x23, w0	// _11536, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w0, w0, 1	// kw, kw,
	add	x3, x3, x24	// _9783, ivtmp.4913, ivtmp.4827
	add	x21, x3, x23	// _11543, _9783, _11536
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x23, x23, x15	// tmp3859, _11536, ivtmp.4826
	add	x14, x28, x21, lsl 2	// vectp.3394, in_ptr, _11543,
	lsl	x21, x21, 2	// _11544, _11543,
	ldr	s23, [x22, x23, lsl 2]	//, *_11539
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q17, q16, [x14, 16]	//,,
	ldp	q7, q6, [x14, 48]	//,,
	ldr	q18, [x28, x21]	//, MEM <const vector(4) float> [(const float *)vectp.3394_11545]
	ldr	q5, [x14, 80]	//, MEM <const vector(4) float> [(const float *)vectp.3394_11545 + 80B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v17.4s, v23.s[0]	//,,
	fmla	v31.4s, v18.4s, v23.s[0]	//,,
	fmla	v27.4s, v16.4s, v23.s[0]	//,,
	fmla	v28.4s, v7.4s, v23.s[0]	//,,
	fmla	v29.4s, v6.4s, v23.s[0]	//,,
	fmla	v30.4s, v5.4s, v23.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w0	// KW, kw
	ble	.L850		//,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w0	// _9267, kw
	add	x3, x0, x3	// _10500, _9267, _9783
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x14, x0, x15	// tmp3871, _9267, ivtmp.4826
	add	x0, x28, x3, lsl 2	// vectp.3394, in_ptr, _10500,
	lsl	x3, x3, 2	// _10501, _10500,
	ldr	s22, [x22, x14, lsl 2]	//, *_9274
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q3, q2, [x0, 16]	//,,
	ldp	q1, q0, [x0, 48]	//,,
	ldr	q4, [x28, x3]	//, MEM <const vector(4) float> [(const float *)vectp.3394_10496]
	ldr	q21, [x0, 80]	//, MEM <const vector(4) float> [(const float *)vectp.3394_10496 + 80B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v3.4s, v22.s[0]	//,,
	fmla	v31.4s, v4.4s, v22.s[0]	//,,
	fmla	v27.4s, v2.4s, v22.s[0]	//,,
	fmla	v28.4s, v1.4s, v22.s[0]	//,,
	fmla	v29.4s, v0.4s, v22.s[0]	//,,
	fmla	v30.4s, v21.4s, v22.s[0]	//,,
.L850:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x0, [sp, 304]	// _7893, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w30, w30, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x15, x15, x0	// ivtmp.4826, ivtmp.4826, _7893
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x24, x24, x0	// ivtmp.4827, ivtmp.4827, IW
	ldr	w0, [sp, 176]	//, %sfp
	cmp	w0, w30	// KH, kh
	bne	.L847		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w16, w16, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x18, x18, x4	// ivtmp.4834, ivtmp.4834, _7891
	add	x17, x17, x1	// ivtmp.4835, ivtmp.4835, _7924
	ldr	w21, [sp, 240]	//, %sfp
	ldr	w23, [sp, 256]	//, %sfp
	cmp	w0, w16	// IC, ic
	bne	.L848		//,
	ldr	x24, [sp, 216]	// out_b, %sfp
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q26, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q27, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q28, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q29, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q30, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
.L846:
	cmp	w23, 0	// OW,
	ble	.L845		//,
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	ldr	x0, [sp, 496]	// _7887, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	add	x1, sp, 1840	//,,
	str	w5, [sp, 216]	// b, %sfp
	str	x11, [sp, 240]	// ivtmp.4912, %sfp
	str	x4, [sp, 256]	// _7891, %sfp
	str	x10, [sp, 272]	// _12246, %sfp
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	madd	x0, x2, x0, x27	// _1154, _1096, _7887, ivtmp.4906
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x2, [sp, 288]	//, %sfp
	str	x9, [sp, 352]	// _12265, %sfp
	str	x8, [sp, 416]	// _12268, %sfp
	add	x0, x24, x0, lsl 2	//, out_b, _1154,
	str	w13, [sp, 432]	// _12273, %sfp
	stp	x12, x7, [sp, 448]	// _12258, _12279,
	bl	memcpy		//
	ldr	x11, [sp, 240]	// ivtmp.4912, %sfp
	ldp	x12, x7, [sp, 448]	// _12258, _12279,
	ldr	x4, [sp, 256]	// _7891, %sfp
	ldr	x10, [sp, 272]	// _12246, %sfp
	ldr	x9, [sp, 352]	// _12265, %sfp
	ldr	x8, [sp, 416]	// _12268, %sfp
	ldr	w5, [sp, 216]	//, %sfp
	ldr	w13, [sp, 432]	//, %sfp
.L845:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
	add	x27, x27, x0	// ivtmp.4906, ivtmp.4906, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x19, x19, x0	// ivtmp.4907, ivtmp.4907, IW
	cmp	w21, w20	// OH, oh
	beq	.L1205		//,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w3, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	cmp	w0, 1	// OC,
	beq	.L842		//,
	mov	x0, x4	// _7891, _7891
	mov	w14, w26	// in_size, in_size
	mov	x6, x19	// ivtmp.4907, ivtmp.4907
	mov	w4, w21	// OH, OH
	mov	w19, w13	// _12273, _12273
	mov	x26, x11	// ivtmp.4912, ivtmp.4912
	mov	w13, w23	// OW, OW
	mov	x21, x0	// _7891, _7891
	mov	w23, w5	// b, b
	b	.L856		//
.L1202:
	add	x7, x7, 8	// ivtmp.4891, ivtmp.4891,
	add	x20, x20, x6	// ivtmp.4893, ivtmp.4893, _12258
	add	x23, x23, x9	// ivtmp.4895, ivtmp.4895, _12265
	add	x24, x24, x8	// ivtmp.4897, ivtmp.4897, _12268
	cmp	x7, x27	// ivtmp.4891, _12279
	bne	.L837		//,
	b	.L1182		//
	.p2align 2,,3
.L1201:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w12, 0	// kw,
	b	.L835		//
.L1204:
	mov	w0, 0	// kw,
	b	.L852		//
.L1203:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w4, w4, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x5, x5, x0	// ivtmp.4906, ivtmp.4906, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x7, x7, x0	// ivtmp.4907, ivtmp.4907, IW
	ldr	w0, [sp, 448]	//, %sfp
	cmp	w0, w4	// OH, oh
	bne	.L839		//,
	ldr	w23, [sp, 416]	//, %sfp
	mov	x10, x26	// _12246, _12246
	mov	x4, x0	//,
	mov	x26, x18	// ivtmp.4912, ivtmp.4912
	mov	x12, x6	// _12258, _12258
	ldr	w19, [sp, 432]	//, %sfp
	mov	x7, x27	// _12279, _12279
.L840:
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w23, w23, 1	// b, b,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	ldr	x0, [sp, 544]	// _12298, %sfp
	ldr	x1, [sp, 472]	// _7883, %sfp
	add	x26, x26, x0	// ivtmp.4912, ivtmp.4912, _12298
	ldr	x0, [sp, 224]	// ivtmp.4913, %sfp
	add	x0, x0, x1	// ivtmp.4913, ivtmp.4913, _7883
	str	x0, [sp, 224]	// ivtmp.4913, %sfp
	ldr	w0, [sp, 560]	//, %sfp
	cmp	w0, w23	// _17, b
	beq	.L614		//,
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x24, x26	// out_b, ivtmp.4912
	b	.L858		//
.L857:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	beq	.L1206		//,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x27, x27, x0	// ivtmp.4906, ivtmp.4906, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x6, x6, x0	// ivtmp.4907, ivtmp.4907, IW
	cmp	w4, w20	// OH, oh
	bne	.L825		//,
	b	.L840		//
.L1205:
	mov	x0, x4	// _7891, _7891
	mov	w14, w26	// in_size, in_size
	mov	w4, w21	// OH, OH
	mov	w19, w13	// _12273, _12273
	mov	x26, x11	// ivtmp.4912, ivtmp.4912
	mov	w13, w23	// OW, OW
	mov	x21, x0	// _7891, _7891
	mov	w23, w5	// b, b
	b	.L840		//
.L1199:
	.cfi_offset 72, -1968
	.cfi_offset 73, -1960
	.cfi_offset 74, -1952
	.cfi_offset 75, -1944
	.cfi_offset 76, -1936
	.cfi_offset 77, -1928
	.cfi_offset 78, -1920
	.cfi_offset 79, -1912
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s13, [x3]	// acc$0$0, MEM[(float *)_4855]
	b	.L781		//
.L611:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w1, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w15, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w4, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w8, w2, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:473:         case 28: DISPATCH(28, 2)    // 14                       (conv1: OW=26)
	ldr	w0, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w1, w1, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w7, w2, w15	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w6, w8, w4	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w2, w2, w1	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w0, 0	// _18,
	ble	.L614		//,
	sub	w3, w18, #3	// _12402, KW,
	sbfiz	x6, x6, 2, 32	// _12528, out_ch_size,,
	mov	w5, w3	// _12402, _12402
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	sub	w3, w13, #1	// _10882, OW,
	add	x3, x3, 1	// _10883, _10882,
	cmp	w13, 0	// OW,
	str	x6, [sp, 552]	// _12528, %sfp
	lsl	x3, x3, 2	// _10884, _10883,
	mov	x6, 4	// tmp3938,
	csel	x3, x3, x6, gt	// _10885, _10884, tmp3938,
	str	x3, [sp, 320]	// _10885, %sfp
	ldr	x3, [sp, 208]	// _62, %sfp
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x7, w7	// _7819, in_ch_size
	sub	w19, w8, #2	// _12503, OC,
	str	w5, [sp, 512]	// _12402, %sfp
	lsr	w5, w5, 1	// _12403, _12402,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x21, w1	// _7827, weight_size
	add	w5, w5, 2	// _12405, _12403,
	sbfiz	x1, x1, 2, 32	// _12468, weight_size,,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	str	x7, [sp, 496]	// _7819, %sfp
	lsl	x5, x5, 1	// _12406, _12405,
	sbfiz	x8, x2, 1, 32	// _12495, weight_ch_size,,
	str	x1, [sp, 352]	// _12468, %sfp
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x1, w18	// _7829, KW
	sbfiz	x9, x2, 3, 32	// _12498, weight_ch_size,,
	add	x3, x3, 8	// _9245, _62,
	str	x5, [sp, 336]	// _12406, %sfp
	lsr	w5, w19, 1	// _12504, _12503,
	add	x7, x3, w5, uxtw 3	// _12509, _9245, _12504,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x3, w2	// _7822, weight_ch_size
	sbfiz	x2, x2, 2, 32	// _12476, weight_ch_size,,
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	str	x1, [sp, 304]	// _7829, %sfp
	sbfiz	x1, x18, 2, 32	// _12420, KW,,
	mov	x26, x25	// ivtmp.5018, out_b
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	str	x3, [sp, 368]	// _7822, %sfp
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	sxtw	x3, w4	// _7823, out_size
	sbfiz	x10, x4, 3, 32	// _12488, out_size,,
	str	x2, [sp, 272]	// _12476, %sfp
	str	x3, [sp, 480]	// _7823, %sfp
	sbfiz	x3, x4, 2, 32	// _12521, out_size,,
	str	x1, [sp, 528]	// _12420, %sfp
	str	x3, [sp, 400]	// _12521, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	cmp	w12, 0	// OH,
	ble	.L614		//,
	mov	x22, 0	// ivtmp.5019,
	mov	w27, 0	// b,
	str	w15, [sp, 416]	// in_size, %sfp
	sxtw	x1, w13	// _12516, OW
	mov	w4, w12	// OH, OH
	str	w0, [sp, 592]	// _18, %sfp
	str	x22, [sp, 224]	// ivtmp.5019, %sfp
	mov	x24, x25	// out_b, out_b
	mov	x12, x10	// _12488, _12488
	ldr	x22, [sp, 448]	// _63, %sfp
	mov	x10, x8	// _12495, _12495
	mov	w25, w18	// KW, KW
	mov	w23, w27	// b, b
	mov	x8, x7	// _12509, _12509
	str	x1, [sp, 200]	// _12516, %sfp
.L892:
	ldr	x0, [sp, 400]	// _12521, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x7, 0	// ivtmp.5013,
	mov	x27, 0	// ivtmp.5012,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w20, 0	// oh,
	add	x0, x26, x0	// _12523, ivtmp.5018, _12521
	str	x0, [sp, 544]	// _12523, %sfp
	ldr	x0, [sp, 224]	// ivtmp.5019, %sfp
	add	x0, x28, x0, lsl 2	// _12452, in_ptr, ivtmp.5019,
	str	x0, [sp, 384]	// _12452, %sfp
.L859:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, 1	// OC,
	ble	.L891		//,
.L890:
	and	w5, w19, -2	// _9047, _12503,
	sub	x0, x22, #8	// ivtmp.5003, _63,
	str	w4, [sp, 448]	// OH, %sfp
	mov	w11, w19	// _12503, _12503
	mov	x4, x27	// ivtmp.5012, ivtmp.5012
	str	x26, [sp, 456]	// ivtmp.5018, %sfp
	mov	x27, x9	// _12498, _12498
	mov	x26, x8	// _12509, _12509
	str	w5, [sp, 608]	// _9047, %sfp
	mov	x8, x7	// ivtmp.5013, ivtmp.5013
	mov	w5, w20	// oh, oh
	str	w23, [sp, 432]	// b, %sfp
	mov	x7, x12	// _12488, _12488
	str	x0, [sp, 576]	// ivtmp.5003, %sfp
	str	x24, [sp, 1456]	// out_b, %sfp
.L873:
	ldr	x0, [sp, 544]	// _12523, %sfp
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	mov	x23, 0	// ivtmp.5001,
	str	w5, [sp, 464]	// oh, %sfp
	ldr	x19, [sp, 208]	// ivtmp.4997, %sfp
	str	x4, [sp, 472]	// ivtmp.5012, %sfp
	ldr	x24, [sp, 576]	// ivtmp.5003, %sfp
	add	x20, x0, x4, lsl 2	// ivtmp.4999, _12523, ivtmp.5012,
.L871:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	s28, s29, [x19]	// bv, bv,* ivtmp.4997
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	add	x2, sp, 1944	//,,
	add	x3, sp, 2056	//,,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
	dup	v31.4s, v28.s[0]	//, bv
	dup	v30.4s, v29.s[0]	//, bv
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q31, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q31, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	stp	s28, s28, [x2, -8]	// bv, bv,
	stp	s28, s28, [x2]	// bv, bv,
	str	q30, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q30, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q30, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q30, [sp, 2000]	//, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q30, [sp, 2016]	//, MEM <vector(4) float> [(float *)_520 + 176B]
	str	q30, [sp, 2032]	//, MEM <vector(4) float> [(float *)_520 + 192B]
	stp	s29, s29, [x3, -8]	// bv, bv,
	stp	s29, s29, [x3]	// bv, bv,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w0, 0	// IC,
	ble	.L863		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	ldrsw	x2, [sp, 416]	// _7826, %sfp
	cmp	w0, 0	// KH,
	ble	.L863		//,
	cmp	w25, 0	// KW,
	ble	.L863		//,
	ldr	x0, [sp, 368]	// _7822, %sfp
	mov	v27.16b, v30.16b	//,
	mov	v26.16b, v31.16b	//,
	mov	x4, x23	// ivtmp.4976, ivtmp.5001
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x30, x23	// ivtmp.5001, ivtmp.5001
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v25.16b, v30.16b	//,
	mov	v24.16b, v31.16b	//,
	mov	x1, x24	// ivtmp.4979, ivtmp.5003
	mov	x5, x8	// ivtmp.4978, ivtmp.5013
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x19, [sp, 640]	// ivtmp.4997, %sfp
	ldr	q29, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v23.16b, v30.16b	//,
	mov	v22.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w3, 0	// ic,
	mov	x19, x8	// ivtmp.5013, ivtmp.5013
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v21.16b, v30.16b	//,
	mov	v20.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w13, [sp, 624]	// OW, %sfp
	ldr	q28, [sp, 2048]	//, MEM <vector(4) float> [(float *)_520 + 208B]
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	v19.16b, v30.16b	//,
	mov	v18.16b, v31.16b	//,
	add	x6, x0, x23	// ivtmp.4977, _7822, ivtmp.5001
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x23, x20	// ivtmp.4999, ivtmp.4999
	ldr	x0, [sp, 272]	// _12476, %sfp
	ldr	x9, [sp, 528]	// _12420, %sfp
	add	x17, x0, 4	// _9302, _12476,
	.p2align 5,,15
.L865:
	ldr	x0, [sp, 272]	// _12476, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w20, 0	// kh,
	add	x13, x17, x1	// ivtmp.4966, _9302, ivtmp.4979
	add	x12, x1, 4	// ivtmp.4967, ivtmp.4979,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x18, x5	// ivtmp.4960, ivtmp.4978
	str	x1, [sp, 216]	// ivtmp.4962, %sfp
	mov	x16, x6	// ivtmp.4959, ivtmp.4977
	str	w20, [sp, 288]	// kh, %sfp
	mov	x20, x4	// ivtmp.4958, ivtmp.4958
	add	x14, x1, x0	// ivtmp.4964, ivtmp.4979, _12476
	.p2align 5,,15
.L864:
	ldr	x0, [sp, 384]	// _12452, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x15, 2	// ivtmp.4947,
	add	x0, x0, x18, lsl 2	// ivtmp.4953, _12452, ivtmp.4960,
	cmp	w25, 2	// KW,
	ble	.L1207		//,
	ldr	x8, [sp, 216]	// ivtmp.4962, %sfp
	str	x2, [sp, 240]	// _7826, %sfp
	ldr	x2, [sp, 336]	// _12406, %sfp
	str	x1, [sp, 256]	// ivtmp.4979, %sfp
	b	.L868		//
	.p2align 2,,3
.L921:
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	x15, x1	// ivtmp.4947, ivtmp.4947
.L868:
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q3, [x0]	//,,* ivtmp.4953
	add	x1, x15, 2	// ivtmp.4947, ivtmp.4947,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s17, [x8, x15, lsl 2]	//, MEM[(const float *)_12377 + ivtmp.4947_12365 * 4]
	ldr	s16, [x14, x15, lsl 2]	//, MEM[(const float *)_12383 + ivtmp.4947_12365 * 4]
	ldr	s6, [x12, x15, lsl 2]	//, MEM[(const float *)_12380 + ivtmp.4947_12365 * 4]
	ldr	s7, [x13, x15, lsl 2]	//, MEM[(const float *)_12386 + ivtmp.4947_12365 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v0.4s, v17.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x0, 20]	//, MEM <const vector(4) float> [(const float *)_12387 + 20B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v0.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q5, [x0, 36]	//, MEM <const vector(4) float> [(const float *)_12387 + 36B]
	ldp	q1, q0, [x0, 32]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v3.4s, v17.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q4, [x0, 4]	//, MEM <const vector(4) float> [(const float *)_12387 + 4B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v19.4s, v3.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q3, [x0, 52]	//, MEM <const vector(4) float> [(const float *)_12387 + 52B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v2.4s, v6.s[0]	//,,
	fmla	v20.4s, v1.4s, v17.s[0]	//,,
	fmla	v21.4s, v1.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x0, 68]	//, MEM <const vector(4) float> [(const float *)_12387 + 68B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v19.4s, v2.4s, v7.s[0]	//,,
	fmla	v20.4s, v5.4s, v6.s[0]	//,,
	fmla	v21.4s, v5.4s, v7.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q2, q5, [x0, 64]	//,,
	add	x0, x0, 8	// ivtmp.4953, ivtmp.4953,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v0.4s, v17.s[0]	//,,
	fmla	v23.4s, v0.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x0, 88]	//, MEM <const vector(4) float> [(const float *)_12387 + 96B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v4.4s, v6.s[0]	//,,
	fmla	v24.4s, v2.4s, v17.s[0]	//,,
	fmla	v25.4s, v2.4s, v16.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x0, 92]	//, MEM <const vector(4) float> [(const float *)_12387 + 100B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v4.4s, v7.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q4, [x0, 76]	//, MEM <const vector(4) float> [(const float *)_12387 + 84B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v5.4s, v17.s[0]	//,,
	fmla	v27.4s, v5.4s, v16.s[0]	//,,
	fmla	v29.4s, v0.4s, v17.s[0]	//,,
	fmla	v28.4s, v0.4s, v16.s[0]	//,,
	fmla	v22.4s, v3.4s, v6.s[0]	//,,
	fmla	v23.4s, v3.4s, v7.s[0]	//,,
	fmla	v24.4s, v1.4s, v6.s[0]	//,,
	fmla	v25.4s, v1.4s, v7.s[0]	//,,
	fmla	v26.4s, v4.4s, v6.s[0]	//,,
	fmla	v27.4s, v4.4s, v7.s[0]	//,,
	fmla	v29.4s, v2.4s, v6.s[0]	//,,
	fmla	v28.4s, v2.4s, v7.s[0]	//,,
	cmp	x1, x2	// ivtmp.4947, _12406
	bne	.L921		//,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	x2, [sp, 240]	// _7826, %sfp
	str	x8, [sp, 216]	// ivtmp.4962, %sfp
	ldr	x1, [sp, 256]	// ivtmp.4979, %sfp
.L869:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w15	// _11721, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w15, w15, 1	// kw, kw,
	ldr	x8, [sp, 224]	// ivtmp.5019, %sfp
	str	x0, [sp, 240]	// _11721, %sfp
	str	w15, [sp, 504]	// kw, %sfp
	add	x8, x8, x18	// _9329, ivtmp.5019, ivtmp.4960
	add	x0, x8, x0	// _11732, _9329, _11721
	str	x8, [sp, 256]	// _9329, %sfp
	add	x15, x28, x0, lsl 2	// vectp.3503, in_ptr, _11732,
	lsl	x0, x0, 2	// _11733, _11732,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x8, [sp, 240]	// _11721, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q4, [x28, x0]	//, MEM <const vector(4) float> [(const float *)vectp.3503_11734]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x8, x8, x20	// tmp3953, _11721, ivtmp.4958
	str	x8, [sp, 560]	// tmp3953, %sfp
	ldr	x8, [sp, 240]	// _11721, %sfp
	ldr	x0, [sp, 560]	// tmp3953, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q3, q0, [x15, 16]	//,,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x8, x8, x16	// tmp3954, _11721, ivtmp.4959
	ldr	s1, [x22, x0, lsl 2]	//, *_11724
	ldr	s5, [x22, x8, lsl 2]	//, *_11728
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v4.4s, v1.s[0]	//,,
	fmla	v30.4s, v4.4s, v5.s[0]	//,,
	fmla	v18.4s, v3.4s, v1.s[0]	//,,
	fmla	v19.4s, v3.4s, v5.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q4, q3, [x15, 48]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v0.4s, v1.s[0]	//,,
	fmla	v21.4s, v0.4s, v5.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q2, q0, [x15, 80]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w15, [sp, 504]	//, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v4.4s, v1.s[0]	//,,
	fmla	v23.4s, v4.4s, v5.s[0]	//,,
	fmla	v24.4s, v3.4s, v1.s[0]	//,,
	fmla	v25.4s, v3.4s, v5.s[0]	//,,
	fmla	v26.4s, v2.4s, v1.s[0]	//,,
	fmla	v27.4s, v2.4s, v5.s[0]	//,,
	fmla	v29.4s, v0.4s, v1.s[0]	//,,
	fmla	v28.4s, v0.4s, v5.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w15	// KW, kw
	ble	.L867		//,
	ldr	x8, [sp, 256]	// _9329, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w15	// _9334, kw
	add	x15, x8, x0	// _10739, _9329, _9334
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x8, x0, x20	// tmp3970, _9334, ivtmp.4958
	add	x0, x0, x16	// tmp3971, _9334, ivtmp.4959
	str	x8, [sp, 240]	// tmp3970, %sfp
	lsl	x8, x15, 2	// _10740, _10739,
	add	x15, x28, x15, lsl 2	// vectp.3503, in_ptr, _10739,
	ldr	s2, [x22, x0, lsl 2]	//, *_9347
	str	x8, [sp, 256]	// _10740, %sfp
	ldr	x8, [sp, 240]	// tmp3970, %sfp
	ldr	s3, [x22, x8, lsl 2]	//, *_9341
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x8, [sp, 256]	// _10740, %sfp
	ldr	q4, [x28, x8]	//, MEM <const vector(4) float> [(const float *)vectp.3503_10735]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v4.4s, v3.s[0]	//,,
	fmla	v30.4s, v4.4s, v2.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q4, [x15, 16]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v0.4s, v3.s[0]	//,,
	fmla	v19.4s, v0.4s, v2.s[0]	//,,
	fmla	v20.4s, v4.4s, v3.s[0]	//,,
	fmla	v21.4s, v4.4s, v2.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q4, [x15, 48]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v22.4s, v0.4s, v3.s[0]	//,,
	fmla	v23.4s, v0.4s, v2.s[0]	//,,
	fmla	v24.4s, v4.4s, v3.s[0]	//,,
	fmla	v25.4s, v4.4s, v2.s[0]	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q0, q4, [x15, 80]	//,,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v0.4s, v3.s[0]	//,,
	fmla	v27.4s, v0.4s, v2.s[0]	//,,
	fmla	v29.4s, v4.4s, v3.s[0]	//,,
	fmla	v28.4s, v4.4s, v2.s[0]	//,,
.L867:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x8, [sp, 304]	// _7829, %sfp
	add	x14, x14, x9	// ivtmp.4964, ivtmp.4964, _12420
	add	x13, x13, x9	// ivtmp.4966, ivtmp.4966, _12420
	add	x12, x12, x9	// ivtmp.4967, ivtmp.4967, _12420
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 288]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x20, x20, x8	// ivtmp.4958, ivtmp.4958, _7829
	add	x16, x16, x8	// ivtmp.4959, ivtmp.4959, _7829
	ldr	x8, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w0, w0, 1	// kh, kh,
	str	w0, [sp, 288]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x18, x18, x8	// ivtmp.4960, ivtmp.4960, IW
	ldr	x8, [sp, 216]	// ivtmp.4962, %sfp
	add	x8, x8, x9	// ivtmp.4962, ivtmp.4962, _12420
	str	x8, [sp, 216]	// ivtmp.4962, %sfp
	ldr	w8, [sp, 176]	//, %sfp
	cmp	w8, w0	// KH, kh
	bne	.L864		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 352]	// _12468, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w3, w3, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x4, x4, x21	// ivtmp.4976, ivtmp.4976, _7827
	add	x6, x6, x21	// ivtmp.4977, ivtmp.4977, _7827
	add	x5, x5, x2	// ivtmp.4978, ivtmp.4978, _7826
	add	x1, x1, x0	// ivtmp.4979, ivtmp.4979, _12468
	ldr	w0, [sp, 168]	//, %sfp
	cmp	w0, w3	// IC, ic
	bne	.L865		//,
	mov	x8, x19	// ivtmp.5013, ivtmp.5013
	ldr	x19, [sp, 640]	// ivtmp.4997, %sfp
	mov	x20, x23	// ivtmp.4999, ivtmp.4999
	mov	x23, x30	// ivtmp.5001, ivtmp.5001
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	ldr	w13, [sp, 624]	//, %sfp
	str	q18, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q20, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q22, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q24, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q26, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q29, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q30, [sp, 1952]	//, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q19, [sp, 1968]	//, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q21, [sp, 1984]	//, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q23, [sp, 2000]	//, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q25, [sp, 2016]	//, MEM <vector(4) float> [(float *)_520 + 176B]
	str	q27, [sp, 2032]	//, MEM <vector(4) float> [(float *)_520 + 192B]
	str	q28, [sp, 2048]	//, MEM <vector(4) float> [(float *)_520 + 208B]
.L863:
	cmp	w13, 0	// OW,
	ble	.L1208		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x0, [sp, 400]	// _12521, %sfp
	add	x1, sp, 1840	//,,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	x19, x19, 8	// ivtmp.4997, ivtmp.4997,
	str	w13, [sp, 216]	// OW, %sfp
	add	x24, x24, x27	// ivtmp.5003, ivtmp.5003, _12498
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x2, [sp, 320]	//, %sfp
	str	x8, [sp, 240]	// ivtmp.5013, %sfp
	str	x7, [sp, 256]	// _12488, %sfp
	sub	x0, x20, x0	//, ivtmp.4999, _12521
	str	x10, [sp, 288]	// _12495, %sfp
	str	w11, [sp, 504]	// _12503, %sfp
	bl	memcpy		//
	ldr	x2, [sp, 320]	//, %sfp
	mov	x0, x20	//, ivtmp.4999
	add	x1, sp, 1952	//,,
	bl	memcpy		//
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x7, [sp, 256]	// _12488, %sfp
	cmp	x19, x26	// ivtmp.4997, _12509
	ldr	x10, [sp, 288]	// _12495, %sfp
	ldr	x8, [sp, 240]	// ivtmp.5013, %sfp
	add	x20, x20, x7	// ivtmp.4999, ivtmp.4999, _12488
	ldr	w13, [sp, 216]	//, %sfp
	add	x23, x23, x10	// ivtmp.5001, ivtmp.5001, _12495
	ldr	w11, [sp, 504]	//, %sfp
	bne	.L871		//,
	ldr	w0, [sp, 608]	//, %sfp
	ldr	x4, [sp, 472]	// ivtmp.5012, %sfp
	ldr	w5, [sp, 464]	//, %sfp
	add	w3, w0, 2	// oc0, _9047,
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, w3	// OC, oc0
	ble	.L1209		//,
.L1171:
	ldr	x24, [sp, 1456]	// out_b, %sfp
	mov	x19, x8	// ivtmp.5013, ivtmp.5013
	mov	x12, x7	// _12488, _12488
	mov	x9, x27	// _12498, _12498
	mov	x8, x26	// _12509, _12509
	ldr	x7, [sp, 456]	// ivtmp.5018, %sfp
	mov	x27, x4	// ivtmp.5012, ivtmp.5012
	mov	x26, x21	// _7827, _7827
	mov	w23, w13	// OW, OW
	mov	w20, w5	// oh, oh
	ldr	w4, [sp, 432]	//, %sfp
	ldr	w21, [sp, 448]	//, %sfp
.L876:
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	add	x1, sp, 1944	//,,
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	sxtw	x2, w3	// _1263, oc0
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x0, [sp, 208]	// _62, %sfp
	ldr	s30, [x0, w3, uxtw 2]	// bv, *_1265
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
	dup	v31.4s, v30.s[0]	//, bv
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q31, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q31, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q31, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q31, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	stp	s30, s30, [x1, -8]	// bv, bv,
	stp	s30, s30, [x1]	// bv, bv,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w0, 0	// IC,
	ble	.L880		//,
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	ldrsw	x5, [sp, 416]	// _7860, %sfp
	cmp	w0, 0	// KH,
	ble	.L880		//,
	cmp	w25, 0	// KW,
	ble	.L880		//,
	ldr	w0, [sp, 512]	//, %sfp
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	v29.16b, v31.16b	//,
	mov	v28.16b, v31.16b	//,
	mov	x17, x19	// ivtmp.4941, ivtmp.5013
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w16, 0	// ic,
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	v27.16b, v31.16b	//,
	mov	v26.16b, v31.16b	//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w21, [sp, 216]	// OH, %sfp
	ldr	q30, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	mov	v25.16b, v31.16b	//,
	and	w14, w0, -2	// _12338, _12402,
	ldr	x0, [sp, 368]	// _7822, %sfp
	add	w14, w14, 2	// kw, _12338,
	mul	x18, x2, x0	// ivtmp.4940, _1263, _7822
.L882:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	x21, x17	// ivtmp.4933, ivtmp.4941
	mov	x6, x18	// ivtmp.4932, ivtmp.4940
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w30, 0	// kh,
.L881:
	cmp	w25, 2	// KW,
	ble	.L1210		//,
	ldr	x1, [sp, 384]	// _12452, %sfp
	add	x3, x22, x6, lsl 2	// ivtmp.4926, _63, ivtmp.4932,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w13, 0	// kw,
	mov	w0, w14	// kw, kw
	add	x1, x1, x21, lsl 2	// ivtmp.4927, _12452, ivtmp.4933,
	.p2align 5,,15
.L885:
	ld1r	{v24.4s}, [x3]	//, MEM[(const float *)_12320]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w13, w13, 2	// kw, kw,
	add	x3, x3, 8	// ivtmp.4926, ivtmp.4926,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q22, q18, [x1]	//,,* ivtmp.4927
	ldp	q16, q6, [x1, 32]	//,,
	ldp	q5, q3, [x1, 64]	//,,
	add	x1, x1, 8	// ivtmp.4927, ivtmp.4927,
	ldr	q1, [x1, 88]	//, MEM <const vector(4) float> [(const float *)_12322 + 96B]
	ldr	s23, [x3, -4]	//, MEM[(const float *)_12320 + 4B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v22.4s, v24.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x1, -4]	//, MEM <const vector(4) float> [(const float *)_12322 + 4B]
	ldr	q17, [x1, 12]	//, MEM <const vector(4) float> [(const float *)_12322 + 20B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v25.4s, v18.4s, v24.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q7, [x1, 28]	//, MEM <const vector(4) float> [(const float *)_12322 + 36B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v16.4s, v24.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q21, [x1, 44]	//, MEM <const vector(4) float> [(const float *)_12322 + 52B]
	ldr	q4, [x1, 60]	//, MEM <const vector(4) float> [(const float *)_12322 + 68B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v6.4s, v24.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x1, 76]	//, MEM <const vector(4) float> [(const float *)_12322 + 84B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v28.4s, v5.4s, v24.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x1, 92]	//, MEM <const vector(4) float> [(const float *)_12322 + 100B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v29.4s, v3.4s, v24.4s	//,,
	fmla	v30.4s, v1.4s, v24.4s	//,,
	fmla	v31.4s, v19.4s, v23.s[0]	//,,
	fmla	v25.4s, v17.4s, v23.s[0]	//,,
	fmla	v26.4s, v7.4s, v23.s[0]	//,,
	fmla	v27.4s, v21.4s, v23.s[0]	//,,
	fmla	v28.4s, v4.4s, v23.s[0]	//,,
	fmla	v29.4s, v2.4s, v23.s[0]	//,,
	fmla	v30.4s, v0.4s, v23.s[0]	//,,
	cmp	w13, w14	// kw, kw
	bne	.L885		//,
.L886:
	ldr	x1, [sp, 224]	// ivtmp.5019, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x15, w0	// _11665, kw
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w0, w0, 1	// kw, kw,
	add	x1, x1, x21	// _9435, ivtmp.5019, ivtmp.4933
	add	x13, x1, x15	// _11672, _9435, _11665
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x15, x15, x6	// tmp4022, _11665, ivtmp.4932
	add	x3, x28, x13, lsl 2	// vectp.3472, in_ptr, _11672,
	lsl	x13, x13, 2	// _11673, _11672,
	ldr	s20, [x22, x15, lsl 2]	//, *_11668
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q19, q18, [x3, 16]	//,,
	ldp	q17, q16, [x3, 48]	//,,
	ldp	q7, q6, [x3, 80]	//,,
	ldr	q22, [x28, x13]	//, MEM <const vector(4) float> [(const float *)vectp.3472_11674]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v25.4s, v19.4s, v20.s[0]	//,,
	fmla	v31.4s, v22.4s, v20.s[0]	//,,
	fmla	v26.4s, v18.4s, v20.s[0]	//,,
	fmla	v27.4s, v17.4s, v20.s[0]	//,,
	fmla	v28.4s, v16.4s, v20.s[0]	//,,
	fmla	v29.4s, v7.4s, v20.s[0]	//,,
	fmla	v30.4s, v6.4s, v20.s[0]	//,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w25, w0	// KW, kw
	ble	.L884		//,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sxtw	x0, w0	// _9416, kw
	add	x1, x0, x1	// _10666, _9416, _9435
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	add	x3, x0, x6	// tmp4035, _9416, ivtmp.4932
	add	x0, x28, x1, lsl 2	// vectp.3472, in_ptr, _10666,
	lsl	x1, x1, 2	// _10667, _10666,
	ldr	s21, [x22, x3, lsl 2]	//, *_9413
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldp	q4, q3, [x0, 16]	//,,
	ldp	q2, q1, [x0, 48]	//,,
	ldp	q0, q22, [x0, 80]	//,,
	ldr	q5, [x28, x1]	//, MEM <const vector(4) float> [(const float *)vectp.3472_10662]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v25.4s, v4.4s, v21.s[0]	//,,
	fmla	v31.4s, v5.4s, v21.s[0]	//,,
	fmla	v26.4s, v3.4s, v21.s[0]	//,,
	fmla	v27.4s, v2.4s, v21.s[0]	//,,
	fmla	v28.4s, v1.4s, v21.s[0]	//,,
	fmla	v29.4s, v0.4s, v21.s[0]	//,,
	fmla	v30.4s, v22.4s, v21.s[0]	//,,
.L884:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x0, [sp, 304]	// _7829, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w30, w30, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x6, x6, x0	// ivtmp.4932, ivtmp.4932, _7829
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x21, x21, x0	// ivtmp.4933, ivtmp.4933, IW
	ldr	w0, [sp, 176]	//, %sfp
	cmp	w0, w30	// KH, kh
	bne	.L881		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w16, w16, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x18, x18, x26	// ivtmp.4940, ivtmp.4940, _7827
	add	x17, x17, x5	// ivtmp.4941, ivtmp.4941, _7860
	cmp	w0, w16	// IC, ic
	bne	.L882		//,
	ldr	w21, [sp, 216]	//, %sfp
	str	q31, [sp, 1840]	//, MEM <vector(4) float> [(float *)_520]
	str	q25, [sp, 1856]	//, MEM <vector(4) float> [(float *)_520 + 16B]
	str	q26, [sp, 1872]	//, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q27, [sp, 1888]	//, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q28, [sp, 1904]	//, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q29, [sp, 1920]	//, MEM <vector(4) float> [(float *)_520 + 80B]
	str	q30, [sp, 1936]	//, MEM <vector(4) float> [(float *)_520 + 96B]
.L880:
	cmp	w23, 0	// OW,
	ble	.L879		//,
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	ldr	x0, [sp, 480]	// _7823, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	add	x1, sp, 1840	//,,
	str	w4, [sp, 216]	// b, %sfp
	str	x7, [sp, 240]	// ivtmp.5018, %sfp
	str	x12, [sp, 256]	// _12488, %sfp
	str	x10, [sp, 288]	// _12495, %sfp
// src/cpp/cnn_internals.cpp:357:                             + (std::size_t)oh * output_w;
	madd	x0, x2, x0, x27	// _1321, _1263, _7823, ivtmp.5012
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	x2, [sp, 320]	//, %sfp
	str	w11, [sp, 432]	// _12503, %sfp
	stp	x9, x8, [sp, 448]	// _12498, _12509,
	add	x0, x24, x0, lsl 2	//, out_b, _1321,
	bl	memcpy		//
	ldr	x7, [sp, 240]	// ivtmp.5018, %sfp
	ldp	x9, x8, [sp, 448]	// _12498, _12509,
	ldr	x12, [sp, 256]	// _12488, %sfp
	ldr	x10, [sp, 288]	// _12495, %sfp
	ldr	w4, [sp, 216]	//, %sfp
	ldr	w11, [sp, 432]	//, %sfp
.L879:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
	add	x27, x27, x0	// ivtmp.5012, ivtmp.5012, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x19, x19, x0	// ivtmp.5013, ivtmp.5013, IW
	cmp	w21, w20	// OH, oh
	beq	.L1211		//,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w3, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	cmp	w0, 1	// OC,
	beq	.L876		//,
	mov	w13, w23	// OW, OW
	mov	w23, w4	// b, b
	mov	w4, w21	// OH, OH
	mov	x21, x26	// _7827, _7827
	mov	x26, x7	// ivtmp.5018, ivtmp.5018
	mov	x7, x19	// ivtmp.5013, ivtmp.5013
	mov	w19, w11	// _12503, _12503
	b	.L890		//
.L1208:
	add	x19, x19, 8	// ivtmp.4997, ivtmp.4997,
	add	x20, x20, x7	// ivtmp.4999, ivtmp.4999, _12488
	add	x23, x23, x10	// ivtmp.5001, ivtmp.5001, _12495
	add	x24, x24, x27	// ivtmp.5003, ivtmp.5003, _12498
	cmp	x19, x26	// ivtmp.4997, _12509
	bne	.L871		//,
	ldr	w0, [sp, 608]	//, %sfp
	ldr	x4, [sp, 472]	// ivtmp.5012, %sfp
	ldr	w5, [sp, 464]	//, %sfp
	add	w3, w0, 2	// oc0, _9047,
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, w3	// OC, oc0
	bgt	.L1171		//,
.L1209:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w5, w5, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x4, x4, x0	// ivtmp.5012, ivtmp.5012, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x8, x8, x0	// ivtmp.5013, ivtmp.5013, IW
	ldr	w0, [sp, 448]	//, %sfp
	cmp	w0, w5	// OH, oh
	bne	.L873		//,
	mov	x8, x26	// _12509, _12509
	ldr	x26, [sp, 456]	// ivtmp.5018, %sfp
	mov	x4, x0	//,
	mov	x12, x7	// _12488, _12488
	mov	x9, x27	// _12498, _12498
	ldr	w23, [sp, 432]	//, %sfp
	mov	w19, w11	// _12503, _12503
.L874:
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w23, w23, 1	// b, b,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	ldr	x0, [sp, 552]	// _12528, %sfp
	ldr	x1, [sp, 496]	// _7819, %sfp
	add	x26, x26, x0	// ivtmp.5018, ivtmp.5018, _12528
	ldr	x0, [sp, 224]	// ivtmp.5019, %sfp
	add	x0, x0, x1	// ivtmp.5019, ivtmp.5019, _7819
	str	x0, [sp, 224]	// ivtmp.5019, %sfp
	ldr	w0, [sp, 592]	//, %sfp
	cmp	w0, w23	// _18, b
	beq	.L614		//,
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x24, x26	// out_b, ivtmp.5018
	b	.L892		//
	.p2align 2,,3
.L1207:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w15, 0	// kw,
	b	.L869		//
.L1210:
	mov	w0, 0	// kw,
	b	.L886		//
.L891:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	beq	.L1212		//,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x0, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w20, w20, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x27, x27, x0	// ivtmp.5012, ivtmp.5012, _12516
	ldr	x0, [sp, 192]	// IW, %sfp
	add	x7, x7, x0	// ivtmp.5013, ivtmp.5013, IW
	cmp	w4, w20	// OH, oh
	bne	.L859		//,
	b	.L874		//
.L1211:
	mov	w13, w23	// OW, OW
	mov	w19, w11	// _12503, _12503
	mov	w23, w4	// b, b
	mov	w4, w21	// OH, OH
	mov	x21, x26	// _7827, _7827
	mov	x26, x7	// ivtmp.5018, ivtmp.5018
	b	.L874		//
.L607:
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w1, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w4, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w7, w5, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:469:         case 12: DISPATCH(12, 4)    // 12                       (conv2: OW=11)
	ldr	w3, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w2, w0, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w6, w7, w4	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w0, w5, w1	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w9, w5, w2	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w3, 0	// _14,
	ble	.L614		//,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x5, w0	// _8541, in_ch_size
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x8, w9	// _530, weight_ch_size
	cmp	w12, 0	// OH,
	ble	.L614		//,
	mov	w0, w7	// OC, OC
	sub	w7, w7, #4	// _8678, OC,
	str	w12, [sp, 1648]	// OH, %sfp
	and	w7, w7, -4	// _8685, _8678,
	cmp	w0, 3	// OC,
	stp	d8, d9, [sp, 96]	//,,
	.cfi_offset 73, -1960
	.cfi_offset 72, -1968
	add	w21, w7, 4	// oc0, _8685,
	sbfiz	x26, x4, 4, 32	// _2405, out_size,,
	csel	w16, w21, wzr, gt	// oc0, oc0,,
	smull	x11, w16, w4	// _10463, oc0, out_size
	stp	d10, d11, [sp, 112]	//,,
	.cfi_offset 75, -1944
	.cfi_offset 74, -1952
	sbfiz	x17, x4, 2, 32	// _4600, out_size,,
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x4, w2	// _8546, weight_size
	stp	d12, d13, [sp, 128]	//,,
	.cfi_offset 77, -1928
	.cfi_offset 76, -1936
	sbfiz	x2, x2, 2, 32	// _9011, weight_size,,
	sxtw	x7, w16	// ivtmp.4269, oc0
	stp	d14, d15, [sp, 144]	//,,
	.cfi_offset 79, -1912
	.cfi_offset 78, -1920
	lsr	w14, w18, 2	// bnd.2577_6020, KW,
	mov	w10, 12	// tmp3215,
	str	x4, [sp, 1592]	// _8546, %sfp
	str	x2, [sp, 1608]	// _9011, %sfp
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x2, w18	// _8548, KW
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	x27, 0	// ivtmp.4435,
	smull	x22, w9, w10	// _10386, weight_ch_size, tmp3215
	str	w14, [sp, 1552]	// bnd.2577_6020, %sfp
	sub	w14, w14, #3	// _4266, bnd.2577_6020,
	mov	x10, x25	// ivtmp.4434, out_b
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	str	x2, [sp, 1600]	// _8548, %sfp
	sbfiz	x2, x18, 2, 32	// _9109, KW,,
	mul	x9, x8, x7	// ivtmp.4274, _530, ivtmp.4269
	and	w15, w14, -2	// _4270, _4266,
	lsr	w14, w18, 2	// _9102, KW,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	mov	w0, 0	// b,
	str	x7, [sp, 1656]	// ivtmp.4269, %sfp
	str	x2, [sp, 1544]	// _9109, %sfp
	mov	w7, w21	// oc0, oc0
	lsl	x25, x14, 4	// _9101, _9102,
	ldr	x2, [sp, 192]	// IW, %sfp
	mov	x21, x27	// ivtmp.4435, ivtmp.4435
	lsl	x14, x5, 2	// _5077, _8541,
	mov	x19, x28	// ivtmp.4436, in_ptr
	lsl	x23, x8, 2	// _5909, _530,
	str	x9, [sp, 1576]	// ivtmp.4274, %sfp
	lsl	x24, x8, 3	// _10395, _530,
	sbfiz	x9, x6, 2, 32	// _5052, out_ch_size,,
	str	w15, [sp, 1616]	// _4270, %sfp
	add	w6, w15, 2	// _4287, _4270,
	mov	x20, x8	// _530, _530
	mov	x12, x11	// _10463, _10463
	lsl	x15, x8, 4	// _2472, _530,
	lsl	x30, x2, 2	// _1426, IW,
	sub	w2, w18, #1	// _473, KW,
	str	w6, [sp, 1624]	// _4287, %sfp
	mov	x27, x30	// _1426, _1426
	mov	w30, w18	// KW, KW
	str	w2, [sp, 1440]	// _473, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x2, w1	// _8849, in_size
	sbfiz	x1, x1, 2, 32	// _7364, in_size,,
	str	x1, [sp, 1584]	// _7364, %sfp
	sxtw	x1, w13	// _12516, OW
	str	x2, [sp, 1536]	// _8849, %sfp
	str	x1, [sp, 200]	// _12516, %sfp
	and	w1, w18, -4	// kw, KW,
	str	w1, [sp, 1560]	// kw, %sfp
	mov	x1, x5	// _8541, _8541
	mov	x5, x10	// ivtmp.4434, ivtmp.4434
.L745:
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x8, 0	// ivtmp.4430,
	str	w0, [sp, 1672]	// b, %sfp
	mov	x0, x27	// _1426, _1426
	mov	x18, x9	// _5052, _5052
	mov	x6, x1	// _8541, _8541
	str	w3, [sp, 1664]	// _14, %sfp
	mov	w27, w30	// KW, KW
	mov	x11, 0	// ivtmp.4424,
	str	x26, [sp, 1520]	// _2405, %sfp
	mov	w9, w7	// oc0, oc0
	mov	x1, x12	// _10463, _10463
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	str	wzr, [sp, 1528]	//, %sfp
	mov	x3, x8	// ivtmp.4430, ivtmp.4430
	mov	x30, x0	// _1426, _1426
.L701:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, 3	// OC,
	ble	.L744		//,
	ldr	x0, [sp, 208]	// ivtmp.4413, %sfp
	add	x2, x5, x11, lsl 2	// ivtmp.4415, ivtmp.4434, ivtmp.4424,
	mov	x4, x1	// _10463, _10463
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w7, 0	// oc0,
	add	x12, x19, 12	// _8598, ivtmp.4436,
	add	x26, sp, 2032	// _6803,,
	str	x21, [sp, 1504]	// ivtmp.4435, %sfp
	ldr	x8, [sp, 448]	// ivtmp.4416, %sfp
	mov	w21, w16	// oc0, oc0
	mov	x10, x6	// _8541, _8541
	mov	w1, w9	// oc0, oc0
	mov	x16, x18	// _5052, _5052
	str	x25, [sp, 1512]	// _9101, %sfp
	mov	x25, x20	// _530, _530
	mov	x20, x5	// ivtmp.4434, ivtmp.4434
	str	x30, [sp, 1568]	// _1426, %sfp
.L721:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	w5, w6, [x0]	// acc_I_I_lsm.1578, acc_I_I_lsm.1580,* ivtmp.4413
	str	w5, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	ldr	s31, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	str	w6, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	ldp	w5, w6, [x0, 8]	// acc_I_I_lsm.1582, acc_I_I_lsm.1584,
	dup	v28.4s, v31.s[0]	// tmp3301, acc_I_I_lsm.1578
	ldr	s31, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	str	w5, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	str	w6, [sp, 224]	// acc_I_I_lsm.1584, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q28, [sp, 1840]	// tmp3301, MEM <vector(4) float> [(float *)_520]
	str	q28, [sp, 1856]	// tmp3301, MEM <vector(4) float> [(float *)_520 + 16B]
	dup	v29.4s, v31.s[0]	// tmp3304, acc_I_I_lsm.1580
	fmov	s31, w5	// acc_I_I_lsm.1582, acc_I_I_lsm.1582
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w5, [sp, 168]	//, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q28, [sp, 1872]	// tmp3301, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q29, [sp, 1888]	// tmp3304, MEM <vector(4) float> [(float *)_520 + 48B]
	str	q29, [sp, 1904]	// tmp3304, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q29, [sp, 1920]	// tmp3304, MEM <vector(4) float> [(float *)_520 + 80B]
	dup	v30.4s, v31.s[0]	// tmp3307, acc_I_I_lsm.1582
	fmov	s31, w6	// acc_I_I_lsm.1584, acc_I_I_lsm.1584
	str	q30, [sp, 1936]	// tmp3307, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q30, [sp, 1952]	// tmp3307, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q30, [sp, 1968]	// tmp3307, MEM <vector(4) float> [(float *)_520 + 128B]
	dup	v31.4s, v31.s[0]	// tmp3310, acc_I_I_lsm.1584
	str	q31, [sp, 1984]	// tmp3310, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q31, [sp, 2000]	// tmp3310, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q31, [sp, 2016]	// tmp3310, MEM <vector(4) float> [(float *)_520 + 176B]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w5, 0	// IC,
	ble	.L711		//,
	fmov	s31, w6	// acc_I_I_lsm.1584, acc_I_I_lsm.1584
	mov	w30, 0	// acc_I_I_lsm_flag.1579,
	mov	x6, x3	// ivtmp.4396, ivtmp.4430
	ldr	s30, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	mov	x9, x8	// ivtmp.4394, ivtmp.4416
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w18, 0	// ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	s28, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	ldr	s29, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	str	s30, [sp, 384]	// acc_I_I_lsm.1582, %sfp
	str	s30, [sp, 432]	// acc_I_I_lsm.1582, %sfp
	str	s28, [sp, 304]	// acc_I_I_lsm.1578, %sfp
	str	s28, [sp, 320]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 352]	// acc_I_I_lsm.1580, %sfp
	str	s28, [sp, 368]	// acc_I_I_lsm.1578, %sfp
	str	s28, [sp, 400]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 416]	// acc_I_I_lsm.1580, %sfp
	str	s28, [sp, 456]	// acc_I_I_lsm.1578, %sfp
	str	s28, [sp, 464]	// acc_I_I_lsm.1578, %sfp
	str	s31, [sp, 472]	// acc_I_I_lsm.1584, %sfp
	str	s29, [sp, 496]	// acc_I_I_lsm.1580, %sfp
	str	s31, [sp, 504]	// acc_I_I_lsm.1584, %sfp
	str	s30, [sp, 544]	// acc_I_I_lsm.1582, %sfp
	str	s31, [sp, 552]	// acc_I_I_lsm.1584, %sfp
	str	s29, [sp, 656]	// acc_I_I_lsm.1580, %sfp
	str	s30, [sp, 720]	// acc_I_I_lsm.1582, %sfp
	str	s30, [sp, 736]	// acc_I_I_lsm.1582, %sfp
	str	s29, [sp, 752]	// acc_I_I_lsm.1580, %sfp
	str	s31, [sp, 896]	// acc_I_I_lsm.1584, %sfp
	str	s31, [sp, 912]	// acc_I_I_lsm.1584, %sfp
	str	s30, [sp, 928]	// acc_I_I_lsm.1582, %sfp
	str	s30, [sp, 944]	// acc_I_I_lsm.1582, %sfp
	str	s29, [sp, 960]	// acc_I_I_lsm.1580, %sfp
	str	s29, [sp, 976]	// acc_I_I_lsm.1580, %sfp
	str	s28, [sp, 992]	// acc_I_I_lsm.1578, %sfp
	str	s31, [sp, 1008]	// acc_I_I_lsm.1584, %sfp
	str	s31, [sp, 1200]	// acc_I_I_lsm.1584, %sfp
	str	s31, [sp, 1456]	// acc_I_I_lsm.1584, %sfp
	str	s30, [sp, 1184]	// acc_I_I_lsm.1582, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w7, [sp, 1688]	// oc0, %sfp
	add	x7, sp, 1712	//,,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	s30, [sp, 1040]	// acc_I_I_lsm.1582, %sfp
	str	s31, [sp, 1056]	// acc_I_I_lsm.1584, %sfp
	str	s28, [sp, 1072]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 1088]	// acc_I_I_lsm.1580, %sfp
	str	s30, [sp, 1104]	// acc_I_I_lsm.1582, %sfp
	str	s31, [sp, 1120]	// acc_I_I_lsm.1584, %sfp
	str	s28, [sp, 1152]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 1168]	// acc_I_I_lsm.1580, %sfp
	str	s31, [sp, 1232]	// acc_I_I_lsm.1584, %sfp
	str	s28, [sp, 1248]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 1264]	// acc_I_I_lsm.1580, %sfp
	str	s28, [sp, 1280]	// acc_I_I_lsm.1578, %sfp
	str	s29, [sp, 1296]	// acc_I_I_lsm.1580, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w13, [sp, 1680]	// OW, %sfp
	str	x25, [sp, 1696]	// _530, %sfp
	str	w21, [sp, 1704]	// oc0, %sfp
	stp	x3, x8, [x7]	// ivtmp.4430, ivtmp.4416,
	mov	x3, x14	// _5077, _5077
	stp	x2, x17, [x7, 16]	// ivtmp.4415, _4600,
	mov	x17, x20	// ivtmp.4434, ivtmp.4434
	mov	w20, w30	// acc_I_I_lsm_flag.1579, acc_I_I_lsm_flag.1579
	mov	x30, x15	// _2472, _2472
	str	x0, [sp, 1752]	// ivtmp.4413, %sfp
	ldr	w0, [sp, 1560]	//, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	s30, [sp, 288]	// acc_I_I_lsm.1582, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w1, [sp, 1744]	// oc0, %sfp
	.p2align 5,,15
.L709:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w1, [sp, 176]	//, %sfp
	cmp	w1, 0	// KH,
	ble	.L702		//,
	add	x8, x12, x6, lsl 2	// ivtmp.4365, _8598, ivtmp.4396,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w14, 0	// kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x25, x30	// _2472, _2472
	add	x2, x19, x6, lsl 2	// ivtmp.4372, ivtmp.4436, ivtmp.4396,
	mov	x5, x9	// ivtmp.4368, ivtmp.4394
	mov	x7, x9	// ivtmp.4357, ivtmp.4394
	mov	w30, w18	// ic, ic
	mov	x1, x6	// ivtmp.4364, ivtmp.4364
	str	w14, [sp, 1488]	// kh, %sfp
	.p2align 5,,15
.L708:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w27, 0	// KW,
	ble	.L703		//,
	ldr	w13, [sp, 1440]	//, %sfp
	cmp	w13, 3	// _473,
	bls	.L907		//,
	movi	v31.4s, 0	// vect_acc_I_I_lsm.1672_2632.2627
	add	x13, x5, x23	// vectp.2632, ivtmp.4368, _5909
	ldr	q19, [x2, 4]	// vectp.2775__lsm0.3600, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 4B]
	add	x21, x5, x22	// vectp.2638, ivtmp.4368, _10386
	add	x20, x2, 32	// vectp.2761, ivtmp.4372,
	add	x18, x2, 36	// vectp.2776, ivtmp.4372,
	str	x13, [sp, 1464]	// vectp.2632, %sfp
	add	x13, x5, x24	// vectp.2635, ivtmp.4368, _10395
	add	x15, x2, 40	// vectp.2791, ivtmp.4372,
	ldr	q20, [x2, 8]	// vectp.2790__lsm0.3598, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 8B]
	add	x14, x2, 44	// vectp.2806, ivtmp.4372,
	str	q31, [sp, 272]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	mov	v14.16b, v31.16b	// vect_acc_I_I_lsm.1638_2568.2610, vect_acc_I_I_lsm.1672_2632.2627
	mov	v13.16b, v31.16b	// vect_acc_I_I_lsm.1636_2412.2609, vect_acc_I_I_lsm.1672_2632.2627
	ldr	q21, [x2, 12]	// vectp.2805__lsm0.3596, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 12B]
	mov	v12.16b, v31.16b	// vect_acc_I_I_lsm.1634_3146.2608, vect_acc_I_I_lsm.1672_2632.2627
	mov	v11.16b, v31.16b	// vect_acc_I_I_lsm.1632_3182.2607, vect_acc_I_I_lsm.1672_2632.2627
	str	q31, [sp, 480]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	mov	v10.16b, v31.16b	// vect_acc_I_I_lsm.1630_2858.2606, vect_acc_I_I_lsm.1672_2632.2627
	mov	v9.16b, v31.16b	// vect_acc_I_I_lsm.1628_2894.2605, vect_acc_I_I_lsm.1672_2632.2627
	ldr	q24, [x2, 20]	// vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 20B]
	mov	v8.16b, v31.16b	// vect_acc_I_I_lsm.1626_3224.2604, vect_acc_I_I_lsm.1672_2632.2627
	mov	v7.16b, v31.16b	// vect_acc_I_I_lsm.1624_1496.2603, vect_acc_I_I_lsm.1672_2632.2627
	str	q31, [sp, 640]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	mov	v6.16b, v31.16b	// vect_acc_I_I_lsm.1622_1864.2602, vect_acc_I_I_lsm.1672_2632.2627
	mov	v5.16b, v31.16b	// vect_acc_I_I_lsm.1620_2608.2601, vect_acc_I_I_lsm.1672_2632.2627
	ldr	q25, [x2, 24]	// vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 24B]
	mov	v4.16b, v31.16b	// vect_acc_I_I_lsm.1618_1470.2600, vect_acc_I_I_lsm.1672_2632.2627
	mov	v3.16b, v31.16b	// vect_acc_I_I_lsm.1616_3745.2599, vect_acc_I_I_lsm.1672_2632.2627
	str	q31, [sp, 1376]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	mov	v2.16b, v31.16b	// vect_acc_I_I_lsm.1614_3710.2598, vect_acc_I_I_lsm.1672_2632.2627
	mov	v1.16b, v31.16b	// vect_acc_I_I_lsm.1612_3675.2597, vect_acc_I_I_lsm.1672_2632.2627
	ldr	q26, [x2, 28]	// vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2641_2678 + 28B]
	mov	v0.16b, v31.16b	// vect_acc_I_I_lsm.1578_4437.2580, vect_acc_I_I_lsm.1672_2632.2627
	stp	q31, q31, [sp, 512]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	str	q31, [sp, 1392]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1408]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	x13, [sp, 1472]	// vectp.2635, %sfp
	mov	x13, 0	// ivtmp.4319,
	ldp	q22, q23, [x2]	// vectp.2760__lsm0.3602, vectp.2760__lsm1.3603,* ivtmp.4372
	str	q31, [sp, 336]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	stp	q31, q31, [sp, 560]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	stp	q31, q31, [sp, 592]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	str	q31, [sp, 624]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	stp	q31, q31, [sp, 672]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	str	q31, [sp, 704]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	stp	q31, q31, [sp, 768]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	stp	q31, q31, [sp, 800]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	str	q31, [sp, 1024]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1136]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1216]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1312]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1328]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1344]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	q31, [sp, 1360]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	stp	q31, q31, [sp, 832]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	stp	q31, q31, [sp, 864]	// vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627,
	str	q31, [sp, 1424]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	str	w0, [sp, 1496]	// kw, %sfp
	b	.L705		//
	.p2align 2,,3
.L908:
	mov	v22.16b, v23.16b	// vectp.2760__lsm0.3602, vectp.2760__lsm1.3603
	mov	v19.16b, v24.16b	// vectp.2775__lsm0.3600, vectp.2775__lsm1.3601
	mov	v20.16b, v25.16b	// vectp.2790__lsm0.3598, vectp.2790__lsm1.3599
	mov	v21.16b, v26.16b	// vectp.2805__lsm0.3596, vectp.2805__lsm1.3597
	mov	v23.16b, v15.16b	// vectp.2760__lsm1.3603, MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1]
	mov	v24.16b, v16.16b	// vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1]
	mov	v25.16b, v17.16b	// vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1]
	mov	v26.16b, v18.16b	// vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1]
.L705:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q27, [x5, x13]	// MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q31, [sp, 1312]	// vect_acc_I_I_lsm.1602_3939.2592, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q15, [x20, x13]	// MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x0, [sp, 1464]	// vectp.2632, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v0.4s, v22.4s, v27.4s	// vect_acc_I_I_lsm.1578_4437.2580, vectp.2760__lsm0.3602, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	ldr	q18, [sp, 768]	// vect_acc_I_I_lsm.1586_4304.2584, %sfp
	fmla	v31.4s, v21.4s, v27.4s	// vect_acc_I_I_lsm.1602_3939.2592, vectp.2805__lsm0.3596, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q30, [x21, x13]	// MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	ldr	q28, [x0, x13]	// MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v4.4s, v24.4s, v27.4s	// vect_acc_I_I_lsm.1618_1470.2600, vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x0, [sp, 1472]	// vectp.2635, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v19.4s, v27.4s	// vect_acc_I_I_lsm.1586_4304.2584, vectp.2775__lsm0.3600, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q16, [x18, x13]	// MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q31, [sp, 1312]	// vect_acc_I_I_lsm.1602_3939.2592, %sfp
	fmla	v8.4s, v25.4s, v27.4s	// vect_acc_I_I_lsm.1626_3224.2604, vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	ldr	q31, [sp, 336]	// vect_acc_I_I_lsm.1610_3640.2596, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x0, x13]	// MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v12.4s, v26.4s, v27.4s	// vect_acc_I_I_lsm.1634_3146.2608, vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q17, [x15, x13]	// MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q18, [sp, 768]	// vect_acc_I_I_lsm.1586_4304.2584, %sfp
	fmla	v3.4s, v23.4s, v30.4s	// vect_acc_I_I_lsm.1616_3745.2599, vectp.2760__lsm1.3603, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	ldr	q18, [sp, 832]	// vect_acc_I_I_lsm.1594_3967.2588, %sfp
	fmla	v31.4s, v23.4s, v27.4s	// vect_acc_I_I_lsm.1610_3640.2596, vectp.2760__lsm1.3603, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	fmla	v7.4s, v24.4s, v30.4s	// vect_acc_I_I_lsm.1624_1496.2603, vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	fmla	v18.4s, v20.4s, v27.4s	// vect_acc_I_I_lsm.1594_3967.2588, vectp.2790__lsm0.3598, MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	str	q31, [sp, 336]	// vect_acc_I_I_lsm.1610_3640.2596, %sfp
	fmla	v11.4s, v25.4s, v30.4s	// vect_acc_I_I_lsm.1632_3182.2607, vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	ldr	q31, [sp, 672]	// vect_acc_I_I_lsm.1642_2010.2612, %sfp
	fmla	v1.4s, v23.4s, v28.4s	// vect_acc_I_I_lsm.1612_3675.2597, vectp.2760__lsm1.3603, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q18, [sp, 832]	// vect_acc_I_I_lsm.1594_3967.2588, %sfp
	fmla	v5.4s, v24.4s, v28.4s	// vect_acc_I_I_lsm.1620_2608.2601, vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q18, [x14, x13]	// MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1]
	add	x13, x13, 16	// ivtmp.4319, ivtmp.4319,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v15.4s, v27.4s	// vect_acc_I_I_lsm.1642_2010.2612, MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	fmla	v9.4s, v25.4s, v28.4s	// vect_acc_I_I_lsm.1628_2894.2605, vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	fmla	v13.4s, v26.4s, v28.4s	// vect_acc_I_I_lsm.1636_2412.2609, vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 672]	// vect_acc_I_I_lsm.1642_2010.2612, %sfp
	fmla	v2.4s, v23.4s, v29.4s	// vect_acc_I_I_lsm.1614_3710.2598, vectp.2760__lsm1.3603, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	ldr	q31, [sp, 1344]	// vect_acc_I_I_lsm.1644_2122.2613, %sfp
	fmla	v6.4s, v24.4s, v29.4s	// vect_acc_I_I_lsm.1622_1864.2602, vectp.2775__lsm1.3601, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	fmla	v10.4s, v25.4s, v29.4s	// vect_acc_I_I_lsm.1630_2858.2606, vectp.2790__lsm1.3599, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	fmla	v31.4s, v15.4s, v28.4s	// vect_acc_I_I_lsm.1644_2122.2613, MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	fmla	v14.4s, v26.4s, v29.4s	// vect_acc_I_I_lsm.1638_2568.2610, vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1344]	// vect_acc_I_I_lsm.1644_2122.2613, %sfp
	ldr	q31, [sp, 864]	// vect_acc_I_I_lsm.1580_4488.2581, %sfp
	fmla	v31.4s, v22.4s, v28.4s	// vect_acc_I_I_lsm.1580_4488.2581, vectp.2760__lsm0.3602, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 864]	// vect_acc_I_I_lsm.1580_4488.2581, %sfp
	ldr	q31, [sp, 784]	// vect_acc_I_I_lsm.1588_4371.2585, %sfp
	fmla	v31.4s, v19.4s, v28.4s	// vect_acc_I_I_lsm.1588_4371.2585, vectp.2775__lsm0.3600, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 784]	// vect_acc_I_I_lsm.1588_4371.2585, %sfp
	ldr	q31, [sp, 560]	// vect_acc_I_I_lsm.1596_4006.2589, %sfp
	fmla	v31.4s, v20.4s, v28.4s	// vect_acc_I_I_lsm.1596_4006.2589, vectp.2790__lsm0.3598, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 560]	// vect_acc_I_I_lsm.1596_4006.2589, %sfp
	ldr	q31, [sp, 1216]	// vect_acc_I_I_lsm.1604_3535.2593, %sfp
	fmla	v31.4s, v21.4s, v28.4s	// vect_acc_I_I_lsm.1604_3535.2593, vectp.2805__lsm0.3596, MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1216]	// vect_acc_I_I_lsm.1604_3535.2593, %sfp
	ldr	q31, [sp, 688]	// vect_acc_I_I_lsm.1646_2226.2614, %sfp
	fmla	v31.4s, v15.4s, v29.4s	// vect_acc_I_I_lsm.1646_2226.2614, MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 688]	// vect_acc_I_I_lsm.1646_2226.2614, %sfp
	ldr	q31, [sp, 880]	// vect_acc_I_I_lsm.1582_4143.2582, %sfp
	fmla	v31.4s, v22.4s, v29.4s	// vect_acc_I_I_lsm.1582_4143.2582, vectp.2760__lsm0.3602, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 880]	// vect_acc_I_I_lsm.1582_4143.2582, %sfp
	ldr	q31, [sp, 800]	// vect_acc_I_I_lsm.1590_3452.2586, %sfp
	fmla	v31.4s, v19.4s, v29.4s	// vect_acc_I_I_lsm.1590_3452.2586, vectp.2775__lsm0.3600, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 800]	// vect_acc_I_I_lsm.1590_3452.2586, %sfp
	ldr	q31, [sp, 576]	// vect_acc_I_I_lsm.1598_4044.2590, %sfp
	fmla	v31.4s, v20.4s, v29.4s	// vect_acc_I_I_lsm.1598_4044.2590, vectp.2790__lsm0.3598, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 576]	// vect_acc_I_I_lsm.1598_4044.2590, %sfp
	ldr	q31, [sp, 1136]	// vect_acc_I_I_lsm.1606_3570.2594, %sfp
	fmla	v31.4s, v21.4s, v29.4s	// vect_acc_I_I_lsm.1606_3570.2594, vectp.2805__lsm0.3596, MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1136]	// vect_acc_I_I_lsm.1606_3570.2594, %sfp
	ldr	q31, [sp, 704]	// vect_acc_I_I_lsm.1648_1772.2615, %sfp
	fmla	v31.4s, v15.4s, v30.4s	// vect_acc_I_I_lsm.1648_1772.2615, MEM <const vector(4) float> [(const float *)vectp.2761_393 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 704]	// vect_acc_I_I_lsm.1648_1772.2615, %sfp
	ldr	q31, [sp, 848]	// vect_acc_I_I_lsm.1584_4209.2583, %sfp
	fmla	v31.4s, v22.4s, v30.4s	// vect_acc_I_I_lsm.1584_4209.2583, vectp.2760__lsm0.3602, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 848]	// vect_acc_I_I_lsm.1584_4209.2583, %sfp
	ldr	q31, [sp, 816]	// vect_acc_I_I_lsm.1592_3487.2587, %sfp
	fmla	v31.4s, v19.4s, v30.4s	// vect_acc_I_I_lsm.1592_3487.2587, vectp.2775__lsm0.3600, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 816]	// vect_acc_I_I_lsm.1592_3487.2587, %sfp
	ldr	q31, [sp, 592]	// vect_acc_I_I_lsm.1600_3820.2591, %sfp
	fmla	v31.4s, v20.4s, v30.4s	// vect_acc_I_I_lsm.1600_3820.2591, vectp.2790__lsm0.3598, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 592]	// vect_acc_I_I_lsm.1600_3820.2591, %sfp
	ldr	q31, [sp, 1024]	// vect_acc_I_I_lsm.1608_3605.2595, %sfp
	fmla	v31.4s, v21.4s, v30.4s	// vect_acc_I_I_lsm.1608_3605.2595, vectp.2805__lsm0.3596, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1024]	// vect_acc_I_I_lsm.1608_3605.2595, %sfp
	ldr	q31, [sp, 1328]	// vect_acc_I_I_lsm.1640_2652.2611, %sfp
	fmla	v31.4s, v26.4s, v30.4s	// vect_acc_I_I_lsm.1640_2652.2611, vectp.2805__lsm1.3597, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1328]	// vect_acc_I_I_lsm.1640_2652.2611, %sfp
	ldr	q31, [sp, 608]	// vect_acc_I_I_lsm.1650_1884.2616, %sfp
	fmla	v31.4s, v16.4s, v27.4s	// vect_acc_I_I_lsm.1650_1884.2616, MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	str	q31, [sp, 608]	// vect_acc_I_I_lsm.1650_1884.2616, %sfp
	ldr	q31, [sp, 624]	// vect_acc_I_I_lsm.1652_3008.2617, %sfp
	fmla	v31.4s, v16.4s, v28.4s	// vect_acc_I_I_lsm.1652_3008.2617, MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 624]	// vect_acc_I_I_lsm.1652_3008.2617, %sfp
	ldr	q31, [sp, 1360]	// vect_acc_I_I_lsm.1654_1437.2618, %sfp
	fmla	v31.4s, v16.4s, v29.4s	// vect_acc_I_I_lsm.1654_1437.2618, MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1360]	// vect_acc_I_I_lsm.1654_1437.2618, %sfp
	ldr	q31, [sp, 640]	// vect_acc_I_I_lsm.1656_2750.2619, %sfp
	fmla	v31.4s, v30.4s, v16.4s	// vect_acc_I_I_lsm.1656_2750.2619, MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2776_2017 + ivtmp.4319_909 * 1]
	str	q31, [sp, 640]	// vect_acc_I_I_lsm.1656_2750.2619, %sfp
	ldr	q31, [sp, 1376]	// vect_acc_I_I_lsm.1658_2532.2620, %sfp
	fmla	v31.4s, v17.4s, v27.4s	// vect_acc_I_I_lsm.1658_2532.2620, MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1376]	// vect_acc_I_I_lsm.1658_2532.2620, %sfp
	ldr	q31, [sp, 512]	// vect_acc_I_I_lsm.1660_2442.2621, %sfp
	fmla	v31.4s, v17.4s, v28.4s	// vect_acc_I_I_lsm.1660_2442.2621, MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 512]	// vect_acc_I_I_lsm.1660_2442.2621, %sfp
	ldr	q31, [sp, 528]	// vect_acc_I_I_lsm.1662_2290.2622, %sfp
	ldr	x0, [sp, 1512]	// _9101, %sfp
	fmla	v31.4s, v17.4s, v29.4s	// vect_acc_I_I_lsm.1662_2290.2622, MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 528]	// vect_acc_I_I_lsm.1662_2290.2622, %sfp
	ldr	q31, [sp, 1392]	// vect_acc_I_I_lsm.1664_2048.2623, %sfp
	fmla	v31.4s, v17.4s, v30.4s	// vect_acc_I_I_lsm.1664_2048.2623, MEM <const vector(4) float> [(const float *)vectp.2791_4845 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1392]	// vect_acc_I_I_lsm.1664_2048.2623, %sfp
	ldr	q31, [sp, 272]	// vect_acc_I_I_lsm.1666_1912.2624, %sfp
	fmla	v31.4s, v18.4s, v27.4s	// vect_acc_I_I_lsm.1666_1912.2624, MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2629_6071 + ivtmp.4319_909 * 1]
	str	q31, [sp, 272]	// vect_acc_I_I_lsm.1666_1912.2624, %sfp
	ldr	q31, [sp, 1408]	// vect_acc_I_I_lsm.1668_55.2625, %sfp
	fmla	v31.4s, v18.4s, v28.4s	// vect_acc_I_I_lsm.1668_55.2625, MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2632_6079 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1408]	// vect_acc_I_I_lsm.1668_55.2625, %sfp
	ldr	q31, [sp, 480]	// vect_acc_I_I_lsm.1670_2854.2626, %sfp
	fmla	v31.4s, v18.4s, v29.4s	// vect_acc_I_I_lsm.1670_2854.2626, MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2635_6088 + ivtmp.4319_909 * 1]
	str	q31, [sp, 480]	// vect_acc_I_I_lsm.1670_2854.2626, %sfp
	ldr	q31, [sp, 1424]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	fmla	v31.4s, v18.4s, v30.4s	// vect_acc_I_I_lsm.1672_2632.2627, MEM <const vector(4) float> [(const float *)vectp.2806_305 + ivtmp.4319_909 * 1], MEM <const vector(4) float> [(const float *)vectp.2638_504 + ivtmp.4319_909 * 1]
	str	q31, [sp, 1424]	// vect_acc_I_I_lsm.1672_2632.2627, %sfp
	cmp	x0, x13	// _9101, ivtmp.4319
	bne	.L908		//,
	ldr	q30, [sp, 480]	// vect_acc_I_I_lsm.1670_2854.2626, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3243, vect_acc_I_I_lsm.1672_2632.2627, vect_acc_I_I_lsm.1672_2632.2627
	faddp	v14.4s, v14.4s, v14.4s	// tmp3260, vect_acc_I_I_lsm.1638_2568.2610, vect_acc_I_I_lsm.1638_2568.2610
	ldr	q28, [sp, 272]	// vect_acc_I_I_lsm.1666_1912.2624, %sfp
	faddp	v13.4s, v13.4s, v13.4s	// tmp3261, vect_acc_I_I_lsm.1636_2412.2609, vect_acc_I_I_lsm.1636_2412.2609
	faddp	v12.4s, v12.4s, v12.4s	// tmp3262, vect_acc_I_I_lsm.1634_3146.2608, vect_acc_I_I_lsm.1634_3146.2608
	ldp	q25, q26, [sp, 512]	// vect_acc_I_I_lsm.1660_2442.2621, vect_acc_I_I_lsm.1662_2290.2622,
	faddp	v11.4s, v11.4s, v11.4s	// tmp3263, vect_acc_I_I_lsm.1632_3182.2607, vect_acc_I_I_lsm.1632_3182.2607
	str	q31, [sp, 1424]	// tmp3243, %sfp
	faddp	v31.4s, v30.4s, v30.4s	// tmp3244, vect_acc_I_I_lsm.1670_2854.2626, vect_acc_I_I_lsm.1670_2854.2626
	ldp	q20, q21, [sp, 608]	// vect_acc_I_I_lsm.1650_1884.2616, vect_acc_I_I_lsm.1652_3008.2617,
	faddp	v28.4s, v28.4s, v28.4s	// tmp3246, vect_acc_I_I_lsm.1666_1912.2624, vect_acc_I_I_lsm.1666_1912.2624
	ldr	q23, [sp, 640]	// vect_acc_I_I_lsm.1656_2750.2619, %sfp
	faddp	v14.4s, v14.4s, v14.4s	// tmp3260, tmp3260, tmp3260
	faddp	v13.4s, v13.4s, v13.4s	// tmp3261, tmp3261, tmp3261
	ldr	q19, [sp, 704]	// vect_acc_I_I_lsm.1648_1772.2615, %sfp
	faddp	v12.4s, v12.4s, v12.4s	// tmp3262, tmp3262, tmp3262
	str	q31, [sp, 480]	// tmp3244, %sfp
	faddp	v11.4s, v11.4s, v11.4s	// tmp3263, tmp3263, tmp3263
	ldr	q31, [sp, 336]	// vect_acc_I_I_lsm.1610_3640.2596, %sfp
	faddp	v26.4s, v26.4s, v26.4s	// tmp3248, vect_acc_I_I_lsm.1662_2290.2622, vect_acc_I_I_lsm.1662_2290.2622
	faddp	v28.4s, v28.4s, v28.4s	// tmp3246, tmp3246, tmp3246
	ldr	q15, [sp, 1328]	// vect_acc_I_I_lsm.1640_2652.2611, %sfp
	faddp	v25.4s, v25.4s, v25.4s	// tmp3249, vect_acc_I_I_lsm.1660_2442.2621, vect_acc_I_I_lsm.1660_2442.2621
	faddp	v23.4s, v23.4s, v23.4s	// tmp3251, vect_acc_I_I_lsm.1656_2750.2619, vect_acc_I_I_lsm.1656_2750.2619
	ldr	q17, [sp, 1344]	// vect_acc_I_I_lsm.1644_2122.2613, %sfp
	faddp	v21.4s, v21.4s, v21.4s	// tmp3253, vect_acc_I_I_lsm.1652_3008.2617, vect_acc_I_I_lsm.1652_3008.2617
	faddp	v20.4s, v20.4s, v20.4s	// tmp3254, vect_acc_I_I_lsm.1650_1884.2616, vect_acc_I_I_lsm.1650_1884.2616
	faddp	v31.4s, v31.4s, v31.4s	// tmp3274, vect_acc_I_I_lsm.1610_3640.2596, vect_acc_I_I_lsm.1610_3640.2596
	ldr	q22, [sp, 1360]	// vect_acc_I_I_lsm.1654_1437.2618, %sfp
	faddp	v26.4s, v26.4s, v26.4s	// tmp3248, tmp3248, tmp3248
	ldr	q24, [sp, 1376]	// vect_acc_I_I_lsm.1658_2532.2620, %sfp
	faddp	v25.4s, v25.4s, v25.4s	// tmp3249, tmp3249, tmp3249
	faddp	v23.4s, v23.4s, v23.4s	// tmp3251, tmp3251, tmp3251
	ldr	q27, [sp, 1392]	// vect_acc_I_I_lsm.1664_2048.2623, %sfp
	faddp	v21.4s, v21.4s, v21.4s	// tmp3253, tmp3253, tmp3253
	faddp	v20.4s, v20.4s, v20.4s	// tmp3254, tmp3254, tmp3254
	str	q31, [sp, 272]	// tmp3274, %sfp
	faddp	v22.4s, v22.4s, v22.4s	// tmp3252, vect_acc_I_I_lsm.1654_1437.2618, vect_acc_I_I_lsm.1654_1437.2618
	ldr	q31, [sp, 1024]	// vect_acc_I_I_lsm.1608_3605.2595, %sfp
	faddp	v19.4s, v19.4s, v19.4s	// tmp3255, vect_acc_I_I_lsm.1648_1772.2615, vect_acc_I_I_lsm.1648_1772.2615
	faddp	v24.4s, v24.4s, v24.4s	// tmp3250, vect_acc_I_I_lsm.1658_2532.2620, vect_acc_I_I_lsm.1658_2532.2620
	ldr	q29, [sp, 1408]	// vect_acc_I_I_lsm.1668_55.2625, %sfp
	faddp	v17.4s, v17.4s, v17.4s	// tmp3257, vect_acc_I_I_lsm.1644_2122.2613, vect_acc_I_I_lsm.1644_2122.2613
	faddp	v27.4s, v27.4s, v27.4s	// tmp3247, vect_acc_I_I_lsm.1664_2048.2623, vect_acc_I_I_lsm.1664_2048.2623
	ldp	q16, q18, [sp, 672]	// vect_acc_I_I_lsm.1642_2010.2612, vect_acc_I_I_lsm.1646_2226.2614,
	faddp	v22.4s, v22.4s, v22.4s	// tmp3252, tmp3252, tmp3252
	faddp	v31.4s, v31.4s, v31.4s	// tmp3275, vect_acc_I_I_lsm.1608_3605.2595, vect_acc_I_I_lsm.1608_3605.2595
	ldr	w0, [sp, 1496]	//, %sfp
	faddp	v24.4s, v24.4s, v24.4s	// tmp3250, tmp3250, tmp3250
	faddp	v29.4s, v29.4s, v29.4s	// tmp3245, vect_acc_I_I_lsm.1668_55.2625, vect_acc_I_I_lsm.1668_55.2625
	faddp	v27.4s, v27.4s, v27.4s	// tmp3247, tmp3247, tmp3247
	faddp	v19.4s, v19.4s, v19.4s	// tmp3255, tmp3255, tmp3255
	faddp	v17.4s, v17.4s, v17.4s	// tmp3257, tmp3257, tmp3257
	sxtw	x13, w0	//, kw
	str	q31, [sp, 336]	// tmp3275, %sfp
	faddp	v15.4s, v15.4s, v15.4s	// tmp3259, vect_acc_I_I_lsm.1640_2652.2611, vect_acc_I_I_lsm.1640_2652.2611
	ldr	q31, [sp, 1136]	// vect_acc_I_I_lsm.1606_3570.2594, %sfp
	faddp	v18.4s, v18.4s, v18.4s	// tmp3256, vect_acc_I_I_lsm.1646_2226.2614, vect_acc_I_I_lsm.1646_2226.2614
	faddp	v29.4s, v29.4s, v29.4s	// tmp3245, tmp3245, tmp3245
	faddp	v16.4s, v16.4s, v16.4s	// tmp3258, vect_acc_I_I_lsm.1642_2010.2612, vect_acc_I_I_lsm.1642_2010.2612
	faddp	v10.4s, v10.4s, v10.4s	// tmp3264, vect_acc_I_I_lsm.1630_2858.2606, vect_acc_I_I_lsm.1630_2858.2606
	faddp	v9.4s, v9.4s, v9.4s	// tmp3265, vect_acc_I_I_lsm.1628_2894.2605, vect_acc_I_I_lsm.1628_2894.2605
	faddp	v15.4s, v15.4s, v15.4s	// tmp3259, tmp3259, tmp3259
	faddp	v31.4s, v31.4s, v31.4s	// tmp3276, vect_acc_I_I_lsm.1606_3570.2594, vect_acc_I_I_lsm.1606_3570.2594
	faddp	v18.4s, v18.4s, v18.4s	// tmp3256, tmp3256, tmp3256
	faddp	v16.4s, v16.4s, v16.4s	// tmp3258, tmp3258, tmp3258
	faddp	v10.4s, v10.4s, v10.4s	// tmp3264, tmp3264, tmp3264
	faddp	v9.4s, v9.4s, v9.4s	// tmp3265, tmp3265, tmp3265
	faddp	v8.4s, v8.4s, v8.4s	// tmp3266, vect_acc_I_I_lsm.1626_3224.2604, vect_acc_I_I_lsm.1626_3224.2604
	str	q31, [sp, 512]	// tmp3276, %sfp
	faddp	v7.4s, v7.4s, v7.4s	// tmp3267, vect_acc_I_I_lsm.1624_1496.2603, vect_acc_I_I_lsm.1624_1496.2603
	ldr	q31, [sp, 1216]	// vect_acc_I_I_lsm.1604_3535.2593, %sfp
	faddp	v6.4s, v6.4s, v6.4s	// tmp3268, vect_acc_I_I_lsm.1622_1864.2602, vect_acc_I_I_lsm.1622_1864.2602
	faddp	v5.4s, v5.4s, v5.4s	// tmp3269, vect_acc_I_I_lsm.1620_2608.2601, vect_acc_I_I_lsm.1620_2608.2601
	faddp	v4.4s, v4.4s, v4.4s	// tmp3270, vect_acc_I_I_lsm.1618_1470.2600, vect_acc_I_I_lsm.1618_1470.2600
	faddp	v3.4s, v3.4s, v3.4s	// tmp3271, vect_acc_I_I_lsm.1616_3745.2599, vect_acc_I_I_lsm.1616_3745.2599
	faddp	v8.4s, v8.4s, v8.4s	// tmp3266, tmp3266, tmp3266
	faddp	v7.4s, v7.4s, v7.4s	// tmp3267, tmp3267, tmp3267
	faddp	v31.4s, v31.4s, v31.4s	// tmp3277, vect_acc_I_I_lsm.1604_3535.2593, vect_acc_I_I_lsm.1604_3535.2593
	faddp	v6.4s, v6.4s, v6.4s	// tmp3268, tmp3268, tmp3268
	faddp	v5.4s, v5.4s, v5.4s	// tmp3269, tmp3269, tmp3269
	faddp	v4.4s, v4.4s, v4.4s	// tmp3270, tmp3270, tmp3270
	faddp	v3.4s, v3.4s, v3.4s	// tmp3271, tmp3271, tmp3271
	faddp	v2.4s, v2.4s, v2.4s	// tmp3272, vect_acc_I_I_lsm.1614_3710.2598, vect_acc_I_I_lsm.1614_3710.2598
	str	q31, [sp, 528]	// tmp3277, %sfp
	faddp	v1.4s, v1.4s, v1.4s	// tmp3273, vect_acc_I_I_lsm.1612_3675.2597, vect_acc_I_I_lsm.1612_3675.2597
	ldr	q31, [sp, 1312]	// vect_acc_I_I_lsm.1602_3939.2592, %sfp
	faddp	v0.4s, v0.4s, v0.4s	// tmp3290, vect_acc_I_I_lsm.1578_4437.2580, vect_acc_I_I_lsm.1578_4437.2580
	faddp	v2.4s, v2.4s, v2.4s	// tmp3272, tmp3272, tmp3272
	faddp	v1.4s, v1.4s, v1.4s	// tmp3273, tmp3273, tmp3273
	faddp	v31.4s, v31.4s, v31.4s	// tmp3278, vect_acc_I_I_lsm.1602_3939.2592, vect_acc_I_I_lsm.1602_3939.2592
	faddp	v0.4s, v0.4s, v0.4s	// tmp3290, tmp3290, tmp3290
	str	q31, [sp, 608]	// tmp3278, %sfp
	ldr	q31, [sp, 592]	// vect_acc_I_I_lsm.1600_3820.2591, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3279, vect_acc_I_I_lsm.1600_3820.2591, vect_acc_I_I_lsm.1600_3820.2591
	str	q31, [sp, 592]	// tmp3279, %sfp
	ldr	q31, [sp, 576]	// vect_acc_I_I_lsm.1598_4044.2590, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3280, vect_acc_I_I_lsm.1598_4044.2590, vect_acc_I_I_lsm.1598_4044.2590
	str	q31, [sp, 576]	// tmp3280, %sfp
	ldr	q31, [sp, 560]	// vect_acc_I_I_lsm.1596_4006.2589, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3281, vect_acc_I_I_lsm.1596_4006.2589, vect_acc_I_I_lsm.1596_4006.2589
	str	q31, [sp, 560]	// tmp3281, %sfp
	ldr	q31, [sp, 832]	// vect_acc_I_I_lsm.1594_3967.2588, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3282, vect_acc_I_I_lsm.1594_3967.2588, vect_acc_I_I_lsm.1594_3967.2588
	str	q31, [sp, 624]	// tmp3282, %sfp
	ldr	q31, [sp, 816]	// vect_acc_I_I_lsm.1592_3487.2587, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3283, vect_acc_I_I_lsm.1592_3487.2587, vect_acc_I_I_lsm.1592_3487.2587
	str	q31, [sp, 640]	// tmp3283, %sfp
	ldr	q31, [sp, 800]	// vect_acc_I_I_lsm.1590_3452.2586, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3284, vect_acc_I_I_lsm.1590_3452.2586, vect_acc_I_I_lsm.1590_3452.2586
	str	q31, [sp, 672]	// tmp3284, %sfp
	ldr	q31, [sp, 784]	// vect_acc_I_I_lsm.1588_4371.2585, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3285, vect_acc_I_I_lsm.1588_4371.2585, vect_acc_I_I_lsm.1588_4371.2585
	str	q31, [sp, 688]	// tmp3285, %sfp
	ldr	q31, [sp, 768]	// vect_acc_I_I_lsm.1586_4304.2584, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3286, vect_acc_I_I_lsm.1586_4304.2584, vect_acc_I_I_lsm.1586_4304.2584
	str	q31, [sp, 704]	// tmp3286, %sfp
	ldr	q31, [sp, 848]	// vect_acc_I_I_lsm.1584_4209.2583, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3287, vect_acc_I_I_lsm.1584_4209.2583, vect_acc_I_I_lsm.1584_4209.2583
	str	q31, [sp, 768]	// tmp3287, %sfp
	ldr	q31, [sp, 880]	// vect_acc_I_I_lsm.1582_4143.2582, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3288, vect_acc_I_I_lsm.1582_4143.2582, vect_acc_I_I_lsm.1582_4143.2582
	str	q31, [sp, 784]	// tmp3288, %sfp
	ldr	q31, [sp, 864]	// vect_acc_I_I_lsm.1580_4488.2581, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3289, vect_acc_I_I_lsm.1580_4488.2581, vect_acc_I_I_lsm.1580_4488.2581
	mov	v30.16b, v31.16b	// tmp3289, tmp3289
	ldr	q31, [sp, 1424]	// tmp3243, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3243, tmp3243, tmp3243
	str	q31, [sp, 1424]	// tmp3243, %sfp
	ldr	q31, [sp, 480]	// tmp3244, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3244, tmp3244, tmp3244
	str	q31, [sp, 480]	// tmp3244, %sfp
	ldr	q31, [sp, 272]	// tmp3274, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3274, tmp3274, tmp3274
	str	q31, [sp, 272]	// tmp3274, %sfp
	ldr	q31, [sp, 336]	// tmp3275, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3275, tmp3275, tmp3275
	str	q31, [sp, 336]	// tmp3275, %sfp
	ldr	q31, [sp, 512]	// tmp3276, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3276, tmp3276, tmp3276
	str	q31, [sp, 512]	// tmp3276, %sfp
	ldr	q31, [sp, 528]	// tmp3277, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3277, tmp3277, tmp3277
	str	q31, [sp, 528]	// tmp3277, %sfp
	ldr	q31, [sp, 608]	// tmp3278, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3278, tmp3278, tmp3278
	str	q31, [sp, 608]	// tmp3278, %sfp
	ldr	q31, [sp, 592]	// tmp3279, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3279, tmp3279, tmp3279
	str	q31, [sp, 592]	// tmp3279, %sfp
	ldr	q31, [sp, 576]	// tmp3280, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3280, tmp3280, tmp3280
	str	q31, [sp, 576]	// tmp3280, %sfp
	ldr	q31, [sp, 560]	// tmp3281, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3281, tmp3281, tmp3281
	str	q31, [sp, 560]	// tmp3281, %sfp
	ldr	q31, [sp, 624]	// tmp3282, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3282, tmp3282, tmp3282
	str	q31, [sp, 624]	// tmp3282, %sfp
	ldr	q31, [sp, 640]	// tmp3283, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3283, tmp3283, tmp3283
	str	q31, [sp, 640]	// tmp3283, %sfp
	ldr	q31, [sp, 672]	// tmp3284, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3284, tmp3284, tmp3284
	str	q31, [sp, 672]	// tmp3284, %sfp
	ldr	q31, [sp, 688]	// tmp3285, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3285, tmp3285, tmp3285
	str	q31, [sp, 688]	// tmp3285, %sfp
	ldr	q31, [sp, 704]	// tmp3286, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3286, tmp3286, tmp3286
	str	q31, [sp, 704]	// tmp3286, %sfp
	ldr	q31, [sp, 768]	// tmp3287, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3287, tmp3287, tmp3287
	str	q31, [sp, 768]	// tmp3287, %sfp
	ldr	q31, [sp, 784]	// tmp3288, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3288, tmp3288, tmp3288
	str	q31, [sp, 784]	// tmp3288, %sfp
	faddp	v31.4s, v30.4s, v30.4s	// tmp3289, tmp3289, tmp3289
	ldr	s30, [sp, 552]	// acc_I_I_lsm.1672, %sfp
	str	q31, [sp, 800]	// tmp3289, %sfp
	ldr	s31, [sp, 1424]	// tmp10240, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1672, acc_I_I_lsm.1672, tmp10240
	ldr	s31, [sp, 480]	// tmp10236, %sfp
	str	s30, [sp, 552]	// acc_I_I_lsm.1672, %sfp
	ldr	s30, [sp, 944]	// acc_I_I_lsm.1670, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1670, acc_I_I_lsm.1670, tmp10236
	str	s30, [sp, 944]	// acc_I_I_lsm.1670, %sfp
	ldr	s30, [sp, 496]	// acc_I_I_lsm.1668, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1668, acc_I_I_lsm.1668, tmp3245
	str	s30, [sp, 496]	// acc_I_I_lsm.1668, %sfp
	ldr	s30, [sp, 320]	// acc_I_I_lsm.1666, %sfp
	fadd	s30, s30, s28	// acc_I_I_lsm.1666, acc_I_I_lsm.1666, tmp3246
	str	s30, [sp, 320]	// acc_I_I_lsm.1666, %sfp
	ldr	s30, [sp, 1456]	// acc_I_I_lsm.1664, %sfp
	fadd	s30, s30, s27	// acc_I_I_lsm.1664, acc_I_I_lsm.1664, tmp3247
	str	s30, [sp, 1456]	// acc_I_I_lsm.1664, %sfp
	ldr	s30, [sp, 736]	// acc_I_I_lsm.1662, %sfp
	fadd	s30, s30, s26	// acc_I_I_lsm.1662, acc_I_I_lsm.1662, tmp3248
	str	s30, [sp, 736]	// acc_I_I_lsm.1662, %sfp
	ldr	s30, [sp, 416]	// acc_I_I_lsm.1660, %sfp
	fadd	s30, s30, s25	// acc_I_I_lsm.1660, acc_I_I_lsm.1660, tmp3249
	str	s30, [sp, 416]	// acc_I_I_lsm.1660, %sfp
	ldr	s30, [sp, 400]	// acc_I_I_lsm.1658, %sfp
	fadd	s30, s30, s24	// acc_I_I_lsm.1658, acc_I_I_lsm.1658, tmp3250
	str	s30, [sp, 400]	// acc_I_I_lsm.1658, %sfp
	ldr	s30, [sp, 912]	// acc_I_I_lsm.1656, %sfp
	fadd	s30, s30, s23	// acc_I_I_lsm.1656, acc_I_I_lsm.1656, tmp3251
	str	s30, [sp, 912]	// acc_I_I_lsm.1656, %sfp
	ldr	s30, [sp, 928]	// acc_I_I_lsm.1654, %sfp
	fadd	s30, s30, s22	// acc_I_I_lsm.1654, acc_I_I_lsm.1654, tmp3252
	str	s30, [sp, 928]	// acc_I_I_lsm.1654, %sfp
	ldr	s30, [sp, 976]	// acc_I_I_lsm.1652, %sfp
	fadd	s30, s30, s21	// acc_I_I_lsm.1652, acc_I_I_lsm.1652, tmp3253
	str	s30, [sp, 976]	// acc_I_I_lsm.1652, %sfp
	ldr	s30, [sp, 304]	// acc_I_I_lsm.1650, %sfp
	fadd	s30, s30, s20	// acc_I_I_lsm.1650, acc_I_I_lsm.1650, tmp3254
	str	s30, [sp, 304]	// acc_I_I_lsm.1650, %sfp
	ldr	s30, [sp, 504]	// acc_I_I_lsm.1648, %sfp
	fadd	s30, s30, s19	// acc_I_I_lsm.1648, acc_I_I_lsm.1648, tmp3255
	str	s30, [sp, 504]	// acc_I_I_lsm.1648, %sfp
	ldr	s30, [sp, 720]	// acc_I_I_lsm.1646, %sfp
	fadd	s30, s30, s18	// acc_I_I_lsm.1646, acc_I_I_lsm.1646, tmp3256
	str	s30, [sp, 720]	// acc_I_I_lsm.1646, %sfp
	ldr	s30, [sp, 656]	// acc_I_I_lsm.1644, %sfp
	fadd	s30, s30, s17	// acc_I_I_lsm.1644, acc_I_I_lsm.1644, tmp3257
	str	s30, [sp, 656]	// acc_I_I_lsm.1644, %sfp
	ldr	s30, [sp, 368]	// acc_I_I_lsm.1642, %sfp
	fadd	s30, s30, s16	// acc_I_I_lsm.1642, acc_I_I_lsm.1642, tmp3258
	str	s30, [sp, 368]	// acc_I_I_lsm.1642, %sfp
	ldr	s30, [sp, 896]	// acc_I_I_lsm.1640, %sfp
	fadd	s30, s30, s15	// acc_I_I_lsm.1640, acc_I_I_lsm.1640, tmp3259
	str	s30, [sp, 896]	// acc_I_I_lsm.1640, %sfp
	ldr	s30, [sp, 384]	// acc_I_I_lsm.1638, %sfp
	fadd	s30, s30, s14	// acc_I_I_lsm.1638, acc_I_I_lsm.1638, tmp3260
	str	s30, [sp, 384]	// acc_I_I_lsm.1638, %sfp
	ldr	s30, [sp, 752]	// acc_I_I_lsm.1636, %sfp
	fadd	s30, s30, s13	// acc_I_I_lsm.1636, acc_I_I_lsm.1636, tmp3261
	str	s30, [sp, 752]	// acc_I_I_lsm.1636, %sfp
	ldr	s30, [sp, 992]	// acc_I_I_lsm.1634, %sfp
	fadd	s30, s30, s12	// acc_I_I_lsm.1634, acc_I_I_lsm.1634, tmp3262
	str	s30, [sp, 992]	// acc_I_I_lsm.1634, %sfp
	ldr	s30, [sp, 1008]	// acc_I_I_lsm.1632, %sfp
	fadd	s30, s30, s11	// acc_I_I_lsm.1632, acc_I_I_lsm.1632, tmp3263
	str	s30, [sp, 1008]	// acc_I_I_lsm.1632, %sfp
	ldr	s30, [sp, 432]	// acc_I_I_lsm.1630, %sfp
	fadd	s30, s30, s10	// acc_I_I_lsm.1630, acc_I_I_lsm.1630, tmp3264
	str	s30, [sp, 432]	// acc_I_I_lsm.1630, %sfp
	ldr	s30, [sp, 960]	// acc_I_I_lsm.1628, %sfp
	ldr	s29, [sp, 272]	// tmp8532, %sfp
	fadd	s30, s30, s9	// acc_I_I_lsm.1628, acc_I_I_lsm.1628, tmp3265
	str	s30, [sp, 960]	// acc_I_I_lsm.1628, %sfp
	ldr	s30, [sp, 456]	// acc_I_I_lsm.1626, %sfp
	fadd	s30, s30, s8	// acc_I_I_lsm.1626, acc_I_I_lsm.1626, tmp3266
	str	s30, [sp, 456]	// acc_I_I_lsm.1626, %sfp
	ldr	s30, [sp, 472]	// acc_I_I_lsm.1624, %sfp
	fadd	s30, s30, s7	// acc_I_I_lsm.1624, acc_I_I_lsm.1624, tmp3267
	str	s30, [sp, 472]	// acc_I_I_lsm.1624, %sfp
	ldr	s30, [sp, 544]	// acc_I_I_lsm.1622, %sfp
	fadd	s30, s30, s6	// acc_I_I_lsm.1622, acc_I_I_lsm.1622, tmp3268
	str	s30, [sp, 544]	// acc_I_I_lsm.1622, %sfp
	ldr	s30, [sp, 352]	// acc_I_I_lsm.1620, %sfp
	fadd	s30, s30, s5	// acc_I_I_lsm.1620, acc_I_I_lsm.1620, tmp3269
	str	s30, [sp, 352]	// acc_I_I_lsm.1620, %sfp
	ldr	s30, [sp, 464]	// acc_I_I_lsm.1618, %sfp
	fadd	s30, s30, s4	// acc_I_I_lsm.1618, acc_I_I_lsm.1618, tmp3270
	str	s30, [sp, 464]	// acc_I_I_lsm.1618, %sfp
	ldr	s30, [sp, 1200]	// acc_I_I_lsm.1616, %sfp
	fadd	s30, s30, s3	// acc_I_I_lsm.1616, acc_I_I_lsm.1616, tmp3271
	str	s30, [sp, 1200]	// acc_I_I_lsm.1616, %sfp
	ldr	s30, [sp, 1184]	// acc_I_I_lsm.1614, %sfp
	fadd	s30, s30, s2	// acc_I_I_lsm.1614, acc_I_I_lsm.1614, tmp3272
	str	s30, [sp, 1184]	// acc_I_I_lsm.1614, %sfp
	ldr	s30, [sp, 1168]	// acc_I_I_lsm.1612, %sfp
	fadd	s30, s30, s1	// acc_I_I_lsm.1612, acc_I_I_lsm.1612, tmp3273
	str	s30, [sp, 1168]	// acc_I_I_lsm.1612, %sfp
	ldr	s30, [sp, 1152]	// acc_I_I_lsm.1610, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1610, acc_I_I_lsm.1610, tmp8532
	ldr	s29, [sp, 336]	// tmp8535, %sfp
	str	s30, [sp, 1152]	// acc_I_I_lsm.1610, %sfp
	ldr	s30, [sp, 1120]	// acc_I_I_lsm.1608, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1608, acc_I_I_lsm.1608, tmp8535
	ldr	s29, [sp, 512]	// tmp8538, %sfp
	str	s30, [sp, 1120]	// acc_I_I_lsm.1608, %sfp
	ldr	s30, [sp, 1104]	// acc_I_I_lsm.1606, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1606, acc_I_I_lsm.1606, tmp8538
	ldr	s29, [sp, 528]	// tmp8541, %sfp
	str	s30, [sp, 1104]	// acc_I_I_lsm.1606, %sfp
	ldr	s30, [sp, 1088]	// acc_I_I_lsm.1604, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1604, acc_I_I_lsm.1604, tmp8541
	ldr	s29, [sp, 608]	// tmp8544, %sfp
	str	s30, [sp, 1088]	// acc_I_I_lsm.1604, %sfp
	ldr	s30, [sp, 1072]	// acc_I_I_lsm.1602, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1602, acc_I_I_lsm.1602, tmp8544
	str	s30, [sp, 1072]	// acc_I_I_lsm.1602, %sfp
	ldr	s29, [sp, 592]	// tmp8547, %sfp
	ldr	s30, [sp, 1232]	// acc_I_I_lsm.1600, %sfp
	ldr	s31, [sp, 800]	// tmp8577, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1600, acc_I_I_lsm.1600, tmp8547
	ldr	s29, [sp, 576]	// tmp8550, %sfp
	str	s30, [sp, 1232]	// acc_I_I_lsm.1600, %sfp
	ldr	s30, [sp, 288]	// acc_I_I_lsm.1598, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1598, acc_I_I_lsm.1598, tmp8550
	ldr	s29, [sp, 560]	// tmp8553, %sfp
	str	s30, [sp, 288]	// acc_I_I_lsm.1598, %sfp
	ldr	s30, [sp, 1264]	// acc_I_I_lsm.1596, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1596, acc_I_I_lsm.1596, tmp8553
	ldr	s29, [sp, 624]	// tmp8556, %sfp
	str	s30, [sp, 1264]	// acc_I_I_lsm.1596, %sfp
	ldr	s30, [sp, 1248]	// acc_I_I_lsm.1594, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1594, acc_I_I_lsm.1594, tmp8556
	ldr	s29, [sp, 640]	// tmp8559, %sfp
	str	s30, [sp, 1248]	// acc_I_I_lsm.1594, %sfp
	ldr	s30, [sp, 1056]	// acc_I_I_lsm.1592, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1592, acc_I_I_lsm.1592, tmp8559
	ldr	s29, [sp, 672]	// tmp8562, %sfp
	str	s30, [sp, 1056]	// acc_I_I_lsm.1592, %sfp
	ldr	s30, [sp, 1040]	// acc_I_I_lsm.1590, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1590, acc_I_I_lsm.1590, tmp8562
	ldr	s29, [sp, 688]	// tmp8565, %sfp
	str	s30, [sp, 1040]	// acc_I_I_lsm.1590, %sfp
	ldr	s30, [sp, 1296]	// acc_I_I_lsm.1588, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1588, acc_I_I_lsm.1588, tmp8565
	ldr	s29, [sp, 704]	// tmp8568, %sfp
	str	s30, [sp, 1296]	// acc_I_I_lsm.1588, %sfp
	ldr	s30, [sp, 1280]	// acc_I_I_lsm.1586, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1586, acc_I_I_lsm.1586, tmp8568
	ldr	s29, [sp, 768]	// tmp8571, %sfp
	str	s30, [sp, 1280]	// acc_I_I_lsm.1586, %sfp
	ldr	s30, [sp, 224]	// acc_I_I_lsm.1584, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1584, acc_I_I_lsm.1584, tmp8571
	ldr	s29, [sp, 784]	// tmp8574, %sfp
	str	s30, [sp, 224]	// acc_I_I_lsm.1584, %sfp
	ldr	s30, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1582, acc_I_I_lsm.1582, tmp8574
	str	s30, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	ldr	s30, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	fadd	s31, s30, s31	// acc_I_I_lsm.1580, acc_I_I_lsm.1580, tmp8577
	str	s31, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	ldr	s31, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	fadd	s31, s31, s0	// acc_I_I_lsm.1578, acc_I_I_lsm.1578, tmp3290
	str	s31, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	cmp	w27, w0	// KW, kw
	beq	.L706		//,
.L704:
	ldr	x14, [sp, 1504]	// ivtmp.4435, %sfp
	add	x18, x23, x7	// _6820, _5909, ivtmp.4357
	add	x20, x7, x24	// _6822, ivtmp.4357, _10395
	add	x21, x7, x22	// _10416, ivtmp.4357, _10386
	add	x15, x14, x1	// _8642, ivtmp.4435, ivtmp.4364
	add	x15, x15, x13	// _4310, _8642, ivtmp.4304
	add	x14, x28, x15, lsl 2	// _4312, in_ptr, _4310,
	ldr	s16, [x28, x15, lsl 2]	// D__lsm0.3662, *_4312
	add	x15, x8, 32	// _6269, ivtmp.4365,
	ldr	s27, [x14, 40]	// D__lsm6.3661, MEM[(const float *)_4312 + 40B]
	ldp	s20, s26, [x14, 4]	// D__lsm1.3663, D__lsm2.3664,
	ldp	s17, s21, [x14, 16]	// D__lsm0.3655, D__lsm1.3656,
	ldp	s23, s22, [x14, 24]	// D__lsm2.3657, D__lsm3.3658,
	ldp	s25, s24, [x14, 32]	// D__lsm4.3659, D__lsm5.3660,
.L707:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s28, [x7, x13, lsl 2]	// _5703, MEM[(const float *)_6817 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	s15, [sp, 1280]	// acc_I_I_lsm.1586, %sfp
	ldr	s19, [sp, 1152]	// acc_I_I_lsm.1610, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s29, [x18, x13, lsl 2]	// _5706, MEM[(const float *)_6820 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s15, s20, s28, s15	// acc_I_I_lsm.1586, D__lsm1.3663, _5703, acc_I_I_lsm.1586
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s30, [x20, x13, lsl 2]	// _5259, MEM[(const float *)_6822 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s19, s17, s28, s19	// acc_I_I_lsm.1610, D__lsm0.3655, _5703, acc_I_I_lsm.1610
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s31, [x21, x13, lsl 2]	// _5711, MEM[(const float *)_10416 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s18, [x8, x13, lsl 2]	// xv, MEM[(const float *)_10433 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s15, [sp, 1280]	// acc_I_I_lsm.1586, %sfp
	ldr	s15, [sp, 304]	// acc_I_I_lsm.1650, %sfp
	str	s19, [sp, 1152]	// acc_I_I_lsm.1610, %sfp
	ldr	s19, [sp, 464]	// acc_I_I_lsm.1618, %sfp
	fmadd	s15, s24, s28, s15	// acc_I_I_lsm.1650, D__lsm5.3660, _5703, acc_I_I_lsm.1650
	fmadd	s19, s21, s28, s19	// acc_I_I_lsm.1618, D__lsm1.3656, _5703, acc_I_I_lsm.1618
	str	s15, [sp, 304]	// acc_I_I_lsm.1650, %sfp
	ldr	s15, [sp, 1248]	// acc_I_I_lsm.1594, %sfp
	str	s19, [sp, 464]	// acc_I_I_lsm.1618, %sfp
	ldr	s19, [sp, 456]	// acc_I_I_lsm.1626, %sfp
	fmadd	s15, s26, s28, s15	// acc_I_I_lsm.1594, D__lsm2.3664, _5703, acc_I_I_lsm.1594
	fmadd	s19, s23, s28, s19	// acc_I_I_lsm.1626, D__lsm2.3657, _5703, acc_I_I_lsm.1626
	str	s15, [sp, 1248]	// acc_I_I_lsm.1594, %sfp
	ldr	s15, [sp, 400]	// acc_I_I_lsm.1658, %sfp
	str	s19, [sp, 456]	// acc_I_I_lsm.1626, %sfp
	ldr	s19, [sp, 992]	// acc_I_I_lsm.1634, %sfp
	fmadd	s15, s27, s28, s15	// acc_I_I_lsm.1658, D__lsm6.3661, _5703, acc_I_I_lsm.1658
	fmadd	s19, s22, s28, s19	// acc_I_I_lsm.1634, D__lsm3.3658, _5703, acc_I_I_lsm.1634
	str	s15, [sp, 400]	// acc_I_I_lsm.1658, %sfp
	ldr	s15, [sp, 1168]	// acc_I_I_lsm.1612, %sfp
	str	s19, [sp, 992]	// acc_I_I_lsm.1634, %sfp
	ldr	s19, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	fmadd	s15, s17, s29, s15	// acc_I_I_lsm.1612, D__lsm0.3655, _5706, acc_I_I_lsm.1612
	fmadd	s19, s16, s28, s19	// acc_I_I_lsm.1578, D__lsm0.3662, _5703, acc_I_I_lsm.1578
	str	s15, [sp, 1168]	// acc_I_I_lsm.1612, %sfp
	ldr	s15, [sp, 352]	// acc_I_I_lsm.1620, %sfp
	str	s19, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	ldr	s19, [sp, 368]	// acc_I_I_lsm.1642, %sfp
	fmadd	s15, s21, s29, s15	// acc_I_I_lsm.1620, D__lsm1.3656, _5706, acc_I_I_lsm.1620
	fmadd	s19, s25, s28, s19	// acc_I_I_lsm.1642, D__lsm4.3659, _5703, acc_I_I_lsm.1642
	str	s15, [sp, 352]	// acc_I_I_lsm.1620, %sfp
	ldr	s15, [sp, 960]	// acc_I_I_lsm.1628, %sfp
	str	s19, [sp, 368]	// acc_I_I_lsm.1642, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s19, [x15, x13, lsl 2]	// xv, MEM[(const float *)_10459 + ivtmp.4304_6805 * 4]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	x13, x13, 1	// ivtmp.4304, ivtmp.4304,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s15, s23, s29, s15	// acc_I_I_lsm.1628, D__lsm2.3657, _5706, acc_I_I_lsm.1628
	str	s15, [sp, 960]	// acc_I_I_lsm.1628, %sfp
	ldr	s15, [sp, 752]	// acc_I_I_lsm.1636, %sfp
	fmadd	s15, s22, s29, s15	// acc_I_I_lsm.1636, D__lsm3.3658, _5706, acc_I_I_lsm.1636
	str	s15, [sp, 752]	// acc_I_I_lsm.1636, %sfp
	ldr	s15, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	fmadd	s15, s16, s29, s15	// acc_I_I_lsm.1580, D__lsm0.3662, _5706, acc_I_I_lsm.1580
	str	s15, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	ldr	s15, [sp, 656]	// acc_I_I_lsm.1644, %sfp
	fmadd	s15, s25, s29, s15	// acc_I_I_lsm.1644, D__lsm4.3659, _5706, acc_I_I_lsm.1644
	str	s15, [sp, 656]	// acc_I_I_lsm.1644, %sfp
	ldr	s15, [sp, 1296]	// acc_I_I_lsm.1588, %sfp
	fmadd	s15, s20, s29, s15	// acc_I_I_lsm.1588, D__lsm1.3663, _5706, acc_I_I_lsm.1588
	str	s15, [sp, 1296]	// acc_I_I_lsm.1588, %sfp
	ldr	s15, [sp, 976]	// acc_I_I_lsm.1652, %sfp
	fmadd	s15, s24, s29, s15	// acc_I_I_lsm.1652, D__lsm5.3660, _5706, acc_I_I_lsm.1652
	str	s15, [sp, 976]	// acc_I_I_lsm.1652, %sfp
	ldr	s15, [sp, 1264]	// acc_I_I_lsm.1596, %sfp
	fmadd	s15, s26, s29, s15	// acc_I_I_lsm.1596, D__lsm2.3664, _5706, acc_I_I_lsm.1596
	str	s15, [sp, 1264]	// acc_I_I_lsm.1596, %sfp
	ldr	s15, [sp, 416]	// acc_I_I_lsm.1660, %sfp
	fmadd	s15, s27, s29, s15	// acc_I_I_lsm.1660, D__lsm6.3661, _5706, acc_I_I_lsm.1660
	str	s15, [sp, 416]	// acc_I_I_lsm.1660, %sfp
	ldr	s15, [sp, 1184]	// acc_I_I_lsm.1614, %sfp
	fmadd	s15, s17, s30, s15	// acc_I_I_lsm.1614, D__lsm0.3655, _5259, acc_I_I_lsm.1614
	str	s15, [sp, 1184]	// acc_I_I_lsm.1614, %sfp
	ldr	s15, [sp, 544]	// acc_I_I_lsm.1622, %sfp
	fmadd	s15, s21, s30, s15	// acc_I_I_lsm.1622, D__lsm1.3656, _5259, acc_I_I_lsm.1622
	str	s15, [sp, 544]	// acc_I_I_lsm.1622, %sfp
	ldr	s15, [sp, 432]	// acc_I_I_lsm.1630, %sfp
	fmadd	s15, s23, s30, s15	// acc_I_I_lsm.1630, D__lsm2.3657, _5259, acc_I_I_lsm.1630
	str	s15, [sp, 432]	// acc_I_I_lsm.1630, %sfp
	ldr	s15, [sp, 384]	// acc_I_I_lsm.1638, %sfp
	fmadd	s15, s22, s30, s15	// acc_I_I_lsm.1638, D__lsm3.3658, _5259, acc_I_I_lsm.1638
	str	s15, [sp, 384]	// acc_I_I_lsm.1638, %sfp
	ldr	s15, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	fmadd	s15, s16, s30, s15	// acc_I_I_lsm.1582, D__lsm0.3662, _5259, acc_I_I_lsm.1582
	str	s15, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	ldr	s15, [sp, 720]	// acc_I_I_lsm.1646, %sfp
	fmadd	s15, s25, s30, s15	// acc_I_I_lsm.1646, D__lsm4.3659, _5259, acc_I_I_lsm.1646
	str	s15, [sp, 720]	// acc_I_I_lsm.1646, %sfp
	ldr	s15, [sp, 1040]	// acc_I_I_lsm.1590, %sfp
	fmadd	s15, s20, s30, s15	// acc_I_I_lsm.1590, D__lsm1.3663, _5259, acc_I_I_lsm.1590
	str	s15, [sp, 1040]	// acc_I_I_lsm.1590, %sfp
	ldr	s15, [sp, 928]	// acc_I_I_lsm.1654, %sfp
	fmadd	s15, s24, s30, s15	// acc_I_I_lsm.1654, D__lsm5.3660, _5259, acc_I_I_lsm.1654
	str	s15, [sp, 928]	// acc_I_I_lsm.1654, %sfp
	ldr	s15, [sp, 288]	// acc_I_I_lsm.1598, %sfp
	fmadd	s15, s26, s30, s15	// acc_I_I_lsm.1598, D__lsm2.3664, _5259, acc_I_I_lsm.1598
	str	s15, [sp, 288]	// acc_I_I_lsm.1598, %sfp
	ldr	s15, [sp, 736]	// acc_I_I_lsm.1662, %sfp
	fmadd	s15, s27, s30, s15	// acc_I_I_lsm.1662, D__lsm6.3661, _5259, acc_I_I_lsm.1662
	str	s15, [sp, 736]	// acc_I_I_lsm.1662, %sfp
	ldr	s15, [sp, 1200]	// acc_I_I_lsm.1616, %sfp
	fmadd	s17, s17, s31, s15	// acc_I_I_lsm.1616, D__lsm0.3655, _5711, acc_I_I_lsm.1616
	str	s17, [sp, 1200]	// acc_I_I_lsm.1616, %sfp
	ldr	s17, [sp, 472]	// acc_I_I_lsm.1624, %sfp
	fmadd	s17, s21, s31, s17	// acc_I_I_lsm.1624, D__lsm1.3656, _5711, acc_I_I_lsm.1624
	str	s17, [sp, 472]	// acc_I_I_lsm.1624, %sfp
	ldr	s17, [sp, 1008]	// acc_I_I_lsm.1632, %sfp
	fmadd	s17, s23, s31, s17	// acc_I_I_lsm.1632, D__lsm2.3657, _5711, acc_I_I_lsm.1632
	str	s17, [sp, 1008]	// acc_I_I_lsm.1632, %sfp
	fmov	s17, s21	// D__lsm0.3655, D__lsm1.3656
	ldr	s21, [sp, 896]	// acc_I_I_lsm.1640, %sfp
	fmadd	s21, s22, s31, s21	// acc_I_I_lsm.1640, D__lsm3.3658, _5711, acc_I_I_lsm.1640
	str	s21, [sp, 896]	// acc_I_I_lsm.1640, %sfp
	fmov	s21, s23	// D__lsm1.3656, D__lsm2.3657
	ldr	s23, [sp, 224]	// acc_I_I_lsm.1584, %sfp
	fmadd	s23, s16, s31, s23	// acc_I_I_lsm.1584, D__lsm0.3662, _5711, acc_I_I_lsm.1584
	fmov	s16, s20	// D__lsm0.3662, D__lsm1.3663
	str	s23, [sp, 224]	// acc_I_I_lsm.1584, %sfp
	ldr	s23, [sp, 504]	// acc_I_I_lsm.1648, %sfp
	fmadd	s23, s25, s31, s23	// acc_I_I_lsm.1648, D__lsm4.3659, _5711, acc_I_I_lsm.1648
	str	s23, [sp, 504]	// acc_I_I_lsm.1648, %sfp
	fmov	s23, s22	// D__lsm2.3657, D__lsm3.3658
	ldr	s22, [sp, 1056]	// acc_I_I_lsm.1592, %sfp
	fmadd	s22, s20, s31, s22	// acc_I_I_lsm.1592, D__lsm1.3663, _5711, acc_I_I_lsm.1592
	fmov	s20, s26	// D__lsm1.3663, D__lsm2.3664
	str	s22, [sp, 1056]	// acc_I_I_lsm.1592, %sfp
	ldr	s22, [sp, 912]	// acc_I_I_lsm.1656, %sfp
	fmadd	s22, s24, s31, s22	// acc_I_I_lsm.1656, D__lsm5.3660, _5711, acc_I_I_lsm.1656
	str	s22, [sp, 912]	// acc_I_I_lsm.1656, %sfp
	fmov	s22, s25	// D__lsm3.3658, D__lsm4.3659
	ldr	s25, [sp, 1232]	// acc_I_I_lsm.1600, %sfp
	fmadd	s25, s26, s31, s25	// acc_I_I_lsm.1600, D__lsm2.3664, _5711, acc_I_I_lsm.1600
	str	s25, [sp, 1232]	// acc_I_I_lsm.1600, %sfp
	ldr	s25, [sp, 1456]	// acc_I_I_lsm.1664, %sfp
	fmadd	s25, s27, s31, s25	// acc_I_I_lsm.1664, D__lsm6.3661, _5711, acc_I_I_lsm.1664
	str	s25, [sp, 1456]	// acc_I_I_lsm.1664, %sfp
	fmov	s25, s24	// D__lsm4.3659, D__lsm5.3660
	ldr	s24, [sp, 1072]	// acc_I_I_lsm.1602, %sfp
	fmadd	s24, s28, s18, s24	// acc_I_I_lsm.1602, _5703, xv, acc_I_I_lsm.1602
	str	s24, [sp, 1072]	// acc_I_I_lsm.1602, %sfp
	ldr	s24, [sp, 1088]	// acc_I_I_lsm.1604, %sfp
	fmadd	s24, s29, s18, s24	// acc_I_I_lsm.1604, _5706, xv, acc_I_I_lsm.1604
	str	s24, [sp, 1088]	// acc_I_I_lsm.1604, %sfp
	fmov	s24, s27	// D__lsm5.3660, D__lsm6.3661
	ldr	s27, [sp, 1104]	// acc_I_I_lsm.1606, %sfp
	fmadd	s27, s30, s18, s27	// acc_I_I_lsm.1606, _5259, xv, acc_I_I_lsm.1606
	str	s27, [sp, 1104]	// acc_I_I_lsm.1606, %sfp
	ldr	s27, [sp, 1120]	// acc_I_I_lsm.1608, %sfp
	fmadd	s27, s31, s18, s27	// acc_I_I_lsm.1608, _5711, xv, acc_I_I_lsm.1608
	str	s27, [sp, 1120]	// acc_I_I_lsm.1608, %sfp
	ldr	s27, [sp, 320]	// acc_I_I_lsm.1666, %sfp
	fmadd	s28, s19, s28, s27	// acc_I_I_lsm.1666, xv, _5703, acc_I_I_lsm.1666
	str	s28, [sp, 320]	// acc_I_I_lsm.1666, %sfp
	ldr	s28, [sp, 496]	// acc_I_I_lsm.1668, %sfp
	fmadd	s29, s19, s29, s28	// acc_I_I_lsm.1668, xv, _5706, acc_I_I_lsm.1668
	str	s29, [sp, 496]	// acc_I_I_lsm.1668, %sfp
	ldr	s29, [sp, 944]	// acc_I_I_lsm.1670, %sfp
	fmadd	s30, s19, s30, s29	// acc_I_I_lsm.1670, xv, _5259, acc_I_I_lsm.1670
	str	s30, [sp, 944]	// acc_I_I_lsm.1670, %sfp
	ldr	s30, [sp, 552]	// acc_I_I_lsm.1672, %sfp
	fmadd	s31, s19, s31, s30	// acc_I_I_lsm.1672, xv, _5711, acc_I_I_lsm.1672
	str	s31, [sp, 552]	// acc_I_I_lsm.1672, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w27, w13	// KW, ivtmp.4304
	ble	.L706		//,
	fmov	s26, s18	// D__lsm2.3664, xv
	fmov	s27, s19	// D__lsm6.3661, xv
	b	.L707		//
	.p2align 2,,3
.L907:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x13, 0	//,
	b	.L704		//
	.p2align 2,,3
.L706:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w20, 1	// acc_I_I_lsm_flag.1579,
.L703:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x15, [sp, 192]	// IW, %sfp
	ldr	x14, [sp, 1544]	// _9109, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w13, [sp, 1488]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x1, x1, x15	// ivtmp.4364, ivtmp.4364, IW
	ldr	x15, [sp, 1568]	// _1426, %sfp
	add	x7, x7, x14	// ivtmp.4357, ivtmp.4357, _9109
	add	x5, x5, x14	// ivtmp.4368, ivtmp.4368, _9109
	ldr	w14, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w13, w13, 1	// kh, kh,
	str	w13, [sp, 1488]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x8, x8, x15	// ivtmp.4365, ivtmp.4365, _1426
	add	x2, x2, x15	// ivtmp.4372, ivtmp.4372, _1426
	cmp	w14, w13	// KH, kh
	bne	.L708		//,
	mov	w18, w30	// ic, ic
	mov	x30, x25	// _2472, _2472
.L702:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x1, [sp, 1608]	// _9011, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w18, w18, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x9, x9, x1	// ivtmp.4394, ivtmp.4394, _9011
	ldr	x1, [sp, 1536]	// _8849, %sfp
	add	x6, x6, x1	// ivtmp.4396, ivtmp.4396, _8849
	ldr	w1, [sp, 168]	//, %sfp
	cmp	w1, w18	// IC, ic
	bne	.L709		//,
	add	x5, sp, 1712	//,,
	mov	x15, x30	// _2472, _2472
	ldr	x25, [sp, 1696]	// _530, %sfp
	mov	w30, w20	// acc_I_I_lsm_flag.1579, acc_I_I_lsm_flag.1579
	mov	x14, x3	// _5077, _5077
	ldp	x3, x8, [x5]	// ivtmp.4430, ivtmp.4416,
	mov	x20, x17	// ivtmp.4434, ivtmp.4434
	ldp	x2, x17, [x5, 16]	// ivtmp.4415, _4600,
	ldr	x0, [sp, 1752]	// ivtmp.4413, %sfp
	ldr	w13, [sp, 1680]	//, %sfp
	ldr	w7, [sp, 1688]	//, %sfp
	ldr	w21, [sp, 1704]	//, %sfp
	ldr	w1, [sp, 1744]	//, %sfp
	cbz	w30, .L711	// acc_I_I_lsm_flag.1579,
	ldr	s31, [sp, 1152]	// acc_I_I_lsm.1610, %sfp
	str	s31, [sp, 1856]	// acc_I_I_lsm.1610, MEM[(float[4][12] *)_520][0][4]
	ldr	s31, [sp, 464]	// acc_I_I_lsm.1618, %sfp
	str	s31, [sp, 1860]	// acc_I_I_lsm.1618, MEM[(float[4][12] *)_520][0][5]
	ldr	s31, [sp, 456]	// acc_I_I_lsm.1626, %sfp
	str	s31, [sp, 1864]	// acc_I_I_lsm.1626, MEM[(float[4][12] *)_520][0][6]
	ldr	s31, [sp, 992]	// acc_I_I_lsm.1634, %sfp
	str	s31, [sp, 1868]	// acc_I_I_lsm.1634, MEM[(float[4][12] *)_520][0][7]
	ldr	s31, [sp, 368]	// acc_I_I_lsm.1642, %sfp
	str	s31, [sp, 1872]	// acc_I_I_lsm.1642, MEM[(float[4][12] *)_520][0][8]
	ldr	s31, [sp, 304]	// acc_I_I_lsm.1650, %sfp
	str	s31, [sp, 1876]	// acc_I_I_lsm.1650, MEM[(float[4][12] *)_520][0][9]
	ldr	s31, [sp, 400]	// acc_I_I_lsm.1658, %sfp
	str	s31, [sp, 1880]	// acc_I_I_lsm.1658, MEM[(float[4][12] *)_520][0][10]
	ldr	s31, [sp, 320]	// acc_I_I_lsm.1666, %sfp
	str	s31, [sp, 1884]	// acc_I_I_lsm.1666, MEM[(float[4][12] *)_520][0][11]
	ldr	s31, [sp, 1168]	// acc_I_I_lsm.1612, %sfp
	str	s31, [sp, 1904]	// acc_I_I_lsm.1612, MEM[(float[4][12] *)_520][1][4]
	ldr	s31, [sp, 352]	// acc_I_I_lsm.1620, %sfp
	str	s31, [sp, 1908]	// acc_I_I_lsm.1620, MEM[(float[4][12] *)_520][1][5]
	ldr	s31, [sp, 960]	// acc_I_I_lsm.1628, %sfp
	str	s31, [sp, 1912]	// acc_I_I_lsm.1628, MEM[(float[4][12] *)_520][1][6]
	ldr	s31, [sp, 752]	// acc_I_I_lsm.1636, %sfp
	str	s31, [sp, 1916]	// acc_I_I_lsm.1636, MEM[(float[4][12] *)_520][1][7]
	ldr	s31, [sp, 656]	// acc_I_I_lsm.1644, %sfp
	str	s31, [sp, 1920]	// acc_I_I_lsm.1644, MEM[(float[4][12] *)_520][1][8]
	ldr	s31, [sp, 976]	// acc_I_I_lsm.1652, %sfp
	str	s31, [sp, 1924]	// acc_I_I_lsm.1652, MEM[(float[4][12] *)_520][1][9]
	ldr	s31, [sp, 416]	// acc_I_I_lsm.1660, %sfp
	str	s31, [sp, 1928]	// acc_I_I_lsm.1660, MEM[(float[4][12] *)_520][1][10]
	ldr	s31, [sp, 496]	// acc_I_I_lsm.1668, %sfp
	str	s31, [sp, 1932]	// acc_I_I_lsm.1668, MEM[(float[4][12] *)_520][1][11]
	ldr	s31, [sp, 1184]	// acc_I_I_lsm.1614, %sfp
	str	s31, [sp, 1952]	// acc_I_I_lsm.1614, MEM[(float[4][12] *)_520][2][4]
	ldr	s31, [sp, 544]	// acc_I_I_lsm.1622, %sfp
	str	s31, [sp, 1956]	// acc_I_I_lsm.1622, MEM[(float[4][12] *)_520][2][5]
	ldr	s31, [sp, 432]	// acc_I_I_lsm.1630, %sfp
	str	s31, [sp, 1960]	// acc_I_I_lsm.1630, MEM[(float[4][12] *)_520][2][6]
	ldr	s31, [sp, 384]	// acc_I_I_lsm.1638, %sfp
	str	s31, [sp, 1964]	// acc_I_I_lsm.1638, MEM[(float[4][12] *)_520][2][7]
	ldr	s31, [sp, 720]	// acc_I_I_lsm.1646, %sfp
	str	s31, [sp, 1968]	// acc_I_I_lsm.1646, MEM[(float[4][12] *)_520][2][8]
	ldr	s31, [sp, 928]	// acc_I_I_lsm.1654, %sfp
	str	s31, [sp, 1972]	// acc_I_I_lsm.1654, MEM[(float[4][12] *)_520][2][9]
	ldr	s31, [sp, 736]	// acc_I_I_lsm.1662, %sfp
	str	s31, [sp, 1976]	// acc_I_I_lsm.1662, MEM[(float[4][12] *)_520][2][10]
	ldr	s31, [sp, 944]	// acc_I_I_lsm.1670, %sfp
	str	s31, [sp, 1980]	// acc_I_I_lsm.1670, MEM[(float[4][12] *)_520][2][11]
	ldr	s31, [sp, 1200]	// acc_I_I_lsm.1616, %sfp
	str	s31, [sp, 2000]	// acc_I_I_lsm.1616, MEM[(float[4][12] *)_520][3][4]
	ldr	s31, [sp, 472]	// acc_I_I_lsm.1624, %sfp
	str	s31, [sp, 2004]	// acc_I_I_lsm.1624, MEM[(float[4][12] *)_520][3][5]
	ldr	s31, [sp, 1008]	// acc_I_I_lsm.1632, %sfp
	str	s31, [sp, 2008]	// acc_I_I_lsm.1632, MEM[(float[4][12] *)_520][3][6]
	ldr	s31, [sp, 896]	// acc_I_I_lsm.1640, %sfp
	str	s31, [sp, 2012]	// acc_I_I_lsm.1640, MEM[(float[4][12] *)_520][3][7]
	ldr	s31, [sp, 504]	// acc_I_I_lsm.1648, %sfp
	str	s31, [sp, 2016]	// acc_I_I_lsm.1648, MEM[(float[4][12] *)_520][3][8]
	ldr	s31, [sp, 912]	// acc_I_I_lsm.1656, %sfp
	str	s31, [sp, 2020]	// acc_I_I_lsm.1656, MEM[(float[4][12] *)_520][3][9]
	ldr	s31, [sp, 1456]	// acc_I_I_lsm.1664, %sfp
	str	s31, [sp, 2024]	// acc_I_I_lsm.1664, MEM[(float[4][12] *)_520][3][10]
	ldr	s31, [sp, 552]	// acc_I_I_lsm.1672, %sfp
	str	s31, [sp, 2028]	// acc_I_I_lsm.1672, MEM[(float[4][12] *)_520][3][11]
	ldr	s31, [sp, 1120]	// acc_I_I_lsm.1608, %sfp
	str	s31, [sp, 1996]	// acc_I_I_lsm.1608, MEM[(float[4][12] *)_520][3][3]
	ldr	s31, [sp, 240]	// acc_I_I_lsm.1578, %sfp
	str	s31, [sp, 1840]	// acc_I_I_lsm.1578, MEM[(float[4][12] *)_520][0][0]
	ldr	s31, [sp, 1280]	// acc_I_I_lsm.1586, %sfp
	str	s31, [sp, 1844]	// acc_I_I_lsm.1586, MEM[(float[4][12] *)_520][0][1]
	ldr	s31, [sp, 1248]	// acc_I_I_lsm.1594, %sfp
	str	s31, [sp, 1848]	// acc_I_I_lsm.1594, MEM[(float[4][12] *)_520][0][2]
	ldr	s31, [sp, 1072]	// acc_I_I_lsm.1602, %sfp
	str	s31, [sp, 1852]	// acc_I_I_lsm.1602, MEM[(float[4][12] *)_520][0][3]
	ldr	s31, [sp, 256]	// acc_I_I_lsm.1580, %sfp
	str	s31, [sp, 1888]	// acc_I_I_lsm.1580, MEM[(float[4][12] *)_520][1][0]
	ldr	s31, [sp, 1296]	// acc_I_I_lsm.1588, %sfp
	str	s31, [sp, 1892]	// acc_I_I_lsm.1588, MEM[(float[4][12] *)_520][1][1]
	ldr	s31, [sp, 1264]	// acc_I_I_lsm.1596, %sfp
	str	s31, [sp, 1896]	// acc_I_I_lsm.1596, MEM[(float[4][12] *)_520][1][2]
	ldr	s31, [sp, 1088]	// acc_I_I_lsm.1604, %sfp
	str	s31, [sp, 1900]	// acc_I_I_lsm.1604, MEM[(float[4][12] *)_520][1][3]
	ldr	s31, [sp, 216]	// acc_I_I_lsm.1582, %sfp
	str	s31, [sp, 1936]	// acc_I_I_lsm.1582, MEM[(float[4][12] *)_520][2][0]
	ldr	s31, [sp, 1040]	// acc_I_I_lsm.1590, %sfp
	str	s31, [sp, 1940]	// acc_I_I_lsm.1590, MEM[(float[4][12] *)_520][2][1]
	ldr	s31, [sp, 288]	// acc_I_I_lsm.1598, %sfp
	str	s31, [sp, 1944]	// acc_I_I_lsm.1598, MEM[(float[4][12] *)_520][2][2]
	ldr	s31, [sp, 1104]	// acc_I_I_lsm.1606, %sfp
	str	s31, [sp, 1948]	// acc_I_I_lsm.1606, MEM[(float[4][12] *)_520][2][3]
	ldr	s31, [sp, 224]	// acc_I_I_lsm.1584, %sfp
	str	s31, [sp, 1984]	// acc_I_I_lsm.1584, MEM[(float[4][12] *)_520][3][0]
	ldr	s31, [sp, 1056]	// acc_I_I_lsm.1592, %sfp
	str	s31, [sp, 1988]	// acc_I_I_lsm.1592, MEM[(float[4][12] *)_520][3][1]
	ldr	s31, [sp, 1232]	// acc_I_I_lsm.1600, %sfp
	str	s31, [sp, 1992]	// acc_I_I_lsm.1600, MEM[(float[4][12] *)_520][3][2]
.L711:
	cmp	w13, 0	// OW,
	ble	.L712		//,
	cmp	w13, 1	// OW,
	beq	.L1213		//,
	cmp	w13, 2	// OW,
	beq	.L1214		//,
	add	x5, sp, 1840	// ivtmp.4299,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x6, x2	// ivtmp.4300, ivtmp.4415
.L720:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x5]	// tmp8738, MEM <vector(2) float> [(float *)_4620]
	str	d31, [x6]	// tmp8738, MEM <vector(2) float> [(float *)_6781]
	ldr	s31, [x5, 8]	// tmp8739, MEM[(float *)_4620 + 8B]
	str	s31, [x6, 8]	// tmp8739, MEM[(float *)_6781 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 3	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 12]	// tmp8740, MEM[(float *)_4620 + 12B]
	str	s31, [x6, 12]	// tmp8740, MEM[(float *)_6781 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 4	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 16]	// tmp8741, MEM[(float *)_4620 + 16B]
	str	s31, [x6, 16]	// tmp8741, MEM[(float *)_6781 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 5	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 20]	// tmp8742, MEM[(float *)_4620 + 20B]
	str	s31, [x6, 20]	// tmp8742, MEM[(float *)_6781 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 6	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 24]	// tmp8743, MEM[(float *)_4620 + 24B]
	str	s31, [x6, 24]	// tmp8743, MEM[(float *)_6781 + 24B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 7	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 28]	// tmp8744, MEM[(float *)_4620 + 28B]
	str	s31, [x6, 28]	// tmp8744, MEM[(float *)_6781 + 28B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 8	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 32]	// tmp8745, MEM[(float *)_4620 + 32B]
	str	s31, [x6, 32]	// tmp8745, MEM[(float *)_6781 + 32B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 9	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 36]	// tmp8746, MEM[(float *)_4620 + 36B]
	str	s31, [x6, 36]	// tmp8746, MEM[(float *)_6781 + 36B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 10	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 40]	// tmp8747, MEM[(float *)_4620 + 40B]
	str	s31, [x6, 40]	// tmp8747, MEM[(float *)_6781 + 40B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 11	// OW,
	beq	.L718		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x5, 44]	// tmp8748, MEM[(float *)_4620 + 44B]
	str	s31, [x6, 44]	// tmp8748, MEM[(float *)_6781 + 44B]
.L718:
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x5, x5, 48	// ivtmp.4299, ivtmp.4299,
	add	x6, x6, x17	// ivtmp.4300, ivtmp.4300, _4600
	cmp	x5, x26	// ivtmp.4299, _6803
	bne	.L720		//,
.L712:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x5, [sp, 1520]	// _2405, %sfp
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	w7, w7, 4	// oc0, oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	x0, x0, 16	// ivtmp.4413, ivtmp.4413,
	add	x8, x8, x15	// ivtmp.4416, ivtmp.4416, _2472
	add	x2, x2, x5	// ivtmp.4415, ivtmp.4415, _2405
	cmp	w7, w1	// oc0, oc0
	bne	.L721		//,
	ldr	x30, [sp, 1568]	// _1426, %sfp
	mov	x5, x20	// ivtmp.4434, ivtmp.4434
	mov	x18, x16	// _5052, _5052
	mov	x20, x25	// _530, _530
	mov	w16, w21	// oc0, oc0
	ldr	x21, [sp, 1504]	// ivtmp.4435, %sfp
	mov	w9, w1	// oc0, oc0
	mov	x6, x10	// _8541, _8541
	mov	x1, x4	// _10463, _10463
	ldr	x25, [sp, 1512]	// _9101, %sfp
.L744:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, w16	// OC, oc0
	ble	.L742		//,
	add	x0, x11, x1	// _4092, ivtmp.4424, _10463
	ldr	x7, [sp, 1576]	// ivtmp.4274, %sfp
	add	x8, x19, 4	// _8578, ivtmp.4436,
	ptrue	p6.b, all	// tmp4242
	add	x2, x5, x0, lsl 2	// ivtmp.4273, ivtmp.4434, _4092,
	str	w16, [sp, 336]	// oc0, %sfp
	ldr	w0, [sp, 1552]	//, %sfp
	add	x10, x8, x3, lsl 2	// _2849, _8578, ivtmp.4430,
	str	x15, [sp, 352]	// _2472, %sfp
	ldr	x4, [sp, 1656]	// ivtmp.4269, %sfp
	str	x5, [sp, 368]	// ivtmp.4434, %sfp
	str	x11, [sp, 384]	// ivtmp.4424, %sfp
	sub	w0, w0, #1	// _5252, bnd.2577_6020,
	str	w9, [sp, 400]	// oc0, %sfp
	str	w0, [sp, 320]	// _5252, %sfp
	mov	x0, x30	// _1426, _1426
	mov	w30, w27	// KW, KW
	mov	x27, x0	// _1426, _1426
.L741:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x0, [sp, 208]	// _62, %sfp
	ldr	s26, [x0, x4, lsl 2]	// bv, MEM[(const float *)_62 + ivtmp.4269_7387 * 4]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w0, [sp, 168]	//, %sfp
	cmp	w0, 0	// IC,
	ble	.L724		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 176]	//, %sfp
	cmp	w0, 0	// KH,
	ble	.L724		//,
	fmov	s1, s26	// acc$0$9, bv
	fmov	s13, s26	// acc$0$11, bv
	add	x5, x3, x21	// _10484, ivtmp.4430, ivtmp.4435
	mov	x9, 0	// ivtmp.4262,
	str	x7, [sp, 272]	// ivtmp.4247, %sfp
	fmov	s0, s26	// acc$0$10, bv
	fmov	s3, s26	// acc$0$7, bv
	mov	x0, x10	// ivtmp.4250, _2849
	mov	w11, 0	// ic,
	str	w13, [sp, 416]	// OW, %sfp
	fmov	s2, s26	// acc$0$8, bv
	fmov	s12, s26	// acc$0$1, bv
	str	x5, [sp, 304]	// _10484, %sfp
	fmov	s25, s26	// acc$0$0, bv
	fmov	s10, s26	// acc$0$4, bv
	str	x20, [sp, 432]	// _530, %sfp
	fmov	s4, s26	// acc$0$6, bv
	fmov	s11, s26	// acc$0$3, bv
	stp	x3, x10, [sp, 456]	// ivtmp.4430, _2849,
	fmov	s5, s26	// acc$0$5, bv
	stp	x17, x18, [sp, 472]	// _4600, _5052,
	stp	x7, x21, [sp, 496]	// ivtmp.4274, ivtmp.4435,
	str	x19, [sp, 512]	// ivtmp.4436, %sfp
	str	x14, [sp, 528]	// _5077, %sfp
	str	x2, [sp, 544]	// ivtmp.4273, %sfp
	str	x4, [sp, 552]	// ivtmp.4269, %sfp
	str	x6, [sp, 560]	// _8541, %sfp
	str	x1, [sp, 576]	// _10463, %sfp
	str	x25, [sp, 592]	// _9101, %sfp
.L733:
	ldr	x8, [sp, 272]	// ivtmp.4247, %sfp
	fmov	s30, s26	// acc$0$11, acc$0$11
	sub	x2, x0, #4	// ivtmp.4218, ivtmp.4250,
	add	x18, x0, 4	// ivtmp.4219, ivtmp.4250,
	add	x17, x0, 8	// ivtmp.4220, ivtmp.4250,
	add	x16, x0, 12	// ivtmp.4221, ivtmp.4250,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	wzr, [sp, 288]	//, %sfp
	ldr	x1, [sp, 448]	// _63, %sfp
	add	x6, x0, 28	// ivtmp.4225, ivtmp.4250,
	add	x5, x0, 32	// ivtmp.4226, ivtmp.4250,
	add	x4, x0, 36	// ivtmp.4227, ivtmp.4250,
	add	x3, x0, 40	// ivtmp.4228, ivtmp.4250,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	x23, [sp, 608]	// _5909, %sfp
	str	w11, [sp, 624]	// ic, %sfp
	str	x0, [sp, 640]	// ivtmp.4250, %sfp
	str	x22, [sp, 656]	// _10386, %sfp
	add	x7, x1, x8, lsl 2	// ivtmp.4215, _63, ivtmp.4247,
	ldr	x1, [sp, 304]	// _10484, %sfp
	str	x24, [sp, 672]	// _10395, %sfp
	str	x9, [sp, 1456]	// ivtmp.4262, %sfp
	add	x26, x1, x9	// ivtmp.4214, _10484, ivtmp.4262
	add	x1, x0, 16	// ivtmp.4222, ivtmp.4250,
	str	x1, [sp, 216]	// ivtmp.4222, %sfp
	add	x1, x0, 20	// ivtmp.4223, ivtmp.4250,
	str	x1, [sp, 224]	// ivtmp.4223, %sfp
	add	x1, x0, 24	// ivtmp.4224, ivtmp.4250,
	str	x1, [sp, 240]	// ivtmp.4224, %sfp
	mov	x1, x0	// ivtmp.4217, ivtmp.4250
	.p2align 5,,15
.L732:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w30, 0	// KW,
	ble	.L725		//,
	ldr	w0, [sp, 1440]	//, %sfp
	cmp	w0, 2	// _473,
	bls	.L911		//,
	ldr	w0, [sp, 320]	//, %sfp
	movi	v31.4s, 0	// vect_acc_0_11_1188.2411
	mov	x24, x7	// vectp.2413, ivtmp.4215
	mov	x23, x2	// vectp.2416, ivtmp.4218
	mov	x22, x6	// vectp.2463, ivtmp.4225
	mov	x21, x5	// vectp.2469, ivtmp.4226
	mov	x20, x4	// vectp.2475, ivtmp.4227
	mov	x19, x3	// vectp.2481, ivtmp.4228
	cmp	w0, 1	// _5252,
	bls	.L727		//,
	ldp	q21, q24, [x2]	// vectp.2463__lsm0.3610, vectp.2463__lsm1.3611,* ivtmp.4218
	mov	v19.16b, v31.16b	// vect_acc_0_10_2975.2410, vect_acc_0_11_1188.2411
	mov	x10, 16	// ivtmp.4208,
	mov	x9, 0	// ivtmp.4172,
	mov	v18.16b, v31.16b	// vect_acc_0_9_320.2409, vect_acc_0_11_1188.2411
	mov	v17.16b, v31.16b	// vect_acc_0_8_1780.2408, vect_acc_0_11_1188.2411
	mov	w12, 0	// ivtmp_2615,
	str	s30, [sp, 256]	// acc$0$11, %sfp
	ldr	q29, [x2, 4]	// vectp.2469__lsm0.3608, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 4B]
	mov	v16.16b, v31.16b	// vect_acc_0_7_52.2407, vect_acc_0_11_1188.2411
	mov	v15.16b, v31.16b	// vect_acc_0_6_1419.2406, vect_acc_0_11_1188.2411
	mov	v14.16b, v31.16b	// vect_acc_0_5_1350.2405, vect_acc_0_11_1188.2411
	mov	v9.16b, v31.16b	// vect_acc_0_3_1360.2403, vect_acc_0_11_1188.2411
	str	s13, [sp, 688]	// bv, %sfp
	ldr	q23, [x2, 8]	// vectp.2475__lsm0.3606, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 8B]
	mov	v8.16b, v31.16b	// vect_acc_0_2_1342.2402, vect_acc_0_11_1188.2411
	mov	v7.16b, v31.16b	// vect_acc_0_1_1373.2401, vect_acc_0_11_1188.2411
	mov	v6.16b, v31.16b	// vect_acc_0_0_1378.2400, vect_acc_0_11_1188.2411
	mov	v13.16b, v31.16b	// vect_acc_0_4_105.2404, vect_acc_0_4_105.2404
	str	s11, [sp, 704]	// acc$0$3, %sfp
	ldr	q22, [x2, 12]	// vectp.2481__lsm0.3604, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 12B]
	str	s10, [sp, 720]	// acc$0$4, %sfp
	ldr	q26, [x2, 20]	// vectp.2469__lsm1.3609, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 20B]
	str	s25, [sp, 736]	// acc$0$0, %sfp
	mov	v25.16b, v24.16b	// vectp.2463__lsm1.3611, vectp.2463__lsm1.3611
	mov	v24.16b, v21.16b	// vectp.2463__lsm0.3610, vectp.2463__lsm0.3610
	ldr	q27, [x2, 24]	// vectp.2475__lsm1.3607, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 24B]
	mov	v11.16b, v23.16b	// vectp.2475__lsm0.3606, vectp.2475__lsm0.3606
	str	s12, [sp, 752]	// acc$0$1, %sfp
	mov	v12.16b, v29.16b	// vectp.2469__lsm0.3608, vectp.2469__lsm0.3608
	ldr	q28, [x2, 28]	// vectp.2481__lsm1.3605, MEM <const vector(4) float> [(const float *)vectp.2416_6166 + 28B]
	mov	v10.16b, v22.16b	// vectp.2481__lsm0.3604, vectp.2481__lsm0.3604
	ldr	w13, [sp, 1616]	//, %sfp
	ldr	w25, [sp, 1624]	//, %sfp
	b	.L728		//
	.p2align 2,,3
.L912:
	mov	v24.16b, v20.16b	// vectp.2463__lsm0.3610, MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4172_3298 * 1]
	mov	v12.16b, v21.16b	// vectp.2469__lsm0.3608, MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4172_3298 * 1]
	mov	v11.16b, v22.16b	// vectp.2475__lsm0.3606, MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4172_3298 * 1]
	mov	v10.16b, v23.16b	// vectp.2481__lsm0.3604, MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4172_3298 * 1]
.L728:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x7, x9]	// MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	cmp	w13, w12	// _4270, ivtmp_3756
	mov	x0, x9	// ivtmp.4172, ivtmp.4172
	add	w12, w12, 2	// ivtmp_2615, ivtmp_2615,
	ldr	q30, [x7, x10]	// MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q20, [x6, x9]	// MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4172_3298 * 1]
	ldr	q21, [x5, x9]	// MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4172_3298 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v13.4s, v25.4s, v29.4s	// vect__4564.2443, vectp.2463__lsm1.3611, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q22, [x4, x9]	// MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4172_3298 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v14.4s, v26.4s, v29.4s	// vect__4576.2449, vectp.2469__lsm1.3609, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q23, [x3, x9]	// MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4172_3298 * 1]
	add	x9, x9, 32	// ivtmp.4172, ivtmp.4172,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v15.4s, v27.4s, v29.4s	// vect__4588.2455, vectp.2475__lsm1.3607, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v16.4s, v28.4s, v29.4s	// vect__4600.2461, vectp.2481__lsm1.3605, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v6.4s, v30.4s, v25.4s	// _8586, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], vectp.2463__lsm1.3611
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q25, [x6, x10]	// MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4208_3305 * 1]
	fmla	v7.4s, v30.4s, v26.4s	// _8594, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], vectp.2469__lsm1.3609
	ldr	q26, [x5, x10]	// MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4208_3305 * 1]
	fmla	v8.4s, v30.4s, v27.4s	// _8602, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], vectp.2475__lsm1.3607
	ldr	q27, [x4, x10]	// MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4208_3305 * 1]
	fmla	v9.4s, v30.4s, v28.4s	// _8646, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], vectp.2481__lsm1.3605
	ldr	q28, [x3, x10]	// MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4208_3305 * 1]
	add	x10, x10, 32	// ivtmp.4208, ivtmp.4208,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v17.4s, v20.4s, v29.4s	// vect__4612.2467, MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v18.4s, v21.4s, v29.4s	// vect__4624.2473, MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v19.4s, v22.4s, v29.4s	// vect__4636.2479, MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v31.4s, v23.4s, v29.4s	// vect__4648.2485, MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4172_3298 * 1], MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v6.4s, v24.4s, v29.4s	// vect_acc_0_0_1378.2400, vectp.2463__lsm0.3610, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v7.4s, v12.4s, v29.4s	// vect_acc_0_1_1373.2401, vectp.2469__lsm0.3608, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v8.4s, v11.4s, v29.4s	// vect_acc_0_2_1342.2402, vectp.2475__lsm0.3606, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v9.4s, v10.4s, v29.4s	// vect_acc_0_3_1360.2403, vectp.2481__lsm0.3604, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4172_3298 * 1]
	fmla	v13.4s, v30.4s, v20.4s	// vect_acc_0_4_105.2404, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4172_3298 * 1]
	fmla	v14.4s, v30.4s, v21.4s	// vect_acc_0_5_1350.2405, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4172_3298 * 1]
	fmla	v15.4s, v30.4s, v22.4s	// vect_acc_0_6_1419.2406, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4172_3298 * 1]
	fmla	v16.4s, v30.4s, v23.4s	// vect_acc_0_7_52.2407, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4172_3298 * 1]
	fmla	v17.4s, v30.4s, v25.4s	// vect_acc_0_8_1780.2408, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2464_4861 + ivtmp.4208_3305 * 1]
	fmla	v18.4s, v30.4s, v26.4s	// vect_acc_0_9_320.2409, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2470_4773 + ivtmp.4208_3305 * 1]
	fmla	v19.4s, v30.4s, v27.4s	// vect_acc_0_10_2975.2410, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2476_4694 + ivtmp.4208_3305 * 1]
	fmla	v31.4s, v30.4s, v28.4s	// vect_acc_0_11_1188.2411, MEM <const vector(4) float> [(const float *)vectp.2413_6173 + ivtmp.4208_3305 * 1], MEM <const vector(4) float> [(const float *)vectp.2482_4369 + ivtmp.4208_3305 * 1]
	bne	.L912		//,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	x9, [sp, 216]	// ivtmp.4222, %sfp
	add	x24, x7, 32	// _8748, ivtmp.4215,
	add	x23, x2, 32	// _8763, ivtmp.4218,
	add	x15, x1, 32	// _8771, ivtmp.4217,
	add	x14, x18, 32	// _8779, ivtmp.4219,
	ldr	s30, [sp, 256]	// acc$0$11, %sfp
	add	x13, x17, 32	// _8807, ivtmp.4220,
	add	x12, x16, 32	// _8841, ivtmp.4221,
	str	q13, [sp, 256]	// vect_acc_0_4_105.2404, %sfp
	add	x22, x6, 32	// _10118, ivtmp.4225,
	add	x21, x5, 32	// _10319, ivtmp.4226,
	ldr	s13, [sp, 688]	// bv, %sfp
	add	x20, x4, 32	// _10342, ivtmp.4227,
	add	x19, x3, 32	// _10407, ivtmp.4228,
	add	x11, x9, 32	// _9738, ivtmp.4222,
	add	x24, x24, x0	// vectp.2413, _8748, ivtmp.4172
	ldr	x9, [sp, 224]	// ivtmp.4223, %sfp
	add	x23, x23, x0	// vectp.2416, _8763, ivtmp.4172
	add	x15, x15, x0	// vectp.2422, _8771, ivtmp.4172
	add	x14, x14, x0	// vectp.2428, _8779, ivtmp.4172
	add	x13, x13, x0	// vectp.2434, _8807, ivtmp.4172
	ldr	s11, [sp, 704]	// acc$0$3, %sfp
	add	x12, x12, x0	// vectp.2440, _8841, ivtmp.4172
	add	x22, x22, x0	// vectp.2463, _10118, ivtmp.4172
	add	x21, x21, x0	// vectp.2469, _10319, ivtmp.4172
	add	x20, x20, x0	// vectp.2475, _10342, ivtmp.4172
	ldr	s10, [sp, 720]	// acc$0$4, %sfp
	add	x19, x19, x0	// vectp.2481, _10407, ivtmp.4172
	add	x11, x11, x0	// vectp.2445, _9738, ivtmp.4172
	add	x10, x9, 32	// _9803, ivtmp.4223,
	ldr	x9, [sp, 240]	// ivtmp.4224, %sfp
	add	x10, x10, x0	// vectp.2451, _9803, ivtmp.4172
	ldr	s25, [sp, 736]	// acc$0$0, %sfp
	ldr	s12, [sp, 752]	// acc$0$1, %sfp
	add	x9, x9, 32	// _10095, ivtmp.4224,
	add	x9, x9, x0	// vectp.2457, _10095, ivtmp.4172
.L729:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x24]	// MEM <const vector(4) float> [(const float *)vectp.2412_5442], MEM <const vector(4) float> [(const float *)vectp.2412_5442]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	v28.16b, v6.16b	// vect_acc_0_0_1378.2400, vect_acc_0_0_1378.2400
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	w25, w25, 1	// ivtmp_3198, _4287,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q27, [x23]	// vect_xv_4513.2417_285, MEM <const vector(4) float> [(const float *)vectp.2415_5443]
	ldr	q26, [x15]	// vect_xv_4525.2423_269, MEM <const vector(4) float> [(const float *)vectp.2421_5445]
	ldr	q24, [x14]	// vect_xv_4537.2429_5213, MEM <const vector(4) float> [(const float *)vectp.2427_5446]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v28.4s, v27.4s, v29.4s	// vect_acc_0_0_1378.2400, vect_xv_4513.2417_285, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q23, [x13]	// vect_xv_4549.2435_4649, MEM <const vector(4) float> [(const float *)vectp.2433_5449]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	v27.16b, v7.16b	// vect_acc_0_1_1373.2401, vect_acc_0_1_1373.2401
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q21, [x12]	// vect_xv_4561.2441_4079, MEM <const vector(4) float> [(const float *)vectp.2439_5450]
	ldr	q6, [x20]	// vect_xv_4633.2477_149, MEM <const vector(4) float> [(const float *)vectp.2475_5464]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v26.4s, v29.4s	// vect_acc_0_1_1373.2401, vect_xv_4525.2423_269, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	mov	v26.16b, v8.16b	// vect_acc_0_2_1342.2402, vect_acc_0_2_1342.2402
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q20, [x11]	// vect_xv_4573.2447_4139, MEM <const vector(4) float> [(const float *)vectp.2445_5453]
	ldr	q22, [x10]	// vect_xv_4585.2453_4028, MEM <const vector(4) float> [(const float *)vectp.2451_5454]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v24.4s, v29.4s	// vect_acc_0_2_1342.2402, vect_xv_4537.2429_5213, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q8, [x9]	// vect_xv_4597.2459_3922, MEM <const vector(4) float> [(const float *)vectp.2457_5461]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	mov	v24.16b, v9.16b	// vect_acc_0_3_1360.2403, vect_acc_0_3_1360.2403
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q7, [x22]	// vect_xv_4609.2465_4972, MEM <const vector(4) float> [(const float *)vectp.2463_5462]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v19.4s, v6.4s, v29.4s	// vect_acc_0_10_2975.2410, vect_xv_4633.2477_149, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q9, [x21]	// vect_xv_4621.2471_3757, MEM <const vector(4) float> [(const float *)vectp.2469_5463]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v24.4s, v23.4s, v29.4s	// vect_acc_0_3_1360.2403, vect_xv_4549.2435_4649, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	ldr	q23, [sp, 256]	// vect_acc_0_4_105.2404, %sfp
	ldr	w0, [sp, 1552]	//, %sfp
	fmla	v17.4s, v7.4s, v29.4s	// vect__4612.2467, vect_xv_4609.2465_4972, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	fmla	v23.4s, v21.4s, v29.4s	// vect_acc_0_4_105.2404, vect_xv_4561.2441_4079, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	mov	v21.16b, v14.16b	// vect_acc_0_5_1350.2405, vect_acc_0_5_1350.2405
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q14, [x19]	// vect_xv_4645.2483_2910, MEM <const vector(4) float> [(const float *)vectp.2481_5466]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v9.4s, v29.4s	// vect__4624.2473, vect_xv_4621.2471_3757, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	fmla	v21.4s, v20.4s, v29.4s	// vect_acc_0_5_1350.2405, vect_xv_4573.2447_4139, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	mov	v20.16b, v15.16b	// vect_acc_0_6_1419.2406, vect_acc_0_6_1419.2406
	fmla	v31.4s, v14.4s, v29.4s	// vect__4648.2485, vect_xv_4645.2483_2910, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	fmla	v20.4s, v22.4s, v29.4s	// vect_acc_0_6_1419.2406, vect_xv_4585.2453_4028, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	mov	v22.16b, v16.16b	// vect_acc_0_7_52.2407, vect_acc_0_7_52.2407
	mov	v16.16b, v19.16b	// vect__4636.2479, vect_acc_0_10_2975.2410
	fmla	v22.4s, v8.4s, v29.4s	// vect_acc_0_7_52.2407, vect_xv_4597.2459_3922, MEM <const vector(4) float> [(const float *)vectp.2412_5442]
	cmp	w25, w0	// ivtmp_3198, bnd.2577_6020
	bcs	.L730		//,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x24, 16]	// MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x15, 16]	// vect_xv_4525.2423_5317, MEM <const vector(4) float> [(const float *)vectp.2421_5445 + 16B]
	ldr	q15, [x23, 16]	// vect_xv_4513.2417_5314, MEM <const vector(4) float> [(const float *)vectp.2415_5443 + 16B]
	ldr	q14, [x13, 16]	// vect_xv_4549.2435_5328, MEM <const vector(4) float> [(const float *)vectp.2433_5449 + 16B]
	ldr	q9, [x14, 16]	// vect_xv_4537.2429_5323, MEM <const vector(4) float> [(const float *)vectp.2427_5446 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v29.4s, v19.4s	// vect__4528.2425, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4525.2423_5317
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x11, 16]	// vect_xv_4573.2447_5341, MEM <const vector(4) float> [(const float *)vectp.2445_5453 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v28.4s, v29.4s, v15.4s	// vect__4516.2419, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4513.2417_5314
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q15, [x12, 16]	// vect_xv_4561.2441_5337, MEM <const vector(4) float> [(const float *)vectp.2439_5450 + 16B]
	ldr	q8, [x9, 16]	// vect_xv_4597.2459_5357, MEM <const vector(4) float> [(const float *)vectp.2457_5461 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v26.4s, v29.4s, v9.4s	// vect__4540.2431, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4537.2429_5323
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q7, [x10, 16]	// vect_xv_4585.2453_5348, MEM <const vector(4) float> [(const float *)vectp.2451_5454 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v24.4s, v29.4s, v14.4s	// vect__4552.2437, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4549.2435_5328
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q9, [x22, 16]	// vect_xv_4609.2465_5361, MEM <const vector(4) float> [(const float *)vectp.2463_5462 + 16B]
	ldr	q14, [x21, 16]	// vect_xv_4621.2471_5366, MEM <const vector(4) float> [(const float *)vectp.2469_5463 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v21.4s, v29.4s, v19.4s	// vect__4576.2449, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4573.2447_5341
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x19, 16]	// vect_xv_4645.2483_5380, MEM <const vector(4) float> [(const float *)vectp.2481_5466 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v23.4s, v29.4s, v15.4s	// vect__4564.2443, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4561.2441_5337
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q15, [x20, 16]	// vect_xv_4633.2477_5377, MEM <const vector(4) float> [(const float *)vectp.2475_5464 + 16B]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v29.4s, v7.4s	// vect__4588.2455, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4585.2453_5348
	fmla	v22.4s, v29.4s, v8.4s	// vect__4600.2461, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4597.2459_5357
	fmla	v31.4s, v29.4s, v19.4s	// vect__4648.2485, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4645.2483_5380
	fmla	v16.4s, v29.4s, v15.4s	// vect__4636.2479, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4633.2477_5377
	fmla	v18.4s, v29.4s, v14.4s	// vect__4624.2473, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4621.2471_5366
	fmla	v17.4s, v29.4s, v9.4s	// vect__4612.2467, MEM <const vector(4) float> [(const float *)vectp.2412_5442 + 16B], vect_xv_4609.2465_5361
.L730:
	ldr	w9, [sp, 1560]	//, %sfp
	faddp	v19.4s, v22.4s, v22.4s	// tmp3383, vect__4600.2461, vect__4600.2461
	faddp	v31.4s, v31.4s, v31.4s	// tmp3379, vect__4648.2485, vect__4648.2485
	faddp	v16.4s, v16.4s, v16.4s	// tmp3380, vect__4636.2479, vect__4636.2479
	faddp	v18.4s, v18.4s, v18.4s	// tmp3381, vect__4624.2473, vect__4624.2473
	mov	w0, w9	// niters_vector_mult_vf.2398, kw
	faddp	v17.4s, v17.4s, v17.4s	// tmp3382, vect__4612.2467, vect__4612.2467
	faddp	v20.4s, v20.4s, v20.4s	// tmp3384, vect__4588.2455, vect__4588.2455
	faddp	v22.4s, v21.4s, v21.4s	// tmp3385, vect__4576.2449, vect__4576.2449
	faddp	v23.4s, v23.4s, v23.4s	// tmp3386, vect__4564.2443, vect__4564.2443
	faddp	v24.4s, v24.4s, v24.4s	// tmp3387, vect__4552.2437, vect__4552.2437
	faddp	v26.4s, v26.4s, v26.4s	// tmp3388, vect__4540.2431, vect__4540.2431
	faddp	v27.4s, v27.4s, v27.4s	// tmp3389, vect__4528.2425, vect__4528.2425
	faddp	v29.4s, v28.4s, v28.4s	// tmp3390, vect__4516.2419, vect__4516.2419
	faddp	v31.4s, v31.4s, v31.4s	// tmp3379, tmp3379, tmp3379
	faddp	v16.4s, v16.4s, v16.4s	// tmp3380, tmp3380, tmp3380
	faddp	v18.4s, v18.4s, v18.4s	// tmp3381, tmp3381, tmp3381
	faddp	v17.4s, v17.4s, v17.4s	// tmp3382, tmp3382, tmp3382
	faddp	v19.4s, v19.4s, v19.4s	// tmp3383, tmp3383, tmp3383
	faddp	v20.4s, v20.4s, v20.4s	// tmp3384, tmp3384, tmp3384
	faddp	v22.4s, v22.4s, v22.4s	// tmp3385, tmp3385, tmp3385
	faddp	v23.4s, v23.4s, v23.4s	// tmp3386, tmp3386, tmp3386
	faddp	v24.4s, v24.4s, v24.4s	// tmp3387, tmp3387, tmp3387
	faddp	v26.4s, v26.4s, v26.4s	// tmp3388, tmp3388, tmp3388
	faddp	v27.4s, v27.4s, v27.4s	// tmp3389, tmp3389, tmp3389
	faddp	v29.4s, v29.4s, v29.4s	// tmp3390, tmp3390, tmp3390
	fadd	s30, s30, s31	// acc$0$11, acc$0$11, tmp3379
	fadd	s0, s0, s16	// acc$0$10, acc$0$10, tmp3380
	fadd	s1, s1, s18	// acc$0$9, acc$0$9, tmp3381
	fadd	s2, s2, s17	// acc$0$8, acc$0$8, tmp3382
	fadd	s3, s3, s19	// acc$0$7, acc$0$7, tmp3383
	fadd	s4, s4, s20	// acc$0$6, acc$0$6, tmp3384
	fadd	s5, s5, s22	// acc$0$5, acc$0$5, tmp3385
	fadd	s10, s10, s23	// acc$0$4, acc$0$4, tmp3386
	fadd	s11, s11, s24	// acc$0$3, acc$0$3, tmp3387
	fadd	s13, s13, s26	// bv, bv, tmp3388
	fadd	s12, s12, s27	// acc$0$1, acc$0$1, tmp3389
	fadd	s25, s25, s29	// acc$0$0, acc$0$0, tmp3390
	cmp	w30, w9	// KW, kw
	beq	.L725		//,
.L726:
	uxtw	x9, w0	// _4617, niters_vector_mult_vf.2398
	sub	w0, w30, w0	// bnd.2488_4217, KW, niters_vector_mult_vf.2398
	whilelo	p7.s, wzr, w0	// max_mask_2904,, bnd.2488_4217
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x10, [sp, 448]	// _63, %sfp
	add	x0, x9, x26	// _1204, _4617, ivtmp.4214
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x28, x0, lsl 2]	// vect_xv_6288.2506, max_mask_2904,* in_ptr
	add	x9, x9, x8	// _1505, _4617, ivtmp.4213
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ld1w	z31.s, p7/z, [x10, x9, lsl 2]	// vect__6292.2503, max_mask_2904,* _63
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11392, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11392, max_mask_2904, vect__6292.2503
	lsl	x0, x0, 2	// _1214, _1204,
	faddv	s29, p6, z29.s	// _1185, tmp4242, _11392
	fadd	s25, s25, s29	// acc$0$0, acc$0$0, _1185
	add	x13, x0, 4	// _7917, _1214,
	add	x12, x0, 8	// _941, _1214,
	add	x13, x28, x13	// vectp.2511, in_ptr, _7917
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x13]	// vect_xv_6282.2512, max_mask_2904,* vectp.2511
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11393, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11393, max_mask_2904, vect__6292.2503
	faddv	s29, p6, z29.s	// _842, tmp4242, _11393
	add	x11, x0, 12	// _1779, _1214,
	add	x12, x28, x12	// vectp.2517, in_ptr, _941
	fadd	s12, s12, s29	// acc$0$1, acc$0$1, _842
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x12]	// vect_xv_6276.2518, max_mask_2904,* vectp.2517
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11394, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11394, max_mask_2904, vect__6292.2503
	faddv	s29, p6, z29.s	// _1875, tmp4242, _11394
	add	x11, x28, x11	// vectp.2523, in_ptr, _1779
	add	x10, x0, 16	// _1817, _1214,
	fadd	s13, s13, s29	// bv, bv, _1875
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x11]	// vect_xv_6270.2524, max_mask_2904,* vectp.2523
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11395, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11395, max_mask_2904, vect__6292.2503
	add	x9, x0, 20	// _1863, _1214,
	faddv	s29, p6, z29.s	// _1794, tmp4242, _11395
	add	x13, x0, 24	// _1742, _1214,
	fadd	s11, s11, s29	// acc$0$3, acc$0$3, _1794
	add	x12, x0, 28	// _1677, _1214,
	add	x10, x28, x10	// vectp.2529, in_ptr, _1817
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x10]	// vect_xv_6264.2530, max_mask_2904,* vectp.2529
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11396, max_mask_2904
	fmul	z28.s, p7/m, z28.s, z31.s	// _11396, max_mask_2904, vect__6292.2503
	faddv	s28, p6, z28.s	// _1839, tmp4242, _11396
	add	x9, x28, x9	// vectp.2535, in_ptr, _1863
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_6258.2536, max_mask_2904,* vectp.2535
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11397, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11397, max_mask_2904, vect__6292.2503
	faddv	s29, p6, z29.s	// _1722, tmp4242, _11397
	add	x11, x0, 32	// _5641, _1214,
	add	x10, x0, 36	// _1193, _1214,
	fadd	s10, s10, s28	// acc$0$4, acc$0$4, _1839
	fadd	s5, s5, s29	// acc$0$5, acc$0$5, _1722
	add	x13, x28, x13	// vectp.2541, in_ptr, _1742
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x13]	// vect_xv_6252.2542, max_mask_2904,* vectp.2541
	add	x12, x28, x12	// vectp.2547, in_ptr, _1677
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11398, max_mask_2904
	fmul	z28.s, p7/m, z28.s, z31.s	// _11398, max_mask_2904, vect__6292.2503
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x12]	// vect_xv_6246.2548, max_mask_2904,* vectp.2547
	faddv	s28, p6, z28.s	// _1762, tmp4242, _11398
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11399, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11399, max_mask_2904, vect__6292.2503
	faddv	s29, p6, z29.s	// _1697, tmp4242, _11399
	add	x9, x0, 40	// _627, _1214,
	fadd	s4, s4, s28	// acc$0$6, acc$0$6, _1762
	fadd	s3, s3, s29	// acc$0$7, acc$0$7, _1697
	add	x0, x0, 44	// _3434, _1214,
	add	x11, x28, x11	// vectp.2553, in_ptr, _5641
	add	x10, x28, x10	// vectp.2559, in_ptr, _1193
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z28.s, p7/z, [x11]	// vect_xv_6240.2554, max_mask_2904,* vectp.2553
	ld1w	z29.s, p7/z, [x10]	// vect_xv_6234.2560, max_mask_2904,* vectp.2559
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z28.s, p7/z, z28.s	// _11400, max_mask_2904
	fmul	z28.s, p7/m, z28.s, z31.s	// _11400, max_mask_2904, vect__6292.2503
	movprfx	z29.s, p7/z, z29.s	// _11401, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11401, max_mask_2904, vect__6292.2503
	faddv	s28, p6, z28.s	// _5648, tmp4242, _11400
	faddv	s29, p6, z29.s	// _862, tmp4242, _11401
	fadd	s2, s2, s28	// acc$0$8, acc$0$8, _5648
	fadd	s1, s1, s29	// acc$0$9, acc$0$9, _862
	add	x9, x28, x9	// vectp.2565, in_ptr, _627
	add	x0, x28, x0	// vectp.2571, in_ptr, _3434
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x9]	// vect_xv_6228.2566, max_mask_2904,* vectp.2565
	ld1w	z28.s, p7/z, [x0]	// vect_xv_6222.2572, max_mask_2904,* vectp.2571
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11402, max_mask_2904
	fmul	z29.s, p7/m, z29.s, z31.s	// _11402, max_mask_2904, vect__6292.2503
	movprfx	z31.s, p7/z, z31.s	// _11403, max_mask_2904
	fmul	z31.s, p7/m, z31.s, z28.s	// _11403, max_mask_2904, vect_xv_6222.2572
	faddv	s29, p6, z29.s	// _406, tmp4242, _11402
	faddv	s31, p6, z31.s	// _3269, tmp4242, _11403
	fadd	s0, s0, s29	// acc$0$10, acc$0$10, _406
	fadd	s30, s30, s31	// acc$0$11, acc$0$11, _3269
.L725:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x9, [sp, 1600]	// _8548, %sfp
	add	x1, x1, x27	// ivtmp.4217, ivtmp.4217, _1426
	add	x2, x2, x27	// ivtmp.4218, ivtmp.4218, _1426
	add	x18, x18, x27	// ivtmp.4219, ivtmp.4219, _1426
	add	x17, x17, x27	// ivtmp.4220, ivtmp.4220, _1426
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 288]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x16, x16, x27	// ivtmp.4221, ivtmp.4221, _1426
	add	x6, x6, x27	// ivtmp.4225, ivtmp.4225, _1426
	add	x5, x5, x27	// ivtmp.4226, ivtmp.4226, _1426
	add	x4, x4, x27	// ivtmp.4227, ivtmp.4227, _1426
	add	x3, x3, x27	// ivtmp.4228, ivtmp.4228, _1426
	add	x8, x8, x9	// ivtmp.4213, ivtmp.4213, _8548
	ldr	x9, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w0, w0, 1	// kh, kh,
	str	w0, [sp, 288]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x26, x26, x9	// ivtmp.4214, ivtmp.4214, IW
	ldr	x9, [sp, 1544]	// _9109, %sfp
	add	x7, x7, x9	// ivtmp.4215, ivtmp.4215, _9109
	ldr	x9, [sp, 216]	// ivtmp.4222, %sfp
	add	x9, x9, x27	// ivtmp.4222, ivtmp.4222, _1426
	str	x9, [sp, 216]	// ivtmp.4222, %sfp
	ldr	x9, [sp, 224]	// ivtmp.4223, %sfp
	add	x9, x9, x27	// ivtmp.4223, ivtmp.4223, _1426
	str	x9, [sp, 224]	// ivtmp.4223, %sfp
	ldr	x9, [sp, 240]	// ivtmp.4224, %sfp
	add	x9, x9, x27	// ivtmp.4224, ivtmp.4224, _1426
	str	x9, [sp, 240]	// ivtmp.4224, %sfp
	ldr	w9, [sp, 176]	//, %sfp
	cmp	w9, w0	// KH, kh
	bne	.L732		//,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x1, [sp, 272]	// ivtmp.4247, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	fmov	s26, s30	// acc$0$11, acc$0$11
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x2, [sp, 1592]	// _8546, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x0, [sp, 640]	// ivtmp.4250, %sfp
	ldr	x9, [sp, 1456]	// ivtmp.4262, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x1, x1, x2	// ivtmp.4247, ivtmp.4247, _8546
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w11, [sp, 624]	//, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x1, [sp, 272]	// ivtmp.4247, %sfp
	ldr	x1, [sp, 1584]	// _7364, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x23, [sp, 608]	// _5909, %sfp
	add	w11, w11, 1	// ic, ic,
	ldr	x22, [sp, 656]	// _10386, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x0, x0, x1	// ivtmp.4250, ivtmp.4250, _7364
	ldr	x1, [sp, 1536]	// _8849, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x24, [sp, 672]	// _10395, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x9, x9, x1	// ivtmp.4262, ivtmp.4262, _8849
	ldr	w1, [sp, 168]	//, %sfp
	cmp	w1, w11	// IC, ic
	bne	.L733		//,
	ldr	x20, [sp, 432]	// _530, %sfp
	fmov	s26, s13	// bv, bv
	fmov	s13, s30	// acc$0$11, acc$0$11
	ldp	x3, x10, [sp, 456]	// ivtmp.4430, _2849,
	ldp	x17, x18, [sp, 472]	// _4600, _5052,
	ldp	x7, x21, [sp, 496]	// ivtmp.4274, ivtmp.4435,
	ldr	x19, [sp, 512]	// ivtmp.4436, %sfp
	ldr	x14, [sp, 528]	// _5077, %sfp
	ldr	x2, [sp, 544]	// ivtmp.4273, %sfp
	ldr	x4, [sp, 552]	// ivtmp.4269, %sfp
	ldr	x6, [sp, 560]	// _8541, %sfp
	ldr	x1, [sp, 576]	// _10463, %sfp
	ldr	x25, [sp, 592]	// _9101, %sfp
	ldr	w13, [sp, 416]	//, %sfp
.L734:
	cmp	w13, 11	// OW,
	ble	.L735		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s25, s12, [x2]	// acc$0$0, acc$0$1,* ivtmp.4273
	stp	s26, s11, [x2, 8]	// bv, acc$0$3,
	stp	s10, s5, [x2, 16]	// acc$0$4, acc$0$5,
	stp	s4, s3, [x2, 24]	// acc$0$6, acc$0$7,
	stp	s2, s1, [x2, 32]	// acc$0$8, acc$0$9,
	stp	s0, s13, [x2, 40]	// acc$0$10, acc$0$11,
.L736:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w0, [sp, 164]	//, %sfp
	add	x4, x4, 1	// ivtmp.4269, ivtmp.4269,
	add	x2, x2, x17	// ivtmp.4273, ivtmp.4273, _4600
	add	x7, x7, x20	// ivtmp.4274, ivtmp.4274, _530
	cmp	w0, w4	// OC, ivtmp.4269
	bgt	.L741		//,
	ldr	x15, [sp, 352]	// _2472, %sfp
	mov	x0, x27	// _1426, _1426
	mov	w27, w30	// KW, KW
	mov	x30, x0	// _1426, _1426
	ldr	x5, [sp, 368]	// ivtmp.4434, %sfp
	ldr	x11, [sp, 384]	// ivtmp.4424, %sfp
	ldr	w16, [sp, 336]	//, %sfp
	ldr	w9, [sp, 400]	//, %sfp
.L742:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x2, [sp, 200]	// _12516, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	w0, [sp, 1528]	//, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x11, x11, x2	// ivtmp.4424, ivtmp.4424, _12516
	ldr	x2, [sp, 192]	// IW, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w0, w0, 1	// oh, oh,
	str	w0, [sp, 1528]	// oh, %sfp
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x3, x3, x2	// ivtmp.4430, ivtmp.4430, IW
	ldr	w2, [sp, 1648]	//, %sfp
	cmp	w2, w0	// OH, oh
	bne	.L701		//,
	ldr	w0, [sp, 1672]	//, %sfp
	mov	x2, x30	// _1426, _1426
	mov	w7, w9	// oc0, oc0
	mov	w30, w27	// KW, KW
	mov	x12, x1	// _10463, _10463
	ldr	w3, [sp, 1664]	//, %sfp
	mov	x9, x18	// _5052, _5052
	mov	x1, x6	// _8541, _8541
	mov	x27, x2	// _1426, _1426
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	x5, x5, x18	// ivtmp.4434, ivtmp.4434, _5052
	ldr	x26, [sp, 1520]	// _2405, %sfp
	add	x21, x21, x6	// ivtmp.4435, ivtmp.4435, _8541
	add	x19, x19, x14	// ivtmp.4436, ivtmp.4436, _5077
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w0, w0, 1	// b, b,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w3, w0	// _14, b
	bne	.L745		//,
	b	.L1185		//
	.p2align 2,,3
.L911:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w0, 0	// niters_vector_mult_vf.2398,
	b	.L726		//
.L727:
	ldr	x9, [sp, 240]	// vectp.2457, %sfp
	mov	v19.16b, v31.16b	// vect_acc_0_10_2975.2410, vect_acc_0_11_1188.2411
	mov	v18.16b, v31.16b	// vect_acc_0_9_320.2409, vect_acc_0_11_1188.2411
	mov	w25, 0	// _4287,
	mov	x15, x1	// vectp.2422, ivtmp.4217
	ldp	x11, x10, [sp, 216]	// vectp.2445, vectp.2451,
	mov	v17.16b, v31.16b	// vect_acc_0_8_1780.2408, vect_acc_0_11_1188.2411
	mov	v16.16b, v31.16b	// vect_acc_0_7_52.2407, vect_acc_0_11_1188.2411
	mov	x14, x18	// vectp.2428, ivtmp.4219
	mov	x13, x17	// vectp.2434, ivtmp.4220
	mov	v15.16b, v31.16b	// vect_acc_0_6_1419.2406, vect_acc_0_11_1188.2411
	mov	v14.16b, v31.16b	// vect_acc_0_5_1350.2405, vect_acc_0_11_1188.2411
	mov	x12, x16	// vectp.2440, ivtmp.4221
	mov	v9.16b, v31.16b	// vect_acc_0_3_1360.2403, vect_acc_0_11_1188.2411
	mov	v8.16b, v31.16b	// vect_acc_0_2_1342.2402, vect_acc_0_11_1188.2411
	mov	v7.16b, v31.16b	// vect_acc_0_1_1373.2401, vect_acc_0_11_1188.2411
	mov	v6.16b, v31.16b	// vect_acc_0_0_1378.2400, vect_acc_0_11_1188.2411
	str	q31, [sp, 256]	// vect_acc_0_11_1188.2411, %sfp
	b	.L729		//
.L735:
	cmp	w13, 0	// OW,
	ble	.L736		//,
	cmp	w13, 1	// OW,
	beq	.L1215		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s25, s12, [x2]	// acc$0$0, acc$0$1,* ivtmp.4273
	cmp	w13, 2	// OW,
	beq	.L736		//,
	str	s26, [x2, 8]	// bv, MEM[(float *)_3089 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 3	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s11, [x2, 12]	// acc$0$3, MEM[(float *)_3089 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 4	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s10, [x2, 16]	// acc$0$4, MEM[(float *)_3089 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 5	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s5, [x2, 20]	// acc$0$5, MEM[(float *)_3089 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 6	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s4, [x2, 24]	// acc$0$6, MEM[(float *)_3089 + 24B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 7	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s3, [x2, 28]	// acc$0$7, MEM[(float *)_3089 + 28B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 8	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s2, [x2, 32]	// acc$0$8, MEM[(float *)_3089 + 32B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 9	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s1, [x2, 36]	// acc$0$9, MEM[(float *)_3089 + 36B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 10	// OW,
	beq	.L736		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s0, [x2, 40]	// acc$0$10, MEM[(float *)_3089 + 40B]
	b	.L736		//
.L724:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	fmov	s13, s26	// acc$0$11, bv
	fmov	s0, s26	// acc$0$10, bv
	fmov	s1, s26	// acc$0$9, bv
	fmov	s2, s26	// acc$0$8, bv
	fmov	s3, s26	// acc$0$7, bv
	fmov	s4, s26	// acc$0$6, bv
	fmov	s5, s26	// acc$0$5, bv
	fmov	s10, s26	// acc$0$4, bv
	fmov	s11, s26	// acc$0$3, bv
	fmov	s12, s26	// acc$0$1, bv
	fmov	s25, s26	// acc$0$0, bv
	b	.L734		//
.L897:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	mov	x1, 0	// padded$_M_finish,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:99: 	: _M_start(), _M_finish(), _M_end_of_storage()
	mov	x3, 0	// _143,
	b	.L597		//
	.p2align 2,,3
.L898:
	.cfi_offset 72, -1968
	.cfi_offset 73, -1960
	.cfi_offset 74, -1952
	.cfi_offset 75, -1944
	.cfi_offset 76, -1936
	.cfi_offset 77, -1928
	.cfi_offset 78, -1920
	.cfi_offset 79, -1912
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w2, 0	// _2661,
	b	.L619		//
	.p2align 2,,3
.L618:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w2, [sp, 944]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x12, x12, x18	// ivtmp.3833, ivtmp.3833, _11213
	add	x11, x11, x18	// ivtmp.3835, ivtmp.3835, _11213
	add	x10, x10, x18	// ivtmp.3837, ivtmp.3837, _11213
	add	x9, x9, x18	// ivtmp.3839, ivtmp.3839, _11213
	ldr	x7, [sp, 928]	// ivtmp.3849, %sfp
	add	x8, x8, x18	// ivtmp.3841, ivtmp.3841, _11213
	add	x24, x24, x18	// ivtmp.3843, ivtmp.3843, _11213
	add	x5, x5, x18	// ivtmp.3847, ivtmp.3847, _11213
	add	x20, x20, x18	// ivtmp.3851, ivtmp.3851, _11213
	add	x19, x19, x18	// ivtmp.3852, ivtmp.3852, _11213
	add	x17, x17, x18	// ivtmp.3853, ivtmp.3853, _11213
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w6, w2, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x2, [sp, 912]	// ivtmp.3845, %sfp
	add	x16, x16, x18	// ivtmp.3854, ivtmp.3854, _11213
	add	x15, x15, x18	// ivtmp.3855, ivtmp.3855, _11213
	add	x14, x14, x18	// ivtmp.3856, ivtmp.3856, _11213
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	w6, [sp, 944]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x13, x13, x18	// ivtmp.3857, ivtmp.3857, _11213
	add	x23, x23, x18	// ivtmp.3858, ivtmp.3858, _11213
	add	x2, x2, x18	// ivtmp.3845, ivtmp.3845, _11213
	str	x2, [sp, 912]	// ivtmp.3845, %sfp
	ldr	x2, [sp, 192]	// IW, %sfp
	add	x21, x21, x2	// ivtmp.3848, ivtmp.3848, IW
	ldr	x2, [sp, 1152]	// _2469, %sfp
	add	x7, x7, x2	// ivtmp.3849, ivtmp.3849, _2469
	add	x4, x4, x2	// ivtmp.3859, ivtmp.3859, _2469
	add	x3, x3, x2	// ivtmp.3861, ivtmp.3861, _2469
	ldr	w2, [sp, 176]	//, %sfp
	str	x7, [sp, 928]	// ivtmp.3849, %sfp
	cmp	w2, w6	// KH, kh
	bne	.L623		//,
.L617:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w2, [sp, 1136]	//, %sfp
	add	w3, w2, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x2, [sp, 1424]	// _9386, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	w3, [sp, 1136]	// ic, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x1, x1, x2	// ivtmp.3872, ivtmp.3872, _9386
	add	x25, x25, x2	// ivtmp.3878, ivtmp.3878, _9386
	add	x26, x26, x2	// ivtmp.3880, ivtmp.3880, _9386
	ldr	x2, [sp, 1072]	// _9385, %sfp
	add	x0, x0, x2	// ivtmp.3888, ivtmp.3888, _9385
	ldr	w2, [sp, 168]	//, %sfp
	cmp	w2, w3	// IC, ic
	bne	.L624		//,
	add	x0, sp, 1552	//,,
	add	x1, sp, 1584	//,,
	ldr	w7, [sp, 1544]	//, %sfp
	add	x3, sp, 1616	//,,
	add	x4, sp, 1664	//,,
	ldp	x17, x8, [x0]	// _196, ivtmp.3923,
	ldp	x2, x22, [x0, 16]	// _2098, _2934,
	ldp	x12, x23, [x1]	// _4449, _4464,
	ldp	x19, x9, [x1, 16]	// _4482, _4964,
	ldp	x11, x24, [x3]	// _5007, _5022,
	ldp	x20, x15, [x3, 32]	// _5031, ivtmp.3935,
	ldp	x10, x6, [x4]	// _5631, ivtmp.3912,
	ldp	x13, x16, [x4, 16]	// _9269, ivtmp.3940,
.L635:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w7, 0	// OW,
	ble	.L626		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [sp, 416]	// bv, %sfp
	ldr	x0, [sp, 880]	// ivtmp.3921, %sfp
	str	s31, [x0]	// bv, MEM[(float *)_5598]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w7, 1	// OW,
	beq	.L627		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [sp, 608]	// acc$0$1, %sfp
	str	s31, [x0, 4]	// acc$0$1, MEM[(float *)_5598 + 4B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w7, 2	// OW,
	bne	.L628		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	w3, [sp, 304]	// acc$1$0, %sfp
	ldr	w4, [sp, 320]	// acc$1$1, %sfp
	ldr	x1, [sp, 864]	// ivtmp.3914, %sfp
	stp	w3, w4, [x1]	// acc$1$0, acc$1$1,* ivtmp.3914
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	str	s31, [x0, x19]	// acc$2$0, MEM[(float *)_5598 + _4482 * 1]
	ldr	s31, [sp, 432]	// acc$2$1, %sfp
	str	s31, [x0, x23]	// acc$2$1, MEM[(float *)_5598 + _4464 * 1]
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [x1, x19]	// acc$3$0, MEM[(float *)_4500 + _4482 * 1]
	ldr	s31, [sp, 352]	// acc$3$1, %sfp
	str	s31, [x1, x23]	// acc$3$1, MEM[(float *)_4500 + _4464 * 1]
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [x0, x20]	// acc$4$0, MEM[(float *)_5598 + _5031 * 1]
	ldr	s31, [sp, 336]	// acc$4$1, %sfp
	str	s31, [x0, x24]	// acc$4$1, MEM[(float *)_5598 + _5022 * 1]
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [x1, x20]	// acc$5$0, MEM[(float *)_4500 + _5031 * 1]
	ldr	s31, [sp, 400]	// acc$5$1, %sfp
	str	s31, [x1, x24]	// acc$5$1, MEM[(float *)_4500 + _5022 * 1]
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	str	s31, [x0, x9]	// acc$6$0, MEM[(float *)_5598 + _4964 * 1]
	ldr	s31, [sp, 384]	// acc$6$1, %sfp
	str	s31, [x0, x22]	// acc$6$1, MEM[(float *)_5598 + _2934 * 1]
	ldr	s31, [sp, 216]	// acc$7$0, %sfp
	str	s31, [x1, x9]	// acc$7$0, MEM[(float *)_4500 + _4964 * 1]
	ldr	s31, [sp, 368]	// acc$7$1, %sfp
	str	s31, [x1, x22]	// acc$7$1, MEM[(float *)_4500 + _2934 * 1]
.L626:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x0, [sp, 864]	// ivtmp.3914, %sfp
	add	x6, x6, 32	// ivtmp.3912, ivtmp.3912,
	add	x0, x0, x2	// ivtmp.3914, ivtmp.3914, _2098
	str	x0, [sp, 864]	// ivtmp.3914, %sfp
	ldr	x0, [sp, 880]	// ivtmp.3921, %sfp
	add	x0, x0, x2	// ivtmp.3921, ivtmp.3921, _2098
	str	x0, [sp, 880]	// ivtmp.3921, %sfp
	ldr	x0, [sp, 1216]	// _8538, %sfp
	add	x8, x8, x0	// ivtmp.3923, ivtmp.3923, _8538
	ldr	x0, [sp, 1168]	// _4501, %sfp
	cmp	x0, x6	// _4501, ivtmp.3912
	bne	.L631		//,
	ldr	x0, [sp, 1536]	// ivtmp.3929, %sfp
	mov	x26, x30	// _9558, _9558
	ldr	x30, [sp, 1024]	// in_ptr, %sfp
	ldr	w21, [sp, 1040]	//, %sfp
	ldr	w2, [sp, 1528]	//, %sfp
.L654:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w1, [sp, 164]	//, %sfp
	ldr	w3, [sp, 1264]	//, %sfp
	cmp	w1, w3	// OC, oc0
	ble	.L652		//,
	ldr	x1, [sp, 1408]	// _11308, %sfp
	mov	x25, x23	// _4464, _4464
	mov	x5, x11	// _5007, _5007
	ptrue	p5.b, all	// tmp4135
	mov	x23, x19	// _4482, _4482
	str	x16, [sp, 288]	// ivtmp.3940, %sfp
	and	w8, w21, -8	// niters_vector_mult_vf.1795, KW,
	ldr	x19, [sp, 192]	// IW, %sfp
	str	x18, [sp, 304]	// _11213, %sfp
	ldr	x14, [sp, 1360]	// _9388, %sfp
	add	x1, x0, x1	// _11303, ivtmp.3929, _11308
	str	w2, [sp, 240]	// oh, %sfp
	mov	x2, x0	// ivtmp.3929, ivtmp.3929
	ldr	x4, [sp, 1376]	// ivtmp.3778, %sfp
	add	x1, x16, x1, lsl 2	// ivtmp.3782, ivtmp.3940, _11303,
	mov	x0, x13	// _9269, _9269
	str	x22, [sp, 256]	// _2934, %sfp
	mov	x22, x9	// _4964, _4964
	ldr	x16, [sp, 1152]	// _2469, %sfp
	str	x12, [sp, 272]	// _4449, %sfp
	ldr	x6, [sp, 1392]	// ivtmp.3783, %sfp
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	ldrsw	x3, [sp, 1232]	// _9599, %sfp
	ldr	w11, [sp, 176]	//, %sfp
	ldr	w18, [sp, 1200]	//, %sfp
	str	x3, [sp, 224]	// _9599, %sfp
.L651:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	x3, [sp, 208]	// _62, %sfp
	ldr	s31, [x3, x4, lsl 2]	//, MEM[(const float *)_62 + ivtmp.3778_1243 * 4]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	w3, [sp, 168]	//, %sfp
	cmp	w3, 0	// IC,
	ble	.L636		//,
	ldr	x3, [sp, 896]	// ivtmp.3941, %sfp
	add	x9, x15, x3	// ivtmp.3772, ivtmp.3935, ivtmp.3941
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	cmp	w11, 0	// KH,
	ble	.L636		//,
	fmov	s30, s31	//,
	fmov	s29, s31	//,
	mov	x13, x6	// ivtmp.3771, ivtmp.3783
	mov	w12, 0	// ic,
	str	x17, [sp, 336]	// _196, %sfp
	fmov	s28, s31	//,
	mov	x17, x20	// _5031, _5031
	mov	x20, x25	// _4464, _4464
	str	w7, [sp, 320]	// OW, %sfp
	mov	x25, x23	// _4482, _4482
	mov	x23, x5	// _5007, _5007
	str	x4, [sp, 352]	// ivtmp.3778, %sfp
	.p2align 5,,15
.L645:
	add	x3, x30, x9, lsl 2	// ivtmp.3758, in_ptr, ivtmp.3772,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w4, 0	// kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	x7, x9	// ivtmp.3764, ivtmp.3772
	mov	x5, x13	// ivtmp.3763, ivtmp.3771
.L644:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w21, 0	// KW,
	bgt	.L1216		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w4, w4, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x3, x3, x16	// ivtmp.3758, ivtmp.3758, _2469
	add	x5, x5, x14	// ivtmp.3763, ivtmp.3763, _9388
	add	x7, x7, x19	// ivtmp.3764, ivtmp.3764, IW
	cmp	w11, w4	// KH, kh
	bne	.L644		//,
	.p2align 5,,15
.L643:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	ldr	x3, [sp, 224]	// _9599, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w12, w12, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x13, x13, x3	// ivtmp.3771, ivtmp.3771, _9599
	ldr	x3, [sp, 1072]	// _9385, %sfp
	add	x9, x9, x3	// ivtmp.3772, ivtmp.3772, _9385
	ldr	w3, [sp, 168]	//, %sfp
	cmp	w3, w12	// IC, ic
	bne	.L645		//,
	ldr	x4, [sp, 352]	// ivtmp.3778, %sfp
	mov	x5, x23	// _5007, _5007
	mov	x23, x25	// _4482, _4482
	mov	x25, x20	// _4464, _4464
	mov	x20, x17	// _5031, _5031
	ldr	x17, [sp, 336]	// _196, %sfp
	ldr	w7, [sp, 320]	//, %sfp
.L646:
	cmp	w7, 3	// OW,
	ble	.L647		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s28, s30, [x1]	//,,* ivtmp.3782
	stp	s31, s29, [x1, 8]	//,,
.L648:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	x3, [sp, 1184]	// _7334, %sfp
	add	x4, x4, 1	// ivtmp.3778, ivtmp.3778,
	add	x6, x6, x17	// ivtmp.3783, ivtmp.3783, _196
	add	x1, x1, x3	// ivtmp.3782, ivtmp.3782, _7334
	ldr	w3, [sp, 164]	//, %sfp
	cmp	w3, w4	// OC, ivtmp.3778
	bgt	.L651		//,
	ldr	x12, [sp, 272]	// _4449, %sfp
	mov	x9, x22	// _4964, _4964
	mov	x13, x0	// _9269, _9269
	mov	x0, x2	// ivtmp.3929, ivtmp.3929
	mov	x19, x23	// _4482, _4482
	ldr	x22, [sp, 256]	// _2934, %sfp
	mov	x23, x25	// _4464, _4464
	mov	x11, x5	// _5007, _5007
	ldr	x16, [sp, 288]	// ivtmp.3940, %sfp
	ldr	x18, [sp, 304]	// _11213, %sfp
	ldr	w2, [sp, 240]	//, %sfp
.L652:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w2, w2, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldr	x1, [sp, 200]	// _12516, %sfp
	add	x0, x0, x1	// ivtmp.3929, ivtmp.3929, _12516
	ldr	x1, [sp, 192]	// IW, %sfp
	add	x15, x15, x1	// ivtmp.3935, ivtmp.3935, IW
	ldr	w1, [sp, 1248]	//, %sfp
	cmp	w1, w2	// OH, oh
	bne	.L616		//,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	ldr	x4, [sp, 896]	// ivtmp.3941, %sfp
	mov	w28, w21	// KW, KW
	mov	x11, x12	// _4449, _4449
	mov	x21, x17	// _196, _196
	mov	x27, x18	// _11213, _11213
	ldr	x1, [sp, 1512]	// _9381, %sfp
	mov	x18, x30	// in_ptr, in_ptr
	mov	w13, w7	// OW, OW
	mov	x30, x10	// _5631, _5631
	ldr	w2, [sp, 1504]	//, %sfp
	ldr	x3, [sp, 1520]	// _10973, %sfp
	add	x4, x4, x1	// ivtmp.3941, ivtmp.3941, _9381
	ldr	w0, [sp, 1496]	//, %sfp
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w2, w2, 1	// b, b,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	str	x4, [sp, 896]	// ivtmp.3941, %sfp
	ldr	w12, [sp, 1248]	//, %sfp
	add	x16, x16, x3	// ivtmp.3940, ivtmp.3940, _10973
	ldr	w17, [sp, 1264]	//, %sfp
	cmp	w0, w2	// _12, b
	bne	.L655		//,
	b	.L1185		//
	.p2align 2,,3
.L1216:
	str	x13, [sp, 368]	// ivtmp.3771, %sfp
	str	x20, [sp, 384]	// _4464, %sfp
	str	x25, [sp, 400]	// _4482, %sfp
	str	x22, [sp, 416]	// _4964, %sfp
	str	x23, [sp, 432]	// _5007, %sfp
	str	x24, [sp, 456]	// _5022, %sfp
	.p2align 5,,15
.L642:
	cmp	w18, 6	// _7730,
	bls	.L900		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	movi	v27.4s, 0	//
	add	x25, x27, x5, lsl 2	// vectp.1802, _63, ivtmp.3763,
	add	x22, x3, 12	// vectp.1827, ivtmp.3758,
	mov	x13, 0	// ivtmp.3737,
	add	x24, x3, 4	// vectp.1813, ivtmp.3758,
	add	x23, x3, 8	// vectp.1820, ivtmp.3758,
	mov	x20, 16	// ivtmp.3753,
	str	x22, [sp, 216]	// vectp.1827, %sfp
	mov	v7.16b, v27.16b	//,
	mov	v25.16b, v27.16b	//,
	mov	v6.16b, v27.16b	//,
	mov	v23.16b, v27.16b	//,
	mov	v5.16b, v27.16b	//,
	mov	v21.16b, v27.16b	//,
	mov	v4.16b, v27.16b	//,
	.p2align 5,,15
.L639:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q19, [x25, x13]	//, MEM <const vector(4) float> [(const float *)vectp.1802_8910 + ivtmp.3737_10957 * 1]
	ldr	q18, [x25, x20]	//, MEM <const vector(4) float> [(const float *)vectp.1802_8910 + ivtmp.3753_10945 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x3, x13]	//, MEM <const vector(4) float> [(const float *)vectp.1806_8082 + ivtmp.3737_10957 * 1]
	ldr	q17, [x3, x20]	//, MEM <const vector(4) float> [(const float *)vectp.1806_8082 + ivtmp.3753_10945 * 1]
	ldr	x22, [sp, 216]	// vectp.1827, %sfp
	ldr	q16, [x24, x13]	//, MEM <const vector(4) float> [(const float *)vectp.1813_1090 + ivtmp.3737_10957 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v4.4s, v19.4s, v0.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q1, [x23, x13]	//, MEM <const vector(4) float> [(const float *)vectp.1820_924 + ivtmp.3737_10957 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v21.4s, v18.4s, v17.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q0, [x22, x13]	//, MEM <const vector(4) float> [(const float *)vectp.1827_9533 + ivtmp.3737_10957 * 1]
	add	x13, x13, 32	// ivtmp.3737, ivtmp.3737,
	ldr	q17, [x22, x20]	//, MEM <const vector(4) float> [(const float *)vectp.1827_9533 + ivtmp.3753_10945 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v5.4s, v16.4s, v19.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q3, [x24, x20]	//, MEM <const vector(4) float> [(const float *)vectp.1813_1090 + ivtmp.3753_10945 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v6.4s, v19.4s, v1.4s	//,,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q2, [x23, x20]	//, MEM <const vector(4) float> [(const float *)vectp.1820_924 + ivtmp.3753_10945 * 1]
	add	x20, x20, 32	// ivtmp.3753, ivtmp.3753,
	ldr	x22, [sp, 1440]	// _10942, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v7.4s, v19.4s, v0.4s	//,,
	fmla	v23.4s, v3.4s, v18.4s	//,,
	fmla	v25.4s, v18.4s, v2.4s	//,,
	fmla	v27.4s, v18.4s, v17.4s	//,,
	cmp	x22, x13	// _10942, ivtmp.3737
	bne	.L639		//,
	mov	w13, w8	// niters_vector_mult_vf.1795, niters_vector_mult_vf.1795
	fadd	v7.4s, v7.4s, v27.4s	//,,
	fadd	v6.4s, v25.4s, v6.4s	//,,
	fadd	v5.4s, v5.4s, v23.4s	//,,
	fadd	v4.4s, v4.4s, v21.4s	//,,
	faddp	v7.4s, v7.4s, v7.4s	//,,
	faddp	v6.4s, v6.4s, v6.4s	//,,
	faddp	v5.4s, v5.4s, v5.4s	//,,
	faddp	v4.4s, v4.4s, v4.4s	//,,
	faddp	v7.4s, v7.4s, v7.4s	//,,
	faddp	v6.4s, v6.4s, v6.4s	//,,
	faddp	v5.4s, v5.4s, v5.4s	//,,
	faddp	v4.4s, v4.4s, v4.4s	//,,
	fadd	s29, s29, s7	//,,
	fadd	s31, s31, s6	//,,
	fadd	s30, s30, s5	//,,
	fadd	s28, s28, s4	//,,
	cmp	w21, w8	// KW, niters_vector_mult_vf.1795
	beq	.L640		//,
.L638:
	uxtw	x20, w13	// _8030, niters_vector_mult_vf.1795
	sub	w13, w21, w13	// bnd.1834, KW, niters_vector_mult_vf.1795
	whilelo	p6.s, wzr, w13	// max_mask_7942,, bnd.1834
	add	x22, x7, x20	// _8019, ivtmp.3764, _8030
	cntw	x23		// tmp7736
	whilelo	p7.s, w23, w13	// next_mask_5516, tmp7736, bnd.1834
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z16.s, p6/z, [x30, x22, lsl 2]	//, max_mask_7942,* in_ptr
	lsl	x13, x22, 2	// _8017, _8019,
	add	x20, x5, x20	// _8029, ivtmp.3763, _8030
	add	x22, x30, x22, lsl 2	// vectp.1843, in_ptr, _8019,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ld1w	z3.s, p6/z, [x27, x20, lsl 2]	//, max_mask_7942,* _63
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z16.s, p6/z, z16.s	//, max_mask_7942
	fmul	z16.s, p6/m, z16.s, z3.s	//, max_mask_7942,
	add	x24, x13, 4	// _7997, _8017,
	add	x23, x13, 8	// _7977, _8017,
	add	x20, x27, x20, lsl 2	// vectp.1840, _63, _8029,
	add	x13, x13, 12	// _7961, _8017,
	add	x24, x30, x24	// vectp.1849, in_ptr, _7997
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z26.s, p6/z, [x24]	//, max_mask_7942,* vectp.1849
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z26.s, p6/z, z26.s	//, max_mask_7942
	fmul	z26.s, p6/m, z26.s, z3.s	//, max_mask_7942,
	add	x23, x30, x23	// vectp.1855, in_ptr, _7977
	add	x13, x30, x13	// vectp.1861, in_ptr, _7961
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z24.s, p6/z, [x23]	//, max_mask_7942,* vectp.1855
	ld1w	z22.s, p6/z, [x13]	//, max_mask_7942,* vectp.1861
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z24.s, p6/z, z24.s	//, max_mask_7942
	fmul	z24.s, p6/m, z24.s, z3.s	//, max_mask_7942,
	movprfx	z22.s, p6/z, z22.s	//, max_mask_7942
	fmul	z22.s, p6/m, z22.s, z3.s	//, max_mask_7942,
	b.none	.L641	//,
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ld1w	z20.s, p7/z, [x20, #1, mul vl]	//, next_mask_5516,
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z2.s, p7/z, [x22, #1, mul vl]	//, next_mask_5516,
	ld1w	z1.s, p7/z, [x24, #1, mul vl]	//, next_mask_5516,
	ld1w	z0.s, p7/z, [x23, #1, mul vl]	//, next_mask_5516,
	ld1w	z17.s, p7/z, [x13, #1, mul vl]	//, next_mask_5516,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	z16.s, p7/m, z2.s, z20.s	//, next_mask_5516,,
	fmla	z26.s, p7/m, z1.s, z20.s	//, next_mask_5516,,
	fmla	z24.s, p7/m, z0.s, z20.s	//, next_mask_5516,,
	fmla	z22.s, p7/m, z17.s, z20.s	//, next_mask_5516,,
.L641:
	faddv	s22, p5, z22.s	//, tmp4135,
	faddv	s24, p5, z24.s	//, tmp4135,
	faddv	s26, p5, z26.s	//, tmp4135,
	faddv	s16, p5, z16.s	//, tmp4135,
	fadd	s29, s29, s22	//,,
	fadd	s31, s31, s24	//,,
	fadd	s30, s30, s26	//,,
	fadd	s28, s28, s16	//,,
.L640:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w4, w4, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x3, x3, x16	// ivtmp.3758, ivtmp.3758, _2469
	add	x5, x5, x14	// ivtmp.3763, ivtmp.3763, _9388
	add	x7, x7, x19	// ivtmp.3764, ivtmp.3764, IW
	cmp	w11, w4	// KH, kh
	bne	.L642		//,
	ldr	x13, [sp, 368]	// ivtmp.3771, %sfp
	ldr	x20, [sp, 384]	// _4464, %sfp
	ldr	x25, [sp, 400]	// _4482, %sfp
	ldr	x22, [sp, 416]	// _4964, %sfp
	ldr	x23, [sp, 432]	// _5007, %sfp
	ldr	x24, [sp, 456]	// _5022, %sfp
	b	.L643		//
.L628:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [sp, 640]	// acc$0$2, %sfp
	mov	x1, x0	// ivtmp.3921, ivtmp.3921
	str	s31, [x0, 8]	// acc$0$2, MEM[(float *)_5598 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w7, 3	// OW,
	bne	.L629		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	w3, [sp, 304]	// acc$1$0, %sfp
	ldr	w4, [sp, 320]	// acc$1$1, %sfp
	ldr	x0, [sp, 864]	// ivtmp.3914, %sfp
	stp	w3, w4, [x0]	// acc$1$0, acc$1$1,* ivtmp.3914
	ldr	s31, [sp, 480]	// acc$1$2, %sfp
	str	s31, [x0, 8]	// acc$1$2, MEM[(float *)_2390 + 8B]
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	str	s31, [x1, x19]	// acc$2$0, MEM[(float *)_5598 + _4482 * 1]
	ldr	s31, [sp, 432]	// acc$2$1, %sfp
	str	s31, [x1, x23]	// acc$2$1, MEM[(float *)_5598 + _4464 * 1]
	ldr	s31, [sp, 512]	// acc$2$2, %sfp
	str	s31, [x1, x12]	// acc$2$2, MEM[(float *)_5598 + _4449 * 1]
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [x0, x19]	// acc$3$0, MEM[(float *)_2390 + _4482 * 1]
	ldr	s31, [sp, 352]	// acc$3$1, %sfp
	str	s31, [x0, x23]	// acc$3$1, MEM[(float *)_2390 + _4464 * 1]
	ldr	s31, [sp, 472]	// acc$3$2, %sfp
	str	s31, [x0, x12]	// acc$3$2, MEM[(float *)_2390 + _4449 * 1]
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [x1, x20]	// acc$4$0, MEM[(float *)_5598 + _5031 * 1]
	ldr	s31, [sp, 336]	// acc$4$1, %sfp
	str	s31, [x1, x24]	// acc$4$1, MEM[(float *)_5598 + _5022 * 1]
	ldr	s31, [sp, 496]	// acc$4$2, %sfp
	str	s31, [x1, x11]	// acc$4$2, MEM[(float *)_5598 + _5007 * 1]
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [x0, x20]	// acc$5$0, MEM[(float *)_2390 + _5031 * 1]
	ldr	s31, [sp, 400]	// acc$5$1, %sfp
	str	s31, [x0, x24]	// acc$5$1, MEM[(float *)_2390 + _5022 * 1]
	ldr	s31, [sp, 504]	// acc$5$2, %sfp
	str	s31, [x0, x11]	// acc$5$2, MEM[(float *)_2390 + _5007 * 1]
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	str	s31, [x1, x9]	// acc$6$0, MEM[(float *)_5598 + _4964 * 1]
	ldr	s31, [sp, 384]	// acc$6$1, %sfp
	str	s31, [x1, x22]	// acc$6$1, MEM[(float *)_5598 + _2934 * 1]
	ldr	s31, [sp, 464]	// acc$6$2, %sfp
	str	s31, [x1, x10]	// acc$6$2, MEM[(float *)_5598 + _5631 * 1]
	ldr	s31, [sp, 216]	// acc$7$0, %sfp
	str	s31, [x0, x9]	// acc$7$0, MEM[(float *)_2390 + _4964 * 1]
	ldr	s31, [sp, 368]	// acc$7$1, %sfp
	str	s31, [x0, x22]	// acc$7$1, MEM[(float *)_2390 + _2934 * 1]
	ldr	s31, [sp, 456]	// acc$7$2, %sfp
	str	s31, [x0, x10]	// acc$7$2, MEM[(float *)_2390 + _5631 * 1]
	b	.L626		//
.L629:
	ldr	s31, [sp, 1456]	// acc$0$3, %sfp
	ldr	w3, [sp, 304]	// acc$1$0, %sfp
	ldr	w4, [sp, 320]	// acc$1$1, %sfp
	ldr	x0, [sp, 864]	// ivtmp.3914, %sfp
	str	s31, [x1, 12]	// acc$0$3, MEM[(float *)_5598 + 12B]
	stp	w3, w4, [x0]	// acc$1$0, acc$1$1,* ivtmp.3914
	ldr	w4, [sp, 480]	// acc$1$2, %sfp
	ldr	w5, [sp, 592]	// acc$1$3, %sfp
	stp	w4, w5, [x0, 8]	// acc$1$2, acc$1$3,
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	ldr	x3, [sp, 1296]	// _4446, %sfp
	str	s31, [x1, x19]	// acc$2$0, MEM[(float *)_5598 + _4482 * 1]
	ldr	s31, [sp, 432]	// acc$2$1, %sfp
	str	s31, [x1, x23]	// acc$2$1, MEM[(float *)_5598 + _4464 * 1]
	ldr	s31, [sp, 512]	// acc$2$2, %sfp
	str	s31, [x1, x12]	// acc$2$2, MEM[(float *)_5598 + _4449 * 1]
	ldr	s31, [sp, 576]	// acc$2$3, %sfp
	str	s31, [x1, x3]	// acc$2$3, MEM[(float *)_5598 + _4446 * 1]
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [x0, x19]	// acc$3$0, MEM[(float *)_7166 + _4482 * 1]
	ldr	s31, [sp, 352]	// acc$3$1, %sfp
	str	s31, [x0, x23]	// acc$3$1, MEM[(float *)_7166 + _4464 * 1]
	ldr	s31, [sp, 472]	// acc$3$2, %sfp
	str	s31, [x0, x12]	// acc$3$2, MEM[(float *)_7166 + _4449 * 1]
	ldr	s31, [sp, 560]	// acc$3$3, %sfp
	str	s31, [x0, x3]	// acc$3$3, MEM[(float *)_7166 + _4446 * 1]
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [x1, x20]	// acc$4$0, MEM[(float *)_5598 + _5031 * 1]
	ldr	s31, [sp, 336]	// acc$4$1, %sfp
	str	s31, [x1, x24]	// acc$4$1, MEM[(float *)_5598 + _5022 * 1]
	ldr	s31, [sp, 496]	// acc$4$2, %sfp
	str	s31, [x1, x11]	// acc$4$2, MEM[(float *)_5598 + _5007 * 1]
	ldr	x3, [sp, 1312]	// _5004, %sfp
	ldr	s31, [sp, 552]	// acc$4$3, %sfp
	str	s31, [x1, x3]	// acc$4$3, MEM[(float *)_5598 + _5004 * 1]
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [x0, x20]	// acc$5$0, MEM[(float *)_7166 + _5031 * 1]
	ldr	s31, [sp, 400]	// acc$5$1, %sfp
	str	s31, [x0, x24]	// acc$5$1, MEM[(float *)_7166 + _5022 * 1]
	ldr	s31, [sp, 504]	// acc$5$2, %sfp
	str	s31, [x0, x11]	// acc$5$2, MEM[(float *)_7166 + _5007 * 1]
	ldr	s31, [sp, 544]	// acc$5$3, %sfp
	str	s31, [x0, x3]	// acc$5$3, MEM[(float *)_7166 + _5004 * 1]
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	ldr	x3, [sp, 1344]	// _5628, %sfp
	str	s31, [x1, x9]	// acc$6$0, MEM[(float *)_5598 + _4964 * 1]
	ldr	s31, [sp, 384]	// acc$6$1, %sfp
	str	s31, [x1, x22]	// acc$6$1, MEM[(float *)_5598 + _2934 * 1]
	ldr	s31, [sp, 464]	// acc$6$2, %sfp
	str	s31, [x1, x10]	// acc$6$2, MEM[(float *)_5598 + _5631 * 1]
	ldr	s31, [sp, 624]	// acc$6$3, %sfp
	str	s31, [x1, x3]	// acc$6$3, MEM[(float *)_5598 + _5628 * 1]
	ldr	s31, [sp, 216]	// acc$7$0, %sfp
	str	s31, [x0, x9]	// acc$7$0, MEM[(float *)_7166 + _4964 * 1]
	ldr	s31, [sp, 368]	// acc$7$1, %sfp
	str	s31, [x0, x22]	// acc$7$1, MEM[(float *)_7166 + _2934 * 1]
	ldr	s31, [sp, 456]	// acc$7$2, %sfp
	str	s31, [x0, x10]	// acc$7$2, MEM[(float *)_7166 + _5631 * 1]
	ldr	s31, [sp, 528]	// acc$7$3, %sfp
	str	s31, [x0, x3]	// acc$7$3, MEM[(float *)_7166 + _5628 * 1]
	b	.L626		//
.L647:
	cmp	w7, 0	// OW,
	ble	.L648		//,
	cmp	w7, 1	// OW,
	beq	.L1217		//,
	stp	s28, s30, [x1]	//,,* ivtmp.3782
	cmp	w7, 2	// OW,
	beq	.L648		//,
	str	s31, [x1, 8]	//, MEM[(float *)_11284 + 8B]
	b	.L648		//
	.p2align 2,,3
.L900:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w13, 0	// niters_vector_mult_vf.1795,
	b	.L638		//
.L636:
	fmov	s29, s31	//,
	fmov	s30, s31	//,
	fmov	s28, s31	//,
	b	.L646		//
.L1188:
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	str	w3, [sp, 368]	// acc$7$0, %sfp
	str	w3, [sp, 456]	// acc$7$0, %sfp
	str	s31, [sp, 384]	// acc$6$0, %sfp
	str	s31, [sp, 464]	// acc$6$0, %sfp
	str	s31, [sp, 624]	// acc$6$0, %sfp
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [sp, 400]	// acc$5$0, %sfp
	str	s31, [sp, 504]	// acc$5$0, %sfp
	str	s31, [sp, 544]	// acc$5$0, %sfp
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [sp, 336]	// acc$4$0, %sfp
	str	s31, [sp, 496]	// acc$4$0, %sfp
	str	s31, [sp, 552]	// acc$4$0, %sfp
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [sp, 352]	// acc$3$0, %sfp
	str	s31, [sp, 472]	// acc$3$0, %sfp
	str	s31, [sp, 560]	// acc$3$0, %sfp
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	str	s31, [sp, 432]	// acc$2$0, %sfp
	str	s31, [sp, 512]	// acc$2$0, %sfp
	str	s31, [sp, 576]	// acc$2$0, %sfp
	ldr	s31, [sp, 304]	// acc$1$0, %sfp
	str	s31, [sp, 320]	// acc$1$0, %sfp
	str	s31, [sp, 480]	// acc$1$0, %sfp
	str	s31, [sp, 592]	// acc$1$0, %sfp
	ldr	s31, [sp, 416]	// bv, %sfp
	str	s31, [sp, 608]	// bv, %sfp
	str	s31, [sp, 640]	// bv, %sfp
	str	s31, [sp, 1456]	// bv, %sfp
	b	.L635		//
.L1217:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s28, [x1]	//, MEM[(float *)_11282]
	b	.L648		//
.L606:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	ldr	w0, [sp, 176]	//, %sfp
// src/cpp/cnn_internals.cpp:373:     const int in_size        = input_h * input_w;
	mul	w10, w24, w26	// in_size, IH, IW
// src/cpp/cnn_internals.cpp:375:     const int out_size       = output_h * output_w;
	mul	w7, w12, w13	// out_size, OH, OW
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	ldp	w3, w17, [sp, 164]	//,,
// src/cpp/cnn_internals.cpp:468:         case 8:  DISPATCH(8,  6)    // 12
	ldr	w1, [x27, 24]	//, input_30(D)->batches
// src/cpp/cnn_internals.cpp:377:     const int weight_size    = kernel_h * kernel_w;
	mul	w2, w0, w18	// weight_size, KH, KW
// src/cpp/cnn_internals.cpp:376:     const int out_ch_size    = out_channels * out_size;
	mul	w4, w3, w7	// out_ch_size, OC, out_size
// src/cpp/cnn_internals.cpp:374:     const int in_ch_size     = in_channels * in_size;
	mul	w0, w17, w10	// in_ch_size, IC, in_size
// src/cpp/cnn_internals.cpp:378:     const int weight_ch_size = in_channels * weight_size;
	mul	w5, w17, w2	// weight_ch_size, IC, weight_size
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	cmp	w1, 0	// _13,
	ble	.L614		//,
// src/cpp/cnn_internals.cpp:381:         const float* __restrict in_b  = input_ptr + (std::size_t)b * in_ch_size;
	sxtw	x3, w0	// _8995, in_ch_size
// src/cpp/cnn_internals.cpp:328:     const float* __restrict w_oc = weight_ptr + (std::size_t)oc0 * weight_ch_size;
	sxtw	x14, w5	// _363, weight_ch_size
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	sbfiz	x23, x5, 1, 32	// _2172, weight_ch_size,,
	sbfiz	x22, x5, 2, 32	// _2196, weight_ch_size,,
	cmp	w12, 0	// OH,
	ble	.L614		//,
	mov	x6, x25	// ivtmp.4163, out_b
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	sxtw	x21, w2	// _9000, weight_size
	ptrue	p6.b, all	// tmp4437
	stp	d8, d9, [sp, 96]	//,,
	.cfi_offset 73, -1960
	.cfi_offset 72, -1968
	sbfiz	x25, x2, 2, 32	// _7981, weight_size,,
	ldr	x2, [sp, 448]	// _63, %sfp
	mov	w9, 24	// tmp3061,
	mov	w8, 6	// tmp3062,
	sbfiz	x4, x4, 2, 32	// _8075, out_ch_size,,
	str	x6, [sp, 1616]	// ivtmp.4163, %sfp
	smull	x15, w5, w9	// _10562, weight_ch_size, tmp3061
	lsl	x16, x3, 2	// _3295, _8995,
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	sxtw	x26, w18	// _9282, KW
	stp	d10, d11, [sp, 112]	//,,
	.cfi_offset 75, -1944
	.cfi_offset 74, -1952
	smull	x5, w5, w8	// _10635, weight_ch_size, tmp3062
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	mov	w0, 0	// b,
	lsr	w11, w18, 2	// _7060, KW,
	stp	d12, d13, [sp, 128]	//,,
	.cfi_offset 77, -1928
	.cfi_offset 76, -1936
	smull	x24, w7, w9	// _9223, out_size, tmp3061
	lsl	x11, x11, 4	// _7048, _7060,
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	sxtw	x9, w7	// _8998, out_size
	stp	d14, d15, [sp, 144]	//,,
	.cfi_offset 79, -1912
	.cfi_offset 78, -1920
	add	x30, x22, x2	// _9289, _2196, _63
	ldr	x2, [sp, 192]	// IW, %sfp
	mov	x6, x16	// _3295, _3295
// src/cpp/cnn_internals.cpp:332:         const float* __restrict w_c  = w_oc     + (std::size_t)ic * weight_size;
	mov	x20, x28	// ivtmp.4166, in_ptr
	mov	x16, x30	// _9289, _9289
	str	x5, [sp, 1672]	// _10635, %sfp
	mov	x30, x26	// _9282, _9282
	sbfiz	x5, x7, 2, 32	// _10401, out_size,,
	str	x15, [sp, 1680]	// _10562, %sfp
	mov	x7, x4	// _8075, _8075
	mov	x8, x14	// _363, _363
	str	xzr, [sp, 1472]	//, %sfp
	mov	w4, w0	// b, b
	mov	w15, w18	// KW, KW
	str	x11, [sp, 1544]	// _7048, %sfp
	lsl	x27, x2, 2	// _7078, IW,
	sub	w2, w18, #1	// _6773, KW,
	str	x5, [sp, 1600]	// _10401, %sfp
	mov	w26, w17	// IC, IC
// src/cpp/cnn_internals.cpp:356:                             + (std::size_t)(oc0 + t) * out_size
	str	x9, [sp, 1712]	// _8998, %sfp
	str	w2, [sp, 1664]	// _6773, %sfp
	sxtw	x2, w13	// _12516, OW
	str	x2, [sp, 200]	// _12516, %sfp
	and	w2, w18, -4	// _563, KW,
	str	w2, [sp, 1608]	// _563, %sfp
	and	w2, w18, 3	// _9397, KW,
	str	w2, [sp, 1648]	// _9397, %sfp
.L700:
	ldr	x11, [sp, 208]	// _62, %sfp
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	mov	x5, 0	// ivtmp.4154,
	mov	x19, x16	// _9289, _9289
	str	x24, [sp, 1656]	// _9223, %sfp
	mov	x24, x27	// _7078, _7078
	mov	x0, x5	// ivtmp.4154, ivtmp.4154
	ldr	x27, [sp, 448]	// _63, %sfp
	mov	w5, w10	// in_size, in_size
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	mov	w9, 0	// oh,
	mov	x17, x6	// _3295, _3295
	mov	x14, x3	// _8995, _8995
	str	x23, [sp, 1552]	// _2172, %sfp
	mov	x10, x8	// _363, _363
	mov	w16, w4	// b, b
// src/cpp/cnn_internals.cpp:382:         float*       __restrict out_b = out_ptr   + (std::size_t)b * out_ch_size;
	str	xzr, [sp, 1592]	//, %sfp
	mov	x23, x7	// _8075, _8075
	str	w12, [sp, 1688]	// OH, %sfp
	str	w1, [sp, 1728]	// _13, %sfp
.L656:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	w1, [sp, 164]	//, %sfp
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w4, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	cmp	w1, 5	// OC,
	ble	.L699		//,
	ldr	x2, [sp, 1616]	// ivtmp.4163, %sfp
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x4, w5	// _8999, in_size
	mov	x1, x11	// ivtmp.4141, _62
	add	x7, x20, 28	// _9126, ivtmp.4166,
	mov	x6, x17	// _3295, _3295
	str	w13, [sp, 1560]	// OW, %sfp
	mov	x13, x0	// ivtmp.4154, ivtmp.4154
	str	w15, [sp, 1624]	// KW, %sfp
	mov	w15, w5	// in_size, in_size
	mov	x5, x30	// _9282, _9282
	mov	x30, x28	// in_ptr, in_ptr
	str	x4, [sp, 1720]	// _8999, %sfp
	mov	x28, x11	// _62, _62
// src/cpp/cnn_internals.cpp:385:             int oc0 = 0;                               // stay hot across all oc
	mov	w4, 0	// oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	str	xzr, [sp, 1536]	//, %sfp
	add	x3, x2, x0, lsl 2	// ivtmp.4143, ivtmp.4163, ivtmp.4154,
	mov	x11, x10	// _363, _363
	mov	x2, 0	// ivtmp.4146,
	mov	x10, x1	// ivtmp.4141, ivtmp.4141
	mov	x1, x23	// _8075, _8075
	mov	x23, x24	// _7078, _7078
	mov	w24, w16	// b, b
	mov	w16, w9	// oh, oh
.L676:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldp	w0, w8, [x10]	// acc_I_I_lsm.1482, acc_I_I_lsm.1484,* ivtmp.4141
	str	w0, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	ldr	s31, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	str	w8, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	ldp	w0, w8, [x10, 8]	// acc_I_I_lsm.1486, acc_I_I_lsm.1488,
	dup	v30.4s, v31.s[0]	// tmp3144, acc_I_I_lsm.1482
	ldr	s31, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	str	w8, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	str	w0, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	ldp	w0, w8, [x10, 16]	// acc_I_I_lsm.1490, acc_I_I_lsm.1492,
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q30, [sp, 1840]	// tmp3144, MEM <vector(4) float> [(float *)_520]
	ldr	s29, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	dup	v31.4s, v31.s[0]	// tmp3147, acc_I_I_lsm.1484
	str	q30, [sp, 1856]	// tmp3144, MEM <vector(4) float> [(float *)_520 + 16B]
	fmov	s30, w0	// acc_I_I_lsm.1490, acc_I_I_lsm.1490
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	str	w8, [sp, 168]	// acc_I_I_lsm.1492, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q31, [sp, 1872]	// tmp3147, MEM <vector(4) float> [(float *)_520 + 32B]
	str	q31, [sp, 1888]	// tmp3147, MEM <vector(4) float> [(float *)_520 + 48B]
	dup	v28.4s, v29.s[0]	// tmp3150, acc_I_I_lsm.1486
	fmov	s31, w8	// acc_I_I_lsm.1492, acc_I_I_lsm.1492
	ldr	s29, [sp, 224]	// acc_I_I_lsm.1488, %sfp
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	str	w0, [sp, 216]	// acc_I_I_lsm.1490, %sfp
// src/cpp/cnn_internals.cpp:325:         for (int v = 0; v < OW_PAD; ++v) acc[t][v] = bv;
	str	q28, [sp, 1904]	// tmp3150, MEM <vector(4) float> [(float *)_520 + 64B]
	str	q28, [sp, 1920]	// tmp3150, MEM <vector(4) float> [(float *)_520 + 80B]
	dup	v30.4s, v30.s[0]	// tmp3156, acc_I_I_lsm.1490
	dup	v29.4s, v29.s[0]	// tmp3153, acc_I_I_lsm.1488
	dup	v31.4s, v31.s[0]	// tmp3159, acc_I_I_lsm.1492
	str	q30, [sp, 1968]	// tmp3156, MEM <vector(4) float> [(float *)_520 + 128B]
	str	q30, [sp, 1984]	// tmp3156, MEM <vector(4) float> [(float *)_520 + 144B]
	str	q29, [sp, 1936]	// tmp3153, MEM <vector(4) float> [(float *)_520 + 96B]
	str	q29, [sp, 1952]	// tmp3153, MEM <vector(4) float> [(float *)_520 + 112B]
	str	q31, [sp, 2000]	// tmp3159, MEM <vector(4) float> [(float *)_520 + 160B]
	str	q31, [sp, 2016]	// tmp3159, MEM <vector(4) float> [(float *)_520 + 176B]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w26, 0	// IC,
	ble	.L666		//,
	fmov	s31, w8	// acc_I_I_lsm.1492, acc_I_I_lsm.1492
	add	x18, x19, x2	// ivtmp.4128, _9289, ivtmp.4146
	add	x8, x27, x2	// ivtmp.4126, _63, ivtmp.4146
	fmov	s30, w0	// acc_I_I_lsm.1490, acc_I_I_lsm.1490
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	mov	x12, x2	// ivtmp.4127, ivtmp.4146
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	mov	w17, 0	// ic,
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	ldr	s29, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	str	wzr, [sp, 896]	//, %sfp
	ldr	s28, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	ldr	s27, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	ldr	s26, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	str	s31, [sp, 336]	// acc_I_I_lsm.1492, %sfp
	ldr	x0, [sp, 1536]	// ivtmp.4119, %sfp
	str	s28, [sp, 288]	// acc_I_I_lsm.1486, %sfp
	str	s27, [sp, 304]	// acc_I_I_lsm.1484, %sfp
	str	s28, [sp, 352]	// acc_I_I_lsm.1486, %sfp
	str	s26, [sp, 320]	// acc_I_I_lsm.1482, %sfp
	str	s27, [sp, 368]	// acc_I_I_lsm.1484, %sfp
	str	s29, [sp, 384]	// acc_I_I_lsm.1488, %sfp
	str	s30, [sp, 416]	// acc_I_I_lsm.1490, %sfp
	str	s31, [sp, 456]	// acc_I_I_lsm.1492, %sfp
	str	s27, [sp, 504]	// acc_I_I_lsm.1484, %sfp
	str	s26, [sp, 512]	// acc_I_I_lsm.1482, %sfp
	str	s29, [sp, 552]	// acc_I_I_lsm.1488, %sfp
	str	s30, [sp, 560]	// acc_I_I_lsm.1490, %sfp
	str	s31, [sp, 608]	// acc_I_I_lsm.1492, %sfp
	str	s28, [sp, 640]	// acc_I_I_lsm.1486, %sfp
	str	s29, [sp, 752]	// acc_I_I_lsm.1488, %sfp
	str	s30, [sp, 768]	// acc_I_I_lsm.1490, %sfp
	str	s31, [sp, 784]	// acc_I_I_lsm.1492, %sfp
	str	s26, [sp, 800]	// acc_I_I_lsm.1482, %sfp
	str	s30, [sp, 816]	// acc_I_I_lsm.1490, %sfp
	str	s31, [sp, 832]	// acc_I_I_lsm.1492, %sfp
	str	s26, [sp, 848]	// acc_I_I_lsm.1482, %sfp
	str	s27, [sp, 864]	// acc_I_I_lsm.1484, %sfp
	str	s28, [sp, 880]	// acc_I_I_lsm.1486, %sfp
	str	s29, [sp, 1456]	// acc_I_I_lsm.1488, %sfp
	ldr	x9, [sp, 1592]	// ivtmp.4122, %sfp
	str	s30, [sp, 400]	// acc_I_I_lsm.1490, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x23, [sp, 1696]	// _7078, %sfp
	mov	x23, x1	// _8075, _8075
	str	w16, [sp, 1752]	// oh, %sfp
	mov	x16, x14	// _8995, _8995
	str	w15, [sp, 1760]	// in_size, %sfp
	mov	x15, x10	// ivtmp.4141, ivtmp.4141
	mov	x10, x13	// ivtmp.4154, ivtmp.4154
	str	x11, [sp, 1768]	// _363, %sfp
	mov	x11, x3	// ivtmp.4143, ivtmp.4143
	str	x6, [sp, 1784]	// _3295, %sfp
	mov	x6, x0	// ivtmp.4119, ivtmp.4119
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	str	s29, [sp, 432]	// acc_I_I_lsm.1488, %sfp
	str	s28, [sp, 464]	// acc_I_I_lsm.1486, %sfp
	str	s27, [sp, 472]	// acc_I_I_lsm.1484, %sfp
	str	s31, [sp, 480]	// acc_I_I_lsm.1492, %sfp
	str	s26, [sp, 496]	// acc_I_I_lsm.1482, %sfp
	str	s30, [sp, 528]	// acc_I_I_lsm.1490, %sfp
	str	s29, [sp, 544]	// acc_I_I_lsm.1488, %sfp
	str	s28, [sp, 576]	// acc_I_I_lsm.1486, %sfp
	str	s27, [sp, 592]	// acc_I_I_lsm.1484, %sfp
	str	s26, [sp, 624]	// acc_I_I_lsm.1482, %sfp
	str	s31, [sp, 656]	// acc_I_I_lsm.1492, %sfp
	str	s30, [sp, 672]	// acc_I_I_lsm.1490, %sfp
	str	s29, [sp, 688]	// acc_I_I_lsm.1488, %sfp
	str	s28, [sp, 704]	// acc_I_I_lsm.1486, %sfp
	str	s27, [sp, 720]	// acc_I_I_lsm.1484, %sfp
	str	s26, [sp, 736]	// acc_I_I_lsm.1482, %sfp
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	str	x20, [sp, 1568]	// ivtmp.4166, %sfp
	str	x22, [sp, 1576]	// _2196, %sfp
	str	x5, [sp, 1704]	// _9282, %sfp
	str	x28, [sp, 1736]	// _62, %sfp
	str	w24, [sp, 1744]	// b, %sfp
	str	w4, [sp, 1776]	// oc0, %sfp
	str	x2, [sp, 1792]	// ivtmp.4146, %sfp
	.p2align 5,,15
.L664:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w0, [sp, 176]	//, %sfp
	cmp	w0, 0	// KH,
	ble	.L657		//,
	add	x0, x7, x9, lsl 2	// ivtmp.4094, _9126, ivtmp.4122,
	mov	w24, w26	// IC, IC
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	mov	x3, x6	// ivtmp.4081, ivtmp.4119
	str	x9, [sp, 1408]	// ivtmp.4122, %sfp
	sub	x14, x8, x12	// _9344, ivtmp.4126, ivtmp.4127
	sub	x13, x18, x12	// _3217, ivtmp.4128, ivtmp.4127
	str	x12, [sp, 1424]	// ivtmp.4127, %sfp
	mov	w26, w17	// ic, ic
	mov	x28, x8	// ivtmp.4126, ivtmp.4126
	str	x18, [sp, 1440]	// ivtmp.4128, %sfp
	str	x0, [sp, 1392]	// ivtmp.4094, %sfp
	ldr	x0, [sp, 1552]	// _2172, %sfp
	str	x6, [sp, 1464]	// ivtmp.4119, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	wzr, [sp, 1488]	//, %sfp
	add	x5, x0, x6	// ivtmp.4085, _2172, ivtmp.4119
	ldr	x0, [sp, 1576]	// _2196, %sfp
	add	x4, x0, x6	// ivtmp.4089, _2196, ivtmp.4119
	ldr	x0, [sp, 1568]	// ivtmp.4166, %sfp
	add	x2, x0, x9, lsl 2	// ivtmp.4102, ivtmp.4166, ivtmp.4122,
	mov	x0, x9	// ivtmp.4093, ivtmp.4093
	.p2align 5,,15
.L663:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w1, [sp, 1624]	//, %sfp
	cmp	w1, 0	// KW,
	ble	.L658		//,
	ldr	w1, [sp, 1664]	//, %sfp
	cmp	w1, 3	// _6773,
	bls	.L901		//,
	add	x1, x14, x3, lsl 2	// vectp.2211, _9344, ivtmp.4081,
	add	x8, x2, 20	// vectp.2334, ivtmp.4102,
	movi	v31.4s, 0	// vect_acc_I_I_lsm.1576_4128.2209
	ldr	q21, [x2]	// vectp.2312__lsm0.3591, MEM <const vector(4) float> [(const float *)vectp.2229_6615]
	lsl	x17, x3, 2	// _3614, ivtmp.4081,
	add	x22, x14, x5, lsl 2	// vectp.2217, _9344, ivtmp.4085,
	lsl	x20, x5, 2	// _9210, ivtmp.4085,
	lsl	x6, x4, 2	// _8079, ivtmp.4089,
	str	x8, [sp, 1496]	// vectp.2334, %sfp
	add	x8, x13, x5, lsl 2	// vectp.2220, _3217, ivtmp.4085,
	add	x18, x2, 24	// vectp.2355, ivtmp.4102,
	add	x12, x2, 28	// vectp.2376, ivtmp.4102,
	str	x1, [sp, 1528]	// vectp.2211, %sfp
	add	x1, x13, x3, lsl 2	// vectp.2214, _3217, ivtmp.4081,
	ldr	q22, [x2, 4]	// vectp.2333__lsm0.3590, MEM <const vector(4) float> [(const float *)vectp.2229_6615 + 4B]
	mov	v14.16b, v31.16b	// vect_acc_I_I_lsm.1546_3550.2194, vect_acc_I_I_lsm.1576_4128.2209
	mov	v15.16b, v31.16b	// vect_acc_I_I_lsm.1544_2374.2193, vect_acc_I_I_lsm.1576_4128.2209
	add	x9, x14, x4, lsl 2	// vectp.2223, _9344, ivtmp.4089,
	str	q31, [sp, 1024]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	mov	v16.16b, v31.16b	// vect_acc_I_I_lsm.1542_4554.2192, vect_acc_I_I_lsm.1576_4128.2209
	mov	v13.16b, v31.16b	// vect_acc_I_I_lsm.1540_5105.2191, vect_acc_I_I_lsm.1576_4128.2209
	str	x1, [sp, 1520]	// vectp.2214, %sfp
	add	x1, x2, 16	// vectp.2313, ivtmp.4102,
	mov	v12.16b, v31.16b	// vect_acc_I_I_lsm.1538_4566.2190, vect_acc_I_I_lsm.1576_4128.2209
	mov	v11.16b, v31.16b	// vect_acc_I_I_lsm.1536_2405.2189, vect_acc_I_I_lsm.1576_4128.2209
	ldr	q23, [x2, 8]	// vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2229_6615 + 8B]
	mov	v10.16b, v31.16b	// vect_acc_I_I_lsm.1534_60.2188, vect_acc_I_I_lsm.1576_4128.2209
	mov	v9.16b, v31.16b	// vect_acc_I_I_lsm.1532_187.2187, vect_acc_I_I_lsm.1576_4128.2209
	str	q31, [sp, 1040]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	mov	v8.16b, v31.16b	// vect_acc_I_I_lsm.1530_245.2186, vect_acc_I_I_lsm.1576_4128.2209
	mov	v7.16b, v31.16b	// vect_acc_I_I_lsm.1528_268.2185, vect_acc_I_I_lsm.1576_4128.2209
	ldr	q24, [x2, 12]	// vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2229_6615 + 12B]
	mov	v6.16b, v31.16b	// vect_acc_I_I_lsm.1526_766.2184, vect_acc_I_I_lsm.1576_4128.2209
	mov	v5.16b, v31.16b	// vect_acc_I_I_lsm.1524_1641.2183, vect_acc_I_I_lsm.1576_4128.2209
	stp	q31, q31, [sp, 896]	// vect_acc_I_I_lsm.1576_4128.2209, vect_acc_I_I_lsm.1576_4128.2209,
	stp	q31, q31, [sp, 928]	// vect_acc_I_I_lsm.1576_4128.2209, vect_acc_I_I_lsm.1576_4128.2209,
	stp	q31, q31, [sp, 960]	// vect_acc_I_I_lsm.1576_4128.2209, vect_acc_I_I_lsm.1576_4128.2209,
	stp	q31, q31, [sp, 992]	// vect_acc_I_I_lsm.1576_4128.2209, vect_acc_I_I_lsm.1576_4128.2209,
	str	q31, [sp, 1056]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	mov	v4.16b, v31.16b	// vect_acc_I_I_lsm.1522_1744.2182, vect_acc_I_I_lsm.1576_4128.2209
	mov	v3.16b, v31.16b	// vect_acc_I_I_lsm.1520_1761.2181, vect_acc_I_I_lsm.1576_4128.2209
	str	q31, [sp, 1072]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	mov	v2.16b, v31.16b	// vect_acc_I_I_lsm.1518_1825.2180, vect_acc_I_I_lsm.1576_4128.2209
	mov	v1.16b, v31.16b	// vect_acc_I_I_lsm.1516_1937.2179, vect_acc_I_I_lsm.1576_4128.2209
	str	q31, [sp, 1088]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	mov	v0.16b, v31.16b	// vect_acc_I_I_lsm.1482_5057.2162, vect_acc_I_I_lsm.1576_4128.2209
	str	q31, [sp, 1104]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1120]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1136]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1152]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1168]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1184]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1200]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1216]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1232]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1248]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1264]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1280]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1296]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1312]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	x1, [sp, 1504]	// vectp.2313, %sfp
	mov	x1, 0	// ivtmp.4049,
	str	x8, [sp, 1512]	// vectp.2220, %sfp
	add	x8, x13, x4, lsl 2	// vectp.2226, _3217, ivtmp.4089,
	str	q31, [sp, 1328]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1344]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1360]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	q31, [sp, 1376]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	str	x0, [sp, 1584]	// ivtmp.4093, %sfp
	b	.L660		//
	.p2align 2,,3
.L902:
	mov	v21.16b, v17.16b	// vectp.2312__lsm0.3591, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1]
	mov	v22.16b, v18.16b	// vectp.2333__lsm0.3590, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1]
	mov	v23.16b, v19.16b	// vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1]
	mov	v24.16b, v20.16b	// vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1]
.L660:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x0, [sp, 1528]	// vectp.2211, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q31, [sp, 1360]	// vect_acc_I_I_lsm.1484_4646.2163, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q27, [x22, x1]	// MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	ldr	q25, [x0, x1]	// MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x0, [sp, 1504]	// vectp.2313, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	q20, [sp, 1184]	// vect_acc_I_I_lsm.1506_3521.2174, %sfp
	fmla	v4.4s, v24.4s, v27.4s	// vect_acc_I_I_lsm.1522_1744.2182, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	ldr	q30, [sp, 1280]	// vect_acc_I_I_lsm.1494_3886.2168, %sfp
	fmla	v0.4s, v25.4s, v21.4s	// vect_acc_I_I_lsm.1482_5057.2162, MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q17, [x0, x1]	// MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x0, [sp, 1520]	// vectp.2214, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v23.4s, v25.4s	// vect_acc_I_I_lsm.1506_3521.2174, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x9, x1]	// MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v25.4s, v22.4s	// vect_acc_I_I_lsm.1494_3886.2168, MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q19, [x18, x1]	// MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q26, [x0, x1]	// MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v2.4s, v24.4s, v25.4s	// vect_acc_I_I_lsm.1518_1825.2180, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x0, [sp, 1512]	// vectp.2220, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q20, [sp, 1184]	// vect_acc_I_I_lsm.1506_3521.2174, %sfp
	fmla	v6.4s, v24.4s, v29.4s	// vect_acc_I_I_lsm.1526_766.2184, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q20, [x12, x1]	// MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v31.4s, v26.4s, v21.4s	// vect_acc_I_I_lsm.1484_4646.2163, MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
	str	q30, [sp, 1280]	// vect_acc_I_I_lsm.1494_3886.2168, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q28, [x0, x1]	// MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x0, [sp, 1496]	// vectp.2334, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v8.4s, v17.4s, v25.4s	// vect_acc_I_I_lsm.1530_245.2186, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q30, [x8, x1]	// MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v10.4s, v17.4s, v27.4s	// vect_acc_I_I_lsm.1534_60.2188, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q18, [x0, x1]	// MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1]
	add	x1, x1, 16	// ivtmp.4049, ivtmp.4049,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	q31, [sp, 1360]	// vect_acc_I_I_lsm.1484_4646.2163, %sfp
	fmla	v12.4s, v17.4s, v29.4s	// vect_acc_I_I_lsm.1538_4566.2190, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
	ldr	q31, [sp, 1264]	// vect_acc_I_I_lsm.1496_3845.2169, %sfp
	fmla	v9.4s, v17.4s, v26.4s	// vect_acc_I_I_lsm.1532_187.2187, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	fmla	v3.4s, v24.4s, v26.4s	// vect_acc_I_I_lsm.1520_1761.2181, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	fmla	v31.4s, v26.4s, v22.4s	// vect_acc_I_I_lsm.1496_3845.2169, MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
	fmla	v11.4s, v17.4s, v28.4s	// vect_acc_I_I_lsm.1536_2405.2189, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	fmla	v5.4s, v24.4s, v28.4s	// vect_acc_I_I_lsm.1524_1641.2183, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1264]	// vect_acc_I_I_lsm.1496_3845.2169, %sfp
	fmla	v16.4s, v18.4s, v25.4s	// vect_acc_I_I_lsm.1542_4554.2192, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
	ldr	q31, [sp, 1168]	// vect_acc_I_I_lsm.1508_2911.2175, %sfp
	fmla	v15.4s, v18.4s, v26.4s	// vect_acc_I_I_lsm.1544_2374.2193, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	fmla	v14.4s, v18.4s, v27.4s	// vect_acc_I_I_lsm.1546_3550.2194, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	fmla	v31.4s, v23.4s, v26.4s	// vect_acc_I_I_lsm.1508_2911.2175, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	fmla	v13.4s, v17.4s, v30.4s	// vect_acc_I_I_lsm.1540_5105.2191, MEM <const vector(4) float> [(const float *)vectp.2313_6464 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	fmla	v1.4s, v23.4s, v30.4s	// vect_acc_I_I_lsm.1516_1937.2179, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1168]	// vect_acc_I_I_lsm.1508_2911.2175, %sfp
	fmla	v7.4s, v24.4s, v30.4s	// vect_acc_I_I_lsm.1528_268.2185, vectp.2375__lsm0.3588, MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	ldr	q31, [sp, 1344]	// vect_acc_I_I_lsm.1486_4562.2164, %sfp
	fmla	v31.4s, v27.4s, v21.4s	// vect_acc_I_I_lsm.1486_4562.2164, MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
	str	q31, [sp, 1344]	// vect_acc_I_I_lsm.1486_4562.2164, %sfp
	ldr	q31, [sp, 1248]	// vect_acc_I_I_lsm.1498_3804.2170, %sfp
	fmla	v31.4s, v27.4s, v22.4s	// vect_acc_I_I_lsm.1498_3804.2170, MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
	str	q31, [sp, 1248]	// vect_acc_I_I_lsm.1498_3804.2170, %sfp
	ldr	q31, [sp, 1152]	// vect_acc_I_I_lsm.1510_2765.2176, %sfp
	fmla	v31.4s, v23.4s, v27.4s	// vect_acc_I_I_lsm.1510_2765.2176, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1152]	// vect_acc_I_I_lsm.1510_2765.2176, %sfp
	ldr	q31, [sp, 1328]	// vect_acc_I_I_lsm.1488_4136.2165, %sfp
	fmla	v31.4s, v28.4s, v21.4s	// vect_acc_I_I_lsm.1488_4136.2165, MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
	str	q31, [sp, 1328]	// vect_acc_I_I_lsm.1488_4136.2165, %sfp
	ldr	q31, [sp, 1232]	// vect_acc_I_I_lsm.1500_3754.2171, %sfp
	fmla	v31.4s, v28.4s, v22.4s	// vect_acc_I_I_lsm.1500_3754.2171, MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
	str	q31, [sp, 1232]	// vect_acc_I_I_lsm.1500_3754.2171, %sfp
	ldr	q31, [sp, 1136]	// vect_acc_I_I_lsm.1512_2413.2177, %sfp
	fmla	v31.4s, v23.4s, v28.4s	// vect_acc_I_I_lsm.1512_2413.2177, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1136]	// vect_acc_I_I_lsm.1512_2413.2177, %sfp
	ldr	q31, [sp, 1312]	// vect_acc_I_I_lsm.1490_4064.2166, %sfp
	fmla	v31.4s, v29.4s, v21.4s	// vect_acc_I_I_lsm.1490_4064.2166, MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
	str	q31, [sp, 1312]	// vect_acc_I_I_lsm.1490_4064.2166, %sfp
	ldr	q31, [sp, 1216]	// vect_acc_I_I_lsm.1502_3690.2172, %sfp
	fmla	v31.4s, v29.4s, v22.4s	// vect_acc_I_I_lsm.1502_3690.2172, MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
	str	q31, [sp, 1216]	// vect_acc_I_I_lsm.1502_3690.2172, %sfp
	ldr	q31, [sp, 1120]	// vect_acc_I_I_lsm.1514_2285.2178, %sfp
	fmla	v31.4s, v23.4s, v29.4s	// vect_acc_I_I_lsm.1514_2285.2178, vectp.2354__lsm0.3589, MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1120]	// vect_acc_I_I_lsm.1514_2285.2178, %sfp
	ldr	q31, [sp, 1296]	// vect_acc_I_I_lsm.1492_3923.2167, %sfp
	fmla	v31.4s, v30.4s, v21.4s	// vect_acc_I_I_lsm.1492_3923.2167, MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1], vectp.2312__lsm0.3591
	str	q31, [sp, 1296]	// vect_acc_I_I_lsm.1492_3923.2167, %sfp
	ldr	q31, [sp, 1200]	// vect_acc_I_I_lsm.1504_3614.2173, %sfp
	fmla	v31.4s, v30.4s, v22.4s	// vect_acc_I_I_lsm.1504_3614.2173, MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1], vectp.2333__lsm0.3590
	str	q31, [sp, 1200]	// vect_acc_I_I_lsm.1504_3614.2173, %sfp
	ldr	q31, [sp, 1104]	// vect_acc_I_I_lsm.1548_3474.2195, %sfp
	fmla	v31.4s, v18.4s, v28.4s	// vect_acc_I_I_lsm.1548_3474.2195, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1104]	// vect_acc_I_I_lsm.1548_3474.2195, %sfp
	ldr	q31, [sp, 1088]	// vect_acc_I_I_lsm.1550_1530.2196, %sfp
	fmla	v31.4s, v18.4s, v29.4s	// vect_acc_I_I_lsm.1550_1530.2196, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1088]	// vect_acc_I_I_lsm.1550_1530.2196, %sfp
	ldr	q31, [sp, 1072]	// vect_acc_I_I_lsm.1552_3089.2197, %sfp
	fmla	v31.4s, v18.4s, v30.4s	// vect_acc_I_I_lsm.1552_3089.2197, MEM <const vector(4) float> [(const float *)vectp.2334_6426 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1072]	// vect_acc_I_I_lsm.1552_3089.2197, %sfp
	ldr	q31, [sp, 1056]	// vect_acc_I_I_lsm.1554_2131.2198, %sfp
	fmla	v31.4s, v19.4s, v25.4s	// vect_acc_I_I_lsm.1554_2131.2198, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1056]	// vect_acc_I_I_lsm.1554_2131.2198, %sfp
	ldr	q31, [sp, 1040]	// vect_acc_I_I_lsm.1556_2142.2199, %sfp
	fmla	v31.4s, v19.4s, v26.4s	// vect_acc_I_I_lsm.1556_2142.2199, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1040]	// vect_acc_I_I_lsm.1556_2142.2199, %sfp
	ldr	q31, [sp, 1024]	// vect_acc_I_I_lsm.1558_356.2200, %sfp
	fmla	v31.4s, v19.4s, v27.4s	// vect_acc_I_I_lsm.1558_356.2200, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1024]	// vect_acc_I_I_lsm.1558_356.2200, %sfp
	ldr	q31, [sp, 1008]	// vect_acc_I_I_lsm.1560_4651.2201, %sfp
	fmla	v31.4s, v19.4s, v28.4s	// vect_acc_I_I_lsm.1560_4651.2201, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1008]	// vect_acc_I_I_lsm.1560_4651.2201, %sfp
	ldr	q31, [sp, 992]	// vect_acc_I_I_lsm.1562_4701.2202, %sfp
	fmla	v31.4s, v19.4s, v29.4s	// vect_acc_I_I_lsm.1562_4701.2202, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 992]	// vect_acc_I_I_lsm.1562_4701.2202, %sfp
	ldr	q31, [sp, 976]	// vect_acc_I_I_lsm.1564_4753.2203, %sfp
	fmla	v31.4s, v19.4s, v30.4s	// vect_acc_I_I_lsm.1564_4753.2203, MEM <const vector(4) float> [(const float *)vectp.2355_6388 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 976]	// vect_acc_I_I_lsm.1564_4753.2203, %sfp
	ldr	q31, [sp, 960]	// vect_acc_I_I_lsm.1566_4824.2204, %sfp
	ldr	x0, [sp, 1544]	// _7048, %sfp
	fmla	v31.4s, v20.4s, v25.4s	// vect_acc_I_I_lsm.1566_4824.2204, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2211_6671 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 960]	// vect_acc_I_I_lsm.1566_4824.2204, %sfp
	ldr	q31, [sp, 944]	// vect_acc_I_I_lsm.1568_4875.2205, %sfp
	fmla	v31.4s, v20.4s, v26.4s	// vect_acc_I_I_lsm.1568_4875.2205, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2214_6664 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 944]	// vect_acc_I_I_lsm.1568_4875.2205, %sfp
	ldr	q31, [sp, 928]	// vect_acc_I_I_lsm.1570_4926.2206, %sfp
	fmla	v31.4s, v20.4s, v27.4s	// vect_acc_I_I_lsm.1570_4926.2206, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2217_6655 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 928]	// vect_acc_I_I_lsm.1570_4926.2206, %sfp
	ldr	q31, [sp, 912]	// vect_acc_I_I_lsm.1572_4056.2207, %sfp
	fmla	v31.4s, v20.4s, v28.4s	// vect_acc_I_I_lsm.1572_4056.2207, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2220_6645 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 912]	// vect_acc_I_I_lsm.1572_4056.2207, %sfp
	ldr	q31, [sp, 896]	// vect_acc_I_I_lsm.1574_4092.2208, %sfp
	fmla	v31.4s, v20.4s, v29.4s	// vect_acc_I_I_lsm.1574_4092.2208, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2223_6635 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 896]	// vect_acc_I_I_lsm.1574_4092.2208, %sfp
	ldr	q31, [sp, 1376]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	fmla	v31.4s, v20.4s, v30.4s	// vect_acc_I_I_lsm.1576_4128.2209, MEM <const vector(4) float> [(const float *)vectp.2376_6350 + ivtmp.4049_7075 * 1], MEM <const vector(4) float> [(const float *)vectp.2226_6625 + ivtmp.4049_7075 * 1]
	str	q31, [sp, 1376]	// vect_acc_I_I_lsm.1576_4128.2209, %sfp
	cmp	x0, x1	// _7048, ivtmp.4049
	bne	.L902		//,
	ldp	q30, q29, [sp, 896]	// vect_acc_I_I_lsm.1574_4092.2208, vect_acc_I_I_lsm.1572_4056.2207,
	faddp	v31.4s, v31.4s, v31.4s	// tmp3085, vect_acc_I_I_lsm.1576_4128.2209, vect_acc_I_I_lsm.1576_4128.2209
	ldp	q28, q27, [sp, 928]	// vect_acc_I_I_lsm.1570_4926.2206, vect_acc_I_I_lsm.1568_4875.2205,
	faddp	v14.4s, v14.4s, v14.4s	// tmp3100, vect_acc_I_I_lsm.1546_3550.2194, vect_acc_I_I_lsm.1546_3550.2194
	ldp	q26, q25, [sp, 960]	// vect_acc_I_I_lsm.1566_4824.2204, vect_acc_I_I_lsm.1564_4753.2203,
	faddp	v15.4s, v15.4s, v15.4s	// tmp3101, vect_acc_I_I_lsm.1544_2374.2193, vect_acc_I_I_lsm.1544_2374.2193
	ldp	q24, q23, [sp, 992]	// vect_acc_I_I_lsm.1562_4701.2202, vect_acc_I_I_lsm.1560_4651.2201,
	str	q31, [sp, 1376]	// tmp3085, %sfp
	faddp	v16.4s, v16.4s, v16.4s	// tmp3102, vect_acc_I_I_lsm.1542_4554.2192, vect_acc_I_I_lsm.1542_4554.2192
	ldr	q22, [sp, 1024]	// vect_acc_I_I_lsm.1558_356.2200, %sfp
	faddp	v13.4s, v13.4s, v13.4s	// tmp3103, vect_acc_I_I_lsm.1540_5105.2191, vect_acc_I_I_lsm.1540_5105.2191
	faddp	v31.4s, v30.4s, v30.4s	// tmp3086, vect_acc_I_I_lsm.1574_4092.2208, vect_acc_I_I_lsm.1574_4092.2208
	ldr	q21, [sp, 1040]	// vect_acc_I_I_lsm.1556_2142.2199, %sfp
	faddp	v29.4s, v29.4s, v29.4s	// tmp3087, vect_acc_I_I_lsm.1572_4056.2207, vect_acc_I_I_lsm.1572_4056.2207
	faddp	v28.4s, v28.4s, v28.4s	// tmp3088, vect_acc_I_I_lsm.1570_4926.2206, vect_acc_I_I_lsm.1570_4926.2206
	ldr	q20, [sp, 1056]	// vect_acc_I_I_lsm.1554_2131.2198, %sfp
	faddp	v27.4s, v27.4s, v27.4s	// tmp3089, vect_acc_I_I_lsm.1568_4875.2205, vect_acc_I_I_lsm.1568_4875.2205
	faddp	v26.4s, v26.4s, v26.4s	// tmp3090, vect_acc_I_I_lsm.1566_4824.2204, vect_acc_I_I_lsm.1566_4824.2204
	ldr	q19, [sp, 1072]	// vect_acc_I_I_lsm.1552_3089.2197, %sfp
	faddp	v25.4s, v25.4s, v25.4s	// tmp3091, vect_acc_I_I_lsm.1564_4753.2203, vect_acc_I_I_lsm.1564_4753.2203
	str	q31, [sp, 896]	// tmp3086, %sfp
	faddp	v24.4s, v24.4s, v24.4s	// tmp3092, vect_acc_I_I_lsm.1562_4701.2202, vect_acc_I_I_lsm.1562_4701.2202
	ldr	q31, [sp, 1120]	// vect_acc_I_I_lsm.1514_2285.2178, %sfp
	faddp	v29.4s, v29.4s, v29.4s	// tmp3087, tmp3087, tmp3087
	faddp	v28.4s, v28.4s, v28.4s	// tmp3088, tmp3088, tmp3088
	ldr	q18, [sp, 1088]	// vect_acc_I_I_lsm.1550_1530.2196, %sfp
	faddp	v27.4s, v27.4s, v27.4s	// tmp3089, tmp3089, tmp3089
	faddp	v26.4s, v26.4s, v26.4s	// tmp3090, tmp3090, tmp3090
	ldr	q17, [sp, 1104]	// vect_acc_I_I_lsm.1548_3474.2195, %sfp
	faddp	v25.4s, v25.4s, v25.4s	// tmp3091, tmp3091, tmp3091
	faddp	v24.4s, v24.4s, v24.4s	// tmp3092, tmp3092, tmp3092
	faddp	v31.4s, v31.4s, v31.4s	// tmp3116, vect_acc_I_I_lsm.1514_2285.2178, vect_acc_I_I_lsm.1514_2285.2178
	ldr	x0, [sp, 1584]	// ivtmp.4093, %sfp
	faddp	v23.4s, v23.4s, v23.4s	// tmp3093, vect_acc_I_I_lsm.1560_4651.2201, vect_acc_I_I_lsm.1560_4651.2201
	ldr	w1, [sp, 1608]	//, %sfp
	faddp	v22.4s, v22.4s, v22.4s	// tmp3094, vect_acc_I_I_lsm.1558_356.2200, vect_acc_I_I_lsm.1558_356.2200
	faddp	v21.4s, v21.4s, v21.4s	// tmp3095, vect_acc_I_I_lsm.1556_2142.2199, vect_acc_I_I_lsm.1556_2142.2199
	faddp	v20.4s, v20.4s, v20.4s	// tmp3096, vect_acc_I_I_lsm.1554_2131.2198, vect_acc_I_I_lsm.1554_2131.2198
	faddp	v19.4s, v19.4s, v19.4s	// tmp3097, vect_acc_I_I_lsm.1552_3089.2197, vect_acc_I_I_lsm.1552_3089.2197
	str	q31, [sp, 912]	// tmp3116, %sfp
	faddp	v18.4s, v18.4s, v18.4s	// tmp3098, vect_acc_I_I_lsm.1550_1530.2196, vect_acc_I_I_lsm.1550_1530.2196
	ldr	q31, [sp, 1136]	// vect_acc_I_I_lsm.1512_2413.2177, %sfp
	faddp	v23.4s, v23.4s, v23.4s	// tmp3093, tmp3093, tmp3093
	faddp	v22.4s, v22.4s, v22.4s	// tmp3094, tmp3094, tmp3094
	faddp	v21.4s, v21.4s, v21.4s	// tmp3095, tmp3095, tmp3095
	faddp	v20.4s, v20.4s, v20.4s	// tmp3096, tmp3096, tmp3096
	faddp	v19.4s, v19.4s, v19.4s	// tmp3097, tmp3097, tmp3097
	faddp	v18.4s, v18.4s, v18.4s	// tmp3098, tmp3098, tmp3098
	faddp	v31.4s, v31.4s, v31.4s	// tmp3117, vect_acc_I_I_lsm.1512_2413.2177, vect_acc_I_I_lsm.1512_2413.2177
	faddp	v17.4s, v17.4s, v17.4s	// tmp3099, vect_acc_I_I_lsm.1548_3474.2195, vect_acc_I_I_lsm.1548_3474.2195
	faddp	v14.4s, v14.4s, v14.4s	// tmp3100, tmp3100, tmp3100
	faddp	v15.4s, v15.4s, v15.4s	// tmp3101, tmp3101, tmp3101
	faddp	v16.4s, v16.4s, v16.4s	// tmp3102, tmp3102, tmp3102
	faddp	v13.4s, v13.4s, v13.4s	// tmp3103, tmp3103, tmp3103
	str	q31, [sp, 928]	// tmp3117, %sfp
	faddp	v12.4s, v12.4s, v12.4s	// tmp3104, vect_acc_I_I_lsm.1538_4566.2190, vect_acc_I_I_lsm.1538_4566.2190
	ldr	q31, [sp, 1152]	// vect_acc_I_I_lsm.1510_2765.2176, %sfp
	faddp	v17.4s, v17.4s, v17.4s	// tmp3099, tmp3099, tmp3099
	faddp	v11.4s, v11.4s, v11.4s	// tmp3105, vect_acc_I_I_lsm.1536_2405.2189, vect_acc_I_I_lsm.1536_2405.2189
	faddp	v10.4s, v10.4s, v10.4s	// tmp3106, vect_acc_I_I_lsm.1534_60.2188, vect_acc_I_I_lsm.1534_60.2188
	faddp	v9.4s, v9.4s, v9.4s	// tmp3107, vect_acc_I_I_lsm.1532_187.2187, vect_acc_I_I_lsm.1532_187.2187
	faddp	v8.4s, v8.4s, v8.4s	// tmp3108, vect_acc_I_I_lsm.1530_245.2186, vect_acc_I_I_lsm.1530_245.2186
	faddp	v12.4s, v12.4s, v12.4s	// tmp3104, tmp3104, tmp3104
	faddp	v31.4s, v31.4s, v31.4s	// tmp3118, vect_acc_I_I_lsm.1510_2765.2176, vect_acc_I_I_lsm.1510_2765.2176
	faddp	v11.4s, v11.4s, v11.4s	// tmp3105, tmp3105, tmp3105
	faddp	v10.4s, v10.4s, v10.4s	// tmp3106, tmp3106, tmp3106
	faddp	v9.4s, v9.4s, v9.4s	// tmp3107, tmp3107, tmp3107
	faddp	v8.4s, v8.4s, v8.4s	// tmp3108, tmp3108, tmp3108
	faddp	v7.4s, v7.4s, v7.4s	// tmp3109, vect_acc_I_I_lsm.1528_268.2185, vect_acc_I_I_lsm.1528_268.2185
	str	q31, [sp, 944]	// tmp3118, %sfp
	faddp	v6.4s, v6.4s, v6.4s	// tmp3110, vect_acc_I_I_lsm.1526_766.2184, vect_acc_I_I_lsm.1526_766.2184
	ldr	q31, [sp, 1168]	// vect_acc_I_I_lsm.1508_2911.2175, %sfp
	faddp	v5.4s, v5.4s, v5.4s	// tmp3111, vect_acc_I_I_lsm.1524_1641.2183, vect_acc_I_I_lsm.1524_1641.2183
	faddp	v4.4s, v4.4s, v4.4s	// tmp3112, vect_acc_I_I_lsm.1522_1744.2182, vect_acc_I_I_lsm.1522_1744.2182
	faddp	v3.4s, v3.4s, v3.4s	// tmp3113, vect_acc_I_I_lsm.1520_1761.2181, vect_acc_I_I_lsm.1520_1761.2181
	faddp	v2.4s, v2.4s, v2.4s	// tmp3114, vect_acc_I_I_lsm.1518_1825.2180, vect_acc_I_I_lsm.1518_1825.2180
	faddp	v7.4s, v7.4s, v7.4s	// tmp3109, tmp3109, tmp3109
	faddp	v6.4s, v6.4s, v6.4s	// tmp3110, tmp3110, tmp3110
	faddp	v31.4s, v31.4s, v31.4s	// tmp3119, vect_acc_I_I_lsm.1508_2911.2175, vect_acc_I_I_lsm.1508_2911.2175
	faddp	v5.4s, v5.4s, v5.4s	// tmp3111, tmp3111, tmp3111
	faddp	v4.4s, v4.4s, v4.4s	// tmp3112, tmp3112, tmp3112
	faddp	v3.4s, v3.4s, v3.4s	// tmp3113, tmp3113, tmp3113
	faddp	v2.4s, v2.4s, v2.4s	// tmp3114, tmp3114, tmp3114
	faddp	v1.4s, v1.4s, v1.4s	// tmp3115, vect_acc_I_I_lsm.1516_1937.2179, vect_acc_I_I_lsm.1516_1937.2179
	str	q31, [sp, 960]	// tmp3119, %sfp
	faddp	v0.4s, v0.4s, v0.4s	// tmp3132, vect_acc_I_I_lsm.1482_5057.2162, vect_acc_I_I_lsm.1482_5057.2162
	ldr	q31, [sp, 1184]	// vect_acc_I_I_lsm.1506_3521.2174, %sfp
	faddp	v1.4s, v1.4s, v1.4s	// tmp3115, tmp3115, tmp3115
	faddp	v0.4s, v0.4s, v0.4s	// tmp3132, tmp3132, tmp3132
	faddp	v31.4s, v31.4s, v31.4s	// tmp3120, vect_acc_I_I_lsm.1506_3521.2174, vect_acc_I_I_lsm.1506_3521.2174
	str	q31, [sp, 976]	// tmp3120, %sfp
	ldr	q31, [sp, 1200]	// vect_acc_I_I_lsm.1504_3614.2173, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3121, vect_acc_I_I_lsm.1504_3614.2173, vect_acc_I_I_lsm.1504_3614.2173
	str	q31, [sp, 992]	// tmp3121, %sfp
	ldr	q31, [sp, 1216]	// vect_acc_I_I_lsm.1502_3690.2172, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3122, vect_acc_I_I_lsm.1502_3690.2172, vect_acc_I_I_lsm.1502_3690.2172
	str	q31, [sp, 1008]	// tmp3122, %sfp
	ldr	q31, [sp, 1232]	// vect_acc_I_I_lsm.1500_3754.2171, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3123, vect_acc_I_I_lsm.1500_3754.2171, vect_acc_I_I_lsm.1500_3754.2171
	str	q31, [sp, 1024]	// tmp3123, %sfp
	ldr	q31, [sp, 1248]	// vect_acc_I_I_lsm.1498_3804.2170, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3124, vect_acc_I_I_lsm.1498_3804.2170, vect_acc_I_I_lsm.1498_3804.2170
	str	q31, [sp, 1040]	// tmp3124, %sfp
	ldr	q31, [sp, 1264]	// vect_acc_I_I_lsm.1496_3845.2169, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3125, vect_acc_I_I_lsm.1496_3845.2169, vect_acc_I_I_lsm.1496_3845.2169
	str	q31, [sp, 1056]	// tmp3125, %sfp
	ldr	q31, [sp, 1280]	// vect_acc_I_I_lsm.1494_3886.2168, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3126, vect_acc_I_I_lsm.1494_3886.2168, vect_acc_I_I_lsm.1494_3886.2168
	str	q31, [sp, 1072]	// tmp3126, %sfp
	ldr	q31, [sp, 1296]	// vect_acc_I_I_lsm.1492_3923.2167, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3127, vect_acc_I_I_lsm.1492_3923.2167, vect_acc_I_I_lsm.1492_3923.2167
	str	q31, [sp, 1088]	// tmp3127, %sfp
	ldr	q31, [sp, 1312]	// vect_acc_I_I_lsm.1490_4064.2166, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3128, vect_acc_I_I_lsm.1490_4064.2166, vect_acc_I_I_lsm.1490_4064.2166
	str	q31, [sp, 1104]	// tmp3128, %sfp
	ldr	q31, [sp, 1328]	// vect_acc_I_I_lsm.1488_4136.2165, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3129, vect_acc_I_I_lsm.1488_4136.2165, vect_acc_I_I_lsm.1488_4136.2165
	str	q31, [sp, 1120]	// tmp3129, %sfp
	ldr	q31, [sp, 1344]	// vect_acc_I_I_lsm.1486_4562.2164, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3130, vect_acc_I_I_lsm.1486_4562.2164, vect_acc_I_I_lsm.1486_4562.2164
	str	q31, [sp, 1136]	// tmp3130, %sfp
	ldr	q31, [sp, 1360]	// vect_acc_I_I_lsm.1484_4646.2163, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3131, vect_acc_I_I_lsm.1484_4646.2163, vect_acc_I_I_lsm.1484_4646.2163
	mov	v30.16b, v31.16b	// tmp3131, tmp3131
	ldr	q31, [sp, 1376]	// tmp3085, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3085, tmp3085, tmp3085
	str	q31, [sp, 1376]	// tmp3085, %sfp
	ldr	q31, [sp, 896]	// tmp3086, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3086, tmp3086, tmp3086
	str	q31, [sp, 896]	// tmp3086, %sfp
	ldr	q31, [sp, 912]	// tmp3116, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3116, tmp3116, tmp3116
	str	q31, [sp, 912]	// tmp3116, %sfp
	ldr	q31, [sp, 928]	// tmp3117, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3117, tmp3117, tmp3117
	str	q31, [sp, 928]	// tmp3117, %sfp
	ldr	q31, [sp, 944]	// tmp3118, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3118, tmp3118, tmp3118
	str	q31, [sp, 944]	// tmp3118, %sfp
	ldr	q31, [sp, 960]	// tmp3119, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3119, tmp3119, tmp3119
	str	q31, [sp, 960]	// tmp3119, %sfp
	ldr	q31, [sp, 976]	// tmp3120, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3120, tmp3120, tmp3120
	str	q31, [sp, 976]	// tmp3120, %sfp
	ldr	q31, [sp, 992]	// tmp3121, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3121, tmp3121, tmp3121
	str	q31, [sp, 992]	// tmp3121, %sfp
	ldr	q31, [sp, 1008]	// tmp3122, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3122, tmp3122, tmp3122
	str	q31, [sp, 1008]	// tmp3122, %sfp
	ldr	q31, [sp, 1024]	// tmp3123, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3123, tmp3123, tmp3123
	str	q31, [sp, 1024]	// tmp3123, %sfp
	ldr	q31, [sp, 1040]	// tmp3124, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3124, tmp3124, tmp3124
	str	q31, [sp, 1040]	// tmp3124, %sfp
	ldr	q31, [sp, 1056]	// tmp3125, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3125, tmp3125, tmp3125
	str	q31, [sp, 1056]	// tmp3125, %sfp
	ldr	q31, [sp, 1072]	// tmp3126, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3126, tmp3126, tmp3126
	str	q31, [sp, 1072]	// tmp3126, %sfp
	ldr	q31, [sp, 1088]	// tmp3127, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3127, tmp3127, tmp3127
	str	q31, [sp, 1088]	// tmp3127, %sfp
	ldr	q31, [sp, 1104]	// tmp3128, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3128, tmp3128, tmp3128
	str	q31, [sp, 1104]	// tmp3128, %sfp
	ldr	q31, [sp, 1120]	// tmp3129, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3129, tmp3129, tmp3129
	str	q31, [sp, 1120]	// tmp3129, %sfp
	ldr	q31, [sp, 1136]	// tmp3130, %sfp
	faddp	v31.4s, v31.4s, v31.4s	// tmp3130, tmp3130, tmp3130
	str	q31, [sp, 1136]	// tmp3130, %sfp
	faddp	v31.4s, v30.4s, v30.4s	// tmp3131, tmp3131, tmp3131
	ldr	s30, [sp, 784]	// acc_I_I_lsm.1576, %sfp
	str	q31, [sp, 1152]	// tmp3131, %sfp
	ldr	s31, [sp, 1376]	// tmp10251, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1576, acc_I_I_lsm.1576, tmp10251
	ldr	s31, [sp, 896]	// tmp10247, %sfp
	str	s30, [sp, 784]	// acc_I_I_lsm.1576, %sfp
	ldr	s30, [sp, 768]	// acc_I_I_lsm.1574, %sfp
	fadd	s30, s30, s31	// acc_I_I_lsm.1574, acc_I_I_lsm.1574, tmp10247
	str	s30, [sp, 768]	// acc_I_I_lsm.1574, %sfp
	ldr	s30, [sp, 752]	// acc_I_I_lsm.1572, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1572, acc_I_I_lsm.1572, tmp3087
	str	s30, [sp, 752]	// acc_I_I_lsm.1572, %sfp
	ldr	s30, [sp, 880]	// acc_I_I_lsm.1570, %sfp
	fadd	s30, s30, s28	// acc_I_I_lsm.1570, acc_I_I_lsm.1570, tmp3088
	str	s30, [sp, 880]	// acc_I_I_lsm.1570, %sfp
	ldr	s30, [sp, 864]	// acc_I_I_lsm.1568, %sfp
	fadd	s30, s30, s27	// acc_I_I_lsm.1568, acc_I_I_lsm.1568, tmp3089
	str	s30, [sp, 864]	// acc_I_I_lsm.1568, %sfp
	ldr	s30, [sp, 848]	// acc_I_I_lsm.1566, %sfp
	fadd	s30, s30, s26	// acc_I_I_lsm.1566, acc_I_I_lsm.1566, tmp3090
	str	s30, [sp, 848]	// acc_I_I_lsm.1566, %sfp
	ldr	s30, [sp, 832]	// acc_I_I_lsm.1564, %sfp
	fadd	s30, s30, s25	// acc_I_I_lsm.1564, acc_I_I_lsm.1564, tmp3091
	str	s30, [sp, 832]	// acc_I_I_lsm.1564, %sfp
	ldr	s30, [sp, 816]	// acc_I_I_lsm.1562, %sfp
	fadd	s30, s30, s24	// acc_I_I_lsm.1562, acc_I_I_lsm.1562, tmp3092
	str	s30, [sp, 816]	// acc_I_I_lsm.1562, %sfp
	ldr	s30, [sp, 384]	// acc_I_I_lsm.1560, %sfp
	fadd	s30, s30, s23	// acc_I_I_lsm.1560, acc_I_I_lsm.1560, tmp3093
	str	s30, [sp, 384]	// acc_I_I_lsm.1560, %sfp
	ldr	s30, [sp, 352]	// acc_I_I_lsm.1558, %sfp
	fadd	s30, s30, s22	// acc_I_I_lsm.1558, acc_I_I_lsm.1558, tmp3094
	str	s30, [sp, 352]	// acc_I_I_lsm.1558, %sfp
	ldr	s30, [sp, 504]	// acc_I_I_lsm.1556, %sfp
	fadd	s30, s30, s21	// acc_I_I_lsm.1556, acc_I_I_lsm.1556, tmp3095
	str	s30, [sp, 504]	// acc_I_I_lsm.1556, %sfp
	ldr	s30, [sp, 512]	// acc_I_I_lsm.1554, %sfp
	fadd	s30, s30, s20	// acc_I_I_lsm.1554, acc_I_I_lsm.1554, tmp3096
	str	s30, [sp, 512]	// acc_I_I_lsm.1554, %sfp
	ldr	s30, [sp, 456]	// acc_I_I_lsm.1552, %sfp
	fadd	s30, s30, s19	// acc_I_I_lsm.1552, acc_I_I_lsm.1552, tmp3097
	str	s30, [sp, 456]	// acc_I_I_lsm.1552, %sfp
	ldr	s30, [sp, 416]	// acc_I_I_lsm.1550, %sfp
	fadd	s30, s30, s18	// acc_I_I_lsm.1550, acc_I_I_lsm.1550, tmp3098
	str	s30, [sp, 416]	// acc_I_I_lsm.1550, %sfp
	ldr	s30, [sp, 552]	// acc_I_I_lsm.1548, %sfp
	fadd	s30, s30, s17	// acc_I_I_lsm.1548, acc_I_I_lsm.1548, tmp3099
	str	s30, [sp, 552]	// acc_I_I_lsm.1548, %sfp
	ldr	s30, [sp, 640]	// acc_I_I_lsm.1546, %sfp
	fadd	s30, s30, s14	// acc_I_I_lsm.1546, acc_I_I_lsm.1546, tmp3100
	str	s30, [sp, 640]	// acc_I_I_lsm.1546, %sfp
	ldr	s30, [sp, 368]	// acc_I_I_lsm.1544, %sfp
	fadd	s30, s30, s15	// acc_I_I_lsm.1544, acc_I_I_lsm.1544, tmp3101
	str	s30, [sp, 368]	// acc_I_I_lsm.1544, %sfp
	ldr	s30, [sp, 800]	// acc_I_I_lsm.1542, %sfp
	fadd	s30, s30, s16	// acc_I_I_lsm.1542, acc_I_I_lsm.1542, tmp3102
	str	s30, [sp, 800]	// acc_I_I_lsm.1542, %sfp
	ldr	s30, [sp, 608]	// acc_I_I_lsm.1540, %sfp
	fadd	s30, s30, s13	// acc_I_I_lsm.1540, acc_I_I_lsm.1540, tmp3103
	str	s30, [sp, 608]	// acc_I_I_lsm.1540, %sfp
	ldr	s30, [sp, 560]	// acc_I_I_lsm.1538, %sfp
	fadd	s30, s30, s12	// acc_I_I_lsm.1538, acc_I_I_lsm.1538, tmp3104
	str	s30, [sp, 560]	// acc_I_I_lsm.1538, %sfp
	ldr	s30, [sp, 1456]	// acc_I_I_lsm.1536, %sfp
	fadd	s30, s30, s11	// acc_I_I_lsm.1536, acc_I_I_lsm.1536, tmp3105
	str	s30, [sp, 1456]	// acc_I_I_lsm.1536, %sfp
	ldr	s30, [sp, 288]	// acc_I_I_lsm.1534, %sfp
	fadd	s30, s30, s10	// acc_I_I_lsm.1534, acc_I_I_lsm.1534, tmp3106
	str	s30, [sp, 288]	// acc_I_I_lsm.1534, %sfp
	ldr	s30, [sp, 304]	// acc_I_I_lsm.1532, %sfp
	ldr	s29, [sp, 912]	// tmp7991, %sfp
	fadd	s30, s30, s9	// acc_I_I_lsm.1532, acc_I_I_lsm.1532, tmp3107
	str	s30, [sp, 304]	// acc_I_I_lsm.1532, %sfp
	ldr	s30, [sp, 320]	// acc_I_I_lsm.1530, %sfp
	fadd	s30, s30, s8	// acc_I_I_lsm.1530, acc_I_I_lsm.1530, tmp3108
	str	s30, [sp, 320]	// acc_I_I_lsm.1530, %sfp
	ldr	s30, [sp, 336]	// acc_I_I_lsm.1528, %sfp
	fadd	s30, s30, s7	// acc_I_I_lsm.1528, acc_I_I_lsm.1528, tmp3109
	str	s30, [sp, 336]	// acc_I_I_lsm.1528, %sfp
	ldr	s30, [sp, 400]	// acc_I_I_lsm.1526, %sfp
	fadd	s30, s30, s6	// acc_I_I_lsm.1526, acc_I_I_lsm.1526, tmp3110
	str	s30, [sp, 400]	// acc_I_I_lsm.1526, %sfp
	ldr	s30, [sp, 432]	// acc_I_I_lsm.1524, %sfp
	fadd	s30, s30, s5	// acc_I_I_lsm.1524, acc_I_I_lsm.1524, tmp3111
	str	s30, [sp, 432]	// acc_I_I_lsm.1524, %sfp
	ldr	s30, [sp, 464]	// acc_I_I_lsm.1522, %sfp
	fadd	s30, s30, s4	// acc_I_I_lsm.1522, acc_I_I_lsm.1522, tmp3112
	str	s30, [sp, 464]	// acc_I_I_lsm.1522, %sfp
	ldr	s30, [sp, 472]	// acc_I_I_lsm.1520, %sfp
	fadd	s30, s30, s3	// acc_I_I_lsm.1520, acc_I_I_lsm.1520, tmp3113
	str	s30, [sp, 472]	// acc_I_I_lsm.1520, %sfp
	ldr	s30, [sp, 496]	// acc_I_I_lsm.1518, %sfp
	fadd	s30, s30, s2	// acc_I_I_lsm.1518, acc_I_I_lsm.1518, tmp3114
	str	s30, [sp, 496]	// acc_I_I_lsm.1518, %sfp
	ldr	s30, [sp, 480]	// acc_I_I_lsm.1516, %sfp
	fadd	s30, s30, s1	// acc_I_I_lsm.1516, acc_I_I_lsm.1516, tmp3115
	str	s30, [sp, 480]	// acc_I_I_lsm.1516, %sfp
	ldr	s30, [sp, 528]	// acc_I_I_lsm.1514, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1514, acc_I_I_lsm.1514, tmp7991
	ldr	s29, [sp, 928]	// tmp7994, %sfp
	str	s30, [sp, 528]	// acc_I_I_lsm.1514, %sfp
	ldr	s30, [sp, 544]	// acc_I_I_lsm.1512, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1512, acc_I_I_lsm.1512, tmp7994
	ldr	s29, [sp, 944]	// tmp7997, %sfp
	str	s30, [sp, 544]	// acc_I_I_lsm.1512, %sfp
	ldr	s30, [sp, 576]	// acc_I_I_lsm.1510, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1510, acc_I_I_lsm.1510, tmp7997
	ldr	s29, [sp, 960]	// tmp8000, %sfp
	str	s30, [sp, 576]	// acc_I_I_lsm.1510, %sfp
	ldr	s30, [sp, 592]	// acc_I_I_lsm.1508, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1508, acc_I_I_lsm.1508, tmp8000
	ldr	s29, [sp, 976]	// tmp8003, %sfp
	str	s30, [sp, 592]	// acc_I_I_lsm.1508, %sfp
	ldr	s30, [sp, 624]	// acc_I_I_lsm.1506, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1506, acc_I_I_lsm.1506, tmp8003
	str	s30, [sp, 624]	// acc_I_I_lsm.1506, %sfp
	ldr	s30, [sp, 656]	// acc_I_I_lsm.1504, %sfp
	ldr	s29, [sp, 992]	// tmp8006, %sfp
	ldr	s31, [sp, 1152]	// tmp8036, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1504, acc_I_I_lsm.1504, tmp8006
	ldr	s29, [sp, 1008]	// tmp8009, %sfp
	str	s30, [sp, 656]	// acc_I_I_lsm.1504, %sfp
	ldr	s30, [sp, 672]	// acc_I_I_lsm.1502, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1502, acc_I_I_lsm.1502, tmp8009
	ldr	s29, [sp, 1024]	// tmp8012, %sfp
	str	s30, [sp, 672]	// acc_I_I_lsm.1502, %sfp
	ldr	s30, [sp, 688]	// acc_I_I_lsm.1500, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1500, acc_I_I_lsm.1500, tmp8012
	ldr	s29, [sp, 1040]	// tmp8015, %sfp
	str	s30, [sp, 688]	// acc_I_I_lsm.1500, %sfp
	ldr	s30, [sp, 704]	// acc_I_I_lsm.1498, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1498, acc_I_I_lsm.1498, tmp8015
	ldr	s29, [sp, 1056]	// tmp8018, %sfp
	str	s30, [sp, 704]	// acc_I_I_lsm.1498, %sfp
	ldr	s30, [sp, 720]	// acc_I_I_lsm.1496, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1496, acc_I_I_lsm.1496, tmp8018
	ldr	s29, [sp, 1072]	// tmp8021, %sfp
	str	s30, [sp, 720]	// acc_I_I_lsm.1496, %sfp
	ldr	s30, [sp, 736]	// acc_I_I_lsm.1494, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1494, acc_I_I_lsm.1494, tmp8021
	ldr	s29, [sp, 1088]	// tmp8024, %sfp
	str	s30, [sp, 736]	// acc_I_I_lsm.1494, %sfp
	ldr	s30, [sp, 168]	// acc_I_I_lsm.1492, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1492, acc_I_I_lsm.1492, tmp8024
	ldr	s29, [sp, 1104]	// tmp8027, %sfp
	str	s30, [sp, 168]	// acc_I_I_lsm.1492, %sfp
	ldr	s30, [sp, 216]	// acc_I_I_lsm.1490, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1490, acc_I_I_lsm.1490, tmp8027
	ldr	s29, [sp, 1120]	// tmp8030, %sfp
	str	s30, [sp, 216]	// acc_I_I_lsm.1490, %sfp
	ldr	s30, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1488, acc_I_I_lsm.1488, tmp8030
	ldr	s29, [sp, 1136]	// tmp8033, %sfp
	str	s30, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	ldr	s30, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	fadd	s30, s30, s29	// acc_I_I_lsm.1486, acc_I_I_lsm.1486, tmp8033
	str	s30, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	ldr	s30, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	fadd	s31, s30, s31	// acc_I_I_lsm.1484, acc_I_I_lsm.1484, tmp8036
	str	s31, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	ldr	s31, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	ldr	w8, [sp, 1648]	//, %sfp
	fadd	s31, s31, s0	// acc_I_I_lsm.1482, acc_I_I_lsm.1482, tmp3132
	str	s31, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	cbz	w8, .L661	// _9397,
.L659:
	ldr	x8, [sp, 1472]	// ivtmp.4164, %sfp
	sxtw	x1, w1	// ivtmp.4033, _563
	add	x12, x27, x17	// _4776, _63, _3614
	add	x18, x27, x20	// _9918, _63, _9210
	add	x17, x17, x19	// _3911, _3614, _9289
	add	x20, x20, x19	// _9926, _9210, _9289
	add	x22, x27, x6	// _10671, _63, _8079
	add	x9, x0, x8	// _9157, ivtmp.4093, ivtmp.4164
	add	x9, x9, x1	// _4190, _9157, ivtmp.4033
	add	x8, x30, x9, lsl 2	// _4194, in_ptr, _4190,
	ldr	s18, [x30, x9, lsl 2]	// D__lsm0.3648, *_4194
	add	x9, x6, x19	// _10680, _8079, _9289
	ldp	s27, s26, [x8, 4]	// D__lsm1.3649, D__lsm2.3650,
	ldp	s29, s28, [x8, 12]	// D__lsm3.3651, D__lsm4.3652,
	ldp	s30, s31, [x8, 20]	// D__lsm5.3653, D__lsm6.3654,
.L662:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s19, [x12, x1, lsl 2]	// _6974, MEM[(const float *)_4776 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	ldr	s25, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	ldr	s17, [sp, 512]	// acc_I_I_lsm.1554, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x6, [sp, 1392]	// ivtmp.4094, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s25, s18, s19, s25	// acc_I_I_lsm.1482, D__lsm0.3648, _6974, acc_I_I_lsm.1482
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s20, [x17, x1, lsl 2]	// _6970, MEM[(const float *)_3911 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s17, s31, s19, s17	// acc_I_I_lsm.1554, D__lsm6.3654, _6974, acc_I_I_lsm.1554
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s21, [x18, x1, lsl 2]	// _6966, MEM[(const float *)_9918 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	s24, [x6, x1, lsl 2]	// xv, MEM[(const float *)_10681 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s22, [x20, x1, lsl 2]	// _6962, MEM[(const float *)_9926 + ivtmp.4033_3176 * 4]
	ldr	s23, [x22, x1, lsl 2]	// _6958, MEM[(const float *)_10671 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	str	s25, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	ldr	s25, [sp, 736]	// acc_I_I_lsm.1494, %sfp
	str	s17, [sp, 512]	// acc_I_I_lsm.1554, %sfp
	ldr	s17, [sp, 848]	// acc_I_I_lsm.1566, %sfp
	fmadd	s25, s27, s19, s25	// acc_I_I_lsm.1494, D__lsm1.3649, _6974, acc_I_I_lsm.1494
	str	s25, [sp, 736]	// acc_I_I_lsm.1494, %sfp
	ldr	s25, [sp, 624]	// acc_I_I_lsm.1506, %sfp
	fmadd	s25, s26, s19, s25	// acc_I_I_lsm.1506, D__lsm2.3650, _6974, acc_I_I_lsm.1506
	str	s25, [sp, 624]	// acc_I_I_lsm.1506, %sfp
	ldr	s25, [sp, 496]	// acc_I_I_lsm.1518, %sfp
	fmadd	s25, s29, s19, s25	// acc_I_I_lsm.1518, D__lsm3.3651, _6974, acc_I_I_lsm.1518
	str	s25, [sp, 496]	// acc_I_I_lsm.1518, %sfp
	ldr	s25, [sp, 320]	// acc_I_I_lsm.1530, %sfp
	fmadd	s25, s28, s19, s25	// acc_I_I_lsm.1530, D__lsm4.3652, _6974, acc_I_I_lsm.1530
	str	s25, [sp, 320]	// acc_I_I_lsm.1530, %sfp
	ldr	s25, [sp, 800]	// acc_I_I_lsm.1542, %sfp
	fmadd	s25, s30, s19, s25	// acc_I_I_lsm.1542, D__lsm5.3653, _6974, acc_I_I_lsm.1542
	fmadd	s19, s24, s19, s17	// acc_I_I_lsm.1566, xv, _6974, acc_I_I_lsm.1566
	str	s19, [sp, 848]	// acc_I_I_lsm.1566, %sfp
	ldr	s19, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	str	s25, [sp, 800]	// acc_I_I_lsm.1542, %sfp
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	s25, [x9, x1, lsl 2]	// _6954, MEM[(const float *)_10680 + ivtmp.4033_3176 * 4]
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	add	x1, x1, 1	// ivtmp.4033, ivtmp.4033,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s19, s18, s20, s19	// acc_I_I_lsm.1484, D__lsm0.3648, _6970, acc_I_I_lsm.1484
	str	s19, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	ldr	s19, [sp, 720]	// acc_I_I_lsm.1496, %sfp
	fmadd	s19, s27, s20, s19	// acc_I_I_lsm.1496, D__lsm1.3649, _6970, acc_I_I_lsm.1496
	str	s19, [sp, 720]	// acc_I_I_lsm.1496, %sfp
	ldr	s19, [sp, 592]	// acc_I_I_lsm.1508, %sfp
	fmadd	s19, s26, s20, s19	// acc_I_I_lsm.1508, D__lsm2.3650, _6970, acc_I_I_lsm.1508
	str	s19, [sp, 592]	// acc_I_I_lsm.1508, %sfp
	ldr	s19, [sp, 472]	// acc_I_I_lsm.1520, %sfp
	fmadd	s19, s29, s20, s19	// acc_I_I_lsm.1520, D__lsm3.3651, _6970, acc_I_I_lsm.1520
	str	s19, [sp, 472]	// acc_I_I_lsm.1520, %sfp
	ldr	s19, [sp, 304]	// acc_I_I_lsm.1532, %sfp
	fmadd	s19, s28, s20, s19	// acc_I_I_lsm.1532, D__lsm4.3652, _6970, acc_I_I_lsm.1532
	str	s19, [sp, 304]	// acc_I_I_lsm.1532, %sfp
	ldr	s19, [sp, 368]	// acc_I_I_lsm.1544, %sfp
	fmadd	s19, s30, s20, s19	// acc_I_I_lsm.1544, D__lsm5.3653, _6970, acc_I_I_lsm.1544
	str	s19, [sp, 368]	// acc_I_I_lsm.1544, %sfp
	ldr	s19, [sp, 504]	// acc_I_I_lsm.1556, %sfp
	fmadd	s19, s31, s20, s19	// acc_I_I_lsm.1556, D__lsm6.3654, _6970, acc_I_I_lsm.1556
	str	s19, [sp, 504]	// acc_I_I_lsm.1556, %sfp
	ldr	s19, [sp, 864]	// acc_I_I_lsm.1568, %sfp
	fmadd	s20, s24, s20, s19	// acc_I_I_lsm.1568, xv, _6970, acc_I_I_lsm.1568
	str	s20, [sp, 864]	// acc_I_I_lsm.1568, %sfp
	ldr	s20, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	fmadd	s20, s18, s21, s20	// acc_I_I_lsm.1486, D__lsm0.3648, _6966, acc_I_I_lsm.1486
	str	s20, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	ldr	s20, [sp, 704]	// acc_I_I_lsm.1498, %sfp
	fmadd	s20, s27, s21, s20	// acc_I_I_lsm.1498, D__lsm1.3649, _6966, acc_I_I_lsm.1498
	str	s20, [sp, 704]	// acc_I_I_lsm.1498, %sfp
	ldr	s20, [sp, 576]	// acc_I_I_lsm.1510, %sfp
	fmadd	s20, s26, s21, s20	// acc_I_I_lsm.1510, D__lsm2.3650, _6966, acc_I_I_lsm.1510
	str	s20, [sp, 576]	// acc_I_I_lsm.1510, %sfp
	ldr	s20, [sp, 464]	// acc_I_I_lsm.1522, %sfp
	fmadd	s20, s29, s21, s20	// acc_I_I_lsm.1522, D__lsm3.3651, _6966, acc_I_I_lsm.1522
	str	s20, [sp, 464]	// acc_I_I_lsm.1522, %sfp
	ldr	s20, [sp, 288]	// acc_I_I_lsm.1534, %sfp
	fmadd	s20, s28, s21, s20	// acc_I_I_lsm.1534, D__lsm4.3652, _6966, acc_I_I_lsm.1534
	str	s20, [sp, 288]	// acc_I_I_lsm.1534, %sfp
	ldr	s20, [sp, 640]	// acc_I_I_lsm.1546, %sfp
	fmadd	s20, s30, s21, s20	// acc_I_I_lsm.1546, D__lsm5.3653, _6966, acc_I_I_lsm.1546
	str	s20, [sp, 640]	// acc_I_I_lsm.1546, %sfp
	ldr	s20, [sp, 352]	// acc_I_I_lsm.1558, %sfp
	fmadd	s20, s31, s21, s20	// acc_I_I_lsm.1558, D__lsm6.3654, _6966, acc_I_I_lsm.1558
	str	s20, [sp, 352]	// acc_I_I_lsm.1558, %sfp
	ldr	s20, [sp, 880]	// acc_I_I_lsm.1570, %sfp
	fmadd	s21, s24, s21, s20	// acc_I_I_lsm.1570, xv, _6966, acc_I_I_lsm.1570
	str	s21, [sp, 880]	// acc_I_I_lsm.1570, %sfp
	ldr	s21, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	fmadd	s21, s18, s22, s21	// acc_I_I_lsm.1488, D__lsm0.3648, _6962, acc_I_I_lsm.1488
	str	s21, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	ldr	s21, [sp, 688]	// acc_I_I_lsm.1500, %sfp
	fmadd	s21, s27, s22, s21	// acc_I_I_lsm.1500, D__lsm1.3649, _6962, acc_I_I_lsm.1500
	str	s21, [sp, 688]	// acc_I_I_lsm.1500, %sfp
	ldr	s21, [sp, 544]	// acc_I_I_lsm.1512, %sfp
	fmadd	s21, s26, s22, s21	// acc_I_I_lsm.1512, D__lsm2.3650, _6962, acc_I_I_lsm.1512
	str	s21, [sp, 544]	// acc_I_I_lsm.1512, %sfp
	ldr	s21, [sp, 432]	// acc_I_I_lsm.1524, %sfp
	fmadd	s21, s29, s22, s21	// acc_I_I_lsm.1524, D__lsm3.3651, _6962, acc_I_I_lsm.1524
	str	s21, [sp, 432]	// acc_I_I_lsm.1524, %sfp
	ldr	s21, [sp, 1456]	// acc_I_I_lsm.1536, %sfp
	fmadd	s21, s28, s22, s21	// acc_I_I_lsm.1536, D__lsm4.3652, _6962, acc_I_I_lsm.1536
	str	s21, [sp, 1456]	// acc_I_I_lsm.1536, %sfp
	ldr	s21, [sp, 552]	// acc_I_I_lsm.1548, %sfp
	fmadd	s21, s30, s22, s21	// acc_I_I_lsm.1548, D__lsm5.3653, _6962, acc_I_I_lsm.1548
	str	s21, [sp, 552]	// acc_I_I_lsm.1548, %sfp
	ldr	s21, [sp, 384]	// acc_I_I_lsm.1560, %sfp
	fmadd	s21, s31, s22, s21	// acc_I_I_lsm.1560, D__lsm6.3654, _6962, acc_I_I_lsm.1560
	str	s21, [sp, 384]	// acc_I_I_lsm.1560, %sfp
	ldr	s21, [sp, 752]	// acc_I_I_lsm.1572, %sfp
	fmadd	s22, s24, s22, s21	// acc_I_I_lsm.1572, xv, _6962, acc_I_I_lsm.1572
	str	s22, [sp, 752]	// acc_I_I_lsm.1572, %sfp
	ldr	s22, [sp, 216]	// acc_I_I_lsm.1490, %sfp
	fmadd	s22, s18, s23, s22	// acc_I_I_lsm.1490, D__lsm0.3648, _6958, acc_I_I_lsm.1490
	str	s22, [sp, 216]	// acc_I_I_lsm.1490, %sfp
	ldr	s22, [sp, 672]	// acc_I_I_lsm.1502, %sfp
	fmadd	s22, s27, s23, s22	// acc_I_I_lsm.1502, D__lsm1.3649, _6958, acc_I_I_lsm.1502
	str	s22, [sp, 672]	// acc_I_I_lsm.1502, %sfp
	ldr	s22, [sp, 528]	// acc_I_I_lsm.1514, %sfp
	fmadd	s22, s26, s23, s22	// acc_I_I_lsm.1514, D__lsm2.3650, _6958, acc_I_I_lsm.1514
	str	s22, [sp, 528]	// acc_I_I_lsm.1514, %sfp
	ldr	s22, [sp, 400]	// acc_I_I_lsm.1526, %sfp
	fmadd	s22, s29, s23, s22	// acc_I_I_lsm.1526, D__lsm3.3651, _6958, acc_I_I_lsm.1526
	str	s22, [sp, 400]	// acc_I_I_lsm.1526, %sfp
	ldr	s22, [sp, 560]	// acc_I_I_lsm.1538, %sfp
	fmadd	s22, s28, s23, s22	// acc_I_I_lsm.1538, D__lsm4.3652, _6958, acc_I_I_lsm.1538
	str	s22, [sp, 560]	// acc_I_I_lsm.1538, %sfp
	ldr	s22, [sp, 416]	// acc_I_I_lsm.1550, %sfp
	fmadd	s22, s30, s23, s22	// acc_I_I_lsm.1550, D__lsm5.3653, _6958, acc_I_I_lsm.1550
	str	s22, [sp, 416]	// acc_I_I_lsm.1550, %sfp
	ldr	s22, [sp, 816]	// acc_I_I_lsm.1562, %sfp
	fmadd	s22, s31, s23, s22	// acc_I_I_lsm.1562, D__lsm6.3654, _6958, acc_I_I_lsm.1562
	str	s22, [sp, 816]	// acc_I_I_lsm.1562, %sfp
	ldr	s22, [sp, 768]	// acc_I_I_lsm.1574, %sfp
	fmadd	s23, s24, s23, s22	// acc_I_I_lsm.1574, xv, _6958, acc_I_I_lsm.1574
	str	s23, [sp, 768]	// acc_I_I_lsm.1574, %sfp
	ldr	s23, [sp, 168]	// acc_I_I_lsm.1492, %sfp
	fmadd	s23, s18, s25, s23	// acc_I_I_lsm.1492, D__lsm0.3648, _6954, acc_I_I_lsm.1492
	fmov	s18, s27	// D__lsm0.3648, D__lsm1.3649
	str	s23, [sp, 168]	// acc_I_I_lsm.1492, %sfp
	ldr	s23, [sp, 656]	// acc_I_I_lsm.1504, %sfp
	fmadd	s23, s27, s25, s23	// acc_I_I_lsm.1504, D__lsm1.3649, _6954, acc_I_I_lsm.1504
	ldr	s27, [sp, 336]	// acc_I_I_lsm.1528, %sfp
	fmadd	s27, s29, s25, s27	// acc_I_I_lsm.1528, D__lsm3.3651, _6954, acc_I_I_lsm.1528
	str	s23, [sp, 656]	// acc_I_I_lsm.1504, %sfp
	ldr	s23, [sp, 480]	// acc_I_I_lsm.1516, %sfp
	str	s27, [sp, 336]	// acc_I_I_lsm.1528, %sfp
	fmov	s27, s26	// D__lsm1.3649, D__lsm2.3650
	fmadd	s23, s26, s25, s23	// acc_I_I_lsm.1516, D__lsm2.3650, _6954, acc_I_I_lsm.1516
	str	s23, [sp, 480]	// acc_I_I_lsm.1516, %sfp
	ldr	s26, [sp, 608]	// acc_I_I_lsm.1540, %sfp
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w6, [sp, 1624]	//, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmadd	s26, s28, s25, s26	// acc_I_I_lsm.1540, D__lsm4.3652, _6954, acc_I_I_lsm.1540
	str	s26, [sp, 608]	// acc_I_I_lsm.1540, %sfp
	fmov	s26, s29	// D__lsm2.3650, D__lsm3.3651
	ldr	s29, [sp, 456]	// acc_I_I_lsm.1552, %sfp
	fmadd	s29, s30, s25, s29	// acc_I_I_lsm.1552, D__lsm5.3653, _6954, acc_I_I_lsm.1552
	str	s29, [sp, 456]	// acc_I_I_lsm.1552, %sfp
	fmov	s29, s28	// D__lsm3.3651, D__lsm4.3652
	ldr	s28, [sp, 832]	// acc_I_I_lsm.1564, %sfp
	fmadd	s28, s31, s25, s28	// acc_I_I_lsm.1564, D__lsm6.3654, _6954, acc_I_I_lsm.1564
	str	s28, [sp, 832]	// acc_I_I_lsm.1564, %sfp
	ldr	s28, [sp, 784]	// acc_I_I_lsm.1576, %sfp
	fmadd	s28, s24, s25, s28	// acc_I_I_lsm.1576, xv, _6954, acc_I_I_lsm.1576
	str	s28, [sp, 784]	// acc_I_I_lsm.1576, %sfp
	fmov	s28, s30	// D__lsm4.3652, D__lsm5.3653
	fmov	s30, s31	// D__lsm5.3653, D__lsm6.3654
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w6, w1	// KW, ivtmp.4033
	ble	.L661		//,
	fmov	s31, s24	// D__lsm6.3654, xv
	b	.L662		//
	.p2align 2,,3
.L901:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w1, 0	// _563,
	lsl	x17, x3, 2	// _3614, ivtmp.4081,
	lsl	x20, x5, 2	// _9210, ivtmp.4085,
	lsl	x6, x4, 2	// _8079, ivtmp.4089,
	b	.L659		//
	.p2align 2,,3
.L661:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	w1, 1	// acc_I_I_lsm_flag.1483,
	str	w1, [sp, 896]	// acc_I_I_lsm_flag.1483, %sfp
.L658:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	w1, [sp, 1488]	//, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x8, [sp, 1392]	// ivtmp.4094, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w6, w1, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	ldr	x1, [sp, 1704]	// _9282, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	str	w6, [sp, 1488]	// kh, %sfp
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x3, x3, x1	// ivtmp.4081, ivtmp.4081, _9282
	add	x5, x5, x1	// ivtmp.4085, ivtmp.4085, _9282
	add	x4, x4, x1	// ivtmp.4089, ivtmp.4089, _9282
	ldr	x1, [sp, 192]	// IW, %sfp
	add	x0, x0, x1	// ivtmp.4093, ivtmp.4093, IW
	ldr	x1, [sp, 1696]	// _7078, %sfp
	add	x8, x8, x1	// ivtmp.4094, ivtmp.4094, _7078
	add	x2, x2, x1	// ivtmp.4102, ivtmp.4102, _7078
	ldr	w1, [sp, 176]	//, %sfp
	str	x8, [sp, 1392]	// ivtmp.4094, %sfp
	cmp	w1, w6	// KH, kh
	bne	.L663		//,
	ldr	x9, [sp, 1408]	// ivtmp.4122, %sfp
	mov	w17, w26	// ic, ic
	mov	x8, x28	// ivtmp.4126, ivtmp.4126
	mov	w26, w24	// IC, IC
	ldr	x12, [sp, 1424]	// ivtmp.4127, %sfp
	ldr	x18, [sp, 1440]	// ivtmp.4128, %sfp
	ldr	x6, [sp, 1464]	// ivtmp.4119, %sfp
.L657:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w17, w17, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x6, x6, x21	// ivtmp.4119, ivtmp.4119, _9000
	ldr	x0, [sp, 1720]	// _8999, %sfp
	add	x8, x8, x25	// ivtmp.4126, ivtmp.4126, _7981
	add	x12, x12, x25	// ivtmp.4127, ivtmp.4127, _7981
	add	x18, x18, x25	// ivtmp.4128, ivtmp.4128, _7981
	add	x9, x9, x0	// ivtmp.4122, ivtmp.4122, _8999
	cmp	w26, w17	// IC, ic
	bne	.L664		//,
	add	x8, sp, 1568	//,,
	ldr	w0, [sp, 896]	//, %sfp
	mov	x1, x23	// _8075, _8075
	mov	x14, x16	// _8995, _8995
	mov	x3, x11	// ivtmp.4143, ivtmp.4143
	ldp	x20, x22, [x8]	// ivtmp.4166, _2196,
	mov	x13, x10	// ivtmp.4154, ivtmp.4154
	mov	x10, x15	// ivtmp.4141, ivtmp.4141
	ldp	x23, x5, [x8, 128]	// _7078, _9282,
	ldr	x28, [sp, 1736]	// _62, %sfp
	ldr	x11, [sp, 1768]	// _363, %sfp
	ldr	x6, [sp, 1784]	// _3295, %sfp
	ldr	x2, [sp, 1792]	// ivtmp.4146, %sfp
	ldr	w24, [sp, 1744]	//, %sfp
	ldr	w16, [sp, 1752]	//, %sfp
	ldr	w15, [sp, 1760]	//, %sfp
	ldr	w4, [sp, 1776]	//, %sfp
	cbz	w0, .L666	// acc_I_I_lsm_flag.1483,
	ldr	s31, [sp, 496]	// acc_I_I_lsm.1518, %sfp
	str	s31, [sp, 1852]	// acc_I_I_lsm.1518, MEM[(float[6][8] *)_520][0][3]
	ldr	s31, [sp, 320]	// acc_I_I_lsm.1530, %sfp
	str	s31, [sp, 1856]	// acc_I_I_lsm.1530, MEM[(float[6][8] *)_520][0][4]
	ldr	s31, [sp, 800]	// acc_I_I_lsm.1542, %sfp
	str	s31, [sp, 1860]	// acc_I_I_lsm.1542, MEM[(float[6][8] *)_520][0][5]
	ldr	s31, [sp, 512]	// acc_I_I_lsm.1554, %sfp
	str	s31, [sp, 1864]	// acc_I_I_lsm.1554, MEM[(float[6][8] *)_520][0][6]
	ldr	s31, [sp, 848]	// acc_I_I_lsm.1566, %sfp
	str	s31, [sp, 1868]	// acc_I_I_lsm.1566, MEM[(float[6][8] *)_520][0][7]
	ldr	s31, [sp, 472]	// acc_I_I_lsm.1520, %sfp
	str	s31, [sp, 1884]	// acc_I_I_lsm.1520, MEM[(float[6][8] *)_520][1][3]
	ldr	s31, [sp, 304]	// acc_I_I_lsm.1532, %sfp
	str	s31, [sp, 1888]	// acc_I_I_lsm.1532, MEM[(float[6][8] *)_520][1][4]
	ldr	s31, [sp, 368]	// acc_I_I_lsm.1544, %sfp
	str	s31, [sp, 1892]	// acc_I_I_lsm.1544, MEM[(float[6][8] *)_520][1][5]
	ldr	s31, [sp, 504]	// acc_I_I_lsm.1556, %sfp
	str	s31, [sp, 1896]	// acc_I_I_lsm.1556, MEM[(float[6][8] *)_520][1][6]
	ldr	s31, [sp, 864]	// acc_I_I_lsm.1568, %sfp
	str	s31, [sp, 1900]	// acc_I_I_lsm.1568, MEM[(float[6][8] *)_520][1][7]
	ldr	s31, [sp, 464]	// acc_I_I_lsm.1522, %sfp
	str	s31, [sp, 1916]	// acc_I_I_lsm.1522, MEM[(float[6][8] *)_520][2][3]
	ldr	s31, [sp, 288]	// acc_I_I_lsm.1534, %sfp
	str	s31, [sp, 1920]	// acc_I_I_lsm.1534, MEM[(float[6][8] *)_520][2][4]
	ldr	s31, [sp, 640]	// acc_I_I_lsm.1546, %sfp
	str	s31, [sp, 1924]	// acc_I_I_lsm.1546, MEM[(float[6][8] *)_520][2][5]
	ldr	s31, [sp, 352]	// acc_I_I_lsm.1558, %sfp
	str	s31, [sp, 1928]	// acc_I_I_lsm.1558, MEM[(float[6][8] *)_520][2][6]
	ldr	s31, [sp, 880]	// acc_I_I_lsm.1570, %sfp
	str	s31, [sp, 1932]	// acc_I_I_lsm.1570, MEM[(float[6][8] *)_520][2][7]
	ldr	s31, [sp, 432]	// acc_I_I_lsm.1524, %sfp
	str	s31, [sp, 1948]	// acc_I_I_lsm.1524, MEM[(float[6][8] *)_520][3][3]
	ldr	s31, [sp, 1456]	// acc_I_I_lsm.1536, %sfp
	str	s31, [sp, 1952]	// acc_I_I_lsm.1536, MEM[(float[6][8] *)_520][3][4]
	ldr	s31, [sp, 552]	// acc_I_I_lsm.1548, %sfp
	str	s31, [sp, 1956]	// acc_I_I_lsm.1548, MEM[(float[6][8] *)_520][3][5]
	ldr	s31, [sp, 384]	// acc_I_I_lsm.1560, %sfp
	str	s31, [sp, 1960]	// acc_I_I_lsm.1560, MEM[(float[6][8] *)_520][3][6]
	ldr	s31, [sp, 752]	// acc_I_I_lsm.1572, %sfp
	str	s31, [sp, 1964]	// acc_I_I_lsm.1572, MEM[(float[6][8] *)_520][3][7]
	ldr	s31, [sp, 528]	// acc_I_I_lsm.1514, %sfp
	str	s31, [sp, 1976]	// acc_I_I_lsm.1514, MEM[(float[6][8] *)_520][4][2]
	ldr	s31, [sp, 400]	// acc_I_I_lsm.1526, %sfp
	str	s31, [sp, 1980]	// acc_I_I_lsm.1526, MEM[(float[6][8] *)_520][4][3]
	ldr	s31, [sp, 560]	// acc_I_I_lsm.1538, %sfp
	str	s31, [sp, 1984]	// acc_I_I_lsm.1538, MEM[(float[6][8] *)_520][4][4]
	ldr	s31, [sp, 416]	// acc_I_I_lsm.1550, %sfp
	str	s31, [sp, 1988]	// acc_I_I_lsm.1550, MEM[(float[6][8] *)_520][4][5]
	ldr	s31, [sp, 816]	// acc_I_I_lsm.1562, %sfp
	str	s31, [sp, 1992]	// acc_I_I_lsm.1562, MEM[(float[6][8] *)_520][4][6]
	ldr	s31, [sp, 768]	// acc_I_I_lsm.1574, %sfp
	str	s31, [sp, 1996]	// acc_I_I_lsm.1574, MEM[(float[6][8] *)_520][4][7]
	ldr	s31, [sp, 480]	// acc_I_I_lsm.1516, %sfp
	str	s31, [sp, 2008]	// acc_I_I_lsm.1516, MEM[(float[6][8] *)_520][5][2]
	ldr	s31, [sp, 336]	// acc_I_I_lsm.1528, %sfp
	str	s31, [sp, 2012]	// acc_I_I_lsm.1528, MEM[(float[6][8] *)_520][5][3]
	ldr	s31, [sp, 608]	// acc_I_I_lsm.1540, %sfp
	str	s31, [sp, 2016]	// acc_I_I_lsm.1540, MEM[(float[6][8] *)_520][5][4]
	ldr	s31, [sp, 456]	// acc_I_I_lsm.1552, %sfp
	str	s31, [sp, 2020]	// acc_I_I_lsm.1552, MEM[(float[6][8] *)_520][5][5]
	ldr	s31, [sp, 832]	// acc_I_I_lsm.1564, %sfp
	str	s31, [sp, 2024]	// acc_I_I_lsm.1564, MEM[(float[6][8] *)_520][5][6]
	ldr	s31, [sp, 784]	// acc_I_I_lsm.1576, %sfp
	str	s31, [sp, 2028]	// acc_I_I_lsm.1576, MEM[(float[6][8] *)_520][5][7]
	ldr	s31, [sp, 544]	// acc_I_I_lsm.1512, %sfp
	str	s31, [sp, 1944]	// acc_I_I_lsm.1512, MEM[(float[6][8] *)_520][3][2]
	ldr	s31, [sp, 272]	// acc_I_I_lsm.1482, %sfp
	str	s31, [sp, 1840]	// acc_I_I_lsm.1482, MEM[(float[6][8] *)_520][0][0]
	ldr	s31, [sp, 736]	// acc_I_I_lsm.1494, %sfp
	str	s31, [sp, 1844]	// acc_I_I_lsm.1494, MEM[(float[6][8] *)_520][0][1]
	ldr	s31, [sp, 624]	// acc_I_I_lsm.1506, %sfp
	str	s31, [sp, 1848]	// acc_I_I_lsm.1506, MEM[(float[6][8] *)_520][0][2]
	ldr	s31, [sp, 256]	// acc_I_I_lsm.1484, %sfp
	str	s31, [sp, 1872]	// acc_I_I_lsm.1484, MEM[(float[6][8] *)_520][1][0]
	ldr	s31, [sp, 720]	// acc_I_I_lsm.1496, %sfp
	str	s31, [sp, 1876]	// acc_I_I_lsm.1496, MEM[(float[6][8] *)_520][1][1]
	ldr	s31, [sp, 592]	// acc_I_I_lsm.1508, %sfp
	str	s31, [sp, 1880]	// acc_I_I_lsm.1508, MEM[(float[6][8] *)_520][1][2]
	ldr	s31, [sp, 240]	// acc_I_I_lsm.1486, %sfp
	str	s31, [sp, 1904]	// acc_I_I_lsm.1486, MEM[(float[6][8] *)_520][2][0]
	ldr	s31, [sp, 704]	// acc_I_I_lsm.1498, %sfp
	str	s31, [sp, 1908]	// acc_I_I_lsm.1498, MEM[(float[6][8] *)_520][2][1]
	ldr	s31, [sp, 576]	// acc_I_I_lsm.1510, %sfp
	str	s31, [sp, 1912]	// acc_I_I_lsm.1510, MEM[(float[6][8] *)_520][2][2]
	ldr	s31, [sp, 224]	// acc_I_I_lsm.1488, %sfp
	str	s31, [sp, 1936]	// acc_I_I_lsm.1488, MEM[(float[6][8] *)_520][3][0]
	ldr	s31, [sp, 688]	// acc_I_I_lsm.1500, %sfp
	str	s31, [sp, 1940]	// acc_I_I_lsm.1500, MEM[(float[6][8] *)_520][3][1]
	ldr	s31, [sp, 216]	// acc_I_I_lsm.1490, %sfp
	str	s31, [sp, 1968]	// acc_I_I_lsm.1490, MEM[(float[6][8] *)_520][4][0]
	ldr	s31, [sp, 672]	// acc_I_I_lsm.1502, %sfp
	str	s31, [sp, 1972]	// acc_I_I_lsm.1502, MEM[(float[6][8] *)_520][4][1]
	ldr	s31, [sp, 168]	// acc_I_I_lsm.1492, %sfp
	str	s31, [sp, 2000]	// acc_I_I_lsm.1492, MEM[(float[6][8] *)_520][5][0]
	ldr	s31, [sp, 656]	// acc_I_I_lsm.1504, %sfp
	str	s31, [sp, 2004]	// acc_I_I_lsm.1504, MEM[(float[6][8] *)_520][5][1]
.L666:
	ldr	w0, [sp, 1560]	//, %sfp
	cmp	w0, 0	// OW,
	ble	.L667		//,
	cmp	w0, 1	// OW,
	beq	.L1218		//,
	ldr	w0, [sp, 1560]	//, %sfp
	cmp	w0, 2	// OW,
	beq	.L1219		//,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	ldr	w12, [sp, 1560]	//, %sfp
	add	x0, sp, 1840	// ivtmp.4028,,
	add	x9, sp, 2032	// _3152,,
	mov	x8, x3	// ivtmp.4029, ivtmp.4143
.L675:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x0]	// tmp8208, MEM <vector(2) float> [(float *)_10814]
	str	d31, [x8]	// tmp8208, MEM <vector(2) float> [(float *)_10432]
	ldr	s31, [x0, 8]	// tmp8209, MEM[(float *)_10814 + 8B]
	str	s31, [x8, 8]	// tmp8209, MEM[(float *)_10432 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w12, 3	// OW,
	beq	.L673		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x0, 12]	// tmp8210, MEM[(float *)_10814 + 12B]
	str	s31, [x8, 12]	// tmp8210, MEM[(float *)_10432 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w12, 4	// OW,
	beq	.L673		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x0, 16]	// tmp8211, MEM[(float *)_10814 + 16B]
	str	s31, [x8, 16]	// tmp8211, MEM[(float *)_10432 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w12, 5	// OW,
	beq	.L673		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x0, 20]	// tmp8212, MEM[(float *)_10814 + 20B]
	str	s31, [x8, 20]	// tmp8212, MEM[(float *)_10432 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w12, 6	// OW,
	beq	.L673		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x0, 24]	// tmp8213, MEM[(float *)_10814 + 24B]
	str	s31, [x8, 24]	// tmp8213, MEM[(float *)_10432 + 24B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w12, 7	// OW,
	beq	.L673		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x0, 28]	// tmp8214, MEM[(float *)_10814 + 28B]
	str	s31, [x8, 28]	// tmp8214, MEM[(float *)_10432 + 28B]
.L673:
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	ldr	x17, [sp, 1600]	// _10401, %sfp
	add	x0, x0, 32	// ivtmp.4028, ivtmp.4028,
	add	x8, x8, x17	// ivtmp.4029, ivtmp.4029, _10401
	cmp	x9, x0	// _3152, ivtmp.4028
	bne	.L675		//,
.L667:
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x8, [sp, 1656]	// _9223, %sfp
	add	w0, w4, 11	// _3282, oc0,
	add	x10, x10, 24	// ivtmp.4141, ivtmp.4141,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	add	w4, w4, 6	// oc0, oc0,
// src/cpp/cnn_internals.cpp:386:             for (; oc0 + OC_TILE <= out_channels; oc0 += OC_TILE)
	ldr	x9, [sp, 1672]	// _10635, %sfp
	add	x3, x3, x8	// ivtmp.4143, ivtmp.4143, _9223
	ldr	x8, [sp, 1536]	// ivtmp.4144, %sfp
	add	x8, x8, x9	// ivtmp.4144, ivtmp.4144, _10635
	str	x8, [sp, 1536]	// ivtmp.4144, %sfp
	ldr	x8, [sp, 1680]	// _10562, %sfp
	add	x2, x2, x8	// ivtmp.4146, ivtmp.4146, _10562
	ldr	w8, [sp, 164]	//, %sfp
	cmp	w8, w0	// OC, _3282
	bgt	.L676		//,
	mov	x10, x11	// _363, _363
	mov	x0, x13	// ivtmp.4154, ivtmp.4154
	ldr	w13, [sp, 1560]	//, %sfp
	mov	x11, x28	// _62, _62
	mov	x28, x30	// in_ptr, in_ptr
	mov	x30, x5	// _9282, _9282
	mov	w5, w15	// in_size, in_size
	ldr	w15, [sp, 1624]	//, %sfp
	mov	w9, w16	// oh, oh
	mov	x17, x6	// _3295, _3295
	mov	w16, w24	// b, b
	mov	x24, x23	// _7078, _7078
	mov	x23, x1	// _8075, _8075
.L699:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	w1, [sp, 164]	//, %sfp
	cmp	w1, w4	// OC, oc0
	ble	.L697		//,
	ldr	x1, [sp, 1712]	// _8998, %sfp
	sxtw	x2, w4	// ivtmp.3998, oc0
// src/cpp/cnn_internals.cpp:331:         const float* __restrict in_c = in_batch + (std::size_t)ic * in_size;
	sxtw	x12, w5	// _9279, in_size
	str	w16, [sp, 304]	// b, %sfp
	ldr	x4, [sp, 1616]	// ivtmp.4163, %sfp
	str	x19, [sp, 352]	// _9289, %sfp
	ldr	x16, [sp, 192]	// IW, %sfp
	madd	x3, x2, x1, x0	// _6634, ivtmp.3998, _8998, ivtmp.4154
	str	w5, [sp, 336]	// in_size, %sfp
	mov	x5, x14	// _8995, _8995
	ldr	w18, [sp, 176]	//, %sfp
	mul	x1, x10, x2	// ivtmp.4003, _363, ivtmp.3998
	str	w9, [sp, 320]	// oh, %sfp
	ldr	w19, [sp, 1664]	//, %sfp
	add	x3, x4, x3, lsl 2	// ivtmp.4002, ivtmp.4163, _6634,
	mov	x4, x0	// ivtmp.4154, ivtmp.4154
.L696:
// src/cpp/cnn_internals.cpp:324:         const float bv = bias_ptr[oc0 + t];
	ldr	s31, [x11, x2, lsl 2]	// bv, MEM[(const float *)_62 + ivtmp.3998_7275 * 4]
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	cmp	w26, 0	// IC,
	ble	.L680		//,
	ldr	x6, [sp, 1472]	// ivtmp.4164, %sfp
	ldr	x0, [sp, 1592]	// ivtmp.4159, %sfp
	add	x8, x0, x6	// ivtmp.3991, ivtmp.4159, ivtmp.4164
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	cmp	w18, 0	// KH,
	ble	.L680		//,
	fmov	s22, s31	// acc$0$2, bv
	fmov	s24, s31	// acc$0$4, bv
	mov	w14, 0	// ic,
	mov	x9, x1	// ivtmp.3990, ivtmp.4003
	str	w13, [sp, 368]	// OW, %sfp
	fmov	s26, s31	// acc$0$1, bv
	fmov	s23, s31	// acc$0$3, bv
	mov	x13, x20	// ivtmp.4166, ivtmp.4166
	mov	x20, x1	// ivtmp.4003, ivtmp.4003
	str	x11, [sp, 384]	// _62, %sfp
	fmov	s21, s31	// acc$0$7, bv
	fmov	s25, s31	// acc$0$6, bv
	mov	x11, x10	// _363, _363
	fmov	s28, s31	// acc$0$0, bv
.L688:
	add	x1, x28, x8, lsl 2	// ivtmp.3976, in_ptr, ivtmp.3991,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	mov	w6, 0	// kh,
// src/cpp/cnn_internals.cpp:336:             const float* __restrict w_row  = w_c  + (std::size_t)kh * kernel_w;
	mov	x10, x8	// ivtmp.3974, ivtmp.3991
	mov	x7, x9	// ivtmp.3973, ivtmp.3990
.L687:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	cmp	w15, 0	// KW,
	bgt	.L1220		//,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w6, w6, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x7, x7, x30	// ivtmp.3973, ivtmp.3973, _9282
	add	x10, x10, x16	// ivtmp.3974, ivtmp.3974, IW
	add	x1, x1, x24	// ivtmp.3976, ivtmp.3976, _7078
	cmp	w18, w6	// KH, kh
	bne	.L687		//,
.L686:
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	w14, w14, 1	// ic, ic,
// src/cpp/cnn_internals.cpp:330:     for (int ic = 0; ic < in_channels; ++ic) {
	add	x9, x9, x21	// ivtmp.3990, ivtmp.3990, _9000
	add	x8, x8, x12	// ivtmp.3991, ivtmp.3991, _9279
	cmp	w26, w14	// IC, ic
	bne	.L688		//,
	mov	x10, x11	// _363, _363
	ldr	x11, [sp, 384]	// _62, %sfp
	mov	x1, x20	// ivtmp.4003, ivtmp.4003
	mov	x20, x13	// ivtmp.4166, ivtmp.4166
	ldr	w13, [sp, 368]	//, %sfp
.L689:
	cmp	w13, 7	// OW,
	ble	.L690		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s28, s26, [x3]	// acc$0$0, acc$0$1,* ivtmp.4002
	stp	s22, s23, [x3, 8]	// acc$0$2, acc$0$3,
	stp	s24, s31, [x3, 16]	// acc$0$4, bv,
	stp	s25, s21, [x3, 24]	// acc$0$6, acc$0$7,
.L691:
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	ldr	x0, [sp, 1600]	// _10401, %sfp
	add	x2, x2, 1	// ivtmp.3998, ivtmp.3998,
	add	x1, x1, x10	// ivtmp.4003, ivtmp.4003, _363
	add	x3, x3, x0	// ivtmp.4002, ivtmp.4002, _10401
	ldr	w0, [sp, 164]	//, %sfp
	cmp	w0, w2	// OC, ivtmp.3998
	bgt	.L696		//,
	ldr	x19, [sp, 352]	// _9289, %sfp
	mov	x14, x5	// _8995, _8995
	mov	x0, x4	// ivtmp.4154, ivtmp.4154
	ldr	w16, [sp, 304]	//, %sfp
	ldr	w9, [sp, 320]	//, %sfp
	ldr	w5, [sp, 336]	//, %sfp
.L697:
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	ldp	x2, x1, [sp, 192]	// IW, _12516,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	w9, w9, 1	// oh, oh,
// src/cpp/cnn_internals.cpp:384:         for (int oh = 0; oh < output_h; ++oh) {        // oh ABOVE oc: input rows
	add	x0, x0, x1	// ivtmp.4154, ivtmp.4154, _12516
	ldr	x1, [sp, 1592]	// ivtmp.4159, %sfp
	add	x1, x1, x2	// ivtmp.4159, ivtmp.4159, IW
	str	x1, [sp, 1592]	// ivtmp.4159, %sfp
	ldr	w1, [sp, 1688]	//, %sfp
	cmp	w1, w9	// OH, oh
	bne	.L656		//,
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	ldr	x0, [sp, 1616]	// ivtmp.4163, %sfp
	mov	x7, x23	// _8075, _8075
	mov	w4, w16	// b, b
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	w4, w4, 1	// b, b,
	mov	x8, x10	// _363, _363
	ldr	w1, [sp, 1728]	//, %sfp
	mov	x27, x24	// _7078, _7078
	mov	w10, w5	// in_size, in_size
	mov	x6, x17	// _3295, _3295
	mov	x3, x14	// _8995, _8995
	ldr	x23, [sp, 1552]	// _2172, %sfp
	mov	x16, x19	// _9289, _9289
// src/cpp/cnn_internals.cpp:380:     for (int b = 0; b < batches; ++b) {
	add	x20, x20, x17	// ivtmp.4166, ivtmp.4166, _3295
	add	x0, x0, x7	// ivtmp.4163, ivtmp.4163, _8075
	ldr	x24, [sp, 1656]	// _9223, %sfp
	str	x0, [sp, 1616]	// ivtmp.4163, %sfp
	ldr	x0, [sp, 1472]	// ivtmp.4164, %sfp
	ldr	w12, [sp, 1688]	//, %sfp
	add	x0, x0, x14	// ivtmp.4164, ivtmp.4164, _8995
	str	x0, [sp, 1472]	// ivtmp.4164, %sfp
	cmp	w1, w4	// _13, b
	bne	.L700		//,
	b	.L1185		//
	.p2align 2,,3
.L1220:
	mov	x0, x22	// _2196, _2196
	mov	x22, x13	// ivtmp.4166, ivtmp.4166
	str	x17, [sp, 168]	// _3295, %sfp
	mov	w13, w26	// IC, IC
	mov	x17, x11	// _363, _363
	mov	x26, x0	// _2196, _2196
	.p2align 5,,15
.L685:
	cmp	w19, 2	// _6773,
	bls	.L905		//,
	add	x0, x27, x7, lsl 2	// vectp.2047, _63, ivtmp.3973,
	movi	v30.4s, 0	// vect_acc_0_7_88.2045
	ldr	q7, [x1]	// vectp.2073__lsm0.3595, MEM <const vector(4) float> [(const float *)vectp.2050_7288]
	add	x11, x1, 28	// vectp.2092, ivtmp.3976,
	str	w15, [sp, 272]	// KW, %sfp
	mov	w15, w13	// IC, IC
	mov	x13, x28	// in_ptr, in_ptr
	ldr	q8, [x1, 4]	// vectp.2079__lsm0.3594, MEM <const vector(4) float> [(const float *)vectp.2050_7288 + 4B]
	mov	x28, x27	// _63, _63
	str	x0, [sp, 256]	// vectp.2047, %sfp
	add	x0, x1, 16	// vectp.2074, ivtmp.3976,
	ldr	q9, [x1, 8]	// vectp.2085__lsm0.3593, MEM <const vector(4) float> [(const float *)vectp.2050_7288 + 8B]
	mov	v15.16b, v30.16b	// vect_acc_0_6_1385.2044, vect_acc_0_7_88.2045
	mov	v16.16b, v30.16b	// vect_acc_0_5_1367.2043, vect_acc_0_7_88.2045
	str	x0, [sp, 240]	// vectp.2074, %sfp
	add	x0, x1, 20	// vectp.2080, ivtmp.3976,
	mov	v17.16b, v30.16b	// vect_acc_0_4_1398.2042, vect_acc_0_7_88.2045
	mov	v18.16b, v30.16b	// vect_acc_0_3_1403.2041, vect_acc_0_7_88.2045
	ldr	q10, [x1, 12]	// vectp.2091__lsm0.3592, MEM <const vector(4) float> [(const float *)vectp.2050_7288 + 12B]
	mov	v19.16b, v30.16b	// vect_acc_0_2_152.2040, vect_acc_0_7_88.2045
	mov	v20.16b, v30.16b	// vect_acc_0_1_1410.2039, vect_acc_0_7_88.2045
	str	x0, [sp, 224]	// vectp.2080, %sfp
	add	x0, x1, 24	// vectp.2086, ivtmp.3976,
	mov	v27.16b, v30.16b	// vect_acc_0_0_1392.2038, vect_acc_0_7_88.2045
	str	x0, [sp, 216]	// vectp.2086, %sfp
	mov	x0, 0	// ivtmp.3951,
	b	.L683		//
	.p2align 2,,3
.L906:
	mov	v7.16b, v11.16b	// vectp.2073__lsm0.3595, MEM <const vector(4) float> [(const float *)vectp.2074_7237 + ivtmp.3951_9408 * 1]
	mov	v8.16b, v12.16b	// vectp.2079__lsm0.3594, MEM <const vector(4) float> [(const float *)vectp.2080_7224 + ivtmp.3951_9408 * 1]
	mov	v9.16b, v13.16b	// vectp.2085__lsm0.3593, MEM <const vector(4) float> [(const float *)vectp.2086_7211 + ivtmp.3951_9408 * 1]
	mov	v10.16b, v14.16b	// vectp.2091__lsm0.3592, MEM <const vector(4) float> [(const float *)vectp.2092_7198 + ivtmp.3951_9408 * 1]
.L683:
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	x27, [sp, 256]	// vectp.2047, %sfp
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q14, [x11, x0]	// MEM <const vector(4) float> [(const float *)vectp.2092_7198 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2092_7198 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ldr	q29, [x27, x0]	// MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x27, [sp, 240]	// vectp.2074, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v27.4s, v29.4s, v7.4s	// vect_acc_0_0_1392.2038, MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1], vectp.2073__lsm0.3595
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q11, [x27, x0]	// MEM <const vector(4) float> [(const float *)vectp.2074_7237 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2074_7237 + ivtmp.3951_9408 * 1]
	ldr	x27, [sp, 224]	// vectp.2080, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v20.4s, v29.4s, v8.4s	// vect_acc_0_1_1410.2039, MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1], vectp.2079__lsm0.3594
	fmla	v19.4s, v9.4s, v29.4s	// vect_acc_0_2_152.2040, vectp.2085__lsm0.3593, MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q12, [x27, x0]	// MEM <const vector(4) float> [(const float *)vectp.2080_7224 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2080_7224 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v18.4s, v10.4s, v29.4s	// vect_acc_0_3_1403.2041, vectp.2091__lsm0.3592, MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	x27, [sp, 216]	// vectp.2086, %sfp
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v30.4s, v14.4s, v29.4s	// vect_acc_0_7_88.2045, MEM <const vector(4) float> [(const float *)vectp.2092_7198 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ldr	q13, [x27, x0]	// MEM <const vector(4) float> [(const float *)vectp.2086_7211 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2086_7211 + ivtmp.3951_9408 * 1]
	add	x0, x0, 16	// ivtmp.3951, ivtmp.3951,
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	fmla	v17.4s, v11.4s, v29.4s	// vect_acc_0_4_1398.2042, MEM <const vector(4) float> [(const float *)vectp.2074_7237 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
	ldr	x27, [sp, 1544]	// _7048, %sfp
	fmla	v16.4s, v12.4s, v29.4s	// vect_acc_0_5_1367.2043, MEM <const vector(4) float> [(const float *)vectp.2080_7224 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
	fmla	v15.4s, v13.4s, v29.4s	// vect_acc_0_6_1385.2044, MEM <const vector(4) float> [(const float *)vectp.2086_7211 + ivtmp.3951_9408 * 1], MEM <const vector(4) float> [(const float *)vectp.2047_7295 + ivtmp.3951_9408 * 1]
	cmp	x27, x0	// _7048, ivtmp.3951
	bne	.L906		//,
	ldr	w11, [sp, 1608]	//, %sfp
	mov	x27, x28	// _63, _63
	mov	x28, x13	// in_ptr, in_ptr
	faddp	v30.4s, v30.4s, v30.4s	// tmp3179, vect_acc_0_7_88.2045, vect_acc_0_7_88.2045
	mov	w13, w15	// IC, IC
	faddp	v15.4s, v15.4s, v15.4s	// tmp3180, vect_acc_0_6_1385.2044, vect_acc_0_6_1385.2044
	ldr	w15, [sp, 272]	//, %sfp
	faddp	v16.4s, v16.4s, v16.4s	// tmp3181, vect_acc_0_5_1367.2043, vect_acc_0_5_1367.2043
	faddp	v17.4s, v17.4s, v17.4s	// tmp3182, vect_acc_0_4_1398.2042, vect_acc_0_4_1398.2042
	faddp	v18.4s, v18.4s, v18.4s	// tmp3183, vect_acc_0_3_1403.2041, vect_acc_0_3_1403.2041
	mov	w0, w11	// niters_vector_mult_vf.2036, _563
	faddp	v19.4s, v19.4s, v19.4s	// tmp3184, vect_acc_0_2_152.2040, vect_acc_0_2_152.2040
	faddp	v20.4s, v20.4s, v20.4s	// tmp3185, vect_acc_0_1_1410.2039, vect_acc_0_1_1410.2039
	faddp	v27.4s, v27.4s, v27.4s	// tmp3186, vect_acc_0_0_1392.2038, vect_acc_0_0_1392.2038
	faddp	v30.4s, v30.4s, v30.4s	// tmp3179, tmp3179, tmp3179
	faddp	v15.4s, v15.4s, v15.4s	// tmp3180, tmp3180, tmp3180
	faddp	v16.4s, v16.4s, v16.4s	// tmp3181, tmp3181, tmp3181
	faddp	v17.4s, v17.4s, v17.4s	// tmp3182, tmp3182, tmp3182
	faddp	v18.4s, v18.4s, v18.4s	// tmp3183, tmp3183, tmp3183
	faddp	v19.4s, v19.4s, v19.4s	// tmp3184, tmp3184, tmp3184
	faddp	v20.4s, v20.4s, v20.4s	// tmp3185, tmp3185, tmp3185
	faddp	v27.4s, v27.4s, v27.4s	// tmp3186, tmp3186, tmp3186
	fadd	s21, s21, s30	// acc$0$7, acc$0$7, tmp3179
	fadd	s25, s25, s15	// acc$0$6, acc$0$6, tmp3180
	fadd	s31, s31, s16	// bv, bv, tmp3181
	fadd	s24, s24, s17	// acc$0$4, acc$0$4, tmp3182
	fadd	s23, s23, s18	// acc$0$3, acc$0$3, tmp3183
	fadd	s22, s22, s19	// acc$0$2, acc$0$2, tmp3184
	fadd	s26, s26, s20	// acc$0$1, acc$0$1, tmp3185
	fadd	s28, s28, s27	// acc$0$0, acc$0$0, tmp3186
	cmp	w15, w11	// KW, _563
	beq	.L684		//,
.L682:
	uxtw	x11, w0	// _7160, niters_vector_mult_vf.2036
	sub	w0, w15, w0	// bnd.2098_7173, KW, niters_vector_mult_vf.2036
	whilelo	p7.s, wzr, w0	// max_mask_7031,, bnd.2098_7173
	add	x0, x10, x11	// _7149, ivtmp.3974, _7160
	add	x11, x7, x11	// _7159, ivtmp.3973, _7160
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x28, x0, lsl 2]	// vect_xv_7374.2112, max_mask_7031,* in_ptr
// src/cpp/cnn_internals.cpp:341:                     wv[t] = w_row[(std::size_t)t * weight_ch_size + kw];
	ld1w	z30.s, p7/z, [x27, x11, lsl 2]	// vect__7378.2109, max_mask_7031,* _63
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11383, max_mask_7031
	fmul	z29.s, p7/m, z29.s, z30.s	// _11383, max_mask_7031, vect__7378.2109
	lsl	x0, x0, 2	// _7148, _7149,
	faddv	s29, p6, z29.s	// _7141, tmp4437, _11383
	fadd	s28, s28, s29	// acc$0$0, acc$0$0, _7141
	add	x11, x0, 8	// _7118, _7148,
	str	x11, [sp, 216]	// _7118, %sfp
	add	x11, x0, 12	// _7103, _7148,
	str	x11, [sp, 224]	// _7103, %sfp
	add	x11, x0, 16	// _7088, _7148,
	str	x11, [sp, 240]	// _7088, %sfp
	add	x11, x0, 20	// _7073, _7148,
	str	x11, [sp, 256]	// _7073, %sfp
	add	x11, x0, 4	// _7133, _7148,
	add	x11, x28, x11	// vectp.2117, in_ptr, _7133
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x11]	// vect_xv_7368.2118, max_mask_7031,* vectp.2117
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11384, max_mask_7031
	fmul	z29.s, p7/m, z29.s, z30.s	// _11384, max_mask_7031, vect__7378.2109
	faddv	s29, p6, z29.s	// _7126, tmp4437, _11384
	fadd	s26, s26, s29	// acc$0$1, acc$0$1, _7126
	add	x11, x0, 24	// _7058, _7148,
	add	x0, x0, 28	// _7043, _7148,
	str	x11, [sp, 272]	// _7058, %sfp
	str	x0, [sp, 288]	// _7043, %sfp
	ldp	x11, x0, [sp, 216]	// _7118, _7103,
	add	x0, x28, x0	// vectp.2129, in_ptr, _7103
	add	x11, x28, x11	// vectp.2123, in_ptr, _7118
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x0]	// vect_xv_7356.2130, max_mask_7031,* vectp.2129
	ld1w	z27.s, p7/z, [x11]	// vect_xv_7362.2124, max_mask_7031,* vectp.2123
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11386, max_mask_7031
	fmul	z29.s, p7/m, z29.s, z30.s	// _11386, max_mask_7031, vect__7378.2109
	ldr	x0, [sp, 256]	// _7073, %sfp
	faddv	s29, p6, z29.s	// _7096, tmp4437, _11386
	movprfx	z27.s, p7/z, z27.s	// _11385, max_mask_7031
	fmul	z27.s, p7/m, z27.s, z30.s	// _11385, max_mask_7031, vect__7378.2109
	fadd	s23, s23, s29	// acc$0$3, acc$0$3, _7096
	faddv	s27, p6, z27.s	// _7111, tmp4437, _11385
	fadd	s22, s22, s27	// acc$0$2, acc$0$2, _7111
	ldr	x11, [sp, 240]	// _7088, %sfp
	add	x0, x28, x0	// vectp.2141, in_ptr, _7073
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x0]	// vect_xv_7344.2142, max_mask_7031,* vectp.2141
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z29.s, p7/z, z29.s	// _11388, max_mask_7031
	fmul	z29.s, p7/m, z29.s, z30.s	// _11388, max_mask_7031, vect__7378.2109
	faddv	s29, p6, z29.s	// _7066, tmp4437, _11388
	fadd	s31, s31, s29	// bv, bv, _7066
	ldr	x0, [sp, 288]	// _7043, %sfp
	add	x11, x28, x11	// vectp.2135, in_ptr, _7088
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z27.s, p7/z, [x11]	// vect_xv_7350.2136, max_mask_7031,* vectp.2135
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z27.s, p7/z, z27.s	// _11387, max_mask_7031
	fmul	z27.s, p7/m, z27.s, z30.s	// _11387, max_mask_7031, vect__7378.2109
	faddv	s27, p6, z27.s	// _7081, tmp4437, _11387
	fadd	s24, s24, s27	// acc$0$4, acc$0$4, _7081
	ldr	x11, [sp, 272]	// _7058, %sfp
	add	x0, x28, x0	// vectp.2153, in_ptr, _7043
// src/cpp/cnn_internals.cpp:346:                     const float xv = x[v];           // ONE contiguous load
	ld1w	z29.s, p7/z, [x0]	// vect_xv_7332.2154, max_mask_7031,* vectp.2153
	add	x11, x28, x11	// vectp.2147, in_ptr, _7058
	ld1w	z27.s, p7/z, [x11]	// vect_xv_7338.2148, max_mask_7031,* vectp.2147
// src/cpp/cnn_internals.cpp:348:                         acc[t][v] += xv * wv[t];
	movprfx	z27.s, p7/z, z27.s	// _11389, max_mask_7031
	fmul	z27.s, p7/m, z27.s, z30.s	// _11389, max_mask_7031, vect__7378.2109
	movprfx	z30.s, p7/z, z30.s	// _11390, max_mask_7031
	fmul	z30.s, p7/m, z30.s, z29.s	// _11390, max_mask_7031, vect_xv_7332.2154
	faddv	s29, p6, z27.s	// _7051, tmp4437, _11389
	faddv	s30, p6, z30.s	// _7036, tmp4437, _11390
	fadd	s25, s25, s29	// acc$0$6, acc$0$6, _7051
	fadd	s21, s21, s30	// acc$0$7, acc$0$7, _7036
.L684:
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	w6, w6, 1	// kh, kh,
// src/cpp/cnn_internals.cpp:334:         for (int kh = 0; kh < kernel_h; ++kh) {
	add	x7, x7, x30	// ivtmp.3973, ivtmp.3973, _9282
	add	x10, x10, x16	// ivtmp.3974, ivtmp.3974, IW
	add	x1, x1, x24	// ivtmp.3976, ivtmp.3976, _7078
	cmp	w18, w6	// KH, kh
	bne	.L685		//,
	mov	x0, x26	// _2196, _2196
	mov	x11, x17	// _363, _363
	ldr	x17, [sp, 168]	// _3295, %sfp
	mov	w26, w13	// IC, IC
	mov	x13, x22	// ivtmp.4166, ivtmp.4166
	mov	x22, x0	// _2196, _2196
	b	.L686		//
.L905:
	mov	w0, 0	// niters_vector_mult_vf.2036,
	b	.L682		//
.L690:
	cmp	w13, 0	// OW,
	ble	.L691		//,
	cmp	w13, 1	// OW,
	beq	.L1221		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	stp	s28, s26, [x3]	// acc$0$0, acc$0$1,* ivtmp.4002
	cmp	w13, 2	// OW,
	beq	.L691		//,
	str	s22, [x3, 8]	// acc$0$2, MEM[(float *)_926 + 8B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 3	// OW,
	beq	.L691		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s23, [x3, 12]	// acc$0$3, MEM[(float *)_926 + 12B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 4	// OW,
	beq	.L691		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s24, [x3, 16]	// acc$0$4, MEM[(float *)_926 + 16B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 5	// OW,
	beq	.L691		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s31, [x3, 20]	// bv, MEM[(float *)_926 + 20B]
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	cmp	w13, 6	// OW,
	beq	.L691		//,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s25, [x3, 24]	// acc$0$6, MEM[(float *)_926 + 24B]
	b	.L691		//
.L680:
	fmov	s21, s31	// acc$0$7, bv
	fmov	s25, s31	// acc$0$6, bv
	fmov	s24, s31	// acc$0$4, bv
	fmov	s23, s31	// acc$0$3, bv
	fmov	s22, s31	// acc$0$2, bv
	fmov	s26, s31	// acc$0$1, bv
	fmov	s28, s31	// acc$0$0, bv
	b	.L689		//
.L1221:
	str	s28, [x3]	// acc$0$0, MEM[(float *)_6387]
	b	.L691		//
.L1196:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x4, 0	// ivtmp.4521,
	mov	x5, x10	// ivtmp.4527, ivtmp.4675
	add	x6, sp, 1840	// tmp4098,,
.L759:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ubfiz	x7, x4, 6, 32	// _2398, ivtmp.4521,,
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x4, x4, 1	// ivtmp.4521, ivtmp.4521,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x6, x7]	// tmp9318, MEM[(float *)_520 + _2398 * 1]
	str	s31, [x5]	// tmp9318, MEM[(float *)_4197]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x5, x5, x0	// ivtmp.4527, ivtmp.4527, _565
	cmp	x4, 3	// ivtmp.4521,
	bne	.L759		//,
	b	.L757		//
.L1219:
	add	x8, sp, 1840	// ivtmp.4018,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x0, x3	// ivtmp.4019, ivtmp.4143
	mov	w9, 6	// ivtmp_8470,
.L671:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x8], 32	// vect__9438.3731, MEM <vector(2) float> [(float *)_10714]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	subs	w9, w9, #1	// ivtmp_8470, ivtmp_8470,
	ldr	x12, [sp, 1600]	// _10401, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	d31, [x0]	// vect__9438.3731, MEM <vector(2) float> [(float *)_10664]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x0, x0, x12	// ivtmp.4019, ivtmp.4019, _10401
	bne	.L671		//,
	b	.L667		//
.L1218:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x0, 0	// ivtmp.4005,
	mov	x8, x3	// ivtmp.4011, ivtmp.4143
	add	x9, sp, 1840	// tmp4098,,
.L669:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ubfiz	x12, x0, 5, 32	// _10688, ivtmp.4005,,
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x0, x0, 1	// ivtmp.4005, ivtmp.4005,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x9, x12]	// tmp8204, MEM[(float *)_520 + _10688 * 1]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	ldr	x12, [sp, 1600]	// _10401, %sfp
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	s31, [x8]	// tmp8204, MEM[(float *)_10691]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x8, x8, x12	// ivtmp.4011, ivtmp.4011, _10401
	cmp	x0, 6	// ivtmp.4005,
	bne	.L669		//,
	b	.L667		//
.L627:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [sp, 304]	// acc$1$0, %sfp
	ldr	x0, [sp, 864]	// ivtmp.3914, %sfp
	ldr	x1, [sp, 880]	// ivtmp.3921, %sfp
	str	s31, [x0]	// acc$1$0, MEM[(float *)_4499]
	ldr	s31, [sp, 288]	// acc$2$0, %sfp
	str	s31, [x1, x19]	// acc$2$0, MEM[(float *)_5598 + _4482 * 1]
	ldr	s31, [sp, 272]	// acc$3$0, %sfp
	str	s31, [x0, x19]	// acc$3$0, MEM[(float *)_4499 + _4482 * 1]
	ldr	s31, [sp, 256]	// acc$4$0, %sfp
	str	s31, [x1, x20]	// acc$4$0, MEM[(float *)_5598 + _5031 * 1]
	ldr	s31, [sp, 240]	// acc$5$0, %sfp
	str	s31, [x0, x20]	// acc$5$0, MEM[(float *)_4499 + _5031 * 1]
	ldr	s31, [sp, 224]	// acc$6$0, %sfp
	str	s31, [x1, x9]	// acc$6$0, MEM[(float *)_5598 + _4964 * 1]
	ldr	s31, [sp, 216]	// acc$7$0, %sfp
	str	s31, [x0, x9]	// acc$7$0, MEM[(float *)_4499 + _4964 * 1]
	b	.L626		//
.L1215:
	str	s25, [x2]	// acc$0$0, MEM[(float *)_2142]
	b	.L736		//
.L1214:
	add	x6, sp, 1840	// ivtmp.4289,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x5, x2	// ivtmp.4290, ivtmp.4415
	mov	w9, 4	// ivtmp_8116,
.L716:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x6], 48	// vect__9244.3717, MEM <vector(2) float> [(float *)_4564]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	subs	w9, w9, #1	// ivtmp_8116, ivtmp_8116,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	d31, [x5]	// vect__9244.3717, MEM <vector(2) float> [(float *)_4571]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x5, x5, x17	// ivtmp.4290, ivtmp.4290, _4600
	bne	.L716		//,
	b	.L712		//
.L1213:
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x5, 0	// ivtmp.4276,
	mov	x6, x2	// ivtmp.4282, ivtmp.4415
	add	x9, sp, 1840	// tmp4098,,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	mov	w30, 48	// tmp3298,
.L714:
	umull	x18, w5, w30	// _4515, ivtmp.4276, tmp3298
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x5, x5, 1	// ivtmp.4276, ivtmp.4276,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	s31, [x9, x18]	// tmp8737, MEM[(float *)_520 + _4515 * 1]
	str	s31, [x6]	// tmp8737, MEM[(float *)_4516]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x6, x6, x17	// ivtmp.4282, ivtmp.4282, _4600
	cmp	x5, 4	// ivtmp.4276,
	bne	.L714		//,
	b	.L712		//
	.p2align 2,,3
.L1190:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:413: 	{ *__to = *__from; }
	ldr	s31, [x28]	// tmp7276, MEM[(const float *)_48]
	str	s31, [x0]	// tmp7276, *_143
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_algobase.h:413: 	{ *__to = *__from; }
	b	.L603		//
	.p2align 2,,3
.L1212:
	mov	w11, w19	// _12503, _12503
// src/cpp/cnn_internals.cpp:392:             for (; oc0 < out_channels; ++oc0)          // remainder channels
	mov	w3, 0	// oc0,
	mov	x19, x7	// ivtmp.5013, ivtmp.5013
	mov	x7, x26	// ivtmp.5018, ivtmp.5018
	mov	x26, x21	// _7827, _7827
	mov	w21, w4	// OH, OH
	mov	w4, w23	// b, b
	mov	w23, w13	// OW, OW
	b	.L876		//
.L1206:
	mov	x0, x21	// _7891, _7891
	mov	w5, w23	// b, b
	mov	x11, x26	// ivtmp.4912, ivtmp.4912
	mov	w23, w13	// OW, OW
	mov	w21, w4	// OH, OH
	mov	w13, w19	// _12273, _12273
	mov	w3, 0	// oc0,
	mov	w26, w14	// in_size, in_size
	mov	x19, x6	// ivtmp.4907, ivtmp.4907
	mov	x4, x0	// _7891, _7891
	b	.L842		//
.L1200:
	mov	x0, x21	// _7955, _7955
	mov	w4, w23	// b, b
	mov	x5, x26	// ivtmp.4806, ivtmp.4806
	mov	w21, w3	// OH, OH
	mov	w11, w19	// _12047, _12047
	mov	w2, 0	// oc0,
	mov	w23, w13	// OW, OW
	mov	w26, w14	// in_size, in_size
	mov	x19, x6	// ivtmp.4801, ivtmp.4801
	mov	x3, x0	// _7955, _7955
	b	.L808		//
.L1197:
	.cfi_offset 72, -1968
	.cfi_offset 73, -1960
	.cfi_offset 74, -1952
	.cfi_offset 75, -1944
	.cfi_offset 76, -1936
	.cfi_offset 77, -1928
	.cfi_offset 78, -1920
	.cfi_offset 79, -1912
	add	x5, sp, 1840	// ivtmp.4534,,
// src/cpp/cnn_internals.cpp:338:             for (int kw = 0; kw < kernel_w; ++kw) {
	mov	x4, x10	// ivtmp.4535, ivtmp.4675
	mov	w6, 3	// ivtmp_2827,
.L761:
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	ldr	d31, [x5], 64	// vect__8993.3703, MEM <vector(2) float> [(float *)_2423]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	subs	w6, w6, #1	// ivtmp_2827, ivtmp_2827,
// src/cpp/cnn_internals.cpp:359:             if (v < output_w) o[v] = acc[t][v];
	str	d31, [x4]	// vect__8993.3703, MEM <vector(2) float> [(float *)_2261]
// src/cpp/cnn_internals.cpp:354:     for (int t = 0; t < OC_T; ++t) {
	add	x4, x4, x0	// ivtmp.4535, ivtmp.4535, _565
	bne	.L761		//,
	b	.L757		//
.L923:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1037: 	  _M_fill_insert(end(), __new_size - size(), __x);
	ldr	x2, [sp, 1808]	// padded$_M_start, MEM <float *> [(struct vector *)&padded]
	mov	x19, x0	// tmp4086, tmp4609
	ldr	x1, [sp, 1824]	// padded$_M_end_of_storage, MEM <float *> [(struct vector *)&padded + 16B]
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:369: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	sub	x1, x1, x2	// _70, padded$_M_end_of_storage, padded$_M_start
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:388: 	if (__p)
	cbz	x2, .L601	// padded$_M_start,
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/new_allocator.h:172: 	_GLIBCXX_OPERATOR_DELETE(_GLIBCXX_SIZED_DEALLOC(__p, __n));
	mov	x0, x2	//, padded$_M_start
	bl	_ZdlPvm		//
.L601:
	mov	x0, x19	//, tmp4086
	stp	d8, d9, [sp, 96]	//,,
	.cfi_offset 73, -1960
	.cfi_offset 72, -1968
	stp	d10, d11, [sp, 112]	//,,
	.cfi_offset 75, -1944
	.cfi_offset 74, -1952
	stp	d12, d13, [sp, 128]	//,,
	.cfi_offset 77, -1928
	.cfi_offset 76, -1936
	stp	d14, d15, [sp, 144]	//,,
	.cfi_offset 79, -1912
	.cfi_offset 78, -1920
.LEHB2:
	bl	_Unwind_Resume		//
.LEHE2:
.L922:
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 78
	.cfi_restore 79
// src/cpp/cnn_internals.cpp:454:         padded.resize(numel + slack, 0.0f);
	mov	x19, x0	// tmp4086, tmp4608
	b	.L601		//
.L1189:
// /user-environment/linux-neoverse_v2/gcc-14.2.0-ovez6ffqfi4256sigothvjlis6onlz4h/lib/gcc/aarch64-unknown-linux-gnu/14.2.0/../../../../include/c++/14.2.0/bits/stl_vector.h:1920: 	  __throw_length_error(
	adrp	x0, .LC0	// tmp2929,
	add	x0, x0, :lo12:.LC0	//, tmp2929,
.LEHB3:
	bl	_ZSt20__throw_length_errorPKc		//
.LEHE3:
	.cfi_endproc
.LFE1536:
	.section	.gcc_except_table,"a",@progbits
.LLSDA1536:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1536-.LLSDACSB1536
.LLSDACSB1536:
	.uleb128 .LEHB0-.LFB1536
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L922-.LFB1536
	.uleb128 0
	.uleb128 .LEHB1-.LFB1536
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L923-.LFB1536
	.uleb128 0
	.uleb128 .LEHB2-.LFB1536
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB1536
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L922-.LFB1536
	.uleb128 0
.LLSDACSE1536:
	.text
	.size	_Z34conv2d_forward_specialized_blockedRK6TensorS1_S1_RS_, .-_Z34conv2d_forward_specialized_blockedRK6TensorS1_S1_RS_
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.global	__gxx_personality_v0
	.ident	"GCC: (Spack GCC) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
