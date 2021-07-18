function triangle(n)
  r=[[1]]
    if n==0
       return []
elseif n<0
       throw(DomainError(n, "argument must be a natural number"))
    elseif n==1
        return[[1]]
    else
        for k in 1:n-1
            t=Int[]
        for i in 0:k
              push!(t, Int(factorial(k)/(factorial(i)*factorial(k-i))))  
        
        end
            push!(r,t)
            end
    end  
  return r 
end