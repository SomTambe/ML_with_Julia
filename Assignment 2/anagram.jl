sorted_letters(s) = (sort ∘ collect ∘ lowercase)(s)

function detect_anagrams(subject, candidates)
    v=sorted_letters(subject)
    res=[]
    
    for i in 1:length(candidates)
        if(v==sorted_letters(candidates[i]))
            if(lowercase(candidates[i])!=lowercase(subject))
                push!(res, candidates[i])
            end
        end
    end
    return res
end