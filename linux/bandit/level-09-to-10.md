## Bandit Level 9 -> Level 10

**Challenge:** Find the password for the next level which is one of the few human-readable strings, preceded by several ‘=’ characters.

**Solution:**
```
strings data.txt | grep "="

```

**Explanation:**
- strings outputs any sequence of printable characters
- | feeds the output of strings data.txt to grep
- grep "=" outputs any string containing "="
   
**Password:** B0s2khmbT9u0geKuOoVGW3JZKhndE3BG

**Errors Encountered:** 
None. I initially ran strings data.txt but figured maybe there's a way where I can get strings with an "=" inside


**What I learned:** 
strings outputs sequences of characters in a file to the terminal 

