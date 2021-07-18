function score(x, y)
    d=sqrt(x*x+y*y)
    points=0
    if d>10
        points=0
    elseif d>5&&d<=10
        points=1
    elseif d>1&&d<=5
        points=5
    elseif d<=1
        points=10
    end
    return points
end
