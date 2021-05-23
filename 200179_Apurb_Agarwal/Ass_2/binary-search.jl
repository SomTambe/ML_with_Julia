 
 # please check test number 9
 
 function binarysearch(arr, num)
    if length(arr)==0
        return 1:0
    end
    s=1
    e=length(arr)
    m=0
    m=Int(floor((s+e)/2))
    while s<e
        m=Int(floor((s+e)/2))
        if num<arr[m]
            e=m-1
        elseif num>arr[m]
            s=m+1
        elseif num==arr[m]
            s=m
            e=s
        end
    end
    if arr[s]==num
        return s:s
    else
        return s:(s-1)
    end
    
 end

 