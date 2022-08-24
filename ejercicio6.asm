div(int, int):
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        sw      $5,12($fp)
        lw      $3,8($fp)
        lw      $2,12($fp)
        nop
        div     $0,$3,$2
        bne     $2,$0,1f
        nop
        break   7
        mfhi    $2
        mflo    $2
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

div4(int):
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        lw      $2,8($fp)
        nop
        bgez    $2,$L4
        nop

        addiu   $2,$2,3
$L4:
        sra     $2,$2,2
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

$LC0:
        .ascii  "abcdef\000"
main:
        addiu   $sp,$sp,-64
        sw      $31,60($sp)
        sw      $fp,56($sp)
        move    $fp,$sp
        lui     $2,%hi($LC0)
        addiu   $2,$2,%lo($LC0)
        sw      $2,24($fp)
        li      $2,11148                    # 0x2b8c
        sw      $2,28($fp)
        lw      $2,28($fp)
        nop
        bgez    $2,$L7
        nop

        addiu   $2,$2,7
$L7:
        sra     $2,$2,3
        sw      $2,32($fp)
        lw      $2,28($fp)
        nop
        bgez    $2,$L8
        nop

        addiu   $2,$2,3
$L8:
        sra     $2,$2,2
        sw      $2,36($fp)
        lw      $2,28($fp)
        nop
        srl     $3,$2,31
        addu    $2,$3,$2
        sra     $2,$2,1
        sw      $2,40($fp)
        li      $5,4                        # 0x4
        li      $4,5                        # 0x5
        jal     div(int, int)
        nop

        sw      $2,44($fp)
        li      $4,5                        # 0x5
        jal     div4(int)
        nop

        sw      $2,48($fp)
        move    $2,$0
        move    $sp,$fp
        lw      $31,60($sp)
        lw      $fp,56($sp)
        addiu   $sp,$sp,64
        jr      $31
        nop