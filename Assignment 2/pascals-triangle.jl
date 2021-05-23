function triangle(n)
    function triangle(n)
    if(n<0) throw(DomainError("n<0"))
    end
    return [[binomial(j,k) for k in 0:j] for j in 0:(n-1)]
end
