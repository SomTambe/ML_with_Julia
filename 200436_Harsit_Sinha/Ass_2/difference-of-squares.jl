"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    if n==0 return 0 end
    (mapreduce(x->x,+,[1:n;]))^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    if n==0 return 0 end
    mapreduce(x->x^2,+,[1:n;])
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    abs(sum_of_squares(n)-square_of_sum(n))
end
