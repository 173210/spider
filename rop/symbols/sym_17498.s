.macro AddSym name, addr
	.global	\name
\name = \addr
.endm

.macro AddFunc name, addr
	AddSym	\name, \addr
	.type	\name, %function
.endm

	AddFunc	fGSPGPU_FlushDataCache, 0x344C2C
	AddFunc	f_nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue, 0x2CF3EC
	AddFunc	fSvcSleepThread, 0x2A513C
	AddSym	gFS_MountSdmc, 0x332BEC
	AddSym	gIFile_Open, 0x25B0A8
	AddSym	gIFile_Read, 0x2FC8E8
	AddSym	gPop_pc, 0x10DB6C
	AddSym	gPop_lr_pc, 0x2D6A34
	AddSym	gPop_r0_pc, 0x2AD574
	AddSym	gPop_r1_pc, 0x269758
	AddSym	gPop_r0__r4_pc, 0x29C170
	AddSym	gPop_r0__r4_r7_pc, 0x17943B
	AddSym	hGsp, 0x3B643C
	AddSym	nn__gxlow__CTR__detail__GetInterruptReceiver, 0x3F54E8 + 0x58
	AddSym	s_dmc, 0x2A5F27
