"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    
    s=input;
    s=lowercase(s)
    
    for i in 'a':1:'z'

        if !(i in s)
            return false
         end
        
    end

    return true


    

end

