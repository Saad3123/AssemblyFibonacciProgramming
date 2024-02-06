# AssemblyFibonacciProgramming
The application performs various operations on string such as
1. Implements main function in assembly code as the entry point of an application.
2. Calls scanf() C library function from the assembly code to get user input.
3. Calls printf() C library function from the assembly code to show user outputs.
4. Calls library and custom functions from the assembly code placing the parameters of the
functions into appropriate ARM processor register.
5. Retrieves the return values from the returned functions in assembly code from the
appropriate ARM processor register.
6. Implements the custom functions appropriately so that these functions can be called in
the assembly code in another file.
7. Implements the custom functions by saving the return address onto stack and by
retrieving the return address from the stack before returning from the function.
8. Implements the custom functions by placing the return value to the appropriate ARM
register to return it to the caller.
9. Implements the custom functions by using ARM processor register for local variables.
10. Implements the custom functions by saving the current ARM processor register values,
those will be required later in the function, onto the stack before calling another
function and by retrieving those saved register values from the stack once the called
function returns.
11. Implements both recursive and non-recursive function in assemble code.
12. Uses global variables and array data structure.


## Technologies
This application used ARM v8 64-bit instruction set Assembly Languageto create and this application has been tested in
ARM Developer Studio on Debian 4.9 (Linux).

## Build and Installation
Import the project into your ARM-DS IDE by importing 'existing
project into workspace'. This project has already been configured with the target
ARM8 processor, Debug Symbol and Script Files, and Model Connection. The src folder of this project has 5 assembly
code files named as follows:
1. main.S
2. fibonacci_dynamic.S
3. fibonacci_recursive.S
4. fibonacci_sequence.S
5. show_fibonacci_sequence.S

ARM DS will create the make file and place the binary and object files in ARM DS specific folders.

Step 1:
    open main.S

Step 2:
    connect to the debugger Assignment4_FVP.launch

Step 3:
    run the program



## Contributors
Developer: Saad Hussain Syed, VIU.
Specification: Dr. Humayun Kabir, Instructor, VIU.

## License
None.