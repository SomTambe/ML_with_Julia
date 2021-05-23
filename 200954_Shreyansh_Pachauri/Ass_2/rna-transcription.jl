function to_rna(dna)
    
    l1=length(dna);
    rna="";
    for i=1:l1
        c=dna[i];
        if c=='A'
            rna*='U'; #Concatenation
        elseif c=='C'
            rna*='G';
        elseif c=='G'
            rna*='C';
        elseif c=='T'
            rna*='A';
        else
            throw(ErrorException("to_rna(\"$dna\")"));
            return;
        end
    end
    return rna;

end

