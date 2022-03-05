function rotate(k::Int,str::String)
    s=""
    for i in str
        if (i>='a' && i<='z') || (i>='A' && i<='Z')
            if lowercase(i)+(k%26)>'z'
                s*=i+(k%26)-26
            else
                s*=i+(k%26)
            end
        else
            s*=i
        end
    end
    return s
end

function rotate(k::Int,a::Char)
    if lowercase(a)+(k%26)>'z'
        a+=(k%26)-26
    else
        a+=k%26
    end
    return a
end
