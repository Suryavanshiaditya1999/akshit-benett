# File Permissions


- To check the file permission

  ```
  ls -l
  ```
  ![image](https://github.com/user-attachments/assets/307040de-c7b5-4b9e-ba3f-f64936475420)

- The first digit is for owner permissions, the second digit is for group permissions, and the third is for other users.

1. Owner Permissions: Permissions for the user who owns the file.
2. Group Permissions: Permissions for the group that owns the file.
3. Other (World) Permissions: Permissions for all other users.
4. Permissions are represented by three characters:

- r (read): 4
- w (write): 2
- x (execute): 1

```
chmod [who][operator][permission] filename
```

- who can be u (owner), g (group), o (others), or a (all).
- operator can be +, -, or =.
- permission can be r, w, or x.

![image](https://github.com/user-attachments/assets/b73cfa92-4cbb-491d-bbc4-b73d81efff98)

## LET'S LEARN WITH ACTIVITIES

- To check file permission

```
ls -l
```

![image](https://github.com/user-attachments/assets/c76dd432-bc7d-4c8b-98d7-a248da86e1f7)


![image](https://github.com/user-attachments/assets/fa2aad43-22c2-4dd8-8ce7-0a618e6a692d)

![image](https://github.com/user-attachments/assets/b306a407-2230-402f-bd42-b650672b6e7b)

![image](https://github.com/user-attachments/assets/3dea3a0f-50ae-41a9-8a1b-6a52916633b0)

![image](https://github.com/user-attachments/assets/312eaa7a-9ca2-4541-87b7-1879022820ef)
setuid
setgid
stickybit

## CHMOD

- Create a file and change ownership of `others` 

  ```
  chmod o+x file.txt
  ```
  ![image](https://github.com/user-attachments/assets/33b3978f-7402-4a4f-8c08-424c7f3cf50e)

- To remove the ownership
```
chmod o-x file.txt
```

- Now do the same thing with octal values

  ```
  chmod 665 file.txt
  ```
  ![image](https://github.com/user-attachments/assets/cbbbe3b6-8314-4ea1-a4dd-7b3c4afa8ec2)

- Revert the ownership using octal values only

```
chmod 664 file.txt
```
![image](https://github.com/user-attachments/assets/9878f7be-c37f-4e9c-b6e3-820804ce0158)


## CHOWN

- Change ownership of this file.txt to a different user and group

![image](https://github.com/user-attachments/assets/dd668588-8378-4157-96c9-cff2388ba56a)

- Change owner only

```
sudo chown aditya file.txt
```

- Change group with chown

```
sudo chown :aditya file.txt
```

- Change ownership Recursively for a folder

```
sudo chown john:john folder/
```
![image](https://github.com/user-attachments/assets/191b1c1e-9978-4769-b122-393be8448313)

![image](https://github.com/user-attachments/assets/bac054f0-e3cf-4e33-b441-bd5ba9401c74)



## CHGRP

- change group of a file

```
sudo chgrp john file.txt
```
![image](https://github.com/user-attachments/assets/b7f3a61c-e532-47d0-8b17-cc0804e35af8)


- Change group of multiple files

```
sudo chgrp john file.txt file2.txt file3.txt
```

![image](https://github.com/user-attachments/assets/6fba3771-eddd-4783-848a-7aa6406d7b37)

## HOMEWORK

### Question 1: Changing Ownership

Assume you have a file named `project.doc` owned by the user `alice` and group `developers`. Provide the commands you would use to:

1. Change the owner of the file to `bob`.
2. Change the group of the file to `team`.
3. Change both the owner to `charlie` and the group to `admins`.

**Answer**:
1. Change the owner to `bob`:
   ```
   sudo chown bob project.doc
   ```
2. change group
   ```
   sudo chgrp team project.doc
   ```
3. change both owner and group
   ```
   sudo chown charlie:admins project.doc
   ```

### Question 2: Modifying Permissions

You have a script named `deploy.sh` that needs to be:

1. Executable by the owner.
2. Readable and executable by the group.
3. No permissions for others.

**Answer**:
   ```
   sudo chmod 750 deploy.sh
   ```

![image](https://github.com/user-attachments/assets/d9eb7a2b-e0bc-4f13-a8e6-9a5e6a61fd60)


