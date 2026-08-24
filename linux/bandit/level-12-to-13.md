## Bandit Level 12 -> 13

**Challenge:** Find the password for the next level in the data.txt file where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
**Solution:**
```
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' 

```

**Explanation:**
- cat data.txt outputs the data.txt file 
- | feeds the output to tr
- tr 'A-Za-z' 'N-ZA-Mn-za-m' translate each letter from the normal alphabet to the ROT13 alphabet
   
**Password:** GROozWPO8QyN0mGrjUkID0WCYkZiQxrN
**Errors Encountered:** 
I did not know how to use the tr command. I understood what it does and the logic behind it but I was struggling syntactically. 
I eventually figured out how to write in the second set, but I placed the uppercase after the lowercase letters. Which jumbled up the password.

**What I learned:** 
I learned about the ROT13, how it shifts letters 13 places for encoding when using tr. This level I mapped the normal alphabet to the ROT13 alphabet to decode the text and uncover the password.

