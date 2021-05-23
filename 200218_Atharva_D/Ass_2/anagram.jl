function detect_anagrams(subject, candidates)
    x = lowercase(subject)
    y=[]
    for z in candidates
        if((lowercase(y))==x && lowercase(y)!=lowercase(subject))
            push!(z,y)
        end
    end
    return y
    
end
