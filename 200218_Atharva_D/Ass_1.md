# **Assignment 1** : Complete the first 15 Levels of [OverTheWire - Bandit Wargames](https://overthewire.org/wargames/bandit/) 

Solutions to the Levels will be in the form of Commands used in the terminal and Final Password obtained for the next level.
- **Level 0 → Level 1**
  ---------------	
    ```
    ~$ ssh bandit0@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : bandit0
    ```
    ~$ ls
    ~$ cat readme
    ```
    >*Password Obtained:* boJ9jbbUNNfktd78OOpsqOltutMc3MY1
    
<br/>

- **Level 1 → Level 2**
  ---------------	
    ```
    ~$ ssh bandit1@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : boJ9jbbUNNfktd78OOpsqOltutMc3MY1
    ```
    ~$ ls
    ~$ cat ./-
    ```
    >*Password Obtained:* CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

<br/>

- **Level 2 → Level 3**
  ---------------	
    ```
    ~$ ssh bandit2@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9
    ```
    ~$ ls
    ~$ cat "spaces in this filename"
    ```
    >*Password Obtained:* UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK 

<br/>
    
- **Level 3 → Level 4**
  ---------------	
    ```
    ~$ ssh bandit3@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK
    ```
    ~$ ls
    ~$ file inhere/*
    ~$ cat .hidden
    ```
    >*Password Obtained:* pIwrPrtPN36QITSp3EQaw936yaFoFgAB

<br/>

- **Level 4 → Level 5**
  ---------------	
    ```
    ~$ ssh bandit4@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : pIwrPrtPN36QITSp3EQaw936yaFoFgAB
    ```
    ~$ ls
    ~$ file */*
    ```
    >*Password Obtained:* koReBOKuIDDepwhWk7jZC0RTdopnAYKh

<br/>

- **Level 5 → Level 6**
  ---------------	
    ```
    ~$ ssh bandit5@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : koReBOKuIDDepwhWk7jZC0RTdopnAYKh
    ```
    ~$ ls
    ~$ cd inhere/
    ~$ find . -type f -readable ! -executable -size 1033c
    ```
    >*Password Obtained:* 
    DXjZPULLxYr17uwoI01bNLQbtFemEgo7

<br/>

- **Level 6 → Level 7**
  ---------------	
    ```
    ~$ ssh bandit6@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : DXjZPULLxYr17uwoI01bNLQbtFemEgo7
    ```
    ~$ cd ..
    ~$ cd ..
    ~$ find ./ -type f -size 33c
    ~$ cat ./var/lib/dpkg/info/bandit7.password
    ```
    >*Password Obtained:* 
    HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

<br/>

- **Level 7 → Level 8**
  ---------------	
    ```
    ~$ ssh bandit7@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs
    ```
    ~$ grep “millionth” data.txt
    ```
    >*Password Obtained:* 
    cvX2JJa4CFALtqS87jk27qwqGhBM9plV

<br/>

- **Level 8 → Level 9**
  ---------------	
    ```
    ~$ ssh bandit8@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : cvX2JJa4CFALtqS87jk27qwqGhBM9plV
    ```
    ~$ sort data.txt | uniq -u
    ```
    >*Password Obtained:* 
    UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

<br/>

- **Level 9 → Level 10**
  ---------------	
    ```
    ~$ ssh bandit9@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR
    ```
    ~$ strings data.txt (rest manually)
    ```
    >*Password Obtained:* 
    truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

<br/>

- **Level 10 → Level 11**
  ---------------	
    ```
    ~$ ssh bandit10@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk
    ```
    ~$ base64 --decode data.txt
    ```

    >*Password Obtained:* 
    IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

<br/>


- **Level 11 → Level 12**
  ---------------	
    ```
    ~$ ssh bandit11@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
    ```
    ~$ cat data.txt | tr A-Za-z N-ZA-Mn-za-m
    ```
    ^ (via wikipedia page)

    >*Password Obtained:* 
    IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

<br/>

- **Level 11 → Level 12**
  ---------------	
    ```
    ~$ ssh bandit11@bandit.labs.overthewire.org -p 2220
    ```
    *Password* : IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR
    ```
    ~$ cat data.txt | tr A-Za-z N-ZA-Mn-za-m
    ```
    ^ (via wikipedia page given on website)

    >*Password Obtained:* 
    IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

<br/>

Still trying futher levels... Will update more as soon as I find something new