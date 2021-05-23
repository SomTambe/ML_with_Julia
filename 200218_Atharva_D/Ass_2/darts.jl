function score(x, y)
    score = 0
    r = √(x*x + y*y)
    
    if r > 10
        score = 0
    elseif (r<=10 && r>5)
        score = 1
    elseif (r<=5 && r>1)
        score = 5
    elseif (r<=1 && r>=0) 
        score = 10
    else
        throw(UndefVarError("error"))
    end
    score
end
