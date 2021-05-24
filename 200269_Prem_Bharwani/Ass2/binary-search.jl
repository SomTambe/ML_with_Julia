function binarysearch(list, n; rev=false, by=identity, lt=<)
    start = 1
    stop = length(list)
    n = by(n)

    while start <= stop
        pivot = (start + stop) ÷ 2
        order = cmp(lt, by(list[pivot]), n)

        if order == 0
            return pivot:pivot
        elseif rev ? order > 0 : order < 0
            start = pivot + 1
        else
            stop = pivot - 1
        end
    end

    return start:stop
end