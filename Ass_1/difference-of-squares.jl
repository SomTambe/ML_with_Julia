"Square the sum of the first `n` positive integers"
function square_of_sum(n)

    sqs=0;
    for i=1:n
        sqs+=i;
    end
    sqs=sqs^2;
    return sqs;

end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)

    sqs=0;
    for i=1:n
        sqs+=(i^2);
    end
    return sqs;
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
   return (square_of_sum(n)-sum_of_squares(n));
end
