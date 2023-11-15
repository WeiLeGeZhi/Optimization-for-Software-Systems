	.text
	.file	"example4.c"
	.globl	test                            # -- Begin function test
	.p2align	4, 0x90
	.type	test,@function
test:                                   # @test
.Lfunc_begin0:
	.file	0 "/home/wenzhaohe/Desktop/Optimization-for-Software-Systems/Assignment 4/A4-Code/recitation3" "example4.c" md5 0xdee7868a491240082d8d416269f09af0
	.loc	0 10 0                          # example4.c:10:0
	.cfi_startproc
# %bb.0:
	#DEBUG_VALUE: test:a <- $rdi
	#DEBUG_VALUE: test:x <- $rdi
	xorpd	%xmm0, %xmm0
	xorl	%eax, %eax
.Ltmp0:
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	xorpd	%xmm1, %xmm1
.Ltmp1:
	.p2align	4, 0x90
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: test:a <- $rdi
	#DEBUG_VALUE: test:x <- $rdi
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	.loc	0 18 7 prologue_end             # example4.c:18:7
	addpd	(%rdi,%rax,8), %xmm0
	addpd	16(%rdi,%rax,8), %xmm1
	addpd	32(%rdi,%rax,8), %xmm0
	addpd	48(%rdi,%rax,8), %xmm1
	addpd	64(%rdi,%rax,8), %xmm0
	addpd	80(%rdi,%rax,8), %xmm1
	addpd	96(%rdi,%rax,8), %xmm0
	addpd	112(%rdi,%rax,8), %xmm1
.Ltmp2:
	.loc	0 17 26                         # example4.c:17:26
	addq	$16, %rax
	cmpq	$65536, %rax                    # imm = 0x10000
	jne	.LBB0_1
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: test:a <- $rdi
	#DEBUG_VALUE: test:x <- $rdi
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	.loc	0 17 3 is_stmt 0                # example4.c:17:3
	addpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	addsd	%xmm1, %xmm0
.Ltmp4:
	.loc	0 20 3 is_stmt 1                # example4.c:20:3
	retq
.Ltmp5:
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI1_0:
	.long	0                               # 0x0
	.long	1                               # 0x1
	.zero	4
	.zero	4
.LCPI1_1:
	.quad	0x3ff0000000000000              # double 1
	.quad	0x3ff0000000000000              # double 1
.LCPI1_2:
	.long	2                               # 0x2
	.long	2                               # 0x2
	.zero	4
	.zero	4
.LCPI1_3:
	.long	4                               # 0x4
	.long	4                               # 0x4
	.zero	4
	.zero	4
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	0 23 0                          # example4.c:23:0
	.cfi_startproc
# %bb.0:
	subq	$524312, %rsp                   # imm = 0x80018
	.cfi_def_cfa_offset 524320
	movdqa	.LCPI1_0(%rip), %xmm0           # xmm0 = <0,1,u,u>
	xorl	%eax, %eax
	#DEBUG_VALUE: i <- 0
	movapd	.LCPI1_1(%rip), %xmm1           # xmm1 = [1.0E+0,1.0E+0]
	movdqa	.LCPI1_2(%rip), %xmm2           # xmm2 = <2,2,u,u>
	movdqa	.LCPI1_3(%rip), %xmm3           # xmm3 = <4,4,u,u>
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
.Ltmp6:
	#DEBUG_VALUE: i <- 0
	.loc	0 26 17 prologue_end            # example4.c:26:17
	cvtdq2pd	%xmm0, %xmm4
	.loc	0 26 22 is_stmt 0               # example4.c:26:22
	addpd	%xmm1, %xmm4
	.loc	0 26 15                         # example4.c:26:15
	movapd	%xmm1, %xmm5
	divpd	%xmm4, %xmm5
	.loc	0 26 10                         # example4.c:26:10
	movapd	%xmm5, 16(%rsp,%rax,8)
	.loc	0 26 17                         # example4.c:26:17
	movdqa	%xmm0, %xmm4
	paddd	%xmm2, %xmm4
	cvtdq2pd	%xmm4, %xmm4
	.loc	0 26 22                         # example4.c:26:22
	addpd	%xmm1, %xmm4
	.loc	0 26 15                         # example4.c:26:15
	movapd	%xmm1, %xmm5
	divpd	%xmm4, %xmm5
	.loc	0 26 10                         # example4.c:26:10
	movapd	%xmm5, 32(%rsp,%rax,8)
.Ltmp7:
	.loc	0 25 30 is_stmt 1               # example4.c:25:30
	addq	$4, %rax
