function count_nucleotides(strand)
    d=Dict('A'=>0,'T'=>0,'G'=>0,'C'=>0)
    for i in strand
        if i=='A'
            d['A']+=1
        elseif i=='T'
            d['T']+=1
        elseif i=='G'
            d['G']+=1
        elseif i=='C'
            d['C']+=1
        else
            throw(DomainError())
        end
    end
    println(d)
end
