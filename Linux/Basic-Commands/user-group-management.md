# USER AND GROUP MANAGEMENT IN LINUX

3 important files for user and group management

- `/etc/shadow`
- `/etc/passwd`
- `/etc/group`

### To add a user `useradd`
```
sudo useradd <username>
```

### To create a password
```
sudo passwd john
```

DO `cat /etc/passwd` and you will something like 

![image](https://github.com/user-attachments/assets/ea48a864-fe41-452a-b43e-4d9d38715d0e)

- first column is username . Example: aditya, john
- The x indicates that the password is stored in a separate, shadowed file `/etc/shadow`
- The number like `1000` for aditya, `1001` for john , represents , UID(user id)  and GID(group id) , each user has unique UID similary each group have unique GID , Linux assigns a unique UID to each user. UIDs below 1000 are typically reserved for system accounts, while 1000 and above are usually used for regular user accounts.
- home_directory: Example: /home/aditya, /home/john
- shell: Example: /bin/bash for aditya, /bin/sh for john




### To create home directory using `useradd`

```
sudo useradd -m -d /custom/home/john john
```

### To create shell with `useradd`

```
sudo useradd -s /bin/bash john
```

### To create a home directory with useradd

```
sudo useradd -m -d /custom/home/john john
```

### To add user with `adduser`
```
sudo adduser <username>
```
![image](https://github.com/user-attachments/assets/9fda838e-d6e1-4293-a1d7-9dc4bca4fa56)


**USERADD VS ADDUSER**

| Feature/Aspect             | `useradd`                                  | `adduser`                                 |
|----------------------------|--------------------------------------------|-------------------------------------------|
| **Type**                   | Low-level command                          | High-level script                         |
| **Home Directory**         | Requires `-m` to create                    | Automatically creates                     |
| **Ease of Use**            | Requires manual options                    | User-friendly, interactive                |
| **Password Setup**         | No password by default                     | Prompts for password                      |
| **Shell Assignment**       | Requires `-s` to set shell                 | Sets default shell automatically          |
| **Primary Use Case**       | Suitable for scripting                     | Ideal for manual user creation            |


In general, it's recommended to use use adduser instead of useradd since this will also set up the required groups automatically.

## GROUP MANAGEMENT

### Adding group

```
sudo groupadd developers
```

### Change group name
```
sudo groupmod -n dev_team developers
```
This changes the group name from developers to dev_team.

### Deleting a Group
```
sudo groupdel developers
```


### Adding user to a group

```
sudo usermod -aG developers john
```

This adds the user `john` to the `developers` group.

### Add user to multiple groups

```
sudo usermod -aG developers,tester john
```
This adds john to both the developers and tester groups.



## **Q. HOMEWORK**

**Q. Can we create a user Without `useradd` and `adduser` commands ??**

Ans . [Yes](https://www.youtube.com/watch?v=eG6vDkP8NII&t=317s)

Q. **When a new user is created , which directory contents get copied into new user home directory?**

Ans . `/etc/skel`

- The /etc/skel directory contains default files and directories that should be present in every user's home directory.

![image](https://github.com/user-attachments/assets/30c7ed06-cd63-434a-acac-4a968b4c356a)

- These files provide a basic, pre-configured environment for the new user, which they can customize as needed.



