function binarysearch(list,key)
    a=length(list)
    i=0
    while i<a
        c=1+floor(Int,(a-i)/2)
        if list[c]==key
            return c:c
        elseif list[c]<key
            i=c+1
        else
            a=c-1
        end
    end
end