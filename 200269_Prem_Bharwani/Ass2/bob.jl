function bob(stimulus2)
    stimulus=strip(stimulus2)
    len=length(stimulus)
    yell=false
    ques=false
    has_letters=false
    check_empty=isempty(stimulus)
    ques=endswith(stimulus,'?')
    println("is empty = $check_empty")
    if uppercase(stimulus)==stimulus
        yell=true
    end
    for c in stimulus
        # # println(c)
        # if c!=' '
        #     check_empty=false
        # end
        if c>='A' && c<='Z' || c>='a' && c<='z'
            has_letters=true
        end
    end

    if ques
        if yell && has_letters
            return("Calm down, I know what I'm doing!")
        else
            return("Sure.")
        end
    else
        if yell && has_letters
            return("Whoa, chill out!")
        elseif check_empty
            return("Fine. Be that way!")
        else
            return("Whatever.")
        end
    end

end

println(bob("\t\t\t\t\t\t\t\t\t\t"))
