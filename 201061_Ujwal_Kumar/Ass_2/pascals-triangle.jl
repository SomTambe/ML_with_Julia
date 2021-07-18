function triangle(n)

 if !isinteger(n) | (n < 0)
        throw(DomainError("Invalid input"))
    end
    result = Array{Array{Int, 1}, 1}()
    for i in 1:n
        lvl = Array{Int, 1}()
        for j in 1:i
            if (j == 1) | (j == i)
                push!(lvl, 1)
            else
                push!(lvl, result[i-1][j-1] + result[i-1][j])
            end
        end
        push!(result, lvl)
    end
    result


end
