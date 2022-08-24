div4(int):
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        lw      $2,8($fp)
        nop
        bgez    $2,$L2
        nop

        addiu   $2,$2,3
$L2:
        sra     $2,$2,2
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

$LC0:
        .ascii  "abcdef\000"
main:
        addiu   $sp,$sp,-56
        sw      $31,52($sp)
        sw      $fp,48($sp)
        move    $fp,$sp
        lui     $2,%hi($LC0)
        addiu   $2,$2,%lo($LC0)
        sw      $2,24($fp)
        li      $2,11148                    # 0x2b8c
        sw      $2,28($fp)
        lw      $2,28($fp)
        nop
        bgez    $2,$L5
        nop

        addiu   $2,$2,7
$L5:
        sra     $2,$2,3
        sw      $2,32($fp)
        lw      $2,28($fp)
        nop
        bgez    $2,$L6
        nop

        addiu   $2,$2,3
$L6:
        sra     $2,$2,2
        sw      $2,36($fp)
        lw      $2,28($fp)
        nop
        srl     $3,$2,31
        addu    $2,$3,$2
        sra     $2,$2,1
        sw      $2,40($fp)
        li      $4,5                        # 0x5
        jal     div4(int)
        nop

        sw      $2,44($fp)
        move    $2,$0
        move    $sp,$fp
        lw      $31,52($sp)
        lw      $fp,48($sp)
        addiu   $sp,$sp,56
        jr      $31
        nop

__static_initialization_and_destruction_0(int, int):
        addiu   $sp,$sp,-32
        sw      $31,28($sp)
        sw      $fp,24($sp)
        move    $fp,$sp
        sw      $4,32($fp)
        sw      $5,36($fp)
        lw      $3,32($fp)
        li      $2,1                        # 0x1
        bne     $3,$2,$L10
        nop

        lw      $3,36($fp)
        li      $2,65535                    # 0xffff
        bne     $3,$2,$L10
        nop

        lui     $2,%hi(_ZStL8__ioinit)
        addiu   $4,$2,%lo(_ZStL8__ioinit)
        jal     std::ios_base::Init::Init() [complete object constructor]
        nop

        lui     $2,%hi(__dso_handle)
        addiu   $6,$2,%lo(__dso_handle)
        lui     $2,%hi(_ZStL8__ioinit)
        addiu   $5,$2,%lo(_ZStL8__ioinit)
        lui     $2,%hi(_ZNSt8ios_base4InitD1Ev)
        addiu   $4,$2,%lo(_ZNSt8ios_base4InitD1Ev)
        jal     __cxa_atexit
        nop

$L10:
        nop
        move    $sp,$fp
        lw      $31,28($sp)
        lw      $fp,24($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop

_GLOBAL__sub_I_div4(int):
        addiu   $sp,$sp,-32
        sw      $31,28($sp)
        sw      $fp,24($sp)
        move    $fp,$sp
        li      $5,65535                    # 0xffff
        li      $4,1                        # 0x1
        jal     __static_initialization_and_destruction_0(int, int)
        nop

        move    $sp,$fp
        lw      $31,28($sp)
        lw      $fp,24($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop