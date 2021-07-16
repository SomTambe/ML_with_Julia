function to_rna(dna)
    corresponding_base=Dict(`G` => `C`,`C` => `G`, `T` => `A`, `A` => `U`)
    IOBuffer,buffer=IOBuffer()
    for x in dna
        print(buffer,corresponding_base[x])
    end
    final_string=String(take!(buffer))
    return final_string
end

