"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    arr=split(strand, "")
    a=0
    t=0
    g=0
    c=0
    
    n=length(arr)
    f=1
    for i=1:length(arr)
        if(arr[i]=="A") 
            a=a+1
            continue
        end
        if(arr[i]=="G") 
            g=g+1
            continue
        end
        if(arr[i]=="T") 
            t=t+1
            continue
        end
        if(arr[i]=="C") 
            c=c+1
            continue
        end
        if(arr[i]!="A" && arr[i]!="G" && arr[i]!="C" && arr[i]!="T" && arr[i]!="")
            f=0
            break
        end
    end 
    if(f==1)
        Dict('A' => a, 'C' => c, 'G' => g, 'T' => t)
    else
        throw(DomainError("Invalid string"))
    end
end
