"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input= lowercase(input)
    alphabet=Set('a':'z')
    setdiff!(alphabet,Set(input))
    return length(alphabet)==0
end
ispangram("the quick brown fox jumps over the lazy dog")
