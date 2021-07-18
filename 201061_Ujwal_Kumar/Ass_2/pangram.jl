"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
l=length(input)
 str = uppercase(input)
    ch = 'A'
    while ch ≤ 'Z'
        if !occursin(ch,str)
            return false
        end
        ch += 1
    end
    return true
end

