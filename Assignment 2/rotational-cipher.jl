function rotate(n, str)
    n=n%26
    #println(n) 
    if(typeof(str)==Char)
        str=str+n
        if(str>'z')
            str=str-'z'+'a'-1
        end
        if(str>'z')
            str=str-'Z'+'A'-1
        end
        return str
    else  
        res=[]
        for i=1:length(str)
            if(str[i]>='a' && str[i]<='z')
                c=str[i]+n
                if(c>'z')
                    c=c-'z'+'a'-1
                end
                push!(res, c)
                continue
            end
            if(str[i]>='A' && str[i]<='Z')
                c=str[i]+n
                if(c>'Z')
                    c=c-'Z'+'A'-1
                end
                push!(res, c)
                continue
            end
            push!(res, str[i])
        end
        return join(res)    
    end
end