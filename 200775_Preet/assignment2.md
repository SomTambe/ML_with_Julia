1. Hello World

function hello()
	"Hello, World!"
end

2. Leap

"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
	if (year%4 ==0)
		if(year%400 == 0)
			return true
		elseif(year%100 == 0)
			return false
		else
			return true
		end
	else
		return false
	end
end

3. Nucleotide Count

"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand::AbstractString)
	count = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
	for i ∈ strand
		if i ∈ "AGCT"
			count[i] += 1
		else
			throw(DomainError(i,"not a known nucleotide!!"))
		end
	end
	count
end

4. Hamming

# "Your optional docstring here"
function distance(a, b)
    count = 0
    sizeof(a) == sizeof(b) || throw(ArgumentError("size must be same for both strands"))
    for i in 1:sizeof(a)
        if (a[i]!=b[i])
            count += 1
        end
    end
    return count
end

5. RNA-Transcription

function to_rna(dna)
    rna = ""
    for i in dna
        if (i=='A')
            rna = rna*"U"
        elseif (i=='C')
            rna = rna*"G"
        elseif (i=='G')
            rna = rna*"C"
        elseif (i=='T')
            rna = rna*"A"
        else
            throw(error("Unknown Nucleotide"))
        end
    end
    rna
end

6. Darts

function score(x, y)
    score = 0
    len = √(x^2 + y^2)
    if (len <= 1)
        score = 10
    elseif (len <= 5)
        score = 5
    elseif (len <= 10)
        score = 1
    else
        score = 0
    end
    score
end

7. Run Length Encoding

function encode(s)
    t = ""
    count = 1
    for i ∈ 1:length(s)
        if (i != length(s) && s[i] == s[i+1])
            count += 1
        else
            if (count == 1)
                t = t*s[i]
                count = 1
            else
                t = t* string(count) * s[i]
                count = 1
            end
        end
    end
    return t
end



function decode(s)
    t = ""
    n = 0
    first = 1
    # sec = first
    count = 0
    if (sizeof(s) !=0 )
        for i in 1:sizeof(s)
            if (occursin(s[i],"0123456789"))
                count += 1
            elseif (count == 0)
                t = t * s[i]
                first += 1
            else
                if (count==1)
                    p = s[first]
                else
                    p = s[first:(first+count-1)]
                end
                n = parse(Int64,p)
                first = first + count + 1
                count = 0
                for j in 1:n
                    t = t*s[i]
                end
            end     
        end
    end
    t
end

8. Pangram

"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    try 
        ascii(input)
    catch
        return false
    end
    s = lowercase(input)
    d = Dict(zip("abcdefghijklmnopqrstuvwxyz",zeros(Int64,26)))
    if (length(s)!=0)
        for c in s
            if(c >= 'a' && c <= 'z')
                d[c] = 1
            end
        end
    else
        return false
    end
    flag = 1
    for i in keys(d)
        if (d[i]==0)
            flag = 0
            break
        end
    end
    if (flag == 0)
        return false
    else
        return true
    end
end

9. Anagram

function detect_anagrams(subject, candidates)
    ans = []
    letters_subject=Dict()
    for c in lowercase(subject)
        letters_subject[c] = get(letters_subject, c, 0) + 1
    end
    for p in candidates
        letters_p=Dict()
        for c in lowercase(p)
            letters_p[c] = get(letters_p, c, 0) + 1
        end
        if (letters_p==letters_subject && length(subject)==length(p) && lowercase(subject)!=lowercase(p))
            push!(ans,p)
        end
    end
    return ans
end

10. Rotational Cipher

function rotate(n,s)
    try
        s :: AbstractChar
    catch
        t = ""
        for c in s
            if isletter(c)
                if (lowercase(c)+n <= 'z')
                    t = t * (c + n)
                else
                    t = t * (c + n - 26)
                end
            else
                t = t * c
            end
        end
        return t
    end
    if isletter(s)
        if (lowercase(s)+n <= 'z')
            t = s + n
        else
            t = s + n - 26
        end
    else
        t = s
    end
    return t
end

11. Difference of squares

"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    p = zero(Int64)
    p = sum(1:n)^2
    return p
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    p = zero(Int64)
    p = sum((1:n).^2)
    return p
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    return (square_of_sum(n)-sum_of_squares(n))
end

12,13,14,15 are not been solved. I'll solve and put it as early as possible.