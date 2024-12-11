	.file	"lab6.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	calculate
	.type	calculate, @function
calculate:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	sw	a2,-28(s0)
	sw	a3,-32(s0)
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	mul	a4,a4,a5
	lw	a3,-28(s0)
	lw	a5,-32(s0)
	div	a5,a3,a5
	add	a5,a4,a5
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	calculate, .-calculate
	.section	.rodata
	.align	2
.LC0:
	.string	"The result of %d * %d + %d / %d is: %d\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	li	a5,7
	sw	a5,-20(s0)
	li	a5,8
	sw	a5,-24(s0)
	li	a5,10
	sw	a5,-28(s0)
	li	a5,5
	sw	a5,-32(s0)
	lw	a3,-32(s0)
	lw	a2,-28(s0)
	lw	a1,-24(s0)
	lw	a0,-20(s0)
	call	calculate
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	lw	a4,-32(s0)
	lw	a3,-28(s0)
	lw	a2,-24(s0)
	lw	a1,-20(s0)
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	li	a5,0
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.ident	"GCC: () 14.2.0"
	.section	.note.GNU-stack,"",@progbits
