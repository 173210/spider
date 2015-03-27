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
	AddSym	gFS_MountSdmc, 0x332EC0
	AddSym	gIFile_Open, 0x25B8B0
	AddSym	gIFile_Read, 0x2FA3F4
	AddSym	gPop_pc, 0x1057C4
	AddSym	gPop_lr_pc, 0xDEADBEEF
	AddSym	gPop_r0_pc, 0x2AC058
	AddSym	gPop_r1_pc, 0x26A124
	AddSym	gPop_r0__r4_pc, 0xDEADBEEF
	AddSym	dstPa, 0xDEADBEEF
	AddSym	entry, 0x08B47400
	AddSym	hGsp, 0xDEADBEEF
	AddSym	nn__gxlow__CTR__detail__GetInterruptReceiver, 0xDEADBEEF + 0x58
	AddSym	s_dmc, 0x2A497F
	AddSym	unk, 0x2D5240
