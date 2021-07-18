function encode(s)
    if isempty(s)
        return ""
    end
    output=""
    current=s[1]
    count=1
    for char in s[2:end]
        if char == current
            count+=1
        else
            if count==1
                output = output*current
            else
                output=output* string(count, base=10)*current
            end
            current =char
            count=1
        end
    end
    if count == 1
        output = output * current
    else
        output = output * string(count, base=10) * current
    end
    
    return output

end



function decode(s)
    if isempty(s)
        return ""
    end
    output = ""
    n_str = ""
    for char in s
        if isnumeric(char)
            n_str = n_str * char
        else
            if isempty(n_str)
                number = 1
            else
                number = parse(Int, n_str)
            end
            output = output * char ^ number
            n_str = ""
        end
    end

    return output



end
