/**
* @file	 fibonacci_dynamic.S
* @author Saad Hussain Syed, 665072658, F23N01, VIU
* @version 1.0.0
* @date Dec 5, 2023
	 	int fibonacci_dynamic(int fib_index);
*/



/*
 * Data segment
 */
	.data


/*
* Code segment
*/

	.text
	.global	fibonacci_dynamic

fibonacci_dynamic:

	str lr, [sp, #-16]!		//stores the lr is source  the return address onto stack 16 bytes below sp ! is for preindexing
	cmp x0, #0				//Compare the index with zero
	beq base_case_0			//if equal, go to base case 0
	cmp x0, #1				//Compare the index value with one
	b.eq base_case_1		//if equal, go to base case 1
	mov x4, x0				//Move the index value from x0 to x4
	mov x3, #1				//start loop counter with 1

	mov x2, #0				//x2 to keep track of your fib[n-2] and set it to 0
	mov x1, #1				//Use x1 to keep track of your fib[n-1] and initialize it to 1
	mov x0, #0				//Use x0 to hold your fib[n] and initialize it to 0

loop:


	cmp x3, x4				//Compare loop counter with the current index value
	beq end_function			//end the loop if equal
	add x0, x1, x2			//Compute fib[n] = fib[n-1] + fib[n-2]

	mov x2, x1				//Move fib[n-1] to fib[n-2]
	mov x1, x0				//Move fib[n] to fib[n-1]


	add x3, x3, #1			//Increment the loop counter
	b loop					//branch to loop


base_case_0:
	mov x0, #0				//move 0 to x0
	b end_function			//branch to end function

base_case_1:
	mov x1, #1			//moves 1 to x1
	b end_function		//branches to end function

end_function:
	ldr lr, [sp], #16 //load the value of sp into lr and add 16 to sp
	ret
