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

  **echo $Name
  echo $Teams**
  
- When you run your script on the terminal it would output:
- **Mahamed**

  **Spurs Arsenal Chelsea**

### Parameters






