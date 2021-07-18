function encode(s)
    if(isempty(s))
        return s
    end
    
    s=split(s, "")
    res=[]
    c=1
    #print("\"")
    for i=1:length(s)-1
        if(s[i]==s[i+1] && i<(length(s)-1))
            c=c+1
        else
            if(i==length(s)-1 && s[i]==s[i+1])
                    c=c+1
            end
            if(c>1)
                push!(res, c)
                c=1
            end
            push!(res, s[i])
            if(i==length(s)-1 && (s[i]!=s[i+1]))
                push!(res, s[i+1])
            end
        end
    end
    return join(res)
end



function decode(s)
    if(isempty(s))
        return s
    end
    
    res=[]
    i=1
    while(i<=length(s))
        #println(i, s[i])
       # println(i)
        if((s[i]>'1' && s[i]<='9' && i<=length(s)-1)|| (i<=length(s)-1 && s[i+1]>='1' && s[i+1]<='9'))
            if(s[i]>='1' && s[i]<='9')
                m=parse(Int64,s[i])
                i=i+1
                if(s[i]>='1' && s[i]<='9')
                    m=m*10+parse(Int64,s[i])
                    i=i+1
                end
                for j=2:m
         #           print(s[i+1])
                    push!(res, s[i])
                end
                continue
            end
        end
        #print(s[i])
        push!(res, s[i])
        i=i+1
    end
    return join(res)
end