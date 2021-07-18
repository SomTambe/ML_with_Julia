function detect_anagrams(subject, candidates)
subject=lowercase(subject)
    Dict1=Dict{String,Int}()
    Dict2=Dict{String,Int}()
sol=[]
    for i in subject
        push!(Dict1,"$i"=>0)
    end
    
    for i in subject
        Dict1["$i"]+=1
    end
   print(Dict1)
    for i in candidates
         k=lowercase(i)
        if length(i)!=length(subject) || k==subject
            continue
        end
        Dict2=Dict{String,Int}()
    for j in k
         push!(Dict2,"$j"=>0)
        end
         for j in k
         Dict2["$j"]=0
        end
        for j in k
         Dict2["$j"]+=1
    end
        println("Dict 2 ",Dict2)
       if Dict1==Dict2
          push!(sol,i)
        end
    end 
    return sol
    end
