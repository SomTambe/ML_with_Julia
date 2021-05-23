function encode(input)
    input=lowercase(input)
    d=Dict()
    for i in 1:26
        d['a'+i-1]='z'+1-i
    end
    count=0
    encoded=""
    for i in input
        if i>='a'&&i<='z'
            i=d[i]
            encoded=encoded*i
            count+=1
            if count%5==0&&count!=0
                encoded=encoded*" "
            end
        elseif i>='0'&&i<='9'
            encoded=encoded*i
            count+=1
            if count%5==0&&count!=0
                encoded=encoded*" "
            end
        end
        

    end
    encoded=strip(encoded)
    return encoded
end

function decode(input)
    input=lowercase(input)
    d=Dict()
    decoded=""
    for i in 1:26
        d['a'+i-1]='z'+1-i
    end
    for i in input
        if i>='a'&&i<='z'
            i=d[i]
            decoded=decoded*i
        elseif i>='0'&&i<='9'
            decoded=decoded*i
        end
    end
    return decoded
end