.Ltmp8:
	.loc	0 26 17                         # example4.c:26:17
	paddd	%xmm3, %xmm0
.Ltmp9:
	.loc	0 25 30                         # example4.c:25:30
	cmpq	$65536, %rax                    # imm = 0x10000
	jne	.LBB1_1
.Ltmp10:
# %bb.2:
	#DEBUG_VALUE: i <- 0
	.loc	0 0 30 is_stmt 0                # example4.c:0:30
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	#DEBUG_VALUE: test:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:x <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	xorpd	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
.Ltmp11:
	#DEBUG_VALUE: test:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:x <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	.loc	0 18 7 is_stmt 1                # example4.c:18:7
	addpd	16(%rsp,%rax,8), %xmm0
	addpd	32(%rsp,%rax,8), %xmm1
	addpd	48(%rsp,%rax,8), %xmm0
	addpd	64(%rsp,%rax,8), %xmm1
	addpd	80(%rsp,%rax,8), %xmm0
	addpd	96(%rsp,%rax,8), %xmm1
	addpd	112(%rsp,%rax,8), %xmm0
	addpd	128(%rsp,%rax,8), %xmm1
.Ltmp12:
	.loc	0 17 26                         # example4.c:17:26
	addq	$16, %rax
	cmpq	$65536, %rax                    # imm = 0x10000
	jne	.LBB1_3
.Ltmp13:
# %bb.4:
	#DEBUG_VALUE: test:a <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:x <- [DW_OP_plus_uconst 16, DW_OP_stack_value] $rsp
	#DEBUG_VALUE: test:y <- 0.000000e+00
	#DEBUG_VALUE: test:i <- 0
	.loc	0 17 3 is_stmt 0                # example4.c:17:3
	addpd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm0                    # xmm0 = xmm0[1],xmm1[1]
	addsd	%xmm1, %xmm0
.Ltmp14:
	#DEBUG_VALUE: main:sum <- $xmm0
	.loc	0 0 3                           # example4.c:0:3
	movapd	%xmm0, (%rsp)                   # 16-byte Spill
.Ltmp15:
	#DEBUG_VALUE: main:sum <- [$rsp+0]
	.loc	0 29 3 is_stmt 1                # example4.c:29:3
	leaq	.L.str(%rip), %rdi
	movb	$1, %al
	callq	printf@PLT
.Ltmp16:
	.loc	0 30 3                          # example4.c:30:3
	leaq	.L.str.1(%rip), %rdi
	movaps	(%rsp), %xmm0                   # 16-byte Reload
.Ltmp17:
	#DEBUG_VALUE: main:sum <- $xmm0
	movb	$1, %al
	callq	printf@PLT
.Ltmp18:
	#DEBUG_VALUE: main:sum <- [$rsp+0]
	.loc	0 31 1                          # example4.c:31:1
	xorl	%eax, %eax
	addq	$524312, %rsp                   # imm = 0x80018
	.cfi_def_cfa_offset 8
	retq
.Ltmp19:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
	.file	1 "/usr/lib/llvm-14/lib/clang/14.0.0/include" "stddef.h" md5 0x2499dd2361b915724b073282bea3a7bc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The decimal floating point sum result is: %f\n"
	.size	.L.str, 46

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"The raw floating point sum result is: %a\n"
	.size	.L.str.1, 42

	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.short	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.long	1                               # Offset entry count
