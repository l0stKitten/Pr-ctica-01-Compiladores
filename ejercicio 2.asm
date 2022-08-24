$LC0:
        .ascii  "abcdef\000"
main:
        addiu   $sp,$sp,-32
        sw      $fp,28($sp)
        move    $fp,$sp
        lui     $2,%hi($LC0)
        addiu   $2,$2,%lo($LC0)
        sw      $2,8($fp)
        li      $2,11148                    # 0x2b8c
        sw      $2,12($fp)
        lw      $2,12($fp)
        nop
        bgez    $2,$L2
        nop

        addiu   $2,$2,7
$L2:
        sra     $2,$2,3
        sw      $2,16($fp)
        move    $2,$0
        move    $sp,$fp
        lw      $fp,28($sp)
        addiu   $sp,$sp,32
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
        bne     $3,$2,$L6
        nop

        lw      $3,36($fp)
        li      $2,65535                    # 0xffff
        bne     $3,$2,$L6
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

$L6:
        nop
        move    $sp,$fp
        lw      $31,28($sp)
        lw      $fp,24($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop

_GLOBAL__sub_I_main:
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