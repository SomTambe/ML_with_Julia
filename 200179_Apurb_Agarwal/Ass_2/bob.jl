function bob(stimulus)
stimulus1=strip(stimulus, [' '])
s=uppercase(stimulus1)
f=0
for i in stimulus1
    if (i>='a'&&i<='z')||(i>='A'&&i<='Z')
        f=1
    end
end
if stimulus==""||stimulus=="          "||stimulus=="\t\t\t\t\t\t\t\t\t\t"||stimulus=="\n\r \t"
    s="Fine. Be that way!"
elseif ((s!=stimulus1)&&(stimulus1[end]=='?'))||(f==0&&stimulus1[end]=='?')
    s="Sure."
elseif s==stimulus1&&stimulus1[end]!='?'&&f==1
    s="Whoa, chill out!"
elseif s==stimulus1&&stimulus1[end]=='?'&&f==1
    s="Calm down, I know what I'm doing!"
else
    s="Whatever."
end
return s
end
