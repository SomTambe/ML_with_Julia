function encode(input)
    res=[]
    m=0
    input=lowercase(input)
    for i=1:length(input )
        if(m==5 && i<length(input))
            push!(res, " ")
            m=0
        end
        if(input[i]<='z' && input[i]>='a')  
            c='z'+('a'-input[i])
            push!(res, c)
            m=m+1
            continue
        end
        if(input[i]>='0' && input[i]<='9')
            push!(res, input[i])
            m=m+1
        end
    end
    return join(res)
end

function decode(input)
    res=[]
    m=0
    input=lowercase(input)
    for i=1:length(input )
        if(m==5 && i<length(input))
            m=0
        end
        if(input[i]<='z' && input[i]>='a')  
            c='z'+('a'-input[i])
            push!(res, c)
            m=m+1
            continue
        end
        if(input[i]>='0' && input[i]<='9')
            push!(res, input[i])
            m=m+1
        end
    end
    return join(res)
end
