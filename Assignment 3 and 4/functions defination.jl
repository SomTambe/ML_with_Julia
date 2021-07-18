### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 891fc1aa-b24f-4711-ab3d-aaf956c9187f
begin
	using StaticArrays
	import Base: +, *
end

# ╔═╡ 9ecf91ff-2afa-44b9-8a56-56a1ff79bd83
struct MultiDual{N,T} <:Number
    val::T
    der::SVector{N,T}
end

# ╔═╡ 04bd8712-5465-475f-b695-e22ffdcb0e54
Base.convert(::Type{MultiDual{N, T}}, x::T) where {N, T<:Real} = MultiDual(zeros(SVector{N, T}), x)

# ╔═╡ 10943367-cb75-432c-b952-e5dcd83a8400
Base.promote_rule(::Type{MultiDual{N, T}}, ::Type{T}) where {N, T<:Real} =  MultiDual{N, T}

# ╔═╡ e28b9b07-c5f6-4af6-af18-0800ea9c6d64
begin
	a = MultiDual(3.0, SVector(1.0, 0.0))
	b = MultiDual(4.0, SVector(0.0, 1.0))
end

# ╔═╡ 48a3caa8-4ded-469b-954c-3e816de23bc7
begin
    function  Base.:+(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
    	return MultiDual{N,T}(f.val+g.val, f.der+g.der)
	end

    function Base.:*(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
    	return MultiDual{N,T}(f.val*g.val, f.val*g.der+g.val*f.der)
	end
	
    Base.:^(f::MultiDual{N, T}, n::Integer) where {N,T} = Base.power_by_squaring(f, n)
	

    Base.:*(f::MultiDual{N,T}, α::Number) where {N,T}= MultiDual{N,T}(f.val*α, f.der*α)
	Base.:*(α::Number, f::MultiDual{N, T}) where {N, T} = f*α
	function Base.:/(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
    	return MultiDual{N,T}(f.val /g.val, (-f.val .* g.derivs + g.val .* f.derivs)/(g.val^2))
	end
	
end

# ╔═╡ fc0a4524-0712-40c4-aa7f-d6edfe03faf8
Base.Math.sin(f::MultiDual{N, T}) where {N,T}=MultiDual{N, T}(sin(f.val),cos(f.val)*f.der)

# ╔═╡ f7928f63-92b2-4a6b-83c5-5b35bd280018
Base.Math.:cos(f::MultiDual{N, T}) where {N,T}=MultiDual{N, T}(cos(f.val),-sin(f.val)*f.der)

# ╔═╡ 6abfd228-1928-4412-9853-db9559d2ed55
Base.log(f::MultiDual{N, T}) where {N,T}=MultiDual{N, T}(log(f.val), (1/(f.val))*f.der)

# ╔═╡ 7a677497-1580-4ddb-9da3-7a6b620b2da1
Base.Math.:exp(f::MultiDual{N, T}) where {N,T}= MultiDual{N, T}(exp(f.val), exp(f.val)*f.der)

# ╔═╡ 9bc0e2ed-85fa-43b8-b0d0-7ee87a706f61
Base.:^(f::MultiDual{N, T}, n::Number) where {N,T}= MultiDual{N, T}((f.val)^n,(n)*(f.val)^(n-1)*f.der)

# ╔═╡ 7cf3bd1d-568b-415b-99b6-55a04f17a871
begin
	function Base.:abs(f::MultiDual{N, T}) where {N, T}
		if f.val>0
			return MultiDual{N, T}(f.val, f.der)
		end
		if f.val<0
			return MultiDual{N, T}(-f.val, -f.der)
		end
	end
end

# ╔═╡ 05f89971-71fc-413c-b2f4-0f22a7d32aff
h(x, y, z)=[x+2z, x^2+y^3+z^2, y^2+z^2]

# ╔═╡ f9d9b513-13b7-4c6d-9fa2-b4497303fe01
h(2, 1, 4)

# ╔═╡ 078bf31a-be89-42d9-b9ee-ef471fe3084a
X=[1, 2, 3]

# ╔═╡ 1172ada5-b7a2-43bb-856a-66a4da1b3215
## Comparision Function

# ╔═╡ df38a75e-01f2-4a3d-8f89-5d7b88f26760
begin
        function Base.:>(f::MultiDual{N,T}, α::Number) where {N,T}
            return f.val>α ? true : false
        end

		function Base.:<(f::MultiDual{N,T}, α::Number) where {N,T}
            return f.val<α ? true : false
        end

        function Base.:(==)(f::MultiDual{N,T}, α::Number) where {N,T}
            return f.val==α ? true : false
        end

        function Base.:>(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
            return f.val>g.val ? true : false
        end

        function Base.:<(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
            return f.val<g.val ? true : false
        end

        function Base.:(==)(f::MultiDual{N,T}, g::MultiDual{N,T}) where {N,T}
        	return f.val==g.val ? true : false
    	end
end

# ╔═╡ 18b780ae-479e-4834-a37a-f159009a15e8
## Gradient Function

# ╔═╡ 99624e38-9754-4cd1-9d09-0bda56e96bb0
gradient(f,x,y)= f(MultiDual(x,SVector(one(x),0)),MultiDual(y,SVector(0,one(y)))).der

# ╔═╡ d3263689-d555-47dc-9668-88af64e98844
f(x,y)=x^3+y^5

# ╔═╡ fa6ffa6e-fd14-42d8-9190-ab2144b228b9
begin
	function Jacobian()
		l=size(X)
		J=[f(X)[1]]
		for i in 2:l
			arr=append!(J, f(X)[i].der)
		end
		return J
	end
end

# ╔═╡ e78d9aca-893d-4cca-970d-19e704e52e07
gradient(f,10,2)

# ╔═╡ Cell order:
# ╠═891fc1aa-b24f-4711-ab3d-aaf956c9187f
# ╠═9ecf91ff-2afa-44b9-8a56-56a1ff79bd83
# ╠═04bd8712-5465-475f-b695-e22ffdcb0e54
# ╠═10943367-cb75-432c-b952-e5dcd83a8400
# ╠═e28b9b07-c5f6-4af6-af18-0800ea9c6d64
# ╠═48a3caa8-4ded-469b-954c-3e816de23bc7
# ╠═fc0a4524-0712-40c4-aa7f-d6edfe03faf8
# ╠═f7928f63-92b2-4a6b-83c5-5b35bd280018
# ╠═6abfd228-1928-4412-9853-db9559d2ed55
# ╠═7a677497-1580-4ddb-9da3-7a6b620b2da1
# ╠═9bc0e2ed-85fa-43b8-b0d0-7ee87a706f61
# ╠═7cf3bd1d-568b-415b-99b6-55a04f17a871
# ╠═05f89971-71fc-413c-b2f4-0f22a7d32aff
# ╠═f9d9b513-13b7-4c6d-9fa2-b4497303fe01
# ╠═078bf31a-be89-42d9-b9ee-ef471fe3084a
# ╠═fa6ffa6e-fd14-42d8-9190-ab2144b228b9
# ╠═1172ada5-b7a2-43bb-856a-66a4da1b3215
# ╠═df38a75e-01f2-4a3d-8f89-5d7b88f26760
# ╠═18b780ae-479e-4834-a37a-f159009a15e8
# ╠═99624e38-9754-4cd1-9d09-0bda56e96bb0
# ╠═d3263689-d555-47dc-9668-88af64e98844
# ╠═e78d9aca-893d-4cca-970d-19e704e52e07
