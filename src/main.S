/**
* @file	 main.S
* @author Saad Hussain Syed, 665072658,F23N01, VIU
* @version 1.0.0
* @date Dec 5th 2023
*/

							.data				//data segment


							.align 3, 0			//2^3 and 0 for padding
fibonacci_arr:				.skip 8*41			//space into elem size * 40


index_input:				.asciz "\n Enter a Fibonacci Index (Max is 40) : "


							.align 3, 0
show_index:					.asciz "You entered: %d\n"

							.align 3, 0
show_fibonacci_value:		.asciz "Fibonacci Value is: %d\n"


							.align 3, 0
show_fibonacci_dynamic:		.asciz "Fibonacci Value for dynamic [%d] is: %d\n"

							.align 3, 0
show_fibonacci_recursive:	.asciz "Fibonacci Value for recursive [%d] is: %d\n"

							.align 3, 0
invalid_str:				.asciz "Number is invalid"


							.align 3, 0
scan_index:					.asciz "%d"


    						.align 3, 0
store_index:				.space 4

							.align 3, 0
MAX_INDEX:					.word 40





/*
 * Code segment
 */
			.text					//Define the code segment using assembler directive
			.global main			//Define the name of the function global using assembler directive


main:		str lr, [sp, #-16]!		//Save the return address onto stack and adjust the stack pointer
			ldr x0, =index_input 	//loads the input string
			bl printf				//calls the printf function through x0
			ldr x0, =scan_index		//loads address of scan_index to x0
			ldr x1, =store_index	//loads the addres of store_index into x1
			bl scanf				//scans the user entered input



			ldr	x0,	=store_index	//stores address of user input
			ldr x1, =MAX_INDEX		//stores the adress of max index which is 40
			ldr x0, [x0]			//loads the actual stored
			ldr x1, [x1]			//loads 40
			cmp x0,x1				// input>40
			bgt invalid_number		//branch to invalid_number

			ldr x0, =show_index		// initallizes x0 with show_index str
			ldr x1, =store_index	//intializes x1 with the address of the value user entered
			ldr x1, [x1]			//loads x1 with the actual value not the address
			bl printf				//prints the show_index with appropiate user entered index

			ldr x1, =store_index	// initializes x1 with stored value address
			ldr x0, [x1]			// loads x1 with the value of x1
			bl fibonacci_dynamic	// calls the fibonacci_dynamic with x0 as the parameter
			mov x2, x0				//gets the return value in x0 and copies it into x2
			ldr x0, =store_index	//gets the address of stored user index
    		ldr w1, [x0]			//initiallizes w1 with actual value of entered by user

    		ldr x0, =show_fibonacci_dynamic	//loads show_fibonacci_dynamic str into x0
    		bl printf				//calls the printf func where x1 is the user value and w1 is the user entered index


			ldr x1, =store_index 	// initializes x1 with stored value address
			ldr w0, [x1]			// loads x1 with the value of x1
			bl fibonacci_recursive	//calls the recursive func with user index(w0/x0) as parameter

			mov x2, x0				//gets the return value in x0 and copies it into x2
			ldr x0, =store_index	//gets the address of stored user index
			ldr w1, [x0]			//initiallizes w1 with actual value of entered by user
			ldr x0, =show_fibonacci_recursive	//loads the appropiate string to print
			bl printf				//calls the printf func showing the string with appropiate address


			ldr x0, =fibonacci_arr	//loads x0 with the array defined to hold values
			ldr x2, =store_index 	//loads x2 with the address of index
			ldr w1, [x2]			//loads the actual index value to w1
			bl fibonacci_sequence	//calls the sequence func with arr and index as parameters


			ldr x0, =fibonacci_arr	//loads x0 with the array defined to hold values
			ldr x2, =store_index	//loads x2 with the address of index
			ldr w1, [x2]			//loads the actual index value to w1
			bl show_fibonacci_seq	//calls the show func with arr and index as parameters
			b done					// branch to done
done:
			mov x0, xzr				//Assign zero to x0 in order to return zero from the function
			ldr lr, [sp], #16		//Adjust the stack pointer before returning from the function
			ret lr					//Return from the function

invalid_number:
			ldr x0, =invalid_str	//loads the appropiate string
			bl printf				//print it
			b done					// DONE B-)



