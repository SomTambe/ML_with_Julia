function to_rna(dna)
    rna=""
    for i in 1:length(dna)
        if dna[i]=='A'
            rna=rna*"U"
        elseif dna[i]=='C'
            rna=rna*"G"
        elseif dna[i]=='G'
            rna=rna*"C"
        elseif dna[i]=='T'
            rna=rna*"A"
        else
            throw(ErrorException("INVALID"))
        end
    end
    return rna
end

