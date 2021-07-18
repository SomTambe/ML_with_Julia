function score(x, y)
    if x^2+y^2 <=1
        points=10
    elseif (x^2+y^2<=25 && x^2+y^2>1)
        points=5
    elseif (x^2+y^2<=100 && x^2+y^2>25)   
        points=1
    else 
        points=0     
    end
    return points
end
