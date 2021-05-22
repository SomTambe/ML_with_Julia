function to_rna(dna)
    d= Dict("A"=>"U","G"=>"C","C"=>"G","T"=>"A")
    str=""
    for i in dna
        if string(i) ∈ keys(d)
            str*=d[string(i)]
        else
            error("invalid nucleotide")
        end
    end
    str
end
