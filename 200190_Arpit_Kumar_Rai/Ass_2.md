# Assignment 2 := Complete first 15 problems of exercism


# 1. Hello World

function hello()
return "Hello, World!"
end




# 2. Leap

"""
    is_leap_year(year)

Return `true` if `year` is a leap year in the gregorian calendar.

"""
function is_leap_year(year)
	if(year%4==0&&(year%100!=0||year%400==0))
	    return true
	else 
		return false
	    end
end




# 3. Nucleotide Count

"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
	d=Dict('A'=>0,'C'=>0,'G'=>0,'T'=>0)
	for i in strand
		if i in "ATGC"
		d[i]+=1
		else
		throw(DomainError("Invalid Nucleotide"))
		end
	end
	return d
end




# 4. Hamming

"Your optional docstring here"
function distance(a, b)
    if length(a)!=length(b)
        throw(ArgumentError("Invalid DNA sequences"))
    end
    count=0
    for i in 1:length(a)
        if a[i]!= b[i]
            count+=1
        end
    end
    count
end




# 5. RNA Transcription

function to_rna(dna)
    rna=""
    for i in dna
        if i=='A'
            rna*='U'
        elseif i=='T'
            rna*='A'
        elseif i=='G'
            rna*='C'
        elseif i=='C'
            rna*='G'
        else
            throw(ErrorException("Invalid DNA sequence"))
        end
    end
    rna
end



# 6. Darts

function score(x, y)
    d=sqrt(x^2+y^2)
    if d<=1
        return 10
    elseif d<=5
        return 5
    elseif d<=10
        return 1
    else
        return 0
    end
end




# 7. Bob

function bob(stimulus)
    stimulus=strip(stimulus)
    if stimulus==""
        "Fine. Be that way!"
    elseif stimulus[end] == '?' &&  stimulus==uppercase(stimulus) && stimulus!=lowercase(stimulus)
        "Calm down, I know what I'm doing!"
    elseif stimulus[end]=='?'
        "Sure."
    elseif stimulus==uppercase(stimulus) && stimulus!=lowercase(stimulus)
        "Whoa, chill out!"
    else
        "Whatever."
    end
end




# 8. Run length encoding

function encode(s)
    t=""
    count=0
    for i in 1:length(s)
        if i!=1 && s[i]==s[i-1]
            count+=1
            if i==length(s)
                t*=string(count)*s[i]
            end
        elseif i==1
            count+=1
        else
            if count!=1
                t*=string(count)*s[i-1]
                count=1
            else
                t*=s[i-1]
                count=1
            end
            if i==length(s)
                t*=s[i]
            end
        end
    end
    t   
end
function decode(s)
    t="";count=0;k=""
    l1='A':'Z'
    l2='a':'z'
    for i in 1:length(s)
        if (i!=1 && ((s[i] ∈l1 || s[i] ∈ l2 || s[i]==' ')&&(s[i-1] ∈ l1 || s[i-1] ∈ l2 || s[i-1]==' ')))||(s[1] ∈ l1 || s[1]∈l2 || s[1]==' ')
            t*="1"
        end
        t*=s[i]
    end
    for i in 1:length(t)
        if t[i]>='0' && t[i]<='9'
            count=count*10+Int(t[i]-'0')
        else
            k=k*(t[i]^count)
            count=0
        end
    end
    k
end




# 9. Pangram

"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
function ispangram(input)
    t=zeros(Int8,26)
    l1='A':'Z'
    l2='a':'z'
    for i in input
        if i∈l1
            t[i-'A'+1]=1
        elseif i ∈ l2
            t[i-'a'+1]=1
        end
    end
    f=0
    for i in t
        if i==0
            f=1
            break
        end
    end
    return f==0
end




# 10. Anagram

function detect_anagrams(subject, candidates)
    t=zeros(Int8,26)
    t2=zeros(Int8,26)
    t3=Any[]
    l2='a':'z'
    for i in subject
        i=lowercase(i)
        if i in l2
        t[i-'a'+1]+=1
        end
    end
    for i in candidates
        for j in i
            j=lowercase(j)
            if j in l2
            t2[j-'a'+1]+=1
            end
        end
        if t2==t && lowercase(subject)!=lowercase(i)
            push!(t3,i)
        end
        t2=zeros(Int8,26)
    end
    t3
end





# 11. Binary Search

function binarysearch(arr,val)
    l=1
    r=length(arr)
    mid=0
    if r==0
        return 1:0
    end
    while l<=r
        mid=(l+r)÷2
        if  arr[mid]==val
            return mid:mid
        elseif arr[mid]>val 
            r=mid-1
        else
            l=mid+1
        end
    end
    if arr[mid]>val
        mid:mid-1
    else
        mid+1:mid
    end
end




# 12. Rotational Cypher

function rotate(val,str)
    val%=26
    if val==0 || length(str)==0
        return str
    end
    if typeof(str)==Char
        return ((str+val-'a')%26+'a')
    end
    t=""
    for i ∈ str
        if i in 'a':'z' 
            t*=((i+val-'a')%26+'a')
        elseif i in 'A':'Z'
            t*=((i+val-'A')%26+'A')
        else
            t*=i
        end
    end
    t
end




# 13. Atbash Cypher

function encode(input)
    t="";j=0
    input=lowercase(input)
    for i in input
        if i in 'a':'z'
            t*=('z'-i+'a')
        elseif i in '0':'9'
            t*=i
        end
        if (length(t)-j)%5==0 && t[length(t)]!=' '
            t*=' '
            j+=1
        end
    end
    strip(t)
end

function decode(input)
    t=""
    for i in input
        if i in 'a':'z'
            t*=('a'-i+'z')
        elseif i==' '
            continue
        else
            t*=i
        end
    end
    t
end





# 14. Difference of Squares

function square_of_sum(n)
    r=1:n
    mapreduce(x->x,+,r)^2
end
function sum_of_squares(n)
    r=1:n
    mapreduce(x->x^2,+,r)
end
function difference(n)
   n>1 ? Int(square_of_sum(n)-sum_of_squares(n)) : 0
end




# 15. Pascal Triangle

function triangle(n)
    if n<0
        throw(DomainError("Invalid"))
    end
    v=Vector()
    for i in 1:n
        c=zeros(i)
        c[1]=c[i]=1
        for j in 2:i-1
            c[j]=v[i-1][j-1]+v[i-1][j]
        end
        push!(v,c)
    end
    return v 
end