.Lloclists_table_base0:
	.long	.Ldebug_loc0-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp14-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp15-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	97                              # DW_OP_reg17
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp17-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	0                               # 0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp17-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp18-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	97                              # DW_OP_reg17
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp18-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	0                               # 0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	28                              # DW_AT_const_value
	.byte	15                              # DW_FORM_udata
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	39                              # DW_AT_prototyped
	.byte	25                              # DW_FORM_flag_present
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	32                              # DW_AT_inline
	.byte	33                              # DW_FORM_implicit_const
	.byte	1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	28                              # DW_AT_const_value
	.byte	13                              # DW_FORM_sdata
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	29                              # DW_TAG_inlined_subroutine
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	88                              # DW_AT_call_file
	.byte	11                              # DW_FORM_data1
	.byte	89                              # DW_AT_call_line
	.byte	11                              # DW_FORM_data1
	.byte	87                              # DW_AT_call_column
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	20                              # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	21                              # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0xfd DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	12                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.long	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x27 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.long	78                              # DW_AT_abstract_origin
	.byte	3                               # Abbrev [3] 0x33:0x7 DW_TAG_formal_parameter
	.byte	1                               # DW_AT_location
	.byte	85
	.long	86                              # DW_AT_abstract_origin
	.byte	4                               # Abbrev [4] 0x3a:0x7 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	85
	.long	94                              # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0x41:0x6 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.long	102                             # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0x47:0x6 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.long	110                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	6                               # Abbrev [6] 0x4e:0x29 DW_TAG_subprogram
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	119                             # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	7                               # Abbrev [7] 0x56:0x8 DW_TAG_formal_parameter
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	123                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x5e:0x8 DW_TAG_variable
	.byte	6                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.long	128                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x66:0x8 DW_TAG_variable
	.byte	7                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	15                              # DW_AT_decl_line
	.long	119                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x6e:0x8 DW_TAG_variable
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	133                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x77:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	10                              # Abbrev [10] 0x7b:0x5 DW_TAG_restrict_type
	.long	128                             # DW_AT_type
	.byte	11                              # Abbrev [11] 0x80:0x5 DW_TAG_pointer_type
	.long	119                             # DW_AT_type
	.byte	12                              # Abbrev [12] 0x85:0x8 DW_TAG_typedef
	.long	141                             # DW_AT_type
	.byte	10                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	9                               # Abbrev [9] 0x8d:0x4 DW_TAG_base_type
	.byte	9                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	13                              # Abbrev [13] 0x91:0x60 DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	11                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	23                              # DW_AT_decl_line
	.long	241                             # DW_AT_type
                                        # DW_AT_external
	.byte	14                              # Abbrev [14] 0xa0:0xb DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	145
	.byte	16
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.long	245                             # DW_AT_type
	.byte	15                              # Abbrev [15] 0xab:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.byte	14                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	28                              # DW_AT_decl_line
	.long	119                             # DW_AT_type
	.byte	16                              # Abbrev [16] 0xb4:0x10 DW_TAG_lexical_block
	.byte	2                               # DW_AT_low_pc
	.long	.Ltmp10-.Ltmp6                  # DW_AT_high_pc
	.byte	17                              # Abbrev [17] 0xba:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	25                              # DW_AT_decl_line
	.long	241                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0xc4:0x2c DW_TAG_inlined_subroutine
	.long	78                              # DW_AT_abstract_origin
	.byte	3                               # DW_AT_low_pc
	.long	.Ltmp15-.Ltmp11                 # DW_AT_high_pc
	.byte	0                               # DW_AT_call_file
	.byte	28                              # DW_AT_call_line
	.byte	16                              # DW_AT_call_column
	.byte	3                               # Abbrev [3] 0xd1:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	145
	.byte	16
	.byte	159
	.long	86                              # DW_AT_abstract_origin
	.byte	4                               # Abbrev [4] 0xda:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.byte	16
	.byte	159
	.long	94                              # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0xe3:0x6 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.long	102                             # DW_AT_abstract_origin
	.byte	5                               # Abbrev [5] 0xe9:0x6 DW_TAG_variable
	.byte	0                               # DW_AT_const_value
	.long	110                             # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0xf1:0x4 DW_TAG_base_type
	.byte	12                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	19                              # Abbrev [19] 0xf5:0xf DW_TAG_array_type
	.long	119                             # DW_AT_type
	.byte	20                              # Abbrev [20] 0xfa:0x9 DW_TAG_subrange_type
	.long	260                             # DW_AT_type
	.long	65536                           # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	21                              # Abbrev [21] 0x104:0x4 DW_TAG_base_type
	.byte	13                              # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	64                              # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 14.0.0-1ubuntu1.1" # string offset=0
.Linfo_string1:
	.asciz	"example4.c"                    # string offset=39
.Linfo_string2:
	.asciz	"/home/wenzhaohe/Desktop/Optimization-for-Software-Systems/Assignment 4/A4-Code/recitation3" # string offset=50
.Linfo_string3:
	.asciz	"test"                          # string offset=141
.Linfo_string4:
	.asciz	"double"                        # string offset=146
.Linfo_string5:
	.asciz	"a"                             # string offset=153
.Linfo_string6:
	.asciz	"x"                             # string offset=155
.Linfo_string7:
	.asciz	"y"                             # string offset=157
.Linfo_string8:
	.asciz	"i"                             # string offset=159
.Linfo_string9:
	.asciz	"unsigned long"                 # string offset=161
.Linfo_string10:
	.asciz	"size_t"                        # string offset=175
.Linfo_string11:
	.asciz	"main"                          # string offset=182
.Linfo_string12:
	.asciz	"int"                           # string offset=187
.Linfo_string13:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=191
.Linfo_string14:
	.asciz	"sum"                           # string offset=211
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_begin1
	.quad	.Ltmp6
	.quad	.Ltmp11
.Ldebug_addr_end0:
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
