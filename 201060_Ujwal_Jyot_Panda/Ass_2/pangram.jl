"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    letter='a':'z'
    return letter ⊆ lowercase(input)
    
end

