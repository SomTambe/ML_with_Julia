"Your optional docstring here"
function distance(a, b)
    dist=0;
    l1=length(a)
    l2=length(b)
    if l1==l2

        for i=1:l1
            c1=a[i];
            c2=b[i];
            if(c1!=c2)
                dist=dist+1
            end
        end

    elseif l1!=l2
        throw(ArgumentError("distance(\"$a\",\"$b\")"))
        return;
    end
    


  return dist;

end
