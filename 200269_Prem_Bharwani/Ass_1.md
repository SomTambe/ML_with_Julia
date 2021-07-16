# [Bandit OverTheWire](https://overthewire.org/wargames/bandit/) submission by Prem Bharwani

> I have explained each step with the commands below (except the trivial ones).

---

#### 0->1:
get the password from the readme file and use ssh command with the given port 

`$ ssh bandit1@bandit.labs.overthewire.org -p 2220`

#### 1->2
'-' character can't be directly used with the 'cat' command , because it is misinterpreted for stdin. We use 'cat ./-'
#### 2->3
Use cat along with : use '\' to escape the spaces in the filename OR put the filename in single quotes
#### 3->4
use '$ ls -a' and then cat
#### 4->5
`$ for FILE in *; do cat ./$FILE;echo '\n'; done`

using the above command it will loop through all the files and you can figure out the readable one :)
#### 5->6
`$ ls -alR | grep --line-number 1033`

(use this to get the line number of a file with 1033 bytes and it also matches the given description)

`$ ls -alR | head -n 131`

(Figure out the directory in which this file belongs and get your answer , use cat directly to get the passwd)
#### 6->7
Just go to the '/' and just recursively search for a file owned by bandit7 and bandit6 group

`$ ls -alR | grep --line-number 'bandit7 bandit6'`

(you get the line number that corresponds to the o/p from 'ls -alR')
So now use the head command along with the line number to get the files location 

`$ ls -aRl | head -n 160813`

#### 7->8
`$ cat data.txt | grep millionth`

Using the above command we can get it 
#### 8->9
`$ sort data.txt | uniq -u`

Using sort we can 'club' all the common occurences together . And then 'uniq' command can figure out unique the unique phrase .
#### 9->10
Extract out the printable characters using the strings command 

`$ strings data.txt | grep =`

#### 10->11
straightforward use of 'base64' command : 
`$	base64 -d data.txt`
#### 11->12
this uses the rot13 algo , we can undo this by using the 'tr' command :

$ tr 'a-mA-Mn-zN-Z' 'n-zN-Za-mA-M' < data.txt 
#### 12->13
Firstly use 'xxd' to convert the hexdump back into the file , and then use the 'file' command to understand what kind of file this is , and accordingly use 'gzip' , 'bzip2' or 'tar' at each step with maximum decompression !
Also take note that when using gzip , you have to ensure that the file name is renamed to '*.gz' kind . 

#### 13->14
Take the ssh private key to the local computer and then use ssh command with '-i' arguement to log in .
#### 14->15
Just use netcat('nc' command) to connect to the specific port ,and then supply the password for the current level.
$ nc localhost 30000
#### 15->16
Use openssl to make a secure connection to the localhost at port 30001 and submit the password .

`$ openssl s_client -connect localhost:30001`

#### 16-> 17
Firstly we’ll figure out the open ports using the nmap command :
`$ nmap -p 31000-32000 localhost`
This will give us the list of available ports , now we will use openssl to establish a ssl connection with each of the ports and give the password , you will see that one  of them returns a RSA key for the next level. Which we can use to login using ssh .
`$ openssl s_client -connect localhost:31790`

#### 17->18
Basic use of diff command
`$ diff passwords.new passwords.old`
You will find out what has changed , so use the line from the ‘passwords.new’ file.		

