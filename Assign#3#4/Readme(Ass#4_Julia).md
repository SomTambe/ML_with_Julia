ASS4(DERIVATIVES USING MultiDual)
*It must be opened as a Pluto notebook
*For SIN,COS,EXP,LOG ,Non Integral powers etc I just tweaked the existing strucure a bit
*For abs I  took cases >,=,< than zero and threw error when f is zero and f'!=0(Function is not diff at that point
*I used show to display multi-duals,took a little help from stack overflow for variable subscripts while displaying the gradients
*In Jacobian I have returned the entire jacobian matrix and it's determinant too.Used hcat to paste rows together of gradients of all constituent functions passed as na argument.
*Jacobian takes in vector function and an array of MultiDuals as an input.
*comparasion has been done on similar lines taking cases
*+,-,*,/ have been implemented in similar fashion to what had been taught
*I have tried to use convert and promote but they were not working as planned.

