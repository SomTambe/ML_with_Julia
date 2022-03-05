function to_rna(dna)
    rna=""
    for i ∈ dna
        if(i=='A')
            rna*='U'
        elseif (i=='T')
            rna*='A'
        elseif (i=='C')
            rna*='G'
        elseif (i=='G')
            rna*='C'
        else
            throw(error("Invalid Strand"))
        end
    end
    rna
end

