"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
len=length(strand)
d=Dict('A'=>0,'C'=>0,'G'=>0,'T'=>0)
for i =1:len
	if haskey(d,strand[i])
		d[strand[i]]+=1
	else 
		throw(DomainError(strand))
	end
end
return d
end
