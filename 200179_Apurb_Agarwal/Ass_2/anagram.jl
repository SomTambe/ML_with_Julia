function detect_anagrams(subject, candidates)
    d=Dict()
    for i in 'A':'Z'
        d[i]=0
    end
    for i in subject
        if i>='a'&&i<='z'
            d[uppercase(i)]+=1
        elseif i>='A'&&i<='Z'
            d[i]+=1
        end
    end
    d1=Dict()
    lst=[]
    for i in 'A':'Z'
        d1[i]=0
    end
    f=0
    for i in candidates
        f=0
        for i in 'A':'Z'
            d1[i]=0
        end
        if length(subject)==length(i)
            for j in 1:length(i)
                if uppercase(i[j])!=uppercase(subject[j])
                    f=1
                end
                if i[j]>='a'&&i[j]<='z'
                    d1[uppercase(i[j])]+=1
                elseif i[j]>='A'&&i[j]<='Z'
                    d1[i[j]]+=1
                end
            end
            if d==d1&&length(subject)==length(i)&&f==1
                push!(lst, i)
            end
        end


        
    end
    return lst

end
