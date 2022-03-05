function score(x, y)
    radius=√(x*x + y*y)
    sc=0
    if radius>10
        sc=0
    elseif radius<=10 && radius>5
        sc=1
    elseif radius<=5 && radius>1
        sc=5
    else
        sc=10
    end
    sc
end
