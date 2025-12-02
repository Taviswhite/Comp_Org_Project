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

