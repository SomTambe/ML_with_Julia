function score(x, y)
    point=0;
    dist = √(x*x+y*y)
    if(dist<=1)
        point= 10
    elseif(dist<=5)
        point=5
    elseif(dist<=10)
        point=1
    else
        point=0
    end
end
