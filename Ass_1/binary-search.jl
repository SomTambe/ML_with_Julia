function binarysearch(list, s)
    lower=1
    upper=length(list)
    j=0
    while lower<upper
        j=floor(Int64,(lower+upper)/2)
        a=list[j]
        if (a>s)
            upper=j
        elseif (s>a)
            lower=j
        elseif (s==a)
            return j:j 
            break
        end
    end

    return lower:upper

end