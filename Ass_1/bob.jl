function bob(stimulus)

    response=Dict(
        :question => "Sure.",
        :yelling => "Whoa, chill out!",
        :silence => "Fine. Be that way!",
        :misc => "Whatever.",
        :forceful_question => "Calm down, I know what I'm doing!")

        l=0
        j=0
        q=0
        n=0
        c='a'
    for c in stimulus
        
        if (q==1 && (c>='a' && c<='z' || c>='A' && c<='Z'))
            q-=1;
        end

        if(c>='A' && c<='Z')
            l+=1

        elseif c=='?'
            q+=1

        elseif c>='0' && c<='9'
            n+=1

        elseif !(c>='A' && c<='Z') && !(c>='a' && c<='z')
            j+=1
        end

    end

    if (l+j+n)==length(stimulus) && l!=0
        if q==1
          return response[:forceful_question]
        else
          return response[:yelling]
        end
    elseif q==1
        return response[:question]
    elseif j==length(stimulus) && n==0
        return response[:silence]
    else
        return response[:misc]
    end

    
end
