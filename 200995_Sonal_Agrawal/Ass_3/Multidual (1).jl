### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 10939ffa-9c22-417e-b929-b4cd2bfc5b96
using Markdown

# ╔═╡ 57185bf8-6d7c-4925-9ef1-523db7a4b1fc
using InteractiveUtils

# ╔═╡ a8dbf094-e6b8-11eb-05e5-b3a2949d5806
begin
	using StaticArrays
	using PlutoUI
	import Base: +, *
	using Distributions, Random, Plots, StatsPlots
	plotly()
end

# ╔═╡ 5064776d-8419-4b83-a536-994c7cc6cf1e
struct Dual{T} <: Number
	val::T
	der::T
end

# ╔═╡ 72ffe214-9809-4a14-b5b0-d75e5243d725
struct MultiDual{N,T} # N-> Size of the vector, T -> DataType of the vector
    val::T
    derivs::SVector{N,T}
end

# ╔═╡ 9d790199-f55f-4c8c-b04b-7438e53e2b47
#FUNCTION DEFINITIONS
begin
	Base.:+(f::Dual, g::Dual) = Dual(f.val + g.val, f.der + g.der)
	Base.:+(f::Dual, α::Number) = Dual(f.val + α, f.der)
	Base.:+(α::Number, f::Dual) = f + α

	Base.:-(f::Dual, g::Dual) = Dual(f.val - g.val, f.der - g.der)

	# Product Rule
	Base.:*(f::Dual, g::Dual) = Dual(f.val*g.val, f.der*g.val + f.val*g.der)
	Base.:*(α::Number, f::Dual) = Dual(f.val * α, f.der * α)
	Base.:*(f::Dual, α::Number) = α * f

	# Quotient Rule
	Base.:/(f::Dual, g::Dual) = Dual(f.val/g.val, (f.der*g.val - f.val*g.der)/(g.val^2))
	Base.:/(α::Number, f::Dual) = Dual(α/f.val, -α*f.der/f.val^2)
	Base.:/(f::Dual, α::Number) = f * inv(α) # Dual(f.val/α, f.der * (1/α))

	Base.:^(f::Dual, n::Integer) = Base.power_by_squaring(f, n)
	Base.:exp(f::Dual) = Dual(exp(f.val), exp(f.val) * f.der)
	
######################################################################################
	
	function Base.:+(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
    	return MultiDual{N,T}(f.val + g.val, f.derivs + g.derivs)
	end

	function Base.:*(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
    	return MultiDual{N,T}(f.val * g.val, f.val .* g.derivs + g.val .* f.derivs)
	end
	
	Base.:^(f::MultiDual{N, T}, n::Integer) where {N,T} = Base.power_by_squaring(f, n)
	

	function Base.:*(f::MultiDual{N,T}, α::Number) where {N,T}
    	return MultiDual{N,T}(f.val * α, f.derivs .* α)
	end

	Base.:*(α::Number, f::MultiDual{N, T}) where {N, T} = f*α	

end

# ╔═╡ 4dafdf4c-061c-4acb-92d5-7ce2aa625c0b
begin
	
	m = Dual(3, 1)
	n = Dual(5, 6)
	m + n
end

# ╔═╡ 14648003-7c75-44f5-8c80-66b782900de3
md"""
Problem Statement

Extending the MultiDual{T, N}  framework to functions for the following:
- Jacobians
- log
- exp
- sin, cos
- abs
- ^(for non integral powers too), +, -, / 
- While I was showing stuff to you guys, we defined to separate methods for +(::MultiDual, ::Real) and +(::Real, ::MultiDual). This time, I want you guys to make use of convert and promote_type rule to eliminate the boilerplate above
- Throw in a show method to display MultiDuals nicely.
- comparisons between a MultiDual and a Number : >, <, == 
- comparisons between 2 MultiDuals
PS: you compare between multiduals and numbers by comparing between their values

- just like we had a wrapper function for the derivative, I want one for gradient too.
"""

# ╔═╡ e8c43565-340d-4686-bfc3-4451aa197ece
begin
		function Base.:exp(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(exp(f.val), exp(f.val)*f.derivs)
		end
	
		function Base.:log(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(log(f.val), inv(f.val)*f.derivs)
		end
	
		function Base.:sin(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(sin(f.val), cos(f.val)*f.derivs)
		end
	
		function Base.:cos(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(cos(f.val), -1*sin(f.val)*f.derivs)
		end
	
		function Base.:abs(f::MultiDual{N,T}) where {N,T}
    		return MultiDual{N,T}(abs(f.val), sign(f.val)*f.derivs)
		end
end

# ╔═╡ 61059af0-3f58-45d9-b135-a1df97757d7a
begin
	p = MultiDual(3.0, SVector(1.0,0))
	q = MutliDual(5.0, SVector(3.0,2.0))
	p + q
end

# ╔═╡ Cell order:
# ╠═10939ffa-9c22-417e-b929-b4cd2bfc5b96
# ╠═57185bf8-6d7c-4925-9ef1-523db7a4b1fc
# ╠═a8dbf094-e6b8-11eb-05e5-b3a2949d5806
# ╠═5064776d-8419-4b83-a536-994c7cc6cf1e
# ╠═72ffe214-9809-4a14-b5b0-d75e5243d725
# ╠═9d790199-f55f-4c8c-b04b-7438e53e2b47
# ╠═4dafdf4c-061c-4acb-92d5-7ce2aa625c0b
# ╟─14648003-7c75-44f5-8c80-66b782900de3
# ╠═e8c43565-340d-4686-bfc3-4451aa197ece
# ╠═61059af0-3f58-45d9-b135-a1df97757d7a
