using Printf

function checkIfDigit(c)
    digit=Int(c)
    if digit<=57 && digit>=48
        return true
    end
    return false
end

function encode(s)
    len=length(s)
    if len==0
        return ""
    end
    # println(s)
    i=0
    list_alphabet_count=[]
    chr='a'
    count=0
    # while(i<len-1)
        
    #     chr=s[i]

    #     if i==len-2
    #         if chr==s[len-1]
    #             count+=2
    #             push!(list_alphabet_count,(chr,count))
    #         else
    #             count+=1
    #             push!(list_alphabet_count,(chr,count))
    #             push!(list_alphabet_count,(s[len-1],1))
    #         end
    #     else
    #         if chr!=s[i+1]
    #             push!(list_alphabet_count,(chr,count))
    #             count=0
    #         else
    #             count+=1
    #         end
    #     end
    #     i+=1
    # end

    for x in s
        # @printf("found %s %s\n",x,s[i+2])
        if i==len-2
            break
        end
        count+=1
        if x!=s[i+2]
            # println("two things dont match")
            push!(list_alphabet_count,(x,count))
            count=0
        end
        i+=1
    end

    if s[end]==s[end-1]
        count+=2
        push!(list_alphabet_count,(s[end],count))
    else
        count+=1
        push!(list_alphabet_count,(s[end-1],count))
        push!(list_alphabet_count,(s[end],1))
    end
    
    buffer=IOBuffer()
    for x in list_alphabet_count
        # println(string(x[1]),string(x[2]))
        if x[2]==1
            print(buffer,string(x[1]))
        else    
            print(buffer,string(x[2],string(x[1])))
        end
    end
    # println("Buffer = ")
    return(String(take!(buffer)))
end

function decode(s)
    final_op = IOBuffer()
    digits_buffer=IOBuffer()
    for x in s
        if isdigit(x)
            print(digits_buffer,x)
        else
            dig_str=String(take!(digits_buffer))
            if dig_str==""
                dig_str="1"
            end
            digit_op = parse(Int,dig_str)
            print(final_op,x^digit_op)
        end
    end
    return String(take!(final_op))
end

# function decode(s)
#     len=length(s)
#     if len==0
#         return ""
#     end
#     final_op=IOBuffer()
#     i=1
#     skip=false
#     for x in s
#         if skip
#             skip=false
#             continue
#         end
#         digit=Int(x)
#         if digit<=57 && digit>=48
#             make_str=s[i+1]^parse(Int,x)
#             print(final_op,make_str)
#             i+=1
#             skip=true
#         else
#             print(final_op,x)
#         end

#         i+=1
#     end
#     return String(take!(final_op))
# end

println(decode("12WB12W3B24WB"))
