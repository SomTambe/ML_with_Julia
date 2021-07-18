### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 6ad6078c-66ce-4c19-bf90-1061434dae47
using Markdown

# ╔═╡ 68745887-2432-479c-b551-0b2e440a628d
using InteractiveUtils

# ╔═╡ 6a75270d-04da-4205-8d0f-695167ebed65
using ForwardDiff

# ╔═╡ 555d3e9a-8140-4c07-92fd-e394188ae923
begin
	using StaticArrays
	using PlutoUI
	import Base: +, *
	using Distributions, Random, Plots, StatsPlots, PlotlyBase
	using Parameters
	plotly()
end

# ╔═╡ 61e1c9e6-3a91-4384-81bd-848843f1aa06
struct Dual{T} <:Number
    val::T   
    der::T  
end

# ╔═╡ 8bf6dd36-79f1-4fc7-9912-f3134720a8dc
struct MultiDual{N,T} <:Number 
    val::T
    derivs::SVector{N,T}
end

# ╔═╡ e59b6aaa-55cc-4aad-a329-fe74f91641b2
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
	
end

# ╔═╡ cd72516d-e40a-4d13-8ec6-1147a365830b
begin
		
		function Base.:*(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(f.val * g.val, f.val .* g.derivs + g.val .* f.derivs)
		end
		
		function Base.:^(f::MultiDual{N, T}, n::Integer) where {N,T} 
			return MultiDual{N,T}(f.val ^ n, (n*((f.val)^(n-one(n)))*(f.derivs)))
		end
	
		function Base.:*(f::MultiDual{N,T}, α::Number) where {N,T}
	    	return MultiDual{N,T}(f.val * α, f.derivs .* α)
		end
	
		function Base.:sin(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(sin(f.val), cos(f.val)*f.derivs)
		end
		function Base.:cos(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(cos(f.val), (-1)*sin(f.val)*f.derivs)
		end
		function Base.:log(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(log(f.val), inv(f.val)*f.derivs)
		end
		function Base.:exp(f::MultiDual{N,T}) where {N,T}
	    	return MultiDual{N,T}(exp(f.val), exp(f.val)*f.derivs)
		end
	function Base.:(>)(f::MultiDual{N,T}, α::Number) where {N,T}
    	return ((f.val>α) ? true : false)
    end
	
	function Base.:(<)(f::MultiDual{N,T}, α::Number) where {N,T}
		return ((f.val<α) ? true : false)
	end
	function Base.:(==)(f::MultiDual{N,T}, α::Number) where {N,T}
		return ((f.val==α) ? true : false)
	end
	function Base.:(>)(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
		return ((f.val>g.val) ? true : false)
	end
	function Base.:(<)(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
		return ((f.val<g.val) ? true : false)
	end
	function Base.:(==)(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
		return ((f.val==g.val) ? true : false)
	end
end

# ╔═╡ 3457928a-d05f-4926-addf-aba2cceae272
begin
	function Base.show(io::IO, ::MIME"text/plain", x::MultiDual{N,T}) where {N,T}
		println(io, "Data Type $T")
		println(io, "Val:", x.val, "Derivs:", x.derivs)
	end
end

# ╔═╡ 7f108513-3f42-4982-948f-1d8106d8ca12
begin
	import Base: convert
	
	function Base.:convert(::Type{MultiDual{N,T}},α::T) where {N,T<:Number}
	    return MultiDual{N,T}(α,SVector{N,T}(zeros(N)))
	end
	import Base:promote_rule
	
	function Base.:promote_rule(::Type{MultiDual{N,T}},::Type{T}) where {N,T}
	    return MultiDual{N,T}
	end
end

# ╔═╡ 482c9f12-a029-4cf9-855d-931ec66cfa7e
begin
	x = MultiDual(3.0,SVector(1.0,1.0))
	y = MultiDual(4.0,SVector(1.0,0.0))
	z = MultiDual(4.0,SVector(1.0,1.0))
	(==)(x,y)
	
end

# ╔═╡ 195fd77e-523b-47c0-8174-0dbace48f03f
(>)(x,y)

# ╔═╡ c05bff6a-3b53-4e7f-b443-d6b2027698ce
(<)(x,y)


# ╔═╡ 6dcc7021-aa7f-41f9-b1a9-64f47b34369b
x

# ╔═╡ 543c983f-3cfc-46a1-b951-f4d326eb3995
y

# ╔═╡ 8a64a9ac-62ca-48be-b41d-c8e281af2d38
(==)(y,z)


# ╔═╡ 522f194a-339d-481b-b9fc-2f317a6974de
(==)(y,4)

# ╔═╡ dfe82875-53f3-450d-a952-81a69fa0b514
h(x,y)=[x^2+y^3, 2x*y^2]

# ╔═╡ 48280aa5-78d4-4699-9f40-cfdad7847f3e
in=[1.0,2.0]


# ╔═╡ 57954dd9-64fa-4d9d-980e-e10172146d97
ForwardDiff.jacobian(x->h(x...),in)

# ╔═╡ 08634917-2e66-40c8-bde6-d3efbfc44d45
gradient(f::MultiDual{N,T}) where {N,T} = f.derivs

# ╔═╡ 2752158b-a898-437c-a6d5-c67477db33f1
gradient(x)

# ╔═╡ fc369161-5227-4af2-aa04-b5c601296ef5


# ╔═╡ Cell order:
# ╠═6ad6078c-66ce-4c19-bf90-1061434dae47
# ╠═68745887-2432-479c-b551-0b2e440a628d
# ╠═6a75270d-04da-4205-8d0f-695167ebed65
# ╠═555d3e9a-8140-4c07-92fd-e394188ae923
# ╠═61e1c9e6-3a91-4384-81bd-848843f1aa06
# ╠═8bf6dd36-79f1-4fc7-9912-f3134720a8dc
# ╠═e59b6aaa-55cc-4aad-a329-fe74f91641b2
# ╠═cd72516d-e40a-4d13-8ec6-1147a365830b
# ╠═3457928a-d05f-4926-addf-aba2cceae272
# ╠═7f108513-3f42-4982-948f-1d8106d8ca12
# ╠═482c9f12-a029-4cf9-855d-931ec66cfa7e
# ╠═195fd77e-523b-47c0-8174-0dbace48f03f
# ╠═c05bff6a-3b53-4e7f-b443-d6b2027698ce
# ╠═6dcc7021-aa7f-41f9-b1a9-64f47b34369b
# ╠═543c983f-3cfc-46a1-b951-f4d326eb3995
# ╠═8a64a9ac-62ca-48be-b41d-c8e281af2d38
# ╠═522f194a-339d-481b-b9fc-2f317a6974de
# ╠═dfe82875-53f3-450d-a952-81a69fa0b514
# ╠═48280aa5-78d4-4699-9f40-cfdad7847f3e
# ╠═57954dd9-64fa-4d9d-980e-e10172146d97
# ╠═08634917-2e66-40c8-bde6-d3efbfc44d45
# ╠═2752158b-a898-437c-a6d5-c67477db33f1
# ╠═fc369161-5227-4af2-aa04-b5c601296ef5
