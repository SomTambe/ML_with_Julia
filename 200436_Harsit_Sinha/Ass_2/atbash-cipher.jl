function decode(input)
    str=""
    new=0
    count =0
    for i in input
        if i==' ' continue end
        if i>='a' && i<='z' 
            new=i-'a'
            b='z'-new
            str*=string(b)
            #println(i)
        elseif i>='A' && i<='Z'
            new=i-'A'
            b='z'-new
            str*=string(b)
        elseif i>='0' && i<='9'
            str*=string(i)
        else continue 
        end
    end
    return str
end

function encode(input)
    str=""
    new=0
    count=1
    for i in input
        
        if i==' ' continue end
        if i>='a' && i<='z' 
            new='z'-i
            b='a'+ new
            str*=string(b)
        elseif i>='A' && i<='Z'
            new=i-'A'
            b='z'-new
            str*=string(b)
        elseif i>='0' && i<='9'
            str*=string(i)
        else continue 
        end
        if count%5==0 str*=" " end
        count+=1
    end
    return strip(str)
end
