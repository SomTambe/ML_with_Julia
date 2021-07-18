"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    d=Dict('A'=>0,'C'=>0,'G'=>0,'T'=>0)
    f=0
    for i in strand
        if i!='A'&&i!='C'&&i!='G'&&i!='T'
            f=1            
        end
        
        if i=='A'
            d['A']+=1
        elseif i=='C'
            d['C']+=1
        elseif i=='G'
            d['G']+=1
        elseif i=='T'
            d['T']+=1
        end
    end
    if f==0
        d
    else
        throw(DomainError("INVALID"))
    end

end
