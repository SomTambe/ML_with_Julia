function detect_anagrams(subject, candidates)
 c=[]
    sub_letter=lowercase(subject)
    ordered_letter=sort(collect(sub_letter))
    for x in candidates
        candi_letter=lowercase(x)
        if candi_letter!=sub_letter && ordered_letter==sort(collect(candi_letter))
                push!(c,x)
        end
    end
    return(c)


end
