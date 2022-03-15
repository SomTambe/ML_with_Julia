function encode(s)
    
    s*="☻"
    encoded="";
    l=length(s);
    j=1
    i=1
    while i<=(l-1)
        c1=s[i]
        c2=s[i+1]
        if (c1==c2)
            j+=1 
        else
            if j!=1
                encoded=encoded*string(j);
                encoded*=c1;
                j=1
            else
                encoded*=c1;
            end
        end
        i+=1;
    end
 return encoded

end





function decode(s)

    c=' '
    n="";
    num=0;
    decode=""
    for c in s
        if(c>='0' && c<='9')
            n=n*c;
        
        else
            if n==""
                n="1"
            end
            num=parse(Int64, n)
            j=num
            while j!=0
                decode*=c;
                j-=1;
            end
            n=""
        end
    end
    return decode;

end
