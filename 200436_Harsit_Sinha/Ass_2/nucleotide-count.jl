"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""

    "Count the number of different nucleotides (A, C, G, T) in a strand of DNA."
function count_nucleotides(strand)
    d= Dict('A'=> 0,'C'=> 0,'G'=> 0,'T'=> 0)
    for i in strand
        if i ∈ d
            d[i]+=1
        else 
            throw(DomainError(i))
        end
    end
end
