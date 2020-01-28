# find-bad-commit 
Script in Bash to find the predecessor commit when a specific file was created


# pre requirements 📋
Shell bash

# how to run the script 🚀
1. Open shell bash
2. Clone your repository 
3. run on bash "bash find_file.sh arg1 arg2 arg3 arg4"

#Parameters 🔧
<
arg1: Good commit, hash of a good commit. (initial commit is always good)
arg2: File path (yourProject/dir1/dir2/file.txt ) 
arg3: Git branch (master, develop, other)  
arg4: Project name (yourProject)
  
#example ⚙️
bash find_file.sh 79e6924 backend/apps/emails/email_people.html develop backend

#note 📋
the script must be a directory above your project directory

