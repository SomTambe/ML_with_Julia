# **Over The Wire - Bandit**
## Level 0
>```ssh bandit0@bandit.labs.overthewire.org -p 2220```\
>*Password : bandit0*

## Level 0 to 1
>```cat readme``` \
>boJ9jbbUNNfktd78OOpsqOltutMc3MY1\

>```ssh bandit1@bandit.labs.overthewire.org -p 2220```\
>*Password : boJ9jbbUNNfktd78OOpsqOltutMc3MY1*

## Level 1 to 2
>```cat < -```\
>CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

>```ssh bandit2@bandit.labs.overthewire.org -p 2220```\
>*Password : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9*

## Level 2 to 3
>```ls```\
>*spaces in this filename*\
>```cat spaces\ in\ this\ filename```\
>UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

>```ssh bandit3@bandit.labs.overthewire.org -p 2220```\
>*Password : UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK*

## Level 3 to 4
>```cd inhere```\
>```ls -a```\
>```cat .hidden```\
>pIwrPrtPN36QITSp3EQaw936yaFoFgAB

>```ssh bandit4@bandit.labs.overthewire.org -p 2220```\
>*Password : pIwrPrtPN36QITSp3EQaw936yaFoFgAB*

## Level 4 to 5
>```cd inhere```\
>```file ./-file07```            #Only Readable file\
>```cat <-file07```\
>koReBOKuIDDepwhWk7jZC0RTdopnAYKh

```>``` is used to open a dashed file (-file07).
>```ssh bandit5@bandit.labs.overthewire.org -p 2220```\
>*Password : koReBOKuIDDepwhWk7jZC0RTdopnAYKh*

## Level 5 to 6
>```cd inhere```\
>```ls```   
>maybehere00 to maybehere 19           
>```find -size 1033c```\
>maybehere07/.file02\
>```cat maybehere07/.file02```\
>DXjZPULLxYr17uwoI01bNLQbtFemEgo7

>```ssh bandit6@bandit.labs.overthewire.org -p 2220```\
>*Password : DXjZPULLxYr17uwoI01bNLQbtFemEgo7*

## Level 6 to 7
>```find / -user bandit7 -group bandit6 -size 33c```\
>/var/lib/dpkg/info/bandit7.password\
>```cat /var/lib/dpkg/info/bandit7.password```   
>HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs


>```ssh bandit7@bandit.labs.overthewire.org -p 2220```\
>*Password : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs*

## Level 7 to 8
>```grep -i "millionth" data.txt```\
>cvX2JJa4CFALtqS87jk27qwqGhBM9plV

>```ssh bandit8@bandit.labs.overthewire.org -p 2220```\
>*Password : cvX2JJa4CFALtqS87jk27qwqGhBM9plV*

## Level 8 to 9
>```sort data.txt```\
>UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR   (only unique line)

I manually found out the only unique line, it was easy to spot after sorting
>```ssh bandit9@bandit.labs.overthewire.org -p 2220```\
>*Password : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR*

## Level 9 to 10
>```cat data.txt | strings```\
>truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

Received only 3 ouput strings out of which only this followed password pattern. 
>```ssh bandit10@bandit.labs.overthewire.org -p 2220```\
>*Password : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk*

## Level 10 to 11
>```base64 -d data.txt```\
>IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

>```ssh bandit11@bandit.labs.overthewire.org -p 2220```\
>*Password : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR*

## Level 11 to 12
>```cat data.txt```\
>Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh\
>```tr 'A-Za-z' 'N-ZA-Mn-za-m' <<< "Gur cnffjbeq vf 5Gr8L4qetPEsPk8htqjhRK8XSP6x2RHh"```\
>The password is 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

>```ssh bandit12@bandit.labs.overthewire.org -p 2220```\
>*Password : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR*
