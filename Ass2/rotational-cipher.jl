function rotate(a,b)
cypher=""
 for i in b
        k=Int(i)
   
        
        if k>=97 && k<=122
            k=k%97
            k=97 +(k+a)%26
            c=Char(k)
            cypher=cypher*c
        
            continue
        end
          if k>=65 && k<=90
            k=k%65
            k=65 +(k+a)%26
            c=Char(k)
            cypher=cypher*c

            continue
        end
        cypher=cypher*i
    
    end
    if(typeof(b)==Char)
      k=Int(b)
        if k>=97 && k<=122
            k=k%97
            k=97 +(k+a)%26
            c=Char(k)
         
            
        end
          if k>=65 && k<=90
            k=k%65
            k=65 +(k+a)%26
            c=Char(k)
            
        end
        return c
    end
 return cypher
end