function detect_anagrams(subject, candidates)
    for i in candidates
        if length(i)==length(subject)
            count=0
            for j in subject
                if occursin(j,i) count+=1 end
            end
            if count==length(i) return i
            end
            return []
        end
    end
end
