.data
  prompt_msg:    .asciiz "Please enter an integer N (N >= 22): "
  error_msg:     .asciiz "Illegal Number! "
  newline:       .asciiz "\n"
  space:         .asciiz " "

.text
.globl main

main:
    # Initialize program
    li $v0, 4                   # system call for print string
    la $a0, prompt_msg          # load address of prompt message
    syscall                     # print prompt

input_loop:
    # Read integer from user
    li $v0, 5                   # system call for read integer
    syscall                     # read integer into $v0
    move $t0, $v0               # store input in $t0 (N)
