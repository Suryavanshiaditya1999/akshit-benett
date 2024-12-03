![image](https://github.com/user-attachments/assets/56a1ecf2-fe0c-438b-9e31-bdbd71128dd6)

- Install Ansible

```
sudo apt update
```

```
sudo apt install ansible -y
```

### HOW ANSIBLE EXECUTE ITSELF

- What happens during Gather facts ? Ansible collects information about the system, such as hardware details, installed software, and network configuration . 

-  When ansible runs on client side it creates a temporary directory to run , when ansible is doing gather facts , this is how it gather facts , it creates a temporary directory on client server and fetches data of client server and then execute all the configuration on client server. After the playbook execution, Ansible typically cleans up these temporary files.

- This temporary directory is usually in `/tmp` .

-  You can customize the location of the temporary directory using the `remote_tmp` configuration option in your Ansible configuration file.

## CREATE INVENTORY 

- Inventory

   ```
   [servers]
   server ansible_host=3.14.5.202 ansible_user=ubuntu ansible_ssh_private_key_file=/home/aditya/.ssh/key.pem
   ```

- You can also use localhost inventory to test some cases
  ```
  [local]
  localhost ansible_connection=local
  ```

## UNDERSTANDING ADHOC COMMANDS

1) To verify that the connection to the remote server has been setup you can use ping command
   
     ```
     ansible all -m ping -i inventory
     ```
   - here -m means module , so ansible is using ping module to ping to the other instances
    ![image](https://github.com/user-attachments/assets/20f5e68a-cc20-49b0-b6ac-b2190f44f425)


     ![image](https://github.com/user-attachments/assets/f4421d3f-725a-47b9-8776-05c78a7dde13)

2) Update managed host

   ```
   ansible all -i inventory -m apt -a "update_cache=yes" -b
   ```

   - `-b` : Uses sudo to run the command with elevated priveledge
   - When we are using `ansible all` it is applying changes to all the hosts present in our inventory , if we want to apply changes to 
     particular host we can also do `ansible server -i inventory -m apt -a "update_cache=yes" -b`

3) Install nginx

   ```
   ansible all -i inventory -m apt -a "name=nginx state=present" -b
   ```

   ![image](https://github.com/user-attachments/assets/cdf31639-2e74-4f39-b112-b90b582977a6)

   **LAB -  INSTALL APACHE2** 

   - There will be an error and apache2 will not able to intall sucessfully because nginx is already running and it is also running at port 80.
     So , first you need to uninstall nginx `ansible all -i inventory -m apt -a "name=nginx state=absent" -b` after this you will install 
     apache2.
     
   - Install apache

     ```
     ansible all -i inventory -m apt -a "name=apache2 state=present" -b
     ```

     **NOTE** : if you have already installed `apache2` before uninstalling `nginx` you will need to uninstall `nginx` and then `apache2` , 
     Only after then , when you will install `apache2` it will work .

     ![image](https://github.com/user-attachments/assets/678f3c17-b70b-4a80-bb5d-fdf224b74bc0)

   
4) Add group

   ```
   ansible all -m group -a "name=NinjaTeam state=present" -i inventory -b
   ```

5) Add user Nitish inside that group

   ```
   ansible all -m user -a "name=Nitish groups=NinjaTeam" -i inventory -b
   ```
   ![image](https://github.com/user-attachments/assets/65d62e61-757f-48ad-82e3-560716484a52)

   
6) Change Nitish user password

   ```
   ansible all -i inventory -m user -a "name=Nitish password=12345" -b
   ```

   - When you execute this , you will get an warning sign , stating that the input password is not hased, this warning sign comes because the 
     password should not be passed like this , it should be hashed and only then it should be passed . 
