function distance(a, b)
    if (length(a)==length(b))
        i=1
        count=0
        while i<=length(a)
            if a[i]!=b[i]
                count+=1 
                i+=1
            else 
                i+=1
            end
        end
    else
        throw(exception())
    end
    return count
end
