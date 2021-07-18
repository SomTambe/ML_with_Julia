# [OverTheWire - Bandit](https://overthewire.org/wargames/bandit/) Assignments .

***

## [Level 0](https://overthewire.org/wargames/bandit/bandit0.html)

```
~$ ssh bandit0@bandit.labs.ovethewire.org -p 2220
```
We just enter the password **bandit0** and get access.

***
## [Level 0 → Level 1](https://overthewire.org/wargames/bandit/bandit1.html)

```
bandit0@bandit:~$ cat readme
boJ9jbbUNNfktd78OOpsqOltutMc3MY1 			# Password for next level
```
***

## [Level 1 → Level 2](https://overthewire.org/wargames/bandit/bandit2.html)
```
bandit1@bandit:~$ cat ./-					    
CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9			# Password for next level
```
Using ``` cat - ``` will not work (cat command considers ```-``` as stdin/Stout) , so we have to use ```./``` instead .
***

## [Level 2 → Level 3](https://overthewire.org/wargames/bandit/bandit3.html)
```
bandit1@bandit:~$ cat 'spaces in this filename'
UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK       # Password for next level
```
To read spaces in the file name , either ```\``` is used or the filename is put inside ```' '```.

***

## [Level 3 → Level 4](https://overthewire.org/wargames/bandit/bandit4.html)

```
bandit3@bandit:~/inhere$ ls -a
.  ..  .hidden
bandit3@bandit:~/inhere$ cat .hidden
pIwrPrtPN36QITSp3EQaw936yaFoFgAB        # Password for next level
```
To list all the files (including hidden files) ``` ls -a``` is used .
***

## [Level 4 → Level 5](https://overthewire.org/wargames/bandit/bandit5.html)

Listing all files in the directory , there are 7 files . Now we use ```file ./-*``` command which lists down the data type of every file . Thereafter we find the file which has ASCII text. 
```./-file07: ASCII text``` 
We read the contents of this file and get the password for the next level.

***

## [Level 5 → Level 6](https://overthewire.org/wargames/bandit/bandit6.html)

Since this level involves searching of files , we would use ```find``` to search files .
```
bandit5@bandit:~$ find -type f -size 1033c
``` 

***

## [Level 6 → Level 7](https://overthewire.org/wargames/bandit/bandit7.html)

We would use ```find``` function in this level too , but this time it would involve more descriptive arguments along with it.
```
bandit6@bandit:~$ find -type f -size 1033c
```
***

## [Level 7 → Level 8](https://overthewire.org/wargames/bandit/bandit8.html)

We will use the ```grep``` command to search for the word in the data.txt file . The command prints the complete line involving the word .
```
bandit7@bandit:~$ cat data.txt | grep millionth
```

***

## [Level 8 → Level 9](https://overthewire.org/wargames/bandit/bandit9.html)

In this level , we have to sort all lines present in the text file . Doing this would group all the repeating lines at one place and we can further use ```uniq``` command to print the unique line .
```
bandit8@bandit:~$ cat data.txt | sort | uniq -u
```

***

## [Level 9 → Level 10](https://overthewire.org/wargames/bandit/bandit10.html)

We use the grep command and obtain all the strings with "=" . 
```
bandit9@bandit:~$ strings data.txt | grep "="
``` 

***

## [Level 10 → Level 11](https://overthewire.org/wargames/bandit/bandit11.html)

The contents of the file are encoded .
```
bandit10@bandit:~$ cat data.txt | base64 --decode
```
This command will decode the contents of the file and the contents become human readable .

***

## [Level 11 → Level 12](https://overthewire.org/wargames/bandit/bandit12.html)

The contents are now encoded by ROT13 method . We use the ```tr``` command . 
```
bandit11@bandit:~$ cat data.txt | tr a-zA-Z n-za-mN-ZA-M
```

***

## [Level 12 → Level 13](https://overthewire.org/wargames/bandit/bandit13.html)

We are given the information that the file is hexdumped and is repeatedly compressed . 
This level requires multiple commands , such as , ```xxd , mv , tar ,bzip2 ,gz``` . 

* ```xxd``` is used to convert the hexdump into file .
* ```tar ,bzip2, gz``` , these commands are used for decompressing of various types of compressed files .
* ```mv``` is used for renaming the file.

Doing repeated decompreesion and then renaming the file accordingly would finally fetch a .txt file which would take us to the next level.

***

## [Level 13 → Level 14](https://overthewire.org/wargames/bandit/bandit14.html)

For this level , we have a private key through which we would login privately into the remote server.
```
bandit13@bandit:~$ ssh -i sshkey.private bandit14@localhost
```
We now read the contents of the file on the server and proceed further .

***

## [Level 14 → Level 15](https://overthewire.org/wargames/bandit/bandit15.html)

The password for the next level is obtained by submitting the password of the current level to port 30000 on localhost. 
```telnet``` command serves our purpose .
```
bandit14@bandit:~$ telnet localhost 30000
``` 

***
