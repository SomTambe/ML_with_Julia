function triangle(n)
    for i in 1:n
        for j in 0:i
            return(binomial(i,j))
        end
    end
end
triangle(5)
