"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    A = zeros(Int32, 26)
    count=Set(c for c in lowercase(input) if c in 'a':'z')
    
    return length(count)==26
end

