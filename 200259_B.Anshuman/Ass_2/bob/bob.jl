function bob(stimulus)
    for ch in stimulus
        if ch == '?'
            if uppercase(stimulus) == stimulus
                return "Calm down, I know what I'm doing!"
            else
                return "Sure."
            end
        end
    end
    if length(strip(stimulus)) == 0
        return "Fine. Be that way!"
    elseif uppercase(stimulus) == stimulus
        return "Whoa, chill out!"
    else
        return "Whatever."
    end
end