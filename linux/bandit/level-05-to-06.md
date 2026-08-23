## Bandit Level 6 -> Level 7

**Challenge:** Find the password located in the inhere directory with the following properties:
- human-readable
- 1033 bytes in size
- not executable

**Solution:**
```
cd inhere/
ls
man find
find -size 1033c
cat ./maybehere07/.file2
```

**Explanation:**
- cd inhere/ to enter the inhere directory
- ls to list what is inside the directory
- man find so I know what the purpose of the command is and what potential flag I need to use
- find -size 1033c to find any file in any directory that contains a size of 1033 bytes
- cat ./maybehere07/.file2 to open the contents of file2

**Password:** pXa26xhMWaC2SvDotA4r9EgZkulOeSBW

**Errors Encountered:** 
I didn't encounter any error. It just took me long to find the correct way to use find. I eventually saw the -size flag and how to use it

**What I learned:** 
The find command searches through directories to find files. I scrolled down in the manual to find the -size flag. This can take an argument with a suffix of c to present how many bytes a file has.
