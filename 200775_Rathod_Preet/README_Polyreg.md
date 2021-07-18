For the Polynomial regression of 2nd degree, the thought process is the extension of the "Linear Regression"

Here, our function is f(x) = $ax^2 + bx + c $

and, C(y,t) = ((y-t)^2)/2

so, we will perform partial differentiation of C w.r.t a,b,c to get
pd. of C wrt a = (pd of C wrt f)(pd of f wrt a)
               =  (y-t) (x^2)

pd. of C wrt b = (pd of C wrt f)(pd of f wrt b)
               =  (y-t) (x)

pd. of C wrt c = (pd of C wrt f)(pd of f wrt c)
               =  (y-t)

by iterating through whole Domain, we will calculate loss(C(y,t)) at each point and add them to get total loss
also, we will calculate the grad_a by adding the pd of C wrt a at each point in Domain, and similar process for b and c.
Now, we have a total loss term, grad_a, grad_b, grad_c.
now we will update the existing value of a,b,c by adding a term to them, consisting of (stepsize * avg grad_a) and similar for b and c.
 
and we will continue the process till we get total loss less than some particular small value so that the curve obtained will be passing through maximum points or close to maximum points.

2nd method we used has all the steps same except the method of calculating grad_a, grad_b, grad_c
Here we use gradient function defined in Zygote for calculating grad_a, grad_b, grad_c.

in this method we get more closer values than the 1st method.

And lastly we plotted all 3 graphs together.