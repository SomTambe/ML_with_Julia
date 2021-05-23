"Your optional docstring here"
function distance(a, b)
    if length(a)!=length(b)
        throw(ArgumentError("Same length string required"))
    end

    diff=0
    for i in 1:length(a)
        if a[i]!=b[i]
            diff+=1
        end
    end

    diff
end
