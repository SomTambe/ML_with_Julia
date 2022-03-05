function detect_anagrams(subject, candidates)
    a = sort(collect(lowercase(subject)))
    c=[]
    for b ∈ candidates
        if(sort(collect(lowercase(b)))==a && lowercase(b)!=lowercase(subject))
            push!(c,b)
        end
    end
    return c
end
