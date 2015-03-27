.macro AddSym name, addr
	.global	\name
\name = \addr
.endm

.macro AddFunc name, addr
	AddSym	\name, \addr
	.type	\name, %function
.endm

	AddFunc	fGSPGPU_FlushDataCache, 0xDEADBEEF
	AddFunc	f_nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue, 0xDEADBEEF
	AddFunc	fSvcSleepThread, 0xDEADBEEF
	AddSym	gFS_MountSdmc, 0x333334
	AddSym	gIFile_Open, 0x25BC04
	AddSym	gIFile_Read, 0x2FA868
	AddSym	gPop_pc, 0x1057C4
	AddSym	gPop_lr_pc, 0xDEADBEEF
	AddSym	gPop_r0_pc, 0x2AC330
	AddSym	gPop_r1_pc, 0x26A528
	AddSym	gPop_r0__r4_pc, 0xDEADBEEF
	AddSym	entry, 0x08B46400
	AddSym	hGsp, 0xDEADBEEF
	AddSym	nn__gxlow__CTR__detail__GetInterruptReceiver, 0xDEADBEEF + 0x58
	AddSym	s_dmc, 0x2A4C57
	AddSym	unk, 0x2D5640
