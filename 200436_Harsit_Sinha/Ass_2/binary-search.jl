function binarysearch(list,x)
    r= length(list)-1
    l=0
    while l<=r
        mid= 1+trunc(Int,(r-l)/2)
        if list[mid]== x
            return mid:mid
        elseif list[mid] < x
            l=mid+1
        else
            r= mid-1
        end
    end  
    
end
