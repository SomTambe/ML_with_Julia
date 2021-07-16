function triangle(n::Int)
    n<0 && throw(DomainError("Value is negative"))
    n==0 && return []
    n==1 && return [[1]]cd
    t=triangle(n-1)
    push!(t,[t[end];0]+[0;t[end]])
end
