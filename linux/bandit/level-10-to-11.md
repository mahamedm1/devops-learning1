## Bandit Level 9 -> Level 10

**Challenge:** Find the password for the next level which is in a base64 encoded file
**Solution:**
```
base64 -d data.txt

```

**Explanation:**
- strings outputs any sequence of printable characters
- | feeds the output of strings data.txt to grep
- grep "=" outputs any string containing "="
   
**Password:** pYfOY6HwUsDj5rL9UvyhU7MCmv8vN5Ro

**Errors Encountered:** 
I ran base64 data.txt initially and thought that was the password. It wasn't. I checked man base64 and saw the -d flag. I used it to decode the string and got the password.


**What I learned:** 
base64 is an encoding that turns binary data to readable text so the data travels safely. That text in the data.txt file was encoded and base64 -d decoded it.

