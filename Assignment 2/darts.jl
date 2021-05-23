function score(x, y)
    r=x*x+y*y
    
    if(r<=1)
        return 10
    else
        if(r<=25)
            return 5
        else 
            if(r<=100)
                return 1
            else
                return 0
            end
        end
    end
end
