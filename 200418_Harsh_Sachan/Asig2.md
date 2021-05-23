Solution 1:

function hello()
"Hello, World!"
end
hello()

Solution 2:

"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
	if year%4 != 0 
		false
	elseif year%400 ==0 
		true
	elseif year%100 == 0
		false
	else
		true
	end
end

Solution 3:

"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::AbstractString)
    nucs =Dict('A' => 0,'C' => 0,'G' => 0,'T' => 0,)

    for nuc in strand
        try
            nucs[nuc] += 1
        catch KeyError
            throw(DomainError("$nuc is an invalid nucleotide.  Must be A, C, G, or T."))
        end
    end
    
    nucs
end


Solution 4:

function distance(a, b)
	c=0
	if length(a) != length(b)
		throw(ArgumentError("Strands must be of the same length."))
	else
		for i = 1:length(a)
			if a[i] != b[i]
				c+=1
			end
		end
	end
	c
end


Solution 5:

function to_rna(dna::String)
	rna=""
	for i = 1: length(dna)
		if dna[i] == 'C'
			r='G'
		elseif dna[i] == 'G'
                        r='C'
		elseif dna[i] == 'T'
                        r='A'
		elseif dna[i] == 'A' 
			r='U'
		else
			throw(error("Unknown nucleotide"))
		end
		rna = "$rna$r"
	end
	rna
end


Solution 6:

function score(x, y)
	d= sqrt(x*x + y*y)
	if d <= 1
		r=10
	elseif d <= 5
		r=5
	elseif d <= 10
		r=1
	else
		r=0
	end
	r

end

Solution 7:

function bob(stimulus)
    stimulus = strip(stimulus)
    silence = isempty(stimulus)
    question = endswith(stimulus,"?")
    yelling = stimulus == uppercase(stimulus) && any(isuppercase, stimulus)
    
    if question && yelling
        "Calm down, I know what I'm doing!"
    elseif question
        "Sure."
    elseif yelling
        "Whoa, chill out!"
    elseif silence
        "Fine. Be that way!"
    else
        "Whatever."
    end
    
end


Solution 8:


function decode(s)
    if isempty(s)
        ""
    end

    output = ""
    n_str = ""
    for char in s
        if isnumeric(char)
            n_str = n_str * char
        else
            if isempty(n_str)
                number = 1
            else
                number = parse(Int, n_str)
            end
            output = output * char ^ number
            n_str = ""
        end
    end

    output

end


Solution 9:

function ispangram(input)
    s=input;
    s=lowercase(s) 
    for i in 'a':1:'z'
        if !(i in s)
            return false
         end 
    end
    return true
end


Solution 10:

function detect_anagrams(subject, candidates)

	success=String[]	
	subjectsorted = sort(collect(lowercase(subject)))
	for i in candidates
		lowercase(i) == lowercase(subject) ? continue :
		if sort(collect(lowercase(i))) == subjectsorted
			success=vcat(success,i)
		end
	end
	return success
end