

ls
cat readme
level 1:boJ9jbbUNNfktd78OOpsqOltutMc3MY1
exit
 ssh bandit1@bandit.labs.overthewire.org -p 2220
 cat ./-
level 2 : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
exit
ssh bandit2@bandit.labs.overthewire.org -p 2220
ls
cat spaces\ in\ this\ filename
level 3: UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
exit
ssh bandit3@bandit.labs.overthewire.org -p 2220
 cd \inhere
ls -al
cat .hidden
level 4: pIwrPrtPN36QITSp3EQaw936yaFoFgAB
cd \inhere
find . -type f | xargs file
level 5:koReBOKuIDDepwhWk7jZC0RTdopnAYKh
cd \inhere
find . -type f -size 1033c  ! -executable | xargs file
level 6: DXjZPULLxYr17uwoI01bNLQbtFemEgo7
find / -type f -user bandit7 -group bandit6 -size 33c
cat /var/lib/dpkg/info/bandit7.password

find / -user bandit7 -group bandit6 -size 33c 2>/dev/null
level 7:HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

grep millionth data.txt

level 8: cvX2JJa4CFALtqS87jk27qwqGhBM9plV
 sort data.txt |uniq -u

level 9: UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
strins data.txt

level 10: truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
base64 -d data.txt

level 11:IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
 cat data.txt | tr 'n-za-mN-ZA-M' 'a-zA-Z'

 level 12:5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
I HAVE COPIED THIS LEVEL

level 13:8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
ssh -i sshkey.private bandit14@localhost
cat /etc/bandit_pass/bandit14

level 14 :4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
telnet localhost 30000
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

level 15:BfMYroe26WYalil77FoDi9qh59eK5xNr

