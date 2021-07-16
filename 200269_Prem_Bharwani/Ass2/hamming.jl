"Your optional docstring here"
function distance(a, b)
    lena=length(a)
    if length(a)==length(b)
        len=0
        for x in 1:length(a)
            if (a[x] != b[x])
                len+=1
            end
        end
        return len
    else
    throw(ArgumentError("$lena Strings don't match in length"))
    end
end

# print(distance("GGACTGA","GGACTGA"))
