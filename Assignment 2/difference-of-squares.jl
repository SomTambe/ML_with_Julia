"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    k=0
    for i=1:n
        k+=i
    end
    return k*k
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    k=0
    for i=1:n
        k+=i*i
    end
    return k
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return abs(square_of_sum(n)-sum_of_squares(n))
end