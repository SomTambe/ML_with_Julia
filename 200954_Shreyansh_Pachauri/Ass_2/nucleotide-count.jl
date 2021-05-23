"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)

    l=length(strand);
    A=0;
    C=0;
    G=0;
    T=0;
    i=0;
    for i=1:l
        c=strand[i];
        if c == 'A'
            A=A+1;
        elseif c == 'C'
            C=C+1;
        elseif c == 'G'
            G=G+1;
        elseif c == 'T'
            T=T+1
        else
            throw(DomainError(c,"Expects A,C,G,T"));
        end
    end
    
    
        return Dict('A' => A, 'C' => C, 'G' => G, 'T' => T)
    



end
