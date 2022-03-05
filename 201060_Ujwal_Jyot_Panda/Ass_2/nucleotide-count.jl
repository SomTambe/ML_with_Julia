"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

function count_nucleotides(strand)
    nucleo = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    isinvalidnucleo=0

    for i ∈ strand
        if(i ∈ "ATCG")
            nucleo[i]+=1
        else
            isinvalidnucleo=1
        end
    end
    if(isinvalidnucleo==0)
        nucleo
    else
        throw(DomainError("error"))
    end
        
end
