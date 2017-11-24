.text

#addi $t0, $zero, 0x10010000
#addi $t1, $zero, 0xa
#sw $t1, 0($t0)
#lw $t2, 0($t0)
#addi $t3, $t2, 1
jal BRANCH
addi $t3, $zero, 0xf
j continue
BRANCH:

jr $ra
continue:
add $t3, $zero, $zero
addi $t0, $zero, 5
add $t1, $t0, $zero
addi $t1, $t1, 2
addi $t2, $t1, 3
addi $t3, $t3, 0x10010000
#addi $t2, $zero, 15
sw $t2, 0($t3)
lw $t0, 0($t3)
addi $t1, $t0, 1
#add $s0, $t2, $t1
#sub $s1, $s0, $t3
#lw $t2, 0($t3)
#addi $s2, $s2, -2
#or $s2, $s2, $t4
#sll $s7, $s2, 2
