## Bandit Level 1 -> Level 2 

**Challenge:** Open the file title "-" and uncover the password within

**Solution:**
```
cat ./- 
```

**Explanation:**
- cat will expect a standard input if you run the command cat -
- So you must place "./" before "-" 
- This tells cat to open the file in this directory named "-"


**Password:** PK8fYLZg2hnHSz83plBL1iEPKdD3QToB

**What I learned:** I learned that you need to specify to the command cat to open the file located in this directory rather than just naming the file after the command. Otherwise it will expect an input

