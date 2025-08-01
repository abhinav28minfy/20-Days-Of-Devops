# 🗂️ Python File Management System

A lightweight, command-line **File Management System** written in Python. This script mimics basic shell functionality, allowing users to navigate directories, manage files, and perform common file operations from a controlled Python interface.

---

## 🚀 Features

- 📂 Navigate directories (`cd`, `cwd`)
- 📃 List files in the current directory (`ls`)
- 📝 Create files with content (`touch`)
- 🗑️ Delete files (`rm`)
- 📖 Read files (`read`) 
- ❌ Exit the system (`exit`)

---

## 🧩 Commands

| Command                       | Description                                                  |
|-------------------------------|--------------------------------------------------------------|
| `cwd`                         | Print the current working directory                          |
| `ls`                          | List all files and folders in the current directory          |
| `cd <dir>`                    | Change into a subdirectory (`cd ..` for parent)              |
| `touch "<filename>" <content>`| Create a new file and write content to it                    |
| `rm <filename>`               | Delete a file                                                |
| `exit`                        | Exit the file manager shell                                  |

> ⚠️ For `touch`, always wrap the filename in double quotes if it has spaces.

---

## 📦 Example Usage

```bash
Enter the command: cwd
C:\Users\Example\Desktop

Enter the command: ls
['notes.txt', 'projects', 'test.py']

Enter the command: cd projects

Enter the command: touch "log.txt" This is a test log entry

Enter the command: rm log.txt

Enter the command: exit

🧱 Code Structure
Function	Purpose
cwd()	Prints the current working directory
ls()	Lists contents of the current directory
cd(new_dir)	Changes the working directory
create()	Creates a file and writes given content
delete()	Deletes a file if it exists
read()	Reads a file and prints content (unused)

PS: This project was built as a hands-on exercise after studying the fundamentals of Linux and shell-based file operations. It reflects my understanding of basic command-line functionality reimagined in Python. I’ll be uploading my learning summaries and notes on Linux concepts shortly—stay tuned!


