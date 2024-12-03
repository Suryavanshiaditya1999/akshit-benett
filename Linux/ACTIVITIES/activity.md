In this Assignment  we will cover some basic command of linux
- First check your current working directory
- Now create directory with name "linux" in your current directory.
- Then create a another directory  with name "Assignment-01" inside your "linux" directory  .
- Now create one more directory inside "/tmp" with name "dir1" without changing your present directory.
- At last create two more directories having below tree structure .It should create a below structure via single command only .
```
/tmp
  - dir1
      - dir2
        - dir3
```
- Find a command  that will delete a "dir3" that you have created before.
- Now create a empty file with your "firt-name"  in /tmp directory.
- After creating a empty file , add "This is my first line " into a file without using any editor.
- Now add  one more line "this is a additional content " into a same file .Make sure it will not overwrite the previous line of the file.
- Then  create new  file with your  "last-name" along with some content like "last-name is my last name".Do not use any editor
- Now add "this is line at the  beginning" into "last-name" file  in such a manner that it will add the line at beginning of the file.Do not use any editor.
- Then add some more 8-10  lines to the same file .
- Now find a command that will show:
  - top 5 lines of the file.
  - bottom 2 lines of the  file.
  - only 6th line  of the file.
  - 3-8 lines of the file .
- Find a command that will list  below things of /tmp directory
  - list all content(including hidden files)
  - list only files
  - list only directories
- Now copy the "last-name" into the /tmp/dir2 with same name.
- Then again copy the "last-name" into the /tmp/dir2, this time with different name i.e "last-name".copy
- Now change the name of the "first-name" file  to some other name at same location .
- Find a command that will  move the "last-name" file  to /tmp/dir1
- find a command that will clear the content of /tmp/dir2/"last-name".copy .Make sure it will not even contain  empty line .
- Now delete the same file i.e /tmp/dir2/last-name.copy
Note : Do not use sed command in this assignment.


----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

ASSIGNMENT 1 : Basic Linux Commands
------------------------------------------------------------
- Create a utility(FileManager.sh) that will be able to
- Create a Directory
- Delete a Directory
- List Content of a Directory
- Only listfiles in a Directory
- Only listDirs in a Directory
- listAll(files and directory)

For example
- ./FileManager.sh addDir /tmp dir1
- ./FileManager.sh addDir /tmp dir2
- ./FileManager.sh addDir /tmp dir3
- ./FileManager.sh listFiles /tmp
- ./FileManager.sh listDirs /tmp
- ./FileManager.sh listAll /tmp
- ./FileManager.sh deleteDir /tmp dir3


Update FileManager to process Files as well
- Create a file
- Add content to file
- Add conent at the begining of the file
- Show top n lines of a file
- Show last n lines of a file
- Show contents of a specific line number
- Show conteint of a specfific line number range
- Move/Copy file from one location to another

Delete file
For example

- ./FileManager.sh addFile /tmp/dir1 file1.txt
- ./FileManager.sh addFile /tmp/dir1 file1.txt "Initial Content"
- ./FileManager.sh addContentToFile /tmp/dir1 file1.txt "Additional Content"
- ./FileManager.sh addContentToFileBegining /tmp/dir1 file1.txt "Additional Content"
- ./FileManager.sh showFileBeginingContent /tmp/dir1 file1.txt 5
- ./FileManager.sh showFileEndContent /tmp/dir1 file1.txt 5
- ./FileManager.sh showFileContentAtLine /tmp/dir1 file1.txt 10
- ./FileManager.sh showFileContentForLineRange /tmp/dir1 file1.txt 5 10
- ./FileManager.sh moveFile /tmp/dir1/file1.txt /tmp/dir1/file2.txt
- ./FileManager.sh moveFile /tmp/dir1/file2.txt /tmp/dir2/
- ./FileManager.sh copyFile /tmp/dir2/file2.txt /tmp/dir1/
./FileManager.sh copyFile /tmp/dir1/file2.txt /tmp/dir1/file3.txt
- ./FileManager.sh clearFileContent /tmp/dir1 file3.txt
- ./FileManager.sh deleteFile /tmp/dir1 file2.txt
Note: Do not use sed command.Try to do this assignment only with linux basic commands


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

