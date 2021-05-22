function rotate(n,str)
    s=""
    if typeof(str)==Char
        for i in str
            a=i-'a'
            if n>=26
                n=n-26
            end
            return 'a'+n+a
        end
    end
    if length(str)==1
        for i in str
            a=i-'a'
            if i+n>=26
                n=n-26
            end
            return string('a'+n+a)
        end
    end
    for i in str
        a=i-'a'
        b='a'+n+a
        s*=string(b)
        
    end
    return s
end
rotate(13, "n")
