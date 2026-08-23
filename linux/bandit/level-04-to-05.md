## Bandit Level 4 -> Level 5

**Challenge:** Find the password located in the only human readable file

**Solution:**
```
cd inhere/
ls -a
file ./*
cat ./file07
```

**Explanation:**
- cd inhere/ to enter the inhere directory
- ls -a to list everything inside the directory
- file ./* to determine the file type for every file inside the current directory
- cat ./file07 to open the contents of file07


**Password:** 6C7h9GD8M6ai5nr7wo1RonrzFjj9yIrG

**Errors Encountered:** 
file: Cannot open `ile00' (No such file or directory)
file: Cannot open `ile01' (No such file or directory)
file: Cannot open `ile02' (No such file or directory)
file: Cannot open `ile03' (No such file or directory)
file: Cannot open `ile04' (No such file or directory)
file: Cannot open `ile05' (No such file or directory)
file: Cannot open `ile06' (No such file or directory)
file: Cannot open `ile07' (No such file or directory)
file: Cannot open `ile08' (No such file or directory)
file: Cannot open `ile09' (No such file or directory)

**What I learned:** My initial logic was to cat every file. However, that is inefficent and I knew there must have been a quicker way to solve this. 
On the overthewire bandit website, it mentioned file to be one the commands you could use. I wrote man file, and found out it displays the file type. 
So I knew I could use this to find the file containing readbale text and open it. But then I wrote " file *" with the thinking this would traverse through the current directory and this introduced me to the error presented above. 
Then I realised I needed to specify this current directoy so I ran file ./*. 
This solved my issue.

