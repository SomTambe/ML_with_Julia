function bob(stimulus)
    len=length(stimulus)
    yell=false
    ques=false
    has_letters=false
    check_empty=true
    if uppercase(stimulus)==stimulus
        yell=true
    end
    for c in stimulus
        # println(c)
        if c!=' '
            check_empty=false
        end
        if c>='A' && c<='Z' || c>='a' && c<='z'
            has_letters=true
        end
        if c=='?'
            ques=true;break;
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
        elseif yell && check_empty
            return("Fine. Be that way!")
        else
            return("Whatever.")
        end
    end

end

# println(bob("        "))
