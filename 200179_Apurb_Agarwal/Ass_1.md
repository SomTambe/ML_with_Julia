## Level 0 --> Level 1  
```cat readme```  
password - boJ9jbbUNNfktd78OOpsqOltutMc3MY1  

## Level 1 --> Level 2  
```cat ./-```  
password - CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

## Level 2 --> Level 3
```cat 'spaces in this filename'```  
password - UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

## Level 3 --> Level 4  
```
cd inhere  
ls -a  
cat .hidden  
```
password - pIwrPrtPN36QITSp3EQaw936yaFoFgAB

## Level 4 --> Level 5  
```
cd inhere  
ls  
kept running ```file ./<filename>``` to find the type of content  
cat ./-file07  
```
password - koReBOKuIDDepwhWk7jZC0RTdopnAYKh

## Level 5 --> Level 6  
```  
cd inhere
find -type f -size 1033c
cat ./maybehere07/.file02
```  
password - DXjZPULLxYr17uwoI01bNLQbtFemEgo7  

## Level 6 --> Level 7  
```
cd ~
find -user bandit7 -group bandit6 -size 33c
cat ./var/lib/dpkg/info/bandit7.password
```  
password - HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs  

## Level 7 --> Level 8  
```
grep -i "millionth" data.txt
```  
password - cvX2JJa4CFALtqS87jk27qwqGhBM9plV  

## Level 8 --> Level 9  
```
sort data.txt | uniq -u
```  
password - UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR  

## Level 9 --> Level 10  
```
strings data.txt | grep "=="
```  
password - truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk  

## Level 10 --> Level 11  
```
base64 --decode data.txt
```  
password - IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR  

## Level 11 --> Level 12  
```
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```  
password - 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu  

## Level 12 --> Level 13  
```
mkdir /tmp/name/
cp data.txt /tmp/name/
cd /tmp/name/
xxd -r data.txt data1
file data1
mv data1 data2.gz
gzip -d data2.gz
file data2
mv data2 data3.bz2
bzip2 -d data3.bz2
file data3
mv data3 data4.gz
file data4
tar -xvf data4
file data5.bin
tar -xvf data5.bin
file data6.bin
mv data6.bin data7.bz2
bzip2 -d data7.bz2
file data7
tar -xvf data7
file data8.bin
mv data8.bin data9.gz
file data9
cat data9
```  
password - 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

## Level 13 --> Level 14  
```
ssh -i sshkey.private bandit14@localhost
```  
password - 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e  

## Level 14 --> Level 15
```
nc localhost 30000
4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e
```  
password - BfMYroe26WYalil77FoDi9qh59eK5xNr  
