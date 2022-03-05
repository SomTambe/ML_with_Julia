# Bandit Solutions
### Lvl 0->1
- ssh bandit0@bandit.labs.overthewire.org -p 2220
- ls
- cat readme
  
### Lvl 1->2
- ssh bandit1@bandit.labs.overthewire.org -p 2220
- ls
- cat ./-
  
### Lvl 2->3
- ssh bandit2@bandit.labs.overthewire.org -p 2220
- ls
- cat spaces\ in\ this\ filename

### Lvl 3->4
- ssh bandit3@bandit.labs.overthewire.org -p 2220
- ls
- cd inhere
- ls
- ls -a
- cat .hidden
  
### Lvl 4->5
- ssh bandit4@bandit.labs.overthewire.org -p 2220
- ls
- cd inhere
- ls
- file ./-file*
- cat ./-file07
  
### Lvl 5->6
- ssh bandit5@bandit.labs.overthewire.org -p 2220
- ls
- cd inhere
- ls -a
- find -type f -size 1033c
- cat ./maybehere07/.file2

### Lvl 6->7
- ssh bandit6@bandit.labs.overthewire.org -p 2220
- find / -user bandit7 -group bandit6 -size 33c
- cat /var/lib/dpkg/info/bandit7.password

### Lvl 7->8
- ssh bandit7@bandit.labs.overthewire.org -p 2220
- ls
- cat data.txt
- grep 'millionth' data.txt

### Lvl 8->9
- ssh bandit8@bandit.labs.overthewire.org -p 2220
- ls
- cat data.txt | sort | uniq -u
  
### Lvl 9->10
- ssh bandit9@bandit.labs.overthewire.org -p 2220
- ls
- strings data.txt | grep "="

### Lvl 10->11
- ssh bandit10@bandit.labs.overthewire.org -p 2220
- ls
- cat data.txt | base64 --decode

### Lvl 11->12
- ssh bandit11@bandit.labs.overthewire.org -p 2220
- ls
- cat data.txt | tr 'n-za-mN-ZA-M' 'a-zA-Z'

### Lvl 12->13
- ssh bandit12@bandit.labs.overthewire.org -p 2220
- ls
- cat data.txt | xxd -r > d
- file d
- mv d d2.gz
- gzip -d d2.gz
- continued multiple times in bzip2,tar,gzip,bin till file {filename} showed ASCII text
- cat {filename}