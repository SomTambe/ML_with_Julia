function is_leap_year(year)
    if mod(year,4)==0
        if mod(year,100)==0
            if mod(year,400)==0
                println("true")
            else 
                println("false")
            end

        else 
            println("true")
        end
    else 
         println("false")
    end

end
