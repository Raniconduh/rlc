# rlc

A Reverse Polish Notation calculator written entirely in lua. It has an infinite stack and single-line-entry support.

Each number or constant will be pushed onto the stack and, when an operation is called, the elements on the stack will be manipulated.

Trigonometric functions perform operations in radians. (Both input and outputs to the functions should be in radians.)

## Operations

* `+`: Add the top two numbers in the stack
* `-`: Subtract the top two numbers
* `/`: Divide the top two numbers
* `*`: Multiple the top two numbers
* `^`: Raise the second value in the stack to the power of the first value in the stack
* `v`: Take the square root of the top value of the stack

* `sin` : Take the sine of the top value
* `cos` : Take the cosine of the top value
* `tan` : Take the tangent of the top value
* `asin`: Take the arcsine of the top value
* `acos`: Take the arccosine of the top value
* `atan`: Take the arctangent of the top value
* `rad` : Convert the top value (degrees) to radians
* `deg` : Convert the top value (radians) to degrees
* `log` : Take the base 10 logarithm of the top value
* `lb`  : Using the second element of the stack as a base, find the logarithm of the top element
* `ln`  : Take the natural logarithm of the top value

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
> 2 8 lb
3.0
```