ASSIGNMENT 2.1
-------------------------------------------------------------
In this Assignment  we will cover some basic command of linux
- Create user named neha, vipul and abhishek
- create group named linux
- Create group named sigma
- Change neha and abhishek primary group to sigma
- change neha and abhishek secondary group to linux
- create group named alpha
- create user nkhil and priyashi and add them to linux and aplha group with single command
- Change all user home directory permission to
    - A user should have read,write, execute access to home directory
    - All the users of same team should have read and excute access to home directory of fellow team members.
    - others should have only execute permission to user's home directory
- create these directory structure for all user
  - home directory of user
    - team
    - linux
- change permission for team directory only team members have full access
- change permission for linux directory only linux trainer have full access
- check if alpha team user can access sigma team directory.
- check vipul user can access sigma or
- change vipul user shell to make it service user.
- force abhishek user to change its password on next login.
- change nikhil user password.
- list all user and group you have created
- check which shell is added to neha user as default.
- check the deafult permission of file and directory and how to change it
- now delete vipul user.
- delete linux group.


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

UserManager utility

- Add NinjaTeam (Simulate Group) ex: team1
- Add a User (Simulate) under a team ex: Nitish added to team1


Ensure below constraints are met:

- A user should have read,write, execute access to home directory
- All the users of same team should have read and excute access to home directory of fellow team members.
- others should have only execute permission to user's home directory
- In home directory of every user there should be 2 shared directories

- team: Same team members will have full access
- ninja: All ninja's will have full access


i.e
```
./UserManager.sh addTeam amigo.
./UserManager.sh addTeam unixkings.
./UserManager.sh addUser Rakesh amigo.
./UserManager.sh addUser Sandeep unixkings.
```

Resultant Structure
/home
  - Rakesh
    - team
    - ninja
  - Sandeep
    - team
    - ninja



Additional Features. 

- change user Shell
- change user password
- Delete user
- Delete Group
- list user or Team


i.e 
- ./UserManager.sh delTeam amigo

- ./UserManager.sh delUser Rakesh

- ./UserManager.sh changePasswd Rakesh

- ./UserManager.sh changeShell Rakehs /bin/bash

- ./UserManager.sh ls User

- ./UserManager.sh ls Team

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

Part A
- Please find your assignment for today
- Create a shell script to generate a star, it will take 2 arguments size & type

./drawStar.sh 5 t1
```
    *
   **
  ***
 ****
*****
```


./drawStar.sh 5 t2
```
*
**
***
****
*****
```


./drawStar.sh 5 t3
```
    *
   ***
  *****
 *******
*********
```


./drawStar.sh 5 t4
```
*****
****
***
**
*
```

./drawStar.sh 5 t5
```
*****
 ****
  ***
   **
    *
```


./drawStar.sh 5 t6
```
*********
 *******
  *****
   ***
    *
```


./drawStar.sh 5 t7
```
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```


- Part B
- Create a shell script that will take take a number and print below output depending on the conditions

- tom -> If number is divisible by 3
- cat -> If number is divisible by 5
- tomcat -> If number is divisible by 15


i.e
.- /printTomcat.sh 7

- ./printTomcat.sh 6
tom

- ./printTomcat.sh 10
cat

- ./printTomcat.sh 30
tomcat

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

- Create a utility(FileManager.sh) that will be able to
- Create a Directory
- Delete a Directory
- List Content of a Directory
- Only listfiles in a Directory
- Only listDirs in a Directory
- listAll(files and directory)
For example
- ./FileManager.sh addDir /tmp dir1
- ./FileManager.sh addDir /tmp dir2
- ./FileManager.sh addDir /tmp dir3
- ./FileManager.sh listFiles /tmp
- ./FileManager.sh listDirs /tmp
- ./FileManager.sh listAll /tmp
- ./FileManager.sh deleteDir /tmp dir3

Update FileManager to process Files as well.

Create a file

