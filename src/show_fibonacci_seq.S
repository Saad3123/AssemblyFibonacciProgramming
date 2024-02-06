/**
* @file	 show_fibonacci_seq.S
* @author Saad Hussain Syed, 665072658,F23N01, VIU
* @version 1.0.0
* @date July 20, 2021
* int show_fibonacci_seq(int fibonacci_seq[], int max_index);

/*
* Data segment
*/
    					.data
    					.align 3
format_str_sequence:	.asciz "Fibonacci Sequence[%d]: %d\n"


/*
* Code segment
*/

    					.text
    					.global show_fibonacci_seq

show_fibonacci_seq:

    str lr, [sp, #-16]!			    // Save the return address onto the stack

    mov x3, x0						//mov x3 into x0

    mov x4, x1						//copy max index to x4

    mov x1, #0						//use x1 as loop counter and initalize it to 0

    sub sp, sp, #32					//point stack in the appropiate location
    add x4, x4, #1

loop:
    cmp x1, x4						//compare loop counter with max index

    b.eq end_function				//if equal, branch to end function

    ldr x0, =format_str_sequence	//assign the address of str to x0
    ldr x2, [x3, x1, lsl#3] 		// load the values and traverse
    str x1, [sp]					//store top of stack at x1
    str x3, [sp, #8]				//store the addresss of sequence array before calling
    str x4, [sp, #16]				//save the max index before calling
    bl printf						//call printf

    ldr x4, [sp, #16]				//retreive the the index limit to x4

    ldr x3, [sp, #8]				//retreive the array address adn load it to x3

    ldr x1, [sp]					//retreive the loop counter from sp 0
    add x1, x1, #1					//x1=x1+1
    b loop							//branch to beginning

end_function:
    ldr lr, [sp, #16]				// Retrieve the return address from the stack
	add sp, sp, #32					//reset everything before returning
    ret

