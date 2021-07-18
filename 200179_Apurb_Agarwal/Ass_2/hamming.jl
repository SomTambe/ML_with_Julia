"Your optional docstring here"
function distance(a, b)
    
    if length(a)!=length(b)
        throw(ArgumentError("INVALID"))
    else 
        count=0
        j=1
        for i in 1:length(a)
            if a[i]!=b[j]
               count+=1
            end
        j+=1
        end
        return count
    end
    
end
