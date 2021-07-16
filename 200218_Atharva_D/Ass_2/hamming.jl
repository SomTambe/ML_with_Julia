"Your optional docstring here"
function distance(a, b)
    count = 0

    if (length(a) != length(b))
        throw(ArgumentError("invalid"))
    end
    
    for i in 1:length(a)
        if a[i] == b[i]
            count = count + 0
        elseif a[i] != b[i]
            count +=1
        end
    end
    count

end
