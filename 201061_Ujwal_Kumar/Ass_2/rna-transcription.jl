function to_rna(dna)
l=length(dna)
rna=""
for i=1:l
if dna[i]=='A' || dna[i]=='G' || dna[i]=='T' || dna[i]=='C'
if dna[i]=='G'
rna*='C'
elseif dna[i]=='T'
rna*='A'
elseif dna[i]=='A'
rna*='U'
elseif dna[i]=='C'
rna*='G'
end

else
throw(ErrorException("Dna string strong"))
end
end
return rna
end

