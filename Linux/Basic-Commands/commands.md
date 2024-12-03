 # Basic Linux commands 

**ls: Lists the contents of a directory.**

List command is useful when we want to see different files and folders that are currently present in our working directory

```
ls
```

To list even hidden files

```
ls -a
```

to list files in long format 

```
ls -l
```

**Changes the current directory.**



```
cd /path/to/directory
```

To get back 

```
cd ..
```

one . reprsents current directory
second . represents parent directory , so you are changing directory from current to parent

**pwd: Prints the current working directory.**

```
pwd
```

**4.touch: Creates a new empty file.**

```
touch filename
```

After creating a file , you will need to put content in it how to do that

**Editing the file with editors**

- popular file editors in linux are nano , vi and vim , you can install more application as well , like a lot of people prefer VS Code for writing more robut code . 

```
nano filename
```

```
vim filename
```

**Editing without opening any editors**

`echo "hello world" >> filename `

- The double arrow represents that you are appending the content in filename 
- If you just put 
`echo "helo new world" > filename`

- This command will replace everything that has been written previously in the file and put just the latest content

- you can alo edit like
  `cat > filename` : again this will overwrite previous content
  `cat >> filename` : this will append the content


  
**Creating Diretories**

```
mkdir dir_name
```

if you want to create sub directories inside one directory

```
mkdir -p dir_name/sub_dir_name
```

**cp: Copies files or directories.**

`cp source destination`

```
cp filename dir_name/sub_dir_name/
```

**mv : this will move the file completely**

`mv source destination`

```
mv filename dir_name/sub_dir_name/
```

**Remove or delte files and directories**

to delete a file

```
rm filename
```

to delete a directory

```
rmdir dir_name
```

to delete a directory and it's sub directories and files `recursively`

```
rm -rf dir_name
```


