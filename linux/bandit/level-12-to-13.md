## Bandit Level 12 -> 13

**Challenge:** Find the password for the next level in the data.txt which is a hexdump of a file that has been repeatedly compressed

**Solution:**
```
xxd -r data.txt
file data.txt
mv data.txt data.gz && gzip -d data.gz
mv data data.bz2 && bzip2 -d data.bz2
tar -xf data
repeat until you find an ascii file type
// cat data8
```

**Explanation:**
- xxd reverts hexadecimal file to binary 
- file tells me what file type it is to let me know what command to use next 
- gzip -d decompresses gzip files
- bzip2 -d decompresses bzip2 files
- tar -xf extracts the archives allowing me to inspect it
- cat data8 to open the file
   
**Password:** qQYQiHOBPR8zR61qxYqX45quvihF2uzk
**Errors Encountered:** 
- First error was when I tried decompress with gzip and bzip2 I did not have the correct suffix. 
- Another error was when I was running tar -x to extract the archived files, I didn't use the -f flag to    specify what file I am executing
  

**What I learned:** 
I learned how to revert hexdump files into binary and how to decompress them depending on what file types they are.

