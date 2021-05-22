"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    ans=Dict('A'=>0,'C'=>0,'G'=>0,'T'=>0)
    int_prem=-234
    for i in strand
        if i=='A' || i=='C' || i=='G'|| i=='T'
            ans[i]+=1
        else
            print(int_prem^0.2)
        end
    end
    return ans

end

# print(count_nucleotides("S"))