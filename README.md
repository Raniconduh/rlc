# rlc

A Reverse Polish Notation calculator written entirely in lua. It has an infinite stack and single-line-entry support.

Each number or constant will be pushed onto the stack and, when an operation is called, the elements on the stack will be manipulated.

## Operations

* `+`: Add the top two numbers in the stack
* `-`: Subtract the top two numbers
* `/`: Divide the top two numbers
* `*`: Multiple the top two numbers
* `^`: Raise the second value in the stack to the power of the first value in the stack
* `v`: Take the square root of the top value of the stack

* `sin`: Take the sine of the top value
* `cos`: Take the cosine of the top value
* `tan`: Takw the tangent of the top value
* `rad`: Convert the top value (degrees) to radians

## Functions

* `c`: Clear the stack
* `d`: Delete the top element of the stack
* `q`: Quit the program

* `help`: List all functions and operations

## Constants

* `pi`
* `e`

## Examples

```
$ rlc
> 5 3 +
8
> 5
> 4
> +
9
> p
8
9
> pi 6 / cos
0.86602540378444
> 25 v
5.0
> 8 1 3 / ^
2.0
> 5 0 /
inf
> 0 0 /
nan
```
