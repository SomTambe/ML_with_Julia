# Explanation of code

# Base.promote_rule(::Type{MultiDual{N,T}},::Type{K}) where{N,T<:Number,K<:Number} = MultiDual{N,promote_type(T,K)}

    Defined promote rule such that an expression involving a subtype 'K' of `Number` and `MultiDual{N,T}` is first converted to a common `MultiDual` type. Care is takn to promote the type of resultant MultiDual to greater of T and K using promote_type(T,K).

# Base.convert(::Type{MultiDual{N,T}},x::K) where{N,T<:Number,K<:Number} = MultiDual{N,T}(T(x),SVector(zero(T),zero(T)))

    Defined convert rule to convert a subtype `K` of `Number` to MultiDual{N,T}.

# Base.convert(::Type{MultiDual{N,T}},x::MultiDual{N,K}) where{N,T<:Number,K<:Number} = MultiDual{N,T}(T(x.val),SVector{N,T}(x.derivs))

    Defined convert rule to convert a MultiDual{N,K} to a MultiDual{N,T}. This is required in cases like MultiDual{2,Int64} + Float64. Here according to the promote rule the common DataType after promotion is MultiDual{2,Float64}. Hence MultiDual{2,Int64} is required to be converted to MultiDual{2,Float64}.

# Extension of operators. 
 
1. Extended + simply by adding the 2 fields of 2 multidual variables

2. Extended - by subtracting the 2 fields of 2 multidual variables

3. Extended * / log exp sin cos abs ^ by applying corresponding operations for val field of result and using derivative rules for derivs field of result

4. Extended > < == by comparing val fields of 2 multidual variables


# Defined show() function which accepts a MultiDual variable and displays the value and gradient part separately

# Defined gradient() function which accepts a Vector Valued function 'f' and a Vector 'X' and returns the gradient of 'f' evaluated at 'X'. This function uses another function basisvector() which returns the standard basis vectors (ei) of R^n;

# Defined Jacobian() which accepts a Vector of functions 'X' and a Vector of points 'val' and returns the Jacobian of 'X' evaluated at 'val'.