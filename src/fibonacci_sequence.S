/**
* @file	 fibonacci_sequence.S
* @author Saad Hussain Syed, 665072658, F23N01, VIU
* @version 1.0.0
* @date Dec 5ht 2023
 	int fibonacci_sequence(int fibonacci_seq[], int max_index);
*/
.text
.global fibonacci_sequence

fibonacci_sequence:

    str lr, [sp, #-16]!		//stores the lr is source  the return address onto stack 16 bytes below sp ! is for preindexing


    mov w8, w1				// Move max index from w1 to w8
    cmp w8, #0				// compare w8 to 0
    bne one					// branch to one if not equal


	mov w2, #0				//move index to zero
	str w2, [x0]			//stores the value of x0 in w2
	b done

one:
    // Handle max index value equal to 1 case
    cmp x8, #1 		//compare x8 with 1
    bne seq			//if not equal go to seq

	//max index is one
	mov w2, #0
	str w2,[x0], #8

    mov w1, #1
    str w1, [x0]        // Storing 1 at index 1
    b done

seq:
    // Handle max index value greater than 1
    mov x9, #1          // Loop counter
    mov x2, #0          // fib[n-2]
    str w2, [x0]
    mov x1, #1          // fib[n-1]
	str x1, [x0, x1, lsl#3] //store and traverse
	mov w3, #0			// w3=0

loop:
    cmp x9, x8			//compares x9 and x8
    b.eq done
    add x3, x2, x1      // fib[n] = fib[n-1] + fib[n-2]
    mov x2, x1			//moves x1 to x2
 	mov x1, x3			//moves x3 to x1
 	add x9, x9, #1      // Increment loop counter

 	str x3, [x0, x9, lsl#3]	//traversal and storing the values
    b loop				//branches back to loop

done:
	ldr lr, [sp], #16		//used to load returning add, where sp points to lr then increments by 16
	ret
