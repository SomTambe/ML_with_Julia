using StaticArrays
import Base: convert, promote_rule

struct MultiDual{N,T} <: Number
    val::T
    derivs::SVector{N,T}
end

#Define promotion and convert rules
Base.promote_rule(::Type{MultiDual{N,T}},::Type{K}) where{N,T<:Number,K<:Number} = MultiDual{N,promote_type(T,K)}

Base.convert(::Type{MultiDual{N,T}},x::K) where{N,T<:Number,K<:Number} = MultiDual{N,T}(T(x),SVector(zero(T),zero(T)))

Base.convert(::Type{MultiDual{N,T}},x::MultiDual{N,K}) where{N,T<:Number,K<:Number} = MultiDual{N,T}(T(x.val),SVector{N,T}(x.derivs))


#Define operators for MultiDual

Base.:+(f::MultiDual, g::MultiDual) = MultiDual(f.val + g.val, f.derivs + g.derivs)

Base.:*(f::MultiDual, g::MultiDual) = MultiDual(f.val * g.val, f.val .* g.derivs + g.val .* f.derivs)

Base.:-(f::MultiDual, g::MultiDual) = MultiDual(f.val - g.val, f.derivs - g.derivs)

Base.:/(f::MultiDual, g::MultiDual) = MultiDual(f.val/g.val, (f.derivs.*g.val-g.derivs.*f.val)/(g.val^2))

Base.:exp(f::MultiDual)= MultiDual(exp(f.val),exp(f.val).*f.derivs)

Base.:sin(f::MultiDual) = MultiDual(sin(f.val),cos(f.val).*f.derivs)

Base.:cos(f::MultiDual) = MultiDual(cos(f.val),-sin(f.val).*f.derivs)

Base.:log(f::MultiDual,x::Number) = MultiDual(log(f.val,x),f.derivs./(f.val*log(x,ℯ)))

Base.:^(f::MultiDual,x::Real) = MultiDual(f.val^x,x*(f.val)^(x-1).*f.derivs)
Base.:^(f::MultiDual,x::Integer) = MultiDual(f.val^x,x*(f.val)^(x-1).*f.derivs)

Base.:abs(f::MultiDual) = MultiDual(abs(f.val),abs(f.val)/f.val.*f.derivs)

Base.:<(f::MultiDual, g::MultiDual) = f.val<g.val

Base.:>(f::MultiDual, g::MultiDual) = f.val>g.val

Base.:==(f::MultiDual, g::MultiDual) = f.val==g.val
	
function Jacobian(X ::Vector,val ::Vector)
    V =Vector()
    for i in 1:length(X)
        push!(V,gradient(X[i],val))
    end
    return V
end

function basisvector(n,i)
    V = Vector()
    for j in 1:n
        if j==i
            push!(V,1)
        else
            push!(V,0)
        end
    end
    return SVector{n}(V)
end


function gradient(f,X::Vector)
    n = length(X)
    V = Vector()
    for i in 1:length(X)
        push!(V,MultiDual(X[i],basisvector(n,i)))
    end
    return f(V).derivs
end

function show(x::MultiDual)
    println("Value : ",x.val)
    println("Gradient : ",x.derivs[1],"i + ",x.derivs[2],"j")
end

