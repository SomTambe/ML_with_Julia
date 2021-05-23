# Level 0
> Password: boJ9jbbUNNfktd78OOpsqOltutMc3MY1

This level is simply connecting to overthewire server via ssh. <br>
The password in the only file at home directory.

# Level 1
> Password: CV1DtqXWVFXTvM2F0k09SHz0YwRINYA9

The file name is the tricky part in this level. <br/>
Cleared by specifying the path as ./-

# Level 2
> Password: UmHadQclWmgdLOKQ3YNgjWxGoRMb5luK

Again, the file name was to be handled carefully. <br/>
Used `cat 'spaces in this filename'`

# Level 3
> Password: pIwrPrtPN36QITSp3EQaw936yaFoFgAB

The password is in a hidden file `.hidden`.

# Level 4
> Password: koReBOKuIDDepwhWk7jZC0RTdopnAYKh

Used the `file *` to know which file is human-readable.

# Level 5
> Password: DXjZPULLxYr17uwoI01bNLQbtFemEgo7

Given that file size is 1033 bytes, <br/>
running `find . -size 1033` does the trick.

# Level 6
> Password: HKBPTKQnIay4Fw76bEy8PVxKEDQRKTzs

Given that password is hidden in the server,  <br/>
navigating to root and using `find . -size 33c` is enough.

# Level 7
> Password: cvX2JJa4CFALtqS87jk27qwqGhBM9plV

Given that password is in data.txt <br/>
Next to the word "millionth", did this manually.

# Level 8
> Password: UsvVyFSfZZWbi6wgC7dAFyFuR6jQQUhR

Given that password is the only unique line.  <br/>
Too long to do manually, used `cat data.txt | uniq -u`

# Level 9
> Password: truKLdjsbJ5g7yyJ2X2R0o3a5HQJFuLk

Password is next to 'a lot of "="'. <br/>
Thus used `cat data.txt | grep =`

# Level 10
> Password: IFukwKGsFW8MOq3IRFqrxE1hxTNEbUPR

The password string is encrypted by base64. <br/>
Used `cat data.txt | base64 --decode`

# Level 11
> Password: 5Te8Y4drgCRfCx8ugdwuEX8KFC6k2EUu

Given that password has been encrypted by rot13. <br/>
A Google search explained how to do so.. <br/>
with `cat data.txt | tr a-zA-Z n-za-mN-ZA-M`

# Level 12
> Password: 8ZjyCRiBWFYkneahHwxCv3wb2a1ORpYL

Hex dump level...yay.. ;-; Took me long enough. <br/>
First making a temporary directory as `mkdir /tmp/banshuman20`  <br/>
Copying the data.txt file there.  <br/>
Now to reverse the hexdump, `xxd -r data.txt mdata`  <br/>
mdata.txt is found to be gzip compressed.  <br/>
Changing the name to mdata.gz  <br/>
De-gzip (gunzip) with `gzip -d mdata.gz`  <br/>
`file` shows that it's a bzip2 file.
Redoing above steps in similar fashion with `mv mdata mdata.bz2` `bzip2 -d mdata.bz2`  <br/>
Again a gzip file. Do the above.  <br/>
This yields a tar. Untar with `tar -xvfg mdata`  <br/>
Again untar 'data5.bin' obtained to get 'data6.bin'  <br/>
file now shows a bzip2 again. Unzip to get 'data8.bin'  <br/>
Another check shows this as a gzip file. `gunzip data8.gz` after renaming ofc.  <br/>
We finally obtain `data9.bin`, which contains what we were after.

# Level 13
> Password: 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e

Entering the server shows a private key to the next server.  <br/>
Use that as `ssh bandit14@localhost -i sshkey private`.  <br/>
The password mentioned is found in the next step.

# Level 14
> Password: BfMYroe26WYalil77FoDi9qh59eK5xNr

The above procedure leaves us as bandit14.  <br/>
I do remember all host details were accessible at /etc (/etc/bandit_pass) <br/>
found during reading about root directories.  <br/>
Used it for above password, and to submit to port 30000 of localhost.  <br/>
Used `nc localhost 30000` and entered this level's password.

# Level 15
> Password: cluFn7wTiGryunymYOu4RcffSxQluehd

The hint was using SSL connection, so searching a bit gave the exact solution <br/>
Using `openssl s_client localhost:30001` and entering the password...did it.
