function score(x, y)
    r=x*x+y*y
    if r>100
        return 0
    elseif r>25
        return 1
    elseif r>1
        return 5
    else
        return 10
    end

end
