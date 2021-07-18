function to_rna(dna::String)
    dict = Dict('G' => 'C','C' => 'G','T' => 'A','A' => 'U')
    map(i -> i ∉ keys(dict) ? throw(ErrorException("error pickaboo")) : dict[i],dna)
end
