https://docs.google.com/presentation/d/1xKsE1rqhk4z9NYI6kQCJARZ04xWqOIOqmunabQ9XWI8/edit#slide=id.g27fe9d2c89a_0_0

# SOFTLINK AND HARDLINK

In Linux, "links" are pointers that reference files or directories on the filesystem. There are two primary types of links:

- Hard Links
- Soft Links (Symbolic Links or Symlinks)

**command for creating links**
``
ln
``
![Screenshot from 2024-06-29 14-05-38](https://github.com/user-attachments/assets/03696297-5644-44c3-ad77-8bc86d4ddf27)



## SOFTLINK

- A soft link, also known as a symbolic link or symlink, is more like a shortcut or a reference to another file or directory. It does not contain the actual data but instead act as a pointer or reference to the actual file.

- When you access a softlink the linux redirects you to the actual file
- It's like shortcut in windows

![image](https://github.com/user-attachments/assets/8740c12a-2373-4ab7-a89b-3a1d932c08c2)

## LEARNING SOFTLINK WITH DEMO

### 1. Create a file
```
echo "hello world" >> file.txt
```

### 2. Now create a softlink file in the same location

```
ln -s <original_file> <linked_file>
```

```
ln -s file.txt linked.txt
```
![image](https://github.com/user-attachments/assets/d2e241e9-7b5f-4a7b-8d9b-e15a764fb5dd)

### 3. To see the link
```
ls -l
```
![image](https://github.com/user-attachments/assets/603da688-5e7f-4b91-a392-02b3aadaac84)

**Linked file is blue**  and pointing to original file, also in the file permission we can see it is `l` 

- If we want to see the inode number to confirm that these two are different files
```
ln -i <original_file> <linked_file>
 ```
![image](https://github.com/user-attachments/assets/33106a12-5ffe-47a0-a2e4-449c7f084912)


### 4. Lets write something in linked file and see if it gets also written in original file

![image](https://github.com/user-attachments/assets/ed86b35c-3a56-4c52-9cd7-00feafcf9705)

So after adding the line in linked file lets look at original file if the lines are added or not

![image](https://github.com/user-attachments/assets/7ac2a43f-13dc-4062-bff3-378d2f880595)

So yes , the data will get written in orginal file as well , also you can perform other read and write operations and those operations will be reflected on original file as well

### 5. Now let's create a softlink between already created folder and a folder called `point`

```
ln -s <orignal_dir_location> <linked_folder>
```

```
ln -s /home/aditya/dir/sub_dir/sub2_dir/ point
```

- The reason why we are doing this is beacuse sometimmes you might be working in a directory which is inside so many sub directories so to directly go to that location we can use softlink

- Now if you go to point folder `cd point` and create some file `echo "creating file" >> file.txt` this file will be reflected in your directory as well

![image](https://github.com/user-attachments/assets/0e5b035d-6030-4bfc-9965-a9ea753c6862)

### 6. Delete the original file and see link works or not

![image](https://github.com/user-attachments/assets/e16da2ef-0438-4cdb-a959-446e7b7838c6)

After Deleting the original directory ,  link is broken , as it can be seen in Red


## HARDLINK WITH DEMO

![image](https://github.com/user-attachments/assets/6240dce3-abfe-4040-a984-c3f8ded41bf7)


```
ls <orignal file> <linked_file>
```

### 1. Creating a directory and inside that creating a file , using hardlink to link that file

![image](https://github.com/user-attachments/assets/be096491-55f0-4301-a571-445976ef3dd9)

### 2. Now delete the original file to see if it impacts linked file or not .

so even after deleting the original file hardlink won't get effect . 

## **HOMEWORK**

- When we do `ls -l` we see some number besides file permission these are also `hardlinks`

![image](https://github.com/user-attachments/assets/43802152-5296-4237-9f87-35b742a61a31)

**Q. Create a file and a directory , Now if you do `ls -l`  , you will see 2 hardlinks for folder and only 1 hardlink for file .. Why is it so ??**

![image](https://github.com/user-attachments/assets/effcf97a-6077-49b0-8779-0f58e653f933)

### WHY ?????????

**ANS**

EXPLANATION : 

![image](https://github.com/user-attachments/assets/fa27ff81-6b60-4b08-9901-fbee6e8850bb)

