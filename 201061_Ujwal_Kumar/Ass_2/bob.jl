function bob(stimulus::AbstractString)
s=rstrip(lstrip(stimulus))
l=length(s)
if isempty(s) 
        return "Fine. Be that way!"
    elseif s == uppercase(s) && s != lowercase(s)
        if s[end] == '?'
            return "Calm down, I know what I'm doing!"
        else 
            return "Whoa, chill out!"
        end
    elseif s[end] == '?'
        return "Sure."
    else
        return "Whatever."
    end   
end

