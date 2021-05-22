function is_alphabet(ch)
    c=lowercase(ch)
    if Int(c)>=97 && Int(c)<=122
        return true
    end
    return false
end

function rotate(no,str)
    n=no%26
    buffer=IOBuffer()
    for x in str
        if is_alphabet(x)==false
            print(buffer,x);continue
        end
        ni=Int(x)
        if ni<=90
            # capital
            if ni+n<=90
                print(buffer,x+n)
            else
                print(buffer,x+ni+n-91)
            end
        else
            # lowercase
            if ni+n<=122
                print(buffer,x+n)
            else
                print(buffer,x+ni+n-123)
            end
        end
    end
    return (String(take!(buffer)))  
end

println(rotate(12,'n'))