- Add content to file
- Add conent at the begining of the file
- Show top n lines of a file
- Show last n lines of a file
- Show contents of a specific line number
- Show conteint of a specfific line number range
- Move/Copy file from one location to another
- Delete file
For example
- ./FileManager.sh addFile /tmp/dir1 file1.txt.
- ./FileManager.sh addFile /tmp/dir1 file1.txt "Initial Content".
- ./FileManager.sh addContentToFile /tmp/dir1 file1.txt "Additional Content".
- ./FileManager.sh addContentToFileBegining /tmp/dir1 file1.txt "Additional Content".
- ./FileManager.sh showFileBeginingContent /tmp/dir1 file1.txt 5.
- ./FileManager.sh showFileEndContent /tmp/dir1 file1.txt 5.
- ./FileManager.sh showFileContentAtLine /tmp/dir1 file1.txt 10.
- ./FileManager.sh showFileContentForLineRange /tmp/dir1 file1.txt 5 10.
- ./FileManager.sh moveFile /tmp/dir1/file1.txt /tmp/dir1/file2.txt.
- ./FileManager.sh moveFile /tmp/dir1/file2.txt /tmp/dir2/.
- ./FileManager.sh copyFile /tmp/dir2/file2.txt /tmp/dir1/.
- ./FileManager.sh copyFile /tmp/dir1/file2.txt /tmp/dir1/file3.txt.
- ./FileManager.sh clearFileContent /tmp/dir1 file3.txt.
- ./FileManager.sh deleteFile /tmp/dir1 file2.txt.
Note: Do not use sed command.Try to do this assignment only with linux basic commands.



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

Part A
- Create a template engine, that can generate values file and replace the variables provided as arguments
./teplateEngine.sh template.file key1=value1 key2=value2....
- trainer.template
{{fname}} is trainer of {{topic}}.
i.e 
./teplateEngine.sh <template file> fname=sandeep topic=linux.

- andeep is trainer of linux 
Part B
Create a text editor utility, using which you can.
- Add a line at top
- Add a line at bottom
- Add a line at specific line number
- Replace word
- Delete word
- Insert word
- Delete a line
- Delete a line containeing a word
./otTextEditor addLineTop <file> <line>.
./otTextEditor addLineBottom <file> <line>.
./otTextEditor addLineAt <file> <linenumber> <line>.
./otTextEditor updateFirstWord <file> <word> <word2>.
./otTextEditor updateAllWords <file> <word> <word2>.
./otTextEditor insertWord <file> <word1> <word2> <word to be inserted>.
./otTextEditor deleteLine <file> <line no>.
./otTextEditor deleteLine <file> <line no> <word>.
Also come with your own features of text editor.


-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

- Create a utility otssh, this utility will have below features
add ssh connect.
list ssh connection.
update ssh connection.
delete ssh connection.
- Connect
Add ssh connection
$ otssh -a -n server1 -h 192.168.21.30 -u kirti (add user kirti to connect 192.168.21.30 with name server1 with default ssh setting).
$ otssh -a -n server2 -h 192.168.42.34 -u kirti -p 2022 (add user kirti to connect 192.168.42.34 with name server2 with port 2022 and default ssh setting).
$ otssh -a -n server3 -h 192.168.46.34 -u ubuntu -p 2022 -i ~/.ssh/server3.pem (add user ubuntu to connect 192.168.46.34 with name server3 with port 2022 and ssh key file ~/.ssh/server3.pem and default ssh setting).
List ssh connection
i.e 
$ otssh ls (This should list the name of all connection added using utility).
- server1
- server2
- server3
$ otssh ls -d (This should list the name of all connection with details added using utility).
- server1: ssh user@server1
- server2: ssh -p 2022 user@server2
- server3: ssh -i ~/.ssh/server3.pem -p 2022 user3@server3
Update ssh connection (This should update the settings for connection mentioned after name).
- $ otssh -u -n server1 -h server1 -u user1
- $ otssh -u -n server2 -h server2 -u user2 -p 2022
- $ otssh ls -d
- server1: ssh user1@server1
- server2: ssh -p 2022 user2@server2
- server3: ssh -i ~/.ssh/server3.pem -p 2022 user3@server3
Delete ssh connection (This should Delete the mentioned connection).
- $ otssh rm server1
- $ otssh rm server2
- $ otssh ls -d
server3: ssh -i ~/.ssh/server3.pem -p 2022 user3@server3.
Connect to server (This should connect to the server mentioned with details added using utility).
- $ otssh server1
[ERROR]: Server information is not available, please add server first.
- $ otssh server2
[ERROR]: Server information is not available, please add server first.
- $ otssh server3
Connecting to server3 on 2022 port as user3 via ~/.ssh/server3.pem key.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


https://docs.google.com/document/d/1-vGR2YrgLthZJKB4jIzdZ8CqL23wtX5h9Cc6cp_EKGM/edit
