"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
# function ispangram(input)
#     str=lowercase(input)
#     found_list = Dict()
#     for x in str
#         if !(haskey(found_list,Int(x)-97))
#             found_list[[Int(x)-97]=0
#         end
#         found_list[Int(x)-97]+=1
#     print(x)
#     end
# end

function ispangram(input)
    # println(input)
    str = lowercase(input)
    # println(str)
    found=Dict()
    for c in str
        if (haskey(found,c)==false)
            found[c]=0
        end
        found[c]+=1
    end
    check_char='a'
    for x in 1:26
        if haskey(found,check_char)==false
            return false
        end
        check_char+=1
    end
    return true
    println(found)
end

# ispangram("Hi you really really SUCK !")