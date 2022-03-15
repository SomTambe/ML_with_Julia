function detect_anagrams(subject, candidates)

    l=length(candidates)
    i=1
    s=""
    result=[]
    r1=1
    r2=1
    while i<=l

        s=lowercase(candidates[i])
        r1=1
        r2=1

        for j in s

            if !(j in lowercase(subject))
                r1=0
                break;
            end

            if (freq(s,j)!=freq(lowercase(subject),j))
                r1=0
            end

        end

        for k in lowercase(subject)

            if !(k in s)
                r2=0
                break;
            end

            if freq(s,k)!=freq(lowercase(subject),k)
                r2=0
            end

            
        end

        if ((r1*r2)==1)
            if s!=lowercase(subject) && length(s)==length(subject)
            z=[candidates[i]]
            result=cat(result,z,dims=1);
            end
        end
        i+=1;
    end

    return result;
end


function freq(s,c)

    co=0;
    for i in s
   
        if i==c
            co+=1
        end
    end

    return co;
    
end