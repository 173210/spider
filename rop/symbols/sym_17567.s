.macro AddSym name, addr
	.global	\name
\name = \addr
.endm

.macro AddFunc name, addr
	AddSym	\name, \addr
	.type	\name, %function
.endm

	AddFunc	fGSPGPU_FlushDataCache, 0x12C1E0
	AddFunc	f_nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue, 0x12BF04
	AddFunc	fSvcSleepThread, 0x1041F8
	AddSym	gFS_MountSdmc, 0x19CA34
	AddSym	gIFile_Open, 0x22FE0C
	AddSym	gIFile_Read, 0x1686E0
	AddSym	gPop_pc, 0x1057C4
	AddSym	gPop_lr_pc, 0x13035C
	AddSym	gPop_r0_pc, 0x10C2Fc
	AddSym	gPop_r1_pc, 0x228AF4
	AddSym	gPop_r0__r4_pc, 0x10B5B4
	AddSym	entry, 0x08B88400
	AddSym	hGsp, 0x3DA72C
	AddSym	nn__gxlow__CTR__detail__GetInterruptReceiver, 0x3D7C40 + 0x58
	AddSym	s_dmc, 0x1050B3
	AddSym	unk, 0x130344
