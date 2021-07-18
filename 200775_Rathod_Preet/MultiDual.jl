### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 89e15700-e498-11eb-33cc-e117104bb05d
using StaticArrays,Zygote, ForwardDiff

# ╔═╡ 7fa3cdd3-000a-42a7-b2c0-e53865e9c72b
import Base:+,*

# ╔═╡ dfef3465-3eb7-49c5-8fef-4112b2b7eb79
md"""
#### MultiDual Definition
"""

# ╔═╡ 774365fc-7891-4d77-a025-2c8639b5cc97
struct MultiDual{N,T} <: Number
    val::T
    derivs::SVector{N,T}
end

# ╔═╡ 1366595a-61f9-4633-8af1-dd4ffde5691d
md"""#### Conversion"""

# ╔═╡ 1515199c-b3b5-497c-8d7c-93ddaa3e28bb
import Base: convert

# ╔═╡ 12b751c6-ca55-4bee-bbb7-aa1c2269dcd9
function Base.:convert(::Type{MultiDual{N,T}},α::T) where {N,T<:Number}
    return MultiDual{N,T}(α,SVector{N,T}(zeros(N)))
end

# ╔═╡ 079bebe5-457d-455e-86b1-844f97583912
md"""#### Promotion"""

# ╔═╡ ea10ba3d-27f4-479a-a8c6-c3461beeb1e7
import Base:promote_rule

# ╔═╡ c403ebfe-4fbd-409a-b92e-fdbb7ab6206c
function Base.:promote_rule(::Type{MultiDual{N,T}},::Type{T}) where {N,T}
    return MultiDual{N,T}
end

# ╔═╡ c69a699b-aed7-48eb-9b85-5a78e70a40b8
md"""#### Method for adding 2 MultiDuals"""

