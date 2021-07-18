function ispangram(input)
    input= lowercase(input)
    alphabet=Set('a':'z')
    setdiff!(alphabet,Set(input))
    return length(alphabet)==0
end
