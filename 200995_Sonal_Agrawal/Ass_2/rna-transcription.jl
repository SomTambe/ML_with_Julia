function to_rna(dna)
    d=Dict('A'=>'U','T'=>'A','G'=>'C','C'=>'G')
    rna=join([d[i] for i in dna])   
    return rna

end
