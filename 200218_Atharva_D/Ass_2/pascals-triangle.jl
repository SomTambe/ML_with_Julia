function triangle(n)

    if n<0
        throw(DomainError("error"))
    end
    if n==0
        throw(DomainError("error"))
    end
    x=0
    while x<=n
        for y = 0:x
            print(binomial(x,y)," ")
        end
        println("")
        x = x+1
    end
  
end
