"Assignment 1" : Complete first 15 levels of bandit@OverTheWire

The file contains the password used to reach a level and password obtained at each level and a line about the steps and commands to obtain it.


# bandit0 -> bandit1 

Password Used : bandit0
Password obtained : boJ9jbbUNNfktd78OOpsqOltutMc3MY1

Used cat command to read the readme file


# bandit1 -> bandit2 

Password Used : boJ9jbbUNNfktd78OOpsqOltutMc3MY1
Password obtained : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

Used cat ./- command to read the - file


# bandit2 -> bandit3 

Password Used : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
Password obtained : UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

Used cat along with \ as escape character to read the "spaces in this filename" file as cat spaces\ in\ this\ filename 


# bandit3 -> bandit4

Password Used : UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
Password obtained : pIwrPrtPN36QITSp3EQaw936yaFoFgAB

Used ls -a to find hidden file and cat inhere/.hidden


# bandit4 -> bandit5

Password Used : pIwrPrtPN36QITSp3EQaw936yaFoFgAB
Password obtained : koReBOKuIDDepwhWk7jZC0RTdopnAYKh

Used file command on all files to find the only ASCII file and then used cat command.


# bandit5 -> bandit6

Password Used : koReBOKuIDDepwhWk7jZC0RTdopnAYKh
Password obtained : DXjZPULLxYr17uwoI01bNLQbtFemEgo7

Used find -readable  -size command  to find the readable file of 1033 bytes and then used cat command.


# bandit6 -> bandit7

Password Used : DXjZPULLxYr17uwoI01bNLQbtFemEgo7
Password obtained : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

Used find commande with -group  -size -user options and then used cat command.


# bandit7 -> bandit8

Password Used : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
Password obtained : cvX2JJa4CFALtqS87jk27qwqGhBM9plV

Used egrep "millionth" data.txt


# bandit8 -> bandit9

Password Used : cvX2JJa4CFALtqS87jk27qwqGhBM9plV
Password obtained : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

Used piping to direct the output of sort to uniq -u. 
* sort data.txt | uniq -u


# bandit9 -> bandit10

Password Used : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
Password obtained : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

Used strings to find human readable files. Used grep to find lines having multiple =


# bandit10 -> bandit11

Password Used : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
Password obtained : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

Used base64 -d to decode data.


# bandit11 -> bandit12

Password Used : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
Password obtained : 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

Used cat data.txt and then piped the contents of data to tr "A-Z|a-z" "N-Z|A-M|n-z|a-m"


# bandit12 -> bandit13

Password Used : 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu
Password obtained : 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

Used xxd -r followed by tar gzip bzip2 commands


# bandit13 -> bandit14

Password Used : 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL
Password obtained : 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

Used ssh -i ssh.txt bandit14 -p 2220 where ssh.txt is a file containing the private key to log into next level. 


# bandit14 -> bandit15

Password Used : 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
Password obtained : BfMYroe26WYalil77FoDi9qh59eK5xNr

Used nc localhost 30000 < bandit14 to transfer file from remote to local device.


# bandit15 -> bandit16

Password Used : BfMYroe26WYalil77FoDi9qh59eK5xNr
Password obtained : cluFn7wTiGryunymYOu4RcffSxQluehd

Used openssl command with -ign_eof option
