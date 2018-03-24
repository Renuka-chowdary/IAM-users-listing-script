!/bin/bash
# Variables

Now=$(date +%d-%m-%Y)
year=$(date +%Y)
month=$(date +%m)
date=$(date +%d)
time=$(date +%H:%M:%S)

aws iam list-users --query 'Users[*].[PasswordLastUsed, UserName]' --output text >> IAM.txt
sort -h IAM.txt > IAM-Userslist.txt

echo "This is an email notification for listing IAM Users and their last login details of Hashedin account. 
Data Backup Info: 
$(IAM-Userslist.txt) 

Regards, 
Devops" | mail -s "IAM-USERS list" -a "From: admin@hashedin.com" renuka.c@hashedin.com < IAM-Userslist.txt

