function score(x, y)
d=sqrt(x^2+y^2)
   
if d <=1
        return 10
    elseif d<=5
            return 5
        elseif d<=10 
                return 1 
            else
                return 0
            end 
            
end

