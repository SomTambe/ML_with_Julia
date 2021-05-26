function encode(input)
    count =1
      cypher=""
    for i in input
        k=Int(i)
       if i==' ' 
            continue 
        end
    
        if k>=97 && k<=122
            k=k%97
            k=122-k
            cypher=cypher*Char(k)
         
        
        elseif k>=65 && k<=90
            k=k%65
            k=122-k
            cypher=cypher*Char(k)
            elseif i>='0' && i<='9'
           cypher=cypher*i
        else 
            continue
        end
           if count%5==0 
            cypher=cypher*" "
        end
        count+=1
    end
    
return strip(cypher)
end

function decode(input)
    k=0
    cypher=""
    for i in input
        k=Int(i)
        if i==' ' 
            continue
            
            elseif k>=97 && k<=122
            k=k%97
            k=122-k
            cypher=cypher*Char(k)
         
        
        elseif k>=65 && k<=90
            k=k%65
            k=122-k
            cypher=cypher*Char(k)
            elseif i>='0' && i<='9'
           cypher=cypher*i
        else 
            continue
        end
    end
         
return strip(cypher)
end
