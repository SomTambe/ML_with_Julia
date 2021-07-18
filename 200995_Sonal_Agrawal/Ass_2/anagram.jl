function detect_anagrams(subject, candidates)
    lst=[]
    b=collect(subject)
    b1=sort(b)
    b2=join(b1)
    for i in candidates
        if length(subject)==length(i)
            a=collect(i)
            a1=sort(a)
            a2=join(a1)
            if b2==a2
                push!(lst,i)
            else
                continue
            end
        else
            continue
        end
    end
    return lst
end
