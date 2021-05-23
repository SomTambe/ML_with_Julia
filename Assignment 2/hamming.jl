"Your optional docstring here"
function distance(a, b)
    arr1=split(a, "")
    arr2=split(b, "")
    c=0
    if(length(a)!=length(b)) 
        throw(ArgumentError("lengths are diferent"))
    end
    for i=1:length(arr1)
        if(arr1[i]!=arr2[i])
            c=c+1
        end
    end
    return c
end
