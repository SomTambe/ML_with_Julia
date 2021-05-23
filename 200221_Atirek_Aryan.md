# Assignment 2

## Anagram
function detect_anagrams(subject, candidates)
    for i in candidates
        if length(i)==length(subject)
            count=0
            for j in subject
                if occursin(j,i) count+=1 end
            end
            if count==length(i) return i
            end
            return []
        end
    end
        

end

## Atbash Cipher
function encode(input :: String)
s=""
c=0
    for i in input
        if c==5
            s=string(s," ")
            c=0
        end
        if (i >= 'a' && i <= 'z')
            
            s = string(s, "$('z'-i+'a')")
            c+=1
        elseif (i >= 'A' && i <= 'z')
            i+=32
            s = string(s, "$('z'-i+'a')")
            c+=1
        elseif (i >= '0' && i <= '9')
            s=string(s,"$i")
            c+=1
        else
            continue
        end

    end
    s=strip(s)
    return s
end

function decode(input :: String)
    s=""
    for i in input
        if (i >= 'a' && i <= 'z')
            s = string(s, "$('z'-i+'a')")

        elseif (i >= '0' && i <= '9')
            s = string(s, "$i")
            
        else
            s=string(s,"")
        end 
       
    end
    return s
end

## Binary Search
function binarysearch(array, val)
    lo = 1
    hi = length(array)

    while hi >= lo
        midpoint = Int(floor((hi + lo)/2))
        println(midpoint)
        if val < array[midpoint]
            hi = midpoint -1
        elseif val > array[midpoint]
            lo = midpoint + 1
        elseif val == array[midpoint]
            return midpoint:midpoint
        end
    end

    return lo:hi
end

## Bob
function bob(stimulus)
if (isempty(stimulus))
    return "Fine. Be that way!"
elseif (endswith(stimulus,'?')&&(stimulus == uppercase(stimulus) && any(isuppercase, s)))
    return "Calm down, I know what I'm doing!"
elseif (stimulus == uppercase(stimulus) && (any(isuppercase, s)))
    return "Whoa, chill out!"
elseif (endswith(stimulus,'?'))
    return "Sure."
else
    return "Whatever."
end
end

## Darts
function score(x, y)
t=x*x+y*y
a=(t>100) ? 0 : (t>25) ? 1  : (t>1) ? 5 : 10
return a
end

## Difference of Squares

square_of_sum(n::Int) = sum(1:n)^2

sum_of_squares(n::Int) = sum((1:n).^2)


difference(n::Int) = square_of_sum(n) - sum_of_squares(n)

## Hamming
"Your optional docstring here"
function distance(a, b)
    l1=length(a)
    l2=length(b)
    if(l1==l2)
    c=0
    for i=1:l1
        if a[i]!=b[i]
            c+=1
    
    end
    end
    return c
    else 
    throw(ArgumentError("length not same"))
    end
    end

## Hello World

function hello()
"Hello, World!"
end


## Leap

function is_leap_year(year)
    if ((year%400==0)||((year%100!=0)&&(year%4==0)))
        return true
    else
        return false
    end
end 

## nucleotide-count

function count_nucleotides(strand)
    a_c=0
    c_c=0
    g_c=0
    t_c=0
    for n in strand
        if n == 'A'
            a_c = a_c+1
        elseif n == 'C'
            c_c = c_c+1
        elseif n == 'G'
            g_c = g_c+1
        elseif n == 'T'
            t_c = t_c+1
        else 
            throw(DomainError("error"))
        end
    end
   
    Dict('A' => a_c,
         'C' => c_c,
         'G' => g_c,
         'T' => t_c)
end

## Pangram


    function ispangram(input::AbstractString)
        'a':'z' ⊆ lowercase(input)
    end


## RNA-transcription

function to_rna(dna)
dna == "A" && return "U"
dna == "T" && return "A"
dna == "G" && return "C"
dna == "C" && return "G"
throw(ErrorException("Unknown nucleotide"))
end


## Rotational Cipher

function rotate(n::Int, s::String)
    map(c -> rotate(n, c), s)
end

function rotate(n::Int, c::Char)
    
    if isuppercase(c) && isascii(c)
        c += n
        return isuppercase(c) ? c : c - 26
    elseif islowercase(c) && isascii(c)
        c += n
        return islowercase(c) ? c : c - 26
    else
        return c
    end
end

## Run Length Encoding 

function encode(s)
    function shrink(s)
       len = length(s)
       num = len == 1 ? "" : string(len)
       num * s[1]
    end
 
    replace(s, r"(.)\1*" => shrink)
 end
 
 function decode(s)
    function expand(s)
       num = s[1:end-1]
       if isempty(num)
          string(s[end])
       else
          repeat(s[end], parse(Int, num))
       end
    end
 
    replace(s, r"(\d*)(\D)"=> expand)
 end

