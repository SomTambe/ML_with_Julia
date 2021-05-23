Level 0
ssh bandit0@bandit.labs.overthewire.org -p 2220
Password : bandit0


Level 0>>>1

cat readme
boJ9jbbUNNfktd78OOpsqOltutMc3MY1

ssh bandit1@bandit.labs.overthewire.org -p 2220
Password : boJ9jbbUNNfktd78OOpsqOltutMc3MY1

Level 1>>>2
cat ./-
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

ssh bandit2@bandit.labs.overthewire.org -p 2220
Password : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

Level 2>>>3
ls
spaces in this filename
cat 'spaces in this filename'
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

ssh bandit3@bandit.labs.overthewire.org -p 2220
Password : UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

Level 3>>>4
cd inhere
ls -a
cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB

ssh bandit4@bandit.labs.overthewire.org -p 2220
Password : pIwrPrtPN36QITSp3EQaw936yaFoFgAB

Level 4>>>5
cd inhere
Readable file: -file07
cat ./-file07
Password:koReBOKuIDDepwhWk7jZC0RTdopnAYKh


ssh bandit5@bandit.labs.overthewire.org -p 2220
Password : koReBOKuIDDepwhWk7jZC0RTdopnAYKh

Level 5>>>6

cd inhere
ls
maybehere00 to maybehere 19
find -size 1033c
maybehere07/.file02
cat maybehere07/.file02
DXjZPULLxYr17uwoI01bNLQbtFemEgo7

ssh bandit6@bandit.labs.overthewire.org -p 2220
Password : DXjZPULLxYr17uwoI01bNLQbtFemEgo7


Level 6>>>7

find / -user bandit7 -group bandit6 -size 33c
/var/lib/dpkg/info/bandit7.password
cat /var/lib/dpkg/info/bandit7.password
HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

ssh bandit7@bandit.labs.overthewire.org -p 2220
Password : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

Level 7>>>8

grep -i "millionth" data.txt
cvX2JJa4CFALtqS87jk27qwqGhBM9plV

ssh bandit8@bandit.labs.overthewire.org -p 2220
Password : cvX2JJa4CFALtqS87jk27qwqGhBM9plV

Level 8>>>9

sort data.txt
UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

ssh bandit9@bandit.labs.overthewire.org -p 2220
Password : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

Level 9>>>10

cat data.txt | strings
truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

ssh bandit10@bandit.labs.overthewire.org -p 2220
Password : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk