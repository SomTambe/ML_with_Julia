function encode(input)
    
    i=1
    l=length(input)
    out=""
    j=0
    while i<=l
        c=input[i]
        if j%5==0 && j!=0
            out*=" ";
        end
        if c==" "
           i+=1
           continue
        end
        
        if '0'<=c<='9'
            out*=c
            i=i+1
            j+=1
            continue
        elseif 'A'<=c<='Z'
            c=c+32
        end

        if 'a'<=c<='z'
            out*=('a'+Int('z')-Int(c))
            j+=1
        end
        i+=1
    end

    s=""
    arr=split(out)
    out=""
    for s in arr
    out=out*s*" "
    end
    out=strip(out)

    return out
   
end

function decode(input)

    i=1
    l=length(input)
    out=""
    while i<=l
        c=input[i]
        
        if c==" "
           i+=1
           continue
        end
        
        if '0'<=c<='9'
            out*=c
            i=i+1
            continue
        end

        if 'a'<=c<='z'
            out*=('a'+Int('z')-Int(c))
        end
        i+=1
    end
    

    return out

end

