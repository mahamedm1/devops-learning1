## Bandit Level 14 -> 15

**Challenge:** Retrieve the password by submitting the password of the current level to port 30000 on localhost.
**Solution:**
```
ssh bandit14@bandit.labs.overthewire.org -p2220 -i private.txt 
```

**Explanation:**
- ssh allows you to connect to a server remotely 
- bandit14 is the username
- @bandit.labs.overthewire.org is the hostname
- -p2220 the port we connect to
- -i private.txt select the file to access the private key
- chmod g=- o=-
- 
   
**Password:** n/a

**Errors Encountered:** 
- I initially tried to open a new session and access the sshkey.private from level 13 but of course i was met with directory not found.
  So I copied the private key and pasted it in a private.txt file in my home server.
- Another error was when I was tried to ssh into bandit14 I was told that others cannot have access to the private key so I could not login. So I used chmod to remove permissions from group and others
  

**What I learned:** 
I learned how to ssh into a server using a file containing a private key, also remove permissions of a file to proceed.

