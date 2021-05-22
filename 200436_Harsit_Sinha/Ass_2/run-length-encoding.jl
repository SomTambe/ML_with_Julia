function get_char_multipler(str)
    sum=0
    i=1
    offset =1
    ch = ' '
    for i in 1:sizeof(str)
        ch=str[i]
        if '0' <= ch <= '9'
            sum= sum*10 + (ch-'0')
            offset +=1
        else 
            ch = str[i]
            break
        end
    end
    ch,sum,offset
end
function count_consecutive(str,start)
    start > ncodeunits(str) && return error("error")
    ch= str[start]
    count =1
    while start + count -1 < ncodeunits(str) && ch == str[start+count]
        ch = str[start + count]
        count +=1
    end
    ch,count    
end
function encode(str)
    isempty(str) && return str
    io = IOBuffer()
    i=1
    while i<=ncodeunits(str)
        ch =str[i]
        ch, count= count_consecutive(str,i)
        count == 1 ? write(io,ch) : write(io, string(count,ch))
        i+= count
    end
    String(take!(io))
end



function decode(s)
    isempty(s) && return s
    io= IOBuffer()
    i=1
    while i<= sizeof(s)
        ch =s[i]
        if !isdigit(ch)
            write(io,ch)
        else
            ch,mult, count =get_char_multipler(s[i:end])
            write(io, repeat(ch,mult))
            i=i+count
            continue
        end
        i+=1
    end
    String(take!(io))
end
encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
