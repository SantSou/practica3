.text
addi $t0, $zero, 0x10010000
addi $t1, $zero, 0xa
sw $t1, 0($t0)
lw $t2, 0($t0)
addi $t3, $t2, 1
