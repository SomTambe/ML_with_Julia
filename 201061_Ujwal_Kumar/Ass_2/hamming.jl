"The function returns the number of mismatched characters in two strings"
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
