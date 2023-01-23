# Definite integrals approximations
This project is based on using the most important numerical methods techniques used to estimate the definite integral of any function.
The code written will use the Rectangle , Trapezoid and Simpson rule separately to estimate the definite integral of a function predefined in the beginning, comparing in the end the performance of the methods for each number of interval divisions taken with each other and with the "exact" integral value considered to be the one that Matlab gives using the Int command. Thanks to this script, further understanding of the efficiency and utility of each method can be contamplated, giving a sense of how accurate they are, as well as how fast they converge (if that's the case, since sometimes roundoff errors are carried leading to divergence)

Let $N$ be the number of subintervals that divide $[a,b]$ evenly
### Methods used:
- *RECTANGLE RULE*
- *SIMPSON'S RULE*
- *TRAPEZOID RULE*

Fort the first 2 methods, $N$ can only be even


<u> Example of program's output for the function $f(x) = sin(x)cos(x)$ over interval $[0,3]$ <u>

![2023-01-23](https://user-images.githubusercontent.com/97905110/214137961-f45dc290-8d35-4f8f-a6ba-45ca4f8b5d44.png)
