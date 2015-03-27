.macro AddSym name, addr
	.global	\name
\name = \addr
.endm

.macro AddFunc name, addr
	AddSym	\name, \addr
	.type	\name, %function
.endm

	AddFunc	fGSPGPU_FlushDataCache, 0x12C228
	AddFunc	f_nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue, 0x12BF4C
	AddFunc	fSvcSleepThread, 0x10420C
	AddSym	gFS_MountSdmc, 0x19CA2C
	AddSym	gIFile_Open, 0x22FE48
	AddSym	gIFile_Read, 0x1686C4
	AddSym	gPop_pc, 0x1057C4
	AddSym	gPop_lr_pc, 0x1303A4
	AddSym	gPop_r0_pc, 0x10C320
	AddSym	gPop_r1_pc, 0x228B10
	AddSym	gPop_r0__r4_pc, 0x12A3D4
	AddSym	gPop_r0__r4_r7_pc, 0x1946E3
	AddSym	hGsp, 0x3DA72C
	AddSym	nn__gxlow__CTR__detail__GetInterruptReceiver, 0x3D7C40 + 0x58
	AddSym	s_dmc, 0x1050CB
	AddSym	unk, 0x13038C
