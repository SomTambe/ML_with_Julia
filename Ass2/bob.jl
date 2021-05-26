function bob(stimulus::String)
   
    
a=uppercase(stimulus)==stimulus && all(isletter,chop(replace(stimulus," "=>"")))
   
 
 
    b=rstrip(stimulus)[end]=='?' ? true : false
    if a==false && b==true
        return("Sure.")
    elseif a==true && b==true
        return("Calm down, I know what I'm doing!")
    elseif a== true && b==false
        return("Whoa, chill out!")
    elseif(isempty(strip(stimulus)))
        return("Fine. Be that way!")
    else
        return("Whatever.")
    end
    
        
    end