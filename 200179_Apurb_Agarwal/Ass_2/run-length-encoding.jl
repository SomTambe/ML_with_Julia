function encode(s)
    if length(s)==0
        return s
    end
    prev=s[1]
    len=1
    encoded_s=""
    for i in 2:length(s)
        curr=s[i]
        if curr==prev
            len=len+1
        else
            if len==1
                encoded_s=encoded_s*prev
            else
                encoded_s=encoded_s*string(len, base=10)*prev
            end
            len=1
        end
    prev=curr
    end
    if len==1
        encoded_s=encoded_s*prev
    else
        encoded_s=encoded_s*string(len, base=10)*prev
    end
    return encoded_s
end



function decode(s)
    if length(s)==0
        return s
    end
    num=0
    decoded_s=""
    for i in 1:length(s)
        c=s[i]
        if c>='0'&&c<='9'
            num=10*num+(c-'0')
        else
            if num==0
                decoded_s=decoded_s*c
            else
                for i in 1:num
                    decoded_s=decoded_s*c
                end
            end
            num=0
        end
    end
    return decoded_s
end
