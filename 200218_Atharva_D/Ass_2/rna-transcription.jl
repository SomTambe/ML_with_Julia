function to_rna(dna)
    rna = ""
    length(rna) == length(dna)
    for i in 1:length(dna) 
        if dna[i] == 'G'
            rna=rna*"C"
        elseif dna[i] == 'C'
            rna=rna*"G"
        elseif dna[i] == 'T'
            rna=rna*"A"
        elseif dna[i] == 'A'
            rna=rna*"U"
        else throw(ErrorException("error"))
        end
    end
    rna
    

end

