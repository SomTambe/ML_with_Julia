function encode(input)
    d=Dict()
    for i in 1:26
        d['a'+i-1]='z'+1-i
        d['A'+i-1]='z'+1-i
    end
    s=""
    count=0
    for i ∈ input
        if (i ∈ 'a':'z' || i ∈ 'A':'Z')
               s*=d[i]
        elseif i ∈ '0':'9'
            s*=i
        else
            continue
        end
        count+=1
        if count==5
            s*=' '
            count=0
        end
    end
    return s
end

function decode(input)
    d=Dict()
    for i in 1:26
        d['a'+i-1]='z'+1-i
        d['A'+i-1]='z'+1-i
    end
    s=""
    for i ∈ input
        if(i ∈ 'a':'z' || i ∈ 'A':'Z')
            s*=d[i]
        elseif s ∈ '0':'9'
            s*=i
        end
    end
    return strip(s)
end

