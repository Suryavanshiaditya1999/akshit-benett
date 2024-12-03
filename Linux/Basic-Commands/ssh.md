https://docs.google.com/presentation/d/1xKsE1rqhk4z9NYI6kQCJARZ04xWqOIOqmunabQ9XWI8/edit#slide=id.g27fe9d2c89a_0_0

# SSH

- SSH is a cryptographic network protocol used for secure communication between two networked devices. It is primarily used for remote login and command execution.
- SSH is widely used by network administrators ,  enabling them to log in to another computer over a network, execute commands and move files from one computer to another.
- An SSH server, by default, listens on the standard TCP port 22.
 
## Key Concepts

- **SSH Server**: The machine you want to connect to remotely. It should have an SSH daemon running.
- **SSH Client**: The machine from which you are trying to connect to the SSH server.
- **SSH Keys**: Public and private keys are used for secure authentication without passwords.
  
## Installing SSH if you don't have on your system

```
sudo apt-get install openssh-client
```

### Connecting to remote server via private key

- Change the file permission of private key file 

```
chmod 400 <private_key_file>
```

```
ssh -i <private_key_name> ubuntu@<ip_address>
```
![image](https://github.com/user-attachments/assets/f01e8fcd-b582-4602-8491-91a6412c1fca)
![image](https://github.com/user-attachments/assets/8f84809a-19ce-42b5-80c0-71b7c51eeadb)



### Connecting via public key

- Generate public key in your local system or client system

```
ssh -keygen
```

- Copy the publc key in the authorized key of the remote server

![image](https://github.com/user-attachments/assets/21367b1b-9646-4893-9403-68cda85dacea)

- By doing this you will not need to put private ip again and again before logging into the remote server

![image](https://github.com/user-attachments/assets/a8caa22d-eba6-40b0-84c2-63dc2f954467)


## Securely Copying Files to a Remote Server

```
scp /path/to/local/file username@hostname:/path/to/remote/directory
```
![image](https://github.com/user-attachments/assets/4a303249-6510-41ff-b30d-6f08fdcb06dc)
![image](https://github.com/user-attachments/assets/12315c7d-3c4a-4f57-85dd-cd6fd746fedc)


**To Copy a directory to remote server**

```
scp -r /path/to/local/directory username@hostname:/path/to/remote/directory
```

![image](https://github.com/user-attachments/assets/7480f01d-5d50-4472-8f19-d11e4f4ec565)
![image](https://github.com/user-attachments/assets/c5977fc5-2556-4b32-99ce-9dc5697afad6)

- file is copied in remote server
  
![image](https://github.com/user-attachments/assets/e4f61c72-b911-49f1-a2f0-c93445168139)


**Copying Files from a Remote Server**

```
scp -i /path/to/devinfra ubuntu@3.94.210.8:/path/to/remote/file /path/to/local/directory
```

![image](https://github.com/user-attachments/assets/1abd0d76-6763-4084-8263-0ab81665047e)


## [SOME QUESTIONS](https://www.crybit.com/ssh-interview-question-answers/)

![image](https://github.com/user-attachments/assets/4f3f80b1-d528-4173-9a88-134d499a1873)


![image](https://github.com/user-attachments/assets/8b9d4744-b0c3-4a2e-8acc-9e00ad45d0b9)

```
sudo nano /etc/ssh/sshd_config
```
```
Port 2200
```

- If you try putting ports below 1024 it might not work because ports below 1024 are considered privileged ports and can only be opened by the root user.

**ERROR at port 50**

![image](https://github.com/user-attachments/assets/45363c1d-b007-4a1e-b5ac-997e70f39eca)

**WORKING AT PORT 2200**

![image](https://github.com/user-attachments/assets/09e42053-a87e-44c1-81a5-8edfb6edba4c)

-  Port 2200 is a non-privileged port (above 1024), which can be opened by any user and is generally less likely to be occupied by another service.

![image](https://github.com/user-attachments/assets/56b452aa-6ce3-4d1d-bde0-a9cf621a3e03)


![image](https://github.com/user-attachments/assets/5385ee84-a896-4792-8ce1-658c55477bf3)
![image](https://github.com/user-attachments/assets/475d38b7-1b10-40a3-96ef-aadfaf460301)
![image](https://github.com/user-attachments/assets/48a35667-6c98-4382-a51b-0dfb1e2932a5)

SSH Config File
https://phoenixnap.com/kb/ssh-config

**DEMO**
*** ON REMOTE SERVER ***
1. Create user
   ```
   sudo useradd -m -s /bin/bash gagan
   ```
2. Set Password for user
   ```
   sudo passwd gagan 
   ```
3. Create .ssh dir and authorized_keys file
   ```
   mkdir .ssh
   touch authorized_keys
   sudo chmod 700 /home/gagan/.ssh
   sudo chmod 644 /home/gagan/.ssh/authorized_keys
   ```
5. Set PasswordAuthentication to yes in 60-cloudimg-settings.conf file at /etc/ssh/sshd_config.d dir (or any other file)
   ```
   sudo vim /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
   PasswordAuthentication yes
   ```
*** ON LOCAL SERVER ***
1. ssh into gagan user using password
   ```
   ssh gagan@ip
   ```
3. Generate keys
   ```
   ssh-keygen -t rsa
   ```
5. Print public key
   ```
   cat ~/.ssh/id_rsa.pub
   ```
7. Copy public key to remote server
9. SSH to remote server, this time password prmpt will not come
   ```
   ssh gagan@ip
   ```
11. Delete the public key from authorized_keys in remote server
13. Copy keys using ssh command. And ssh to server
   ```
   ssh-copy-id -i id_rsa.pub gagan@ip
   ssh gagan@ip
   ```

15. Create .ssh/config file
   ```
   vim .ssh/config
   ```
17. Paste following file
   ```
   UserKnownHostsFile ~/.ssh/known_hosts
   Host gagan
       HostName 54.166.40.208
       User gagan 
   ```
19. SSH to remote server without using username@ip
   ```
   ssh gagan
   ```

https://www.youtube.com/watch?v=5JvLV2-ngCI
