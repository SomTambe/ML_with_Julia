function detect_anagrams(subject_og, candidates_og)
    subject=lowercase(subject_og)
    candidates=[]
    for i in candidates_og
        push!(candidates,lowercase(i))
    end
    main_ctr=Dict()
    anagram_list=[]
    for x in subject
        if haskey(main_ctr,x)==false
            main_ctr[x]=0
        end
        main_ctr[x]+=1
    end
    i=0
    for candi in candidates
        i+=1
        if candi==subject
            continue
        end
        temp_ctr = Dict()

        for y in candi
            if haskey(temp_ctr,y)==false
                temp_ctr[y]=0
            end
            temp_ctr[y]+=1
        end
        if temp_ctr==main_ctr
            push!(anagram_list,candidates_og[i])
        end
    end
    return anagram_list
end
