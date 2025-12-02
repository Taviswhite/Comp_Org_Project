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

   # Check if N >= 22
    li $t1, 22                  # load 22 into $t1
    bge $t0, $t1, valid_input   # if N >= 22, go to valid_input

   # Display error message
    li $v0, 4                   # system call for print string
    la $a0, error_msg           # load address of error message
    syscall 

    # Print newline and prompt again
    li $v0, 4                   # system call for print string
    la $a0, newline             # load address of newline
    syscall                     # print newline

    li $v0, 4                   # system call for print string
    la $a0, prompt_msg          # load address of prompt message
    syscall                     # print prompt again
    j input_loop                # jump back to input loop


valid_input:
    # Print newline after valid input
    li $v0, 4                   # system call for print string
    la $a0, newline             # load address of newline
    syscall                     # print newline    

    # Initialize Fibonacci sequence
    li $t1, 0                   # first Fibonacci number (F0)
    li $t2, 1                   # second Fibonacci number (F1)
    li $t3, 2                   # counter for printed numbers

    # Print first Fibonacci number (0)
    li $v0, 1                   # system call for print integer
    move $a0, $t1               # load F0 into $a0
    syscall                     # print F0

    # Print space
    li $v0, 4                   # system call for print string
    la $a0, space               # load address of space
    syscall                     # print space

    # Print second Fibonacci number (1)
    li $v0, 1                   # system call for print integer
    move $a0, $t2               # load F1 into $a0
    syscall                     # print F1



    
    
