function rotate(i::Integer, c::AbstractChar)
    n = Int(c)
    if Int('A') ≤ n ≤ Int('Z') 
        n = (n - Int('A') + i) % 26 + Int('A')
    elseif Int('a') ≤ n ≤ Int('z')
        n = (n - Int('a') + i) % 26 + Int('a')
    end
    return Char(n)
end

function rotate(i::Integer, s::AbstractString)
    return join(rotate(i, c) for c in s)
end