function score(x, y)
x1=x*x
y1=y*y
if x1+y1<=1 
return 10
elseif x1+y1>1 && x1+y1<=25
return 5
elseif x1+y1>25 && x1+y1<=100
return 1
else 
return 0
end
end
