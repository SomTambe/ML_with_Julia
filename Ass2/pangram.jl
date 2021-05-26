function ispangram(input::String)
   local k::Int
    local j::Char
     a=zeros(Int,100)
    trav=lowercase(input)
   for i in trav

    k=convert(Int,i)
    if k>96 && k<123
    a[k-96]=1 
        end
    end
        
    sum=0
   for l in 1:26
      sum +=a[l]
   
    end
   # print(a)
    if sum==26 
        return true
    end
    return false
end