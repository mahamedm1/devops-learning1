# Bash Scripting Notes
Notes from my journey learning Bash Scripting as a part of my DevOps studies

## Contents
- Shebang
- Variables & Parameters
  

---

## Shebang

### What is a Shebang?
- A **Shebang** is the first line of a script which tells the shell which interpreter to use to run the script. 
- The interpreter is the last section of the **Shebang**. This is a program which reads and executes the script. It could be bash or python etc.
- An example of a **Shebang** is **#!/bin/bash** or **#!/usr/bin/python3**
- The **Shebang** begins with a **#!** which is a special marker to notify Linux that an interpreter is to follow. An interpreter is essential as it understands the scripting language being used and executes it
- What follows next is the file path where the specific interpreter in use is located. This tells the OS which interpreter should run the script.

## Variables & Parameters

### Variables
- Variables are containers that store data such as strings, numbers and arrays. They are essential as they provide a way to store values written in them that can later be accessed in the script.
- Example:
  **Name = "Mahamed"
    Teams = ("Spurs", "Arsenal", "Chelsea")**

  **echo $Name $Teams**
  
- When you run your script on the terminal it would output:
- **Mahamed**

  **Spurs Arsenal Chelsea**

### Parameters
- Parameters are values you can input when running a script. You reference it in the script by prepending with $1 for the first input and $2 for the second
- Example:
  **echo "The sum of $1 and $2 = $(($1 + $2))**
- This will output the sum of which ever two numbers you input when you run the script.
**./script.sh 1 2
The sum of 1 and 2 = 3**

- Note for arithmetic calculations you must prepend it with a (( and append with )).

## Conditionals

### If Statements
- If statement are use when conditions are involved. They let your script make a decision. If a condition is met then you run the code if not then it could cease or run something else.
- Example:
  **age=$1
  If [ $age -ge 18 ]
  then
  echo "You are an adult"
  elif [ $age -ge 13 ] && [ $age -le 17 ]
  echo "You are a teenager"
  else
  echo "You are a minor"
  fi**
  
- This code block essentially says if the age is greater than or equal to 18 print "You are an adult" or if you are betwwen 13 and 17 print "You are a teenager" or print "You are a minor".
- The assignment variables for bash are:
  - eq -> equals to
  - ne - not equal to
  - lt -> less than
  - gt -> greater than
  - le -> less than or equal to
  - ge -> greater than or equal to
 
- The logical operators for bash are:
  - == -> equals 
  - && -> AND
  - || -> OR
 
  ### Nested If Statements
  - Nested If statements allow you to make a sequence of decisions step by step where each decision depends on the previous one. This is mainly used for complex decision making.
  - Example:
      age=19
    
      grade=79
    
      if [ $age -ge 18]
    
      then
    
      echo "You are eligible"
    
          if [ grade -ge 75 ]
    
          then
    
          echo "You have made it"
    
          else
    
          echo "You have not made it"
    
          fi
    
      else
    
      echo "You are ineligible"
    
      fi
    
## Loops

### While Loops
- While loops allow to repeatedly run a specific code block as long as a certain condition remains true. Once the condition becomes false, the loop breaks.
- While loop template:
  **While condition
  do**
  # Code to be executed
  **done**

### For Loops
- For loops allow you to repeatedly run through a specific code block for each element in a given collection or sequence. Once there are no more elements to iterate through, the loop halts.
- For loop template:
- **For ((i=1; i<=5; i++))
       do
       # Code to be executed
      done**
### Break & Continue
- The break command immediately exits the entire loop. Any code after the loop can still be executed.
- The continue command completely disregards the rest of the iteration and returns to the top of the loop to begin the next iteration. So it's good if you want to skip things.
 
    
  





