"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)

    set ='a':'z'
    if set ⊆ lowercase(input)
        return true
    else return false
    end

end
    

