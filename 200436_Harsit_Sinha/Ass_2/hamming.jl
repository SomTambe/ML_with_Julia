"Your optional docstring here"
#I was not able to solve this completely. This solution is inspired by someone in exercism
function distance(s1, s2)
    if length(s1) != length(s2)
        throw(ArgumentError("strings must be same length"))
    end

    # take 2, more functional
    count(map(≠, s1, s2))
end
