## Bandit Level 8 -> Level 9

**Challenge:** Find the password for the next level which is stored in the file data.txt and is the only line of text that occurs only once

**Solution:**
```
sort data.txt | uniq -u

```

**Explanation:**
- sort data.txt to sort the file in alphabetical order
- | feeds the output of sort data.txt to uniq -u
- uniq -u to display only unique lines
   
**Password:** EjmOSvuAu7sGAHqHVcBDPirRe9T03kxl

**Errors Encountered:** 
I didn't know how to approach this. I read the manual for strings, grep and sort. I figured I would not need grep since I have nothing to base the pattern search off of.
Strings too since the whole file is text. So I have to use sort. But I did not know how to use it further.


**What I learned:** 
Sort sorts the file alphabetically. "|" is a pipe which takes the std output and feeds it to uniq -u. 
