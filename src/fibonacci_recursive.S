/**
* @file	 fibonacci_recursive.S
* @author Saad Hussain Syed, 665072658, F23N01, VIU
* @version 1.0.0
* @date Dec 5 2023
* 	 	int fibonacci_recursive(int fib_index);
*/



.data

.text
.global				fibonacci_recursive

fibonacci_recursive:
	cmp x0, #1          // compares x0 with 1
    ble zero_case           //if less ot equal branch to base
    sub sp, sp, #16     // subtracts 16 from sp which makes space to store values and assigns back to sp
    stur lr, [sp, #8]   //adds 8 to sp address and that gets assigned to lr(special register used to return stuff)
    stur x0, [sp, #0]   	//stores x0 vlaue on top of the stack
    //Fib(n-1)
    sub x0, x0, #1      // Subtract 1 from n for the recursive call
    bl fibonacci_recursive
    ldr x1, [sp, #0]    // load x1 to the value of top
    sub x1, x1, #2      // subtract 2 for the next recursive call
    stur x0, [sp, #0]   // store Fib(n-1) on top of the stack

    //Fib(n-2)
    mov x0, x1          // copy x1 to x0
    bl fibonacci_recursive
    ldr x1, [sp, #0]    // Load Fib(n-1) from stack
    add x0, x0, x1      // Add Fib(n-1) and Fib(n-2)

    // Cleanup and return
    ldr lr, [sp, #8]    // Restore link register
    add sp, sp, #16     // stack resetting
    ret lr              // Return from function

zero_case:
	cmp x0, #0          // compare x0 with 0
    bne one_case        //we go to one case
    mov x0, #0			//mov x0=0
    ret              // Return from function

one_case:
    mov x0, #1          //	for Fib(1), return 1
    ret              // return from function
