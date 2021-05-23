 
Level 0

This was the first step to get connected to the server.
Command : ssh bandit0@bandit.labs.overthewire.org -p 2220
Password : bandit0

Level 0 -> Level 1

IMPORTANT : Exit the server xD 
Command : cat readme
Password: boJ9jbbUNNfktd78OOpsqOltutMc3MY1 

Level 1 -> Level 2

Command : cat ./- (some sort of escape sequence) or can mention complete file path
Password : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

Level 2 -> Level 3

Various methods to do this
Command : cat 'spaces in this filename' OR cat spaces\ in \ this \filename
Password: UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

Level 3 -> Level 4

Command : cd inhere (to change directory)
	   ls -a (to see hidden file)
	   cat .hidden
Password : pIwrPrtPN36QITSp3EQaw936yaFoFgAB 

Level 4 -> Level 5

Command : Nothing much here, had to manually cat each file
Password : koReBOKuIDDepwhWk7jZC0RTdopnAYKh 

Level 5 -> Level 6

Command : find -type f -size 1033c ! -executable (1033b won't work)
Password : DXjZPULLxYr17uwoI01bNLQbtFemEgo7

Level 6 -> Level 7

Command : find / -user bandit7 -group bandit6 -size 33c
Password : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

Level 7 -> Level 8

Command : cat data.txt | grep millionth
Password : cvX2JJa4CFALtqS87jk27qwqGhBM9plV

Level 8 -> Level 9

Command : sort data.txt | uniq -u
Password : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

Level 9 -> Level 10

Command : cat data.txt | strings | grep ====== (not a certain number)
Password : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
	
Level 10 -> Level 11

Command : cat data.txt | base64 --decode
Password : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

Level 11 -> Level 12

Command : just cat data.txt (some gibberish with rotated letters and then sort it out using some tool)
Password : 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

Level 12 -> Level 13 (PAIN)

Command : mkdir /tmp/AGS_11_12
cp data.txt /tmp/AGS_11_12/data.txt
cd /tmp/AGS_11_12

xxd -r data.txt data.out
file data.out
mv data.out data.gz
gzip -d data.gz

file data
bzip2 -d data

file data.out
mv data.out data.gz
gzip -d data.gz

file data
tar -xf data

file data5.bin
tar -xf data5.bin

file data6.bin
bzip2 -d data6.bin

file data6.bin.out
tar -xf data6.bin.out

file data8.bin
mv data8.bin data8.gz
gzip -d data8.gz
cat data8

 (Kya hi bolun)

Password : 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

Level 13 -> Level 14 

Command : ssh bandit14@localhost -i sshkey.private    cat  /etc/bandit_pass/bandit14
Password : 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

Level 14 -> Level 15

Command : nc localhost 30000 and then I put the password for the previous level.
Password : BfMYroe26WYalil77FoDi9qh59eK5xNr 	
