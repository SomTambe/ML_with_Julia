"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    store = Dict('A'=>0 , 'C' => 0, 'G'=> 0, 'T'=> 0)
    for a in strand

        if a == 'A'
            store['A'] += 1
        elseif a == 'C'
            store['C'] += 1
        elseif a == 'G'
            store['G'] += 1
        elseif a == 'T'
            store['T'] += 1
        else 
            throw(DomainError(a, "error"))
        end
    end
    store
    

end
