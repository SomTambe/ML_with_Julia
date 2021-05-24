function atbash(ch::Char)::Char
    ch ∈ 'a':'z' || return ch
    return 'n' - ch + 'm'
end

function encode(input::String)::String
    input_array::Array = input |> lowercase |> collect
    ciphered::Array = [atbash(x) for x in input_array 
                                 if (x ∈'a':'z' || x ∈'0':'9')]

    return  [i % 5 == 0 ? "$(v) " : "$(v)" 
             for (i, v) in enumerate(ciphered)] |> join |> strip
end

function decode(input::String)::String
    return [atbash(x) for x in input if (x ∈'a':'z' || x ∈'0':'9')] |> join
end