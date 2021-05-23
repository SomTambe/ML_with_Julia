function triangle(n)
    if n<0
        throw(DomainError("INVALID"))
    end
    if n==0
        return []
    end
    if n==1
        return [[1]]
    elseif n==2
        return [[1],[1,1]]
    end
    d=[[1],[1,1]]
    d1=Array([])
    x=0
    for i in 3:n
        d1=Array([])
        for j in 1:i
            if j==1||j==i
                push!(d1,1)
            else
                x=d[i-1][j-1]+d[i-1][j]
                push!(d1, x)
            end
        end
        push!(d,d1)
    end
    return d
end
