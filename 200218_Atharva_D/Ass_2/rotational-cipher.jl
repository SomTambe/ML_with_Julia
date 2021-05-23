function rotate(k,str)
    set=""
    for i in str
        if (i>='A' && i<='Z') || (i>='a' && i<='z')
            if lowercase(i)+(k%26)>'z'
                set*=i+(k%26)-26
            else
                set*=i+(k%26) 
            end
        end
    end
    return set
end