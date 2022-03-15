function score(x, y)
    
    score=0;
    d1=(x^2+y^2)^.5;
    if d1<=1
        score=10;
    elseif d1<=5 && d1>1
        score=5;
    elseif d1>5 && d1<=10
        score=1;
    end

    return score;

end
