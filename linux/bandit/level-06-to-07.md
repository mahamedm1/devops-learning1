## Bandit Level 6 -> Level 7

**Challenge:** Find a file located somewhere in the sever with the following description:
- owned by user bandit7
- owned by group bandit6
- 33 bytes in size

**Solution:**
```
find / -user bandit7 -group bandit6 -size 33c 2/dev/null
cat /var/lib/dpkg/info/bandit7.password
```

**Explanation:**
- find / to look inside the the whole server to search for the file
- -user bandit7 -group bandit6 -size 33c the conditions of the search
- 2/dev/null to direct the many error messages to the "black hole"
- cat /var/lib/dpkg/info/bandit7.password to uncover the password

**Password:** Bmnnvf82KzQlfxgAI2d1zYbr1u9pr3E3

**Errors Encountered:** 
I first found out nothing was inside bandit6. When I ran find / -user bandit7 -group bandit6 -size 33c I encountered many error messages e.g find: ‘/snap’: Permission denied. I then redirected those error messages to 2>/dev/null. 


**What I learned:** 
I could redirect error messages to a file as we don't need to see them in the output.
