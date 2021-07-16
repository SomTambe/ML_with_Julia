# The MultiDual{N,T} Framework

### First we define a struct for the **MultiDual{N,T}**, where ``val`` is for the Value of the Vector and  ``derivs`` is for the Derivative part of it (**Partial Derivative** to be precise).
<br>

### Hence it is essential that the datatypes for `val` and `derivs` remain the same at all times.
<br>

### 1. For basic operators like `+`, `-`, `*`, `/`, `^`

- for `+` and `-`, `val` and `derivs` are simply the algebraic sum of the individual corresponding terms

- for `*` and `/`, `val` is by product and division of corresponding individual terms respectively, and `derivs` is obtained by using the product and quotient rules of differentiation respectively

- for `^`, the definition of derivative of an exponential function is used

<br>

### 2. For other functions:

- for `sin` and `cos` : using the value of their derivatives

- for `exp` and `log` : Easier form of `^`. Just use definition of derivative of e<sup>x</sup> and ln(x)

- for `abs` : Use the fact that derivative of |x| is signum(x). Use Julia's default function `sign()` for that

<br>

### 3. `show` method to display MultiDuals nicely

- I used [this](https://stackoverflow.com/questions/58962304/how-to-overload-base-show-for-custom-array-types) StackOverflow link

- Read about the `show` methods at Julia Docs https://docs.julialang.org/en/v1/base/io-network/

<br>

### 4. Comparisons:

- It was basically based on the fact that while comparing a MultiDual with a Number, we compare the MultiDual's `val` with the number to decide among `>`, `<` and `==`

- For 2 MultiDuals, we simply compare the `val` of both

<br>

### 5. Wrapper for Gradient:

- As the MultiDual's `derivs` part already has the gradient value associated to it, we just have to extract the `.derivs` value from the input MultiDual

<br>

### 6. Conversion and Promotion

- The main aim was to simplify the computations for `+(::MultiDual, ::Number)` and `+(::Number, ::MultiDual)` by defining a single method that can work for both

- A good way to do this can be to ensure that the `Number` is promoted into `MultiDual` so that the computations can be done without any hassles

- For this, I referred to Julia Docs https://docs.julialang.org/en/v1/manual/conversion-and-promotion/

<br>

> A function for calculation for Jacobian is yet to be added, but I have not been able to think about a good way to do that. Will update as soon as I get any idea about it