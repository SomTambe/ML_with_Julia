"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    input=uppercase(input)
    d=Dict()
    f=0
    for i in 'A':'Z'
        d[i]=0
    end
    if length(input)==0
        return false
    else
        for i in input
            if i>='A'&&i<='Z'
                d[i]=d[i]+1
            end
        end
        for i in 'A':'Z'
            if d[i]==0
                f=1
            end
        end
        if f==1
            return false
        else 
            return true
        end
    end
end

