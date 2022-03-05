
# Assignment 4

## Extension of MultiDual{N,T} framework

To add the functions like exp ... let there be a function f(x), then deriviiative of exp(f(x)) will be exp(f(x))*f'(x). This is how the functions were added. All functions were done except Jacobian.

## Show Method for MultiDuals

A new function was created to show the MultiDuals in a customised way.

## Comparison of MultiDual

This Comparison is done by retriving val of MultiDual(s) and comparing with the number(2nd Val)

## Gradient wrapper function

It is assumed that the function is of 2 variables. Now grad(f,x,y)=f((x,[1,0]),(y,[0,1]))