# ╔═╡ dcaf6607-22b1-49e8-b2c0-c91807d3ecee
function Base.:+(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
    return MultiDual{N,T}(f.val+g.val,f.derivs+g.derivs)
end

# ╔═╡ 2e180c79-f789-4cac-90d4-73706c3b41fc
md"""#### Defining MultiDuals"""

# ╔═╡ 1a4df335-6949-4176-993b-89a788594dff
a = MultiDual{2,Float64}(8.0,SVector(1.0,0))

# ╔═╡ 46aa2478-7bbb-498a-aeae-6625dae2112a
b = MultiDual{2,Float64}(4.0,SVector(0.0,1.0))

# ╔═╡ f8bf3246-09a4-4eea-9401-b99111ef6ca2
md"""#### Addition Test Cases"""

# ╔═╡ 092d7bb5-80fd-4da9-8acc-38a804360d5c
a+b

# ╔═╡ 1ada5433-f3dc-461f-8c5c-826edf319560
a+2.0

# ╔═╡ 51cffdd4-6d2e-41df-b51a-60ce09665646
2.0+a

# ╔═╡ d5ea5ec6-0a30-41e0-8244-b3ddc7d61425
md"""#### Method for multiplying 2 MultiDuals"""

# ╔═╡ 6fb9e2f3-14fb-4778-affd-2dad167972bb
function Base.:*(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(f.val*g.val,f.derivs*g.val + f.val*g.derivs)
end

# ╔═╡ cfb60907-ffc6-4f0c-b6ae-1f915e355b7a
md"""#### Multiplication Test Cases"""

# ╔═╡ 8a4934e6-855a-4580-8aea-6719dc580270
a*b

# ╔═╡ 97c44b2e-95e7-4f47-8a0b-5f432a3307a9
a*2.0

# ╔═╡ e0c9fa78-28f9-4560-945b-d21be03353f8
2.0*a

# ╔═╡ bd98717c-8ac3-4282-83cc-7f5e3ae0731a
md"""#### Method for dividing 2 MultiDuals"""

# ╔═╡ 9897d8b1-af0e-46cf-8645-7e4fe5905539
function Base.:/(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(f.val/g.val,(f.derivs*g.val-f.val*g.derivs)/(g.val^2))
end

# ╔═╡ 5d6180ac-9a82-43d2-8ce4-cca949114be6
md"""#### Division Test Cases"""

# ╔═╡ 027594ef-73c3-4100-87cf-c2272d920204
a/b

# ╔═╡ 1a0e0984-2277-4be5-9359-c94fe2eb8a7e
a/2.0

# ╔═╡ 9e3795b4-231d-40ff-8249-7f8efaeed73f
2.0/a

# ╔═╡ 42fae96d-72bf-4543-95ac-1b322011a225
md"""#### Method for n-th power of a MultiDual"""

# ╔═╡ 714a9e8c-59d1-4dd4-b791-63176cef2d1c
function Base.:^(f::MultiDual{N,T},α::Number) where {N,T}
	return MultiDual{N,T}(f.val^α,α*(f.val^(α-1))*f.derivs)
end

# ╔═╡ b6e7cee8-8740-4e1d-8932-7f8d0ee55b3e
md"""#### Power Test Cases"""

# ╔═╡ 061aea1a-28c5-4969-bafd-bd312d702235
a^1.5

# ╔═╡ 697c1ac8-9073-4b1f-b698-53031a95756c
b^0.5

# ╔═╡ 4ae2c02b-34e8-41df-8105-c92af09e33e8
b^a.val

# ╔═╡ 479b11f3-3538-4128-9cc4-d7e4b264a9ba
md"""#### Method for Subtraction"""

# ╔═╡ d9d9632a-6981-4563-8973-42398c0b6913
function Base.:-(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(f.val-g.val,f.derivs-g.derivs)
end

# ╔═╡ 72367940-f587-4af4-84d5-06ad2016315c
function Base.:-(f::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(-f.val,-f.derivs)
end

# ╔═╡ 520149ad-ee18-46fe-b806-d98f1d5803e1
md"""#### Subtraction Test Cases"""

# ╔═╡ c463d229-2a32-4095-8af1-b61068e888f7
a-b

# ╔═╡ 0046984e-df58-42a3-8f63-b23052faeb88
a-2.0

# ╔═╡ 5adc8fc3-2e42-48a2-8128-88dbaf800a32
2.0-b

# ╔═╡ 6c867a48-9dbd-4e1f-9188-845265ace55b
md"""#### Method for Exponential"""

# ╔═╡ eddf9304-12a4-4fc8-a57f-d4374071b4b8
function Base.:exp(f::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(exp(f.val),exp(f.val)*f.derivs)
end

# ╔═╡ 4e1f6454-a7c5-462f-88fa-a2232cdf9e07
md"""#### Exponential Test Cases"""

# ╔═╡ e1e6a3a1-e7e7-44b5-804f-e1a0f20445a3
exp(a)

# ╔═╡ a52c8cff-1459-4d0d-95cb-2142e34a7004
exp(b)

# ╔═╡ 81053563-7629-45a5-ae9a-12fd587098b1
md"""#### Method for Logarithm"""

# ╔═╡ a1142f14-7b5e-4213-afcf-10d68eddcf33
function Base.:log(f::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(log(f.val),f.derivs/f.val)
end

# ╔═╡ 8a602bbf-618c-47b9-976a-a286bfe43dff
md"""#### Logarithm Test Cases"""

# ╔═╡ 7350af62-98a0-4028-b97c-c4968ba76952
log(a)

# ╔═╡ a13fb47d-a354-433d-a5c0-4b190499e601
log(b)

# ╔═╡ cfd64e8b-0b93-46f0-97f6-6c75e487ec3b
md"""#### Method for Absolute function"""

# ╔═╡ 8ca2fb23-4b9a-4c4f-8d8c-c4955b5d0a31
function Base.:abs(f::MultiDual{N,T}) where {N,T}
	if f.val>=0
		return MultiDual{N,T}(f.val,f.derivs)
	else
		return MultiDual{N,T}(-f.val,-f.derivs)
	end
end

# ╔═╡ a9527e0a-29be-4b65-88e5-2845ea43a9f5
md"""#### Absolute Function Test Cases"""

# ╔═╡ 6fa87d8a-f04b-4910-8971-0cfd89440291
abs(a)

# ╔═╡ 106fa9c1-209e-4288-a646-46e00f379c13
abs(-a)

# ╔═╡ 9d4b107e-0d52-41a5-93e8-14ce4e18c238
abs(-b)

# ╔═╡ b3518ea4-7051-4875-9fc9-aa7228a899a7
md"""#### Method for Sine function"""

# ╔═╡ c1f6dbf2-59e3-44a3-bc96-60b25a372c3b
function Base.:sin(f::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(sin(f.val),cos(f.val)*f.derivs)
end

# ╔═╡ dcf298c7-ff11-47cb-a138-502d77658a5f
md"""#### Sine Function Test Cases"""

# ╔═╡ 1a02c3a8-e308-4327-bcc0-3c8f49ad2f00
sin(a)

# ╔═╡ 58c777f3-5fcf-4476-b918-208c7964de86
sin(b)

# ╔═╡ ef82d6e9-ee70-4142-8f0c-d41c4799ea2f
md"""#### Method for Cosine function"""

# ╔═╡ 08e5e47d-4370-455c-8886-9cb84794ebf6
function Base.:cos(f::MultiDual{N,T}) where {N,T}
	return MultiDual{N,T}(cos(f.val),-1*sin(f.val)*f.derivs)
end

# ╔═╡ 9950d5f5-2e43-4030-add3-9076b81d1921
md"""#### Cosine Function Test Cases"""

# ╔═╡ 01467bfa-9143-425f-9701-147c36844ae8
cos(a)

# ╔═╡ 3792b46b-7d01-462a-b7f1-eaa26910f569
cos(b)

# ╔═╡ 7c357d92-04ad-4523-9dc6-78e59f4830b4
md"""#### Method for Comparision"""

# ╔═╡ d3d24230-7b08-43b1-902e-a8fdf2fc46df
function Base.:(<)(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return f.val<g.val
end

# ╔═╡ baec0c93-47e8-4a56-93a8-bf02b7cdbebc
function Base.:(<)(f::MultiDual{N,T},g::Number) where {N,T}
	return f.val<g
end

# ╔═╡ 14cfea0a-ef5a-463e-86d9-6a9ba1dc267c
function Base.:(<)(f::Number,g::MultiDual{N,T}) where {N,T}
	return f<g.val
end

# ╔═╡ 1e003a3c-d235-47cb-bd11-cd452479f261
function Base.:(>)(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return f.val>g.val
end

# ╔═╡ cda60ef5-e76b-4f5a-b782-1e1df0618bef
function Base.:(>)(f::MultiDual{N,T},g::Number) where {N,T}
	return f.val>g
end

# ╔═╡ 987d6b21-5e7f-41f2-b393-e3dc6aef2407
function Base.:(>)(f::Number,g::MultiDual{N,T}) where {N,T}
	return f>g.val
end

# ╔═╡ 303a5fa9-96a7-4931-b0bf-430fae1102ff
function Base.:(==)(f::MultiDual{N,T},g::MultiDual{N,T}) where {N,T}
	return f.val==g.val
end

# ╔═╡ b4d7ee5a-c802-4f7b-a9e3-05d66149860f
function Base.:(==)(f::MultiDual{N,T},g::Number) where {N,T}
	return f.val==g
end

# ╔═╡ c980bf0c-8d16-46d0-aef4-b253d5b03450
function Base.:(==)(f::Number,g::MultiDual{N,T}) where {N,T}
	return f==g.val
end

# ╔═╡ cb00c499-05c2-46c0-b27c-3bf1d11595fd
md"""#### Comparision Test Cases"""

# ╔═╡ ba3c7042-22df-4d88-a99f-1e94d1582ce4
a<=b

# ╔═╡ 749ab001-6347-4421-be05-5081a080e9e3
a>b

# ╔═╡ 340621df-0595-44b6-8098-63c6b921f87e
<(a,3.0)

# ╔═╡ 3fa93c0a-fd1f-4ccf-9e77-3014a7f1a12c
a!=b

# ╔═╡ 38d6f228-6df2-4298-b272-fe75d8731201
a==b

# ╔═╡ 809fbcc0-7abe-4f48-83b6-84a568b72888
b==4.0

# ╔═╡ 1be962d6-83c3-4f88-95ab-4e4a5aafe3f6
b!=4.0

# ╔═╡ ec46c280-c73e-4215-9cc1-6ee5052fb0ab
md"""#### Wrapper Function for Gradient"""

# ╔═╡ 87065ebb-0010-42b6-b94e-ad1f565348ec
∇(f::MultiDual{N,T}) where {N,T} = f.derivs

# ╔═╡ 6955aee3-40ac-4e67-a7fb-cf50352f2c87
∇(a)

# ╔═╡ b17185d5-04da-4af7-b927-e32d4fcf28ba
∇(b)

# ╔═╡ a62507b1-c0c5-4b18-98c2-7445cf1f6801
md"""
#### Jacobian of a given Function and input Vector
"""

# ╔═╡ cf1cdb32-ad08-4ee8-b93f-6606f6066ec9
f(x,y,z) = [(x^3)*y*(z^2),x*(y^3),x*y*z]

# ╔═╡ bcc3ef7c-1434-4fa2-9b17-8617a6963eb0
g(x,y) = [(x^3)*y,x*(y^3)]

# ╔═╡ 208afad6-f346-40f3-ada2-89570c947b15
vec = [3,1,2]

# ╔═╡ 46f2b14c-1c99-402e-8011-8af20334f9fe
vec1 = [1,2]

# ╔═╡ 1c35c11e-6725-4f05-927c-abb3189aa699
[gradient(vec->f(vec...)[1],vec),gradient(vec->f(vec...)[2],vec),gradient(vec->f(vec...)[3],vec)]

# ╔═╡ c45768cc-e091-4117-974d-25720b3cf1bb
md"""
The above output is the Jacobian matrix of function f(x,y,z) = [$x^3yz^2,xy^3,xyz$] and g(x,y) = [$x^3y,xy^3$].
We need to create the function for the same thing.
"""

# ╔═╡ ab59e86d-113b-44f0-98f6-eee31c2316a8
function Jac(f::Function,vec)
	mat = zeros(Number,(length(vec),length(vec)))
	for i in 1:length(vec)
		for j in 1:length(vec)
			mat[i,j] = gradient(vec->f(vec...)[i],vec)[1][j]
		end
	end
	return mat
end

# ╔═╡ f942a962-28f5-4d74-9ee1-836af1ad5467
Jac(f,vec)

# ╔═╡ 3279f9b1-3ade-4b21-8cdf-d3a9e156bcc3
Jac(g,vec1)

# ╔═╡ 065852af-fa09-4b54-958d-33d1e2fc32c9
md"""
Verification of our result by cross checking with jacobian function defined in ForwardDiff module
"""

# ╔═╡ 2165e1c8-5e3e-4773-aa7c-7bbd97ce8ad3
ForwardDiff.jacobian(vec->f(vec...),vec)

# ╔═╡ 930f2198-df61-4cc7-898f-d8f3baca3c33
ForwardDiff.jacobian(vec1->g(vec1...),vec1)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
ForwardDiff = "f6369f11-7733-5829-9624-2563aa707210"
StaticArrays = "90137ffa-7385-5640-81b9-e52037218182"
Zygote = "e88e6eb3-aa80-5325-afca-941959d7151f"

[compat]
ForwardDiff = "~0.10.18"
StaticArrays = "~1.2.6"
Zygote = "~0.6.16"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[AbstractFFTs]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "485ee0867925449198280d4af84bdb46a2a404d0"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.0.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ChainRules]]
deps = ["ChainRulesCore", "Compat", "LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "dabb81719f820cddd6df4916194d44f1fe282bd1"
uuid = "082447d4-558c-5d27-93f4-14fc19e9eca2"
version = "0.8.22"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "0b0aa9d61456940511416b59a0e902c57b154956"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "0.10.12"

[[CommonSubexpressions]]
deps = ["MacroTools", "Test"]
git-tree-sha1 = "7b8a93dba8af7e3b42fecabf646260105ac373f7"
uuid = "bbf7d656-a473-5ed7-a52c-81e309532950"
version = "0.3.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "dc7dedc2c2aa9faf59a55c622760a25cbefbe941"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.31.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[DiffResults]]
deps = ["StaticArrays"]
git-tree-sha1 = "c18e98cba888c6c25d1c3b048e4b3380ca956805"
uuid = "163ba53b-c6d8-5494-b064-1a9d43ac40c5"
version = "1.0.3"

[[DiffRules]]
deps = ["NaNMath", "Random", "SpecialFunctions"]
git-tree-sha1 = "214c3fcac57755cfda163d91c58893a8723f93e9"
uuid = "b552c78f-8df3-52c6-915a-8e097449b14b"
version = "1.0.2"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays"]
git-tree-sha1 = "25b9cc23ba3303de0ad2eac03f840de9104c9253"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.0"

[[ForwardDiff]]
deps = ["CommonSubexpressions", "DiffResults", "DiffRules", "LinearAlgebra", "NaNMath", "Printf", "Random", "SpecialFunctions", "StaticArrays"]
git-tree-sha1 = "e2af66012e08966366a43251e1fd421522908be6"
uuid = "f6369f11-7733-5829-9624-2563aa707210"
version = "0.10.18"

[[IRTools]]
deps = ["InteractiveUtils", "MacroTools", "Test"]
git-tree-sha1 = "95215cd0076a150ef46ff7928892bc341864c73c"
uuid = "7869d1d1-7146-5819-86e3-90919afe41df"
version = "0.4.3"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["DocStringExtensions", "LinearAlgebra"]
git-tree-sha1 = "7bd5f6565d80b6bf753738d2bc40a5dfea072070"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.2.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "6a8a2a625ab0dea913aba95c11370589e0239ff0"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.6"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "LogExpFunctions", "OpenSpecFun_jll"]
git-tree-sha1 = "a50550fa3164a8c46747e62063b4d774ac1bcf49"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.5.1"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "a43a7b58a6e7dc933b2fa2e0ca653ccf8bb8fd0e"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.6"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zygote]]
deps = ["AbstractFFTs", "ChainRules", "ChainRulesCore", "DiffRules", "Distributed", "FillArrays", "ForwardDiff", "IRTools", "InteractiveUtils", "LinearAlgebra", "MacroTools", "NaNMath", "Random", "Requires", "SpecialFunctions", "Statistics", "ZygoteRules"]
git-tree-sha1 = "4f9a5ba559da1fc7474f2ece6c6c1e21c4ab989c"
uuid = "e88e6eb3-aa80-5325-afca-941959d7151f"
version = "0.6.16"

[[ZygoteRules]]
deps = ["MacroTools"]
git-tree-sha1 = "9e7a1e8ca60b742e508a315c17eef5211e7fbfd7"
uuid = "700de1a5-db45-46bc-99cf-38207098b444"
version = "0.2.1"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═89e15700-e498-11eb-33cc-e117104bb05d
# ╠═7fa3cdd3-000a-42a7-b2c0-e53865e9c72b
# ╟─dfef3465-3eb7-49c5-8fef-4112b2b7eb79
# ╠═774365fc-7891-4d77-a025-2c8639b5cc97
# ╟─1366595a-61f9-4633-8af1-dd4ffde5691d
# ╠═1515199c-b3b5-497c-8d7c-93ddaa3e28bb
# ╠═12b751c6-ca55-4bee-bbb7-aa1c2269dcd9
# ╟─079bebe5-457d-455e-86b1-844f97583912
# ╠═ea10ba3d-27f4-479a-a8c6-c3461beeb1e7
# ╠═c403ebfe-4fbd-409a-b92e-fdbb7ab6206c
# ╟─c69a699b-aed7-48eb-9b85-5a78e70a40b8
# ╠═dcaf6607-22b1-49e8-b2c0-c91807d3ecee
# ╟─2e180c79-f789-4cac-90d4-73706c3b41fc
# ╠═1a4df335-6949-4176-993b-89a788594dff
# ╠═46aa2478-7bbb-498a-aeae-6625dae2112a
# ╟─f8bf3246-09a4-4eea-9401-b99111ef6ca2
# ╠═092d7bb5-80fd-4da9-8acc-38a804360d5c
# ╠═1ada5433-f3dc-461f-8c5c-826edf319560
# ╠═51cffdd4-6d2e-41df-b51a-60ce09665646
# ╟─d5ea5ec6-0a30-41e0-8244-b3ddc7d61425
# ╠═6fb9e2f3-14fb-4778-affd-2dad167972bb
# ╟─cfb60907-ffc6-4f0c-b6ae-1f915e355b7a
# ╠═8a4934e6-855a-4580-8aea-6719dc580270
# ╠═97c44b2e-95e7-4f47-8a0b-5f432a3307a9
# ╠═e0c9fa78-28f9-4560-945b-d21be03353f8
# ╟─bd98717c-8ac3-4282-83cc-7f5e3ae0731a
# ╠═9897d8b1-af0e-46cf-8645-7e4fe5905539
# ╟─5d6180ac-9a82-43d2-8ce4-cca949114be6
# ╠═027594ef-73c3-4100-87cf-c2272d920204
# ╠═1a0e0984-2277-4be5-9359-c94fe2eb8a7e
# ╠═9e3795b4-231d-40ff-8249-7f8efaeed73f
# ╟─42fae96d-72bf-4543-95ac-1b322011a225
# ╠═714a9e8c-59d1-4dd4-b791-63176cef2d1c
# ╟─b6e7cee8-8740-4e1d-8932-7f8d0ee55b3e
# ╠═061aea1a-28c5-4969-bafd-bd312d702235
# ╠═697c1ac8-9073-4b1f-b698-53031a95756c
# ╠═4ae2c02b-34e8-41df-8105-c92af09e33e8
# ╟─479b11f3-3538-4128-9cc4-d7e4b264a9ba
# ╠═d9d9632a-6981-4563-8973-42398c0b6913
# ╠═72367940-f587-4af4-84d5-06ad2016315c
# ╟─520149ad-ee18-46fe-b806-d98f1d5803e1
# ╠═c463d229-2a32-4095-8af1-b61068e888f7
# ╠═0046984e-df58-42a3-8f63-b23052faeb88
# ╠═5adc8fc3-2e42-48a2-8128-88dbaf800a32
# ╟─6c867a48-9dbd-4e1f-9188-845265ace55b
# ╠═eddf9304-12a4-4fc8-a57f-d4374071b4b8
# ╟─4e1f6454-a7c5-462f-88fa-a2232cdf9e07
# ╠═e1e6a3a1-e7e7-44b5-804f-e1a0f20445a3
# ╠═a52c8cff-1459-4d0d-95cb-2142e34a7004
# ╟─81053563-7629-45a5-ae9a-12fd587098b1
# ╠═a1142f14-7b5e-4213-afcf-10d68eddcf33
# ╟─8a602bbf-618c-47b9-976a-a286bfe43dff
# ╠═7350af62-98a0-4028-b97c-c4968ba76952
# ╠═a13fb47d-a354-433d-a5c0-4b190499e601
# ╟─cfd64e8b-0b93-46f0-97f6-6c75e487ec3b
# ╠═8ca2fb23-4b9a-4c4f-8d8c-c4955b5d0a31
# ╟─a9527e0a-29be-4b65-88e5-2845ea43a9f5
# ╠═6fa87d8a-f04b-4910-8971-0cfd89440291
# ╠═106fa9c1-209e-4288-a646-46e00f379c13
# ╠═9d4b107e-0d52-41a5-93e8-14ce4e18c238
# ╟─b3518ea4-7051-4875-9fc9-aa7228a899a7
# ╠═c1f6dbf2-59e3-44a3-bc96-60b25a372c3b
# ╟─dcf298c7-ff11-47cb-a138-502d77658a5f
# ╠═1a02c3a8-e308-4327-bcc0-3c8f49ad2f00
# ╠═58c777f3-5fcf-4476-b918-208c7964de86
# ╟─ef82d6e9-ee70-4142-8f0c-d41c4799ea2f
# ╠═08e5e47d-4370-455c-8886-9cb84794ebf6
# ╟─9950d5f5-2e43-4030-add3-9076b81d1921
# ╠═01467bfa-9143-425f-9701-147c36844ae8
# ╠═3792b46b-7d01-462a-b7f1-eaa26910f569
# ╟─7c357d92-04ad-4523-9dc6-78e59f4830b4
# ╠═d3d24230-7b08-43b1-902e-a8fdf2fc46df
# ╠═baec0c93-47e8-4a56-93a8-bf02b7cdbebc
# ╠═14cfea0a-ef5a-463e-86d9-6a9ba1dc267c
# ╠═1e003a3c-d235-47cb-bd11-cd452479f261
# ╠═cda60ef5-e76b-4f5a-b782-1e1df0618bef
# ╠═987d6b21-5e7f-41f2-b393-e3dc6aef2407
# ╠═303a5fa9-96a7-4931-b0bf-430fae1102ff
# ╠═b4d7ee5a-c802-4f7b-a9e3-05d66149860f
# ╠═c980bf0c-8d16-46d0-aef4-b253d5b03450
# ╟─cb00c499-05c2-46c0-b27c-3bf1d11595fd
# ╠═ba3c7042-22df-4d88-a99f-1e94d1582ce4
# ╠═749ab001-6347-4421-be05-5081a080e9e3
# ╠═340621df-0595-44b6-8098-63c6b921f87e
# ╠═3fa93c0a-fd1f-4ccf-9e77-3014a7f1a12c
# ╠═38d6f228-6df2-4298-b272-fe75d8731201
# ╠═809fbcc0-7abe-4f48-83b6-84a568b72888
# ╠═1be962d6-83c3-4f88-95ab-4e4a5aafe3f6
# ╟─ec46c280-c73e-4215-9cc1-6ee5052fb0ab
# ╠═87065ebb-0010-42b6-b94e-ad1f565348ec
# ╠═6955aee3-40ac-4e67-a7fb-cf50352f2c87
# ╠═b17185d5-04da-4af7-b927-e32d4fcf28ba
# ╟─a62507b1-c0c5-4b18-98c2-7445cf1f6801
# ╠═cf1cdb32-ad08-4ee8-b93f-6606f6066ec9
# ╠═bcc3ef7c-1434-4fa2-9b17-8617a6963eb0
# ╠═208afad6-f346-40f3-ada2-89570c947b15
# ╠═46f2b14c-1c99-402e-8011-8af20334f9fe
# ╠═1c35c11e-6725-4f05-927c-abb3189aa699
# ╟─c45768cc-e091-4117-974d-25720b3cf1bb
# ╠═ab59e86d-113b-44f0-98f6-eee31c2316a8
# ╠═f942a962-28f5-4d74-9ee1-836af1ad5467
# ╠═3279f9b1-3ade-4b21-8cdf-d3a9e156bcc3
# ╟─065852af-fa09-4b54-958d-33d1e2fc32c9
# ╠═2165e1c8-5e3e-4773-aa7c-7bbd97ce8ad3
# ╠═930f2198-df61-4cc7-898f-d8f3baca3c33
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
