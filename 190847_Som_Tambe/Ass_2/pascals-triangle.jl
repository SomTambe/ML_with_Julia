function triangle(n)
    if n<0
        throw(DomainError("n can't be negative"))
    
    elseif n==0
        return [[]]
    
    elseif n==1
        return [[1]]
    end
    
    d=[[1]]
    for i in 1:n-1
        d1=[]
        for j in 0:i
            push!(d1,binomial(i,j))
        end
        push!(d,d1)
    end
    return d
end
