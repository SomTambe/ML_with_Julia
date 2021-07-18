"Square the sum of the first `n` positive integers"
function square_of_sum(n)

return sum(1:n) ^ 2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)

return sum((1:n) .^ 2) 
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
return abs(sum_of_squares(n)-square_of_sum(n))
end
