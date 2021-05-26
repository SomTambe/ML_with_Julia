"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::String)
        results = Dict(base => 0 for base in "ACGT")
    for n in strand
        if !haskey(results, n)
          throw(DomainError("Invalid"))
        end
    
        results[n] += 1
    end
    
    return results

end
