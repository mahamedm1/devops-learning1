## Bandit Level 3 -> Level 4

**Challenge:** Open the file called "--spaces in this filename--"  and uncover the password within

**Solution:**
```
cat ./"--spaces in this filename=="  or  cat ./--spaces\ in\ this\ filename-- 
```

**Explanation:**
- cat will not open a file with spaces present in it's name. It will assume each word is a separate argument
- So you must enclose the filename with quotation marks or place a backslash after each word and place a space in between them.


**Password:** 7ZZ2LFrykP2zEyvBl4m3clcL7tGYJPME

**Errors Encountered:** 

**What I learned:** I learned that you cannot use cat to view the contents of a file that contains a space in it's name. To bypass this, you must use quotation marks or place a backslash after each word.
