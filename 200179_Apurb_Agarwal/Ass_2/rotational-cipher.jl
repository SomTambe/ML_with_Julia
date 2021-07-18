function rotate(n, str)
    if typeof(str)==Char
        if str>='a'&&str<='z'
            str=str+n
            while str>'z'
                str=str-26
            end
            return str
        elseif str>='A'&&str<='Z'
            str=str+n
            while str>'Z'
                str=str-26
            end
            return str
        end
    else
        s=""
        for i in str
            if i>='a'&&i<='z'
                i=i+n
                while i>'z'
                    i=i-26
                end
            
            elseif i>='A'&&i<='Z'
                i=i+n
                while i>'Z'
                    i=i-26
                end
            end
            s=s*i
        end
        return s
    end
end