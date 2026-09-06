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
  ```
  Name = "Mahamed"
    Teams = ("Spurs", "Arsenal", "Chelsea")**

  **echo $Name $Teams
  ```
  
- When you run your script on the terminal it would output:
- **Mahamed**

- **Spurs Arsenal Chelsea**

### Parameters
- Parameters are values you can input when running a script. You reference it in the script by prepending with $1 for the first input and $2 for the second
- Example:
  ```
  echo "The sum of $1 and $2 = $(($1 + $2))
  ```
- This will output the sum of which ever two numbers you input when you run the script.
``` ./script.sh 1 2
The sum of 1 and 2 = 3
```

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
      ```age=19
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
      ```
    
## Loops

### While Loops
- While loops allow to repeatedly run a specific code block as long as a certain condition remains true. Once the condition becomes false, the loop breaks.
- While loop template:
  ```
  While condition
  do
  #Code to be executed
  done
  ```

#
## For Loops
- For loops allow you to repeatedly run through a specific code block for each element in a given collection or sequence. Once there are no more elements to iterate through, the loop halts.
- For loop template:
- ```
  For ((i=1; i<=5; i++))
       do
       # Code to be executed
      done
  ```
### Break & Continue
- The break command immediately exits the entire loop. Any code after the loop can still be executed.
- The continue command completely disregards the rest of the iteration and returns to the top of the loop to begin the next iteration. So it's good if you want to skip things.


## Functions and Inputs
- Functions are like mini programs in within bash scripts. They help turn code into modules, enhance script organisation and improve reusability. They contain a bunch of instructions that can be called and executed whenever needed. 
- The syntax for a function is as follows:
```
  function_name() {

    #code goes in here

  }
```
#### Local Variables
- In bash, it's a common practice to use **Local Vabriables**. This is so that you don't accidentally overwrite a variable outside the scope of your function.
- Using local keeps the variable scoped to just that function.

#### Parameters
- In a function you can pass the first argument in the script using **$1** notation and **$2** and so on if you to pass multiple arguments.
- These positional parameters refer to what was passed into that function call
- To find out the count of positional arguments you use **$#**
- To find out the script title you use **$0**
**_Key note: you can reference variables inside quotation mark e.g.
  echo " First argument: $1" - This is because double quotation marks allow expansion meaning it allows you to replace the placeholder (the variable) with it's actual value whereas single quotes will take the code literally _**

#### User Inputs
- The variable read allows user input. Read pauses and waits for user input and stores the value in given variable.
```
  read name
  # User inputs Harry
  echo $name
  # This will output harry
```

#### Handling Bad Data
- Returning non zero messages after a conditional code block signals fail to the shell. To verify this you could echo a message in response. 

##### Input Sanitization
- Checking or validating user input before using it. Like checking something is a number and not a string.


## Piping
- Piping allows us to connect the output of one command as input to another
- Example:
```
sort file.txt | grep "hello"
```
## Error Handling
- Error Handling is a way to check for problems and handle it before it crashes your script.

### Exit Codes
- **exit 1** stops a script immediately and returns a failure code whereas **return** halts a function but lets the rest of the script continue.

### Set Options
- **set -e** ends a script if a command returns a non zero exit status aka error code. You place it at the top of the script below the shebang.
- **set- u** forces a bash script stop if it encounters an uninitialised variable to prevent you script in to running into problems due to missing data
- **set -x** is a debugging option that prints the command that's about to be executed into the terminal before being executed. **set +x** ends the debugging.
- **set -eux** combines all three set options together.
- **set -o pipefail** make the pipeline return failure if any command in the pipeline fails.

## Environment & PATH
- **PATH** tells the Shell which directories to search to find executable commands
- To change a PATH permanently, you must append you .bashrc/.zhrc files with the export command and then source it in the terminal after. Example:
```
echo "export PATH=$PATH:~/my_scripts" >> ~/.bashrc
source ~/.bashrc
```
## Working With Files

### Reading Files
- There are two ways to read a file. Using **cat** and through **input redirection**

#### cat 
- Using **cat** you would pipe cat filename with a while loop. Example:
```
  cat file_name.txt| while IFS= read -r line; do
  echo "$line"
  done
```
= This feeds the file content to the while loop where **IFS** preserves whitespaces and **read -r** ** ignores any backslashes and take the line literally.

#### Input Redirection
- Using input redirection you  use the same while loop but at the end file is redirected into the loops standard input using the less-than operator. Example:
  ```
  while IFS= read -r line; do
  echo "$line"
  done < file_name.txt
  ```
- This redirects the file into the loops standard input and outputs it's contents.

#### Writing Files
- You can write into a file by using simple redirection.
- You use the **>** operator prepending the file name to add whatever you've written inside it.
- You will need to use the **>>** operator to add your entry into a new line.

### File Checksums
- A checksum is like a file's fingerprint, it generates a value based on the file’s contents. Each file has it's own unique checksum which changes if a file's content changes.
- It verifies a file's integrity (whether the contents has been changed)
- Commands such as **sha256sum** and **md5sum** can generate these values. 
