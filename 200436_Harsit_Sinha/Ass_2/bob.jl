function bob(stimulus)
    #stimulus=rstrip(stimulus)
    if(isempty(strip(stimulus)))
        return("Fine. Be that way!")
    elseif rstrip(stimulus)[end]=='?'
        if uppercase(stimulus)==stimulus && all(isletter,chop(replace(stimulus," "=>"")))
            return("Calm down, I know what I'm doing!")
        else
            return("Sure.")
        end
    elseif (occursin("!",stimulus)&& uppercase(stimulus)==stimulus) || (uppercase(stimulus)==stimulus && all(isletter,replace(stimulus," "=>"")))
        return("Whoa, chill out!")
    elseif(isempty(strip(stimulus)))
        return("Fine. Be that way!")
    else
        return("Whatever.")
    end 
end
