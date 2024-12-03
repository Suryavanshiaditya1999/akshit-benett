Q. How to install nginx locally ? 

```
- hosts: localhost
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
```

Q. List 10 modules that you have used in ansible

`apt` : for installing application

`template` : for copying files , using `src` and `dest`

`copy` : also used for copying files , using `src` and `dest` , difference between both of them is , template is used with jinja template and copy is used for copying normal static files .

Q. What is the first task that ansible do when you run ansible playbook ? 

The first thing it does it `gather facts` from the remote machine , like what is the system status in that machine , which softwares are installed which are not , etc .

![image](https://github.com/user-attachments/assets/0a1ca112-40e0-46a6-b559-98ff08870718)


Q. So how can we avoid this always running `gather facts` ? 

by doing `gather_facts: false` in playbook

```
- hosts: localhost
  gather_facts: false
```

Q. What is the difference between `ansible_facts` and `gather_facts`

- Gather facts collects system information , and whatever system info gather facts discovers is accessible by `ansible_facts` . If you set `gather_facts` : `false` the `ansible_fact` will not work .

```
- hosts: localhost
  gather_facts: true
  tasks:
    - name: Display the OS distribution
      debug:
        msg: "The OS is {{ ansible_facts['distribution'] }}"
    
  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: stopped
```
   
  ![image](https://github.com/user-attachments/assets/68260135-60c0-4c4b-a1fe-6a7978721db4)

if you will `gather_facts` : `false` then you will get an error

![image](https://github.com/user-attachments/assets/084938b7-5a68-453f-acac-272084372bc5)

Q. How to use `vars` and `vars_file`  , what is the differnence between these two  ?

- You create a new file `variable.yaml` , you define the variable there what you want to put in playbook , for example : lets create a variable `msg`

variable.yaml

```
msg : my name is khan and i am not a terrorist
```

```
- hosts: localhost
  become: true
  gather_facts : true
  vars: 
    app_name: nginx
  vars_files:
    - variable.yaml  
  tasks:
    - name: Install nginx
      apt: 
        name: "{{ app_name }}"
        state: present
      notify: Restart nginx
    - name: message print
      debug: 
        msg: "{{ msg }}"
```

- So basically , vars ka use krte hain playbook k andar hi variable ko define kr k use krne k liye , jese `app_name` kra hai , aur `vars_file` ka use krte hain jab varialbe ko bhar kisi file se uthana hota hai , iss case m hum `variable.yaml` se pick kr rhe hain to uska nam dal dia .

Q. How to continue playbook even after one task fails

- By using `ignore_errors` in tasks , do `ignore_errors: yes` 


```
- hosts: localhost
  become: true
  gather_facts: true
  vars: 
    app_name: nginx
    msg: "my name is khan and i am not a terrorist"
  tasks:
    - name: Install nginx
      apt: 
        name: "{{ app_name }}"
        state: present
      notify: Restart nginx
      ignore_errors: yes  # This will allow the playbook to continue even if this task fails
    
    - name: Another task that runs even if the previous task failed
      command: /bin/false  # This command will fail
      ignore_errors: yes  # Continue even if this task fails

    - name: Final task
      debug:
        msg: "This task runs regardless of previous failures."
```

![image](https://github.com/user-attachments/assets/fbd5aed7-ed88-4eda-8f11-581b4322bb37)


Q. if we are running ansible and the other server does not have python how to then install python in that server so that ansible can run . 

- Using `raw module`


```
- name: Bootstrap Python on the target server
  hosts: all
  become: yes
  gather_facts: no  # Facts gathering requires Python, so we disable it

  tasks:
    - name: Install Python for Debian-based systems (e.g., Ubuntu)
      raw: apt-get update && apt-get install -y python3
      when: ansible_os_family == "Debian"

    - name: Install Python for RHEL-based systems (e.g., CentOS)
      raw: yum install -y python3
      when: ansible_os_family == "RedHat"

    - name: Ensure Python is available
      command: python3 --version
```

Q. Dir structure of roles ? 



Q. What is the difference between template and copy ? 

![image](https://github.com/user-attachments/assets/54364db6-e7eb-4543-9c1e-7e606240eb01)

Q. Why don't we use `command` module over `apt` ? 

![image](https://github.com/user-attachments/assets/16dc4328-8d39-44f5-aaf4-6a6a129e05d0)

Q. What is the difference between `files` and `template` dir ? 

![image](https://github.com/user-attachments/assets/6930a53a-9093-48cf-afc4-53926b45bb73)

- Assuming you have given `app_port : 80 ` in default directory

![image](https://github.com/user-attachments/assets/86154b1b-5ee2-45f8-884f-c65d593e8fb7)

Q. If you want to skip some of the task in ansible , while executing playbook ?

- Use `tags` in tasks

- if you want to run only 1st task 

```
- hosts: localhost
  tasks:
    - name: Install nginx
      apt:
        name: nginx
        state: present
      tags: task1

    - name: Copy file
      copy:
        src: /root/file1
        dest: /root/dir/file1
      tags: task2

    - name: debug msg
      debug:
        msg: Wow something is written here
      tags: task3

```

```
ansible-playbook playbook.yml --tags task1
```

```
ansible-playbook playbook.yml --skip-tags task2,task3
```

- only task1 will be executed 

![image](https://github.com/user-attachments/assets/fa20ae0b-c210-4102-86f2-f08739145b0f)

Q. `host_vars` aur `group_vars` ky hai

- Dekh bhai , jis nam se `inventory` k andar tune group define kr rakhe honge , usi nam se tu variable file bnayega `group_vars` k andar , matlab ki agar group ka nam inventory k andar agar [dbserver] dia hai to `group_vars` directory k andar jo variable file bnegi uska nam `dbserver.yaml` hi hona chaiye kuch aur nahi .

- isi tarike se jo nam tune single `host` ka dia hoga inventory k andar usi nam se teri yaml file honi chaiye `host_vars` k andar

```
# Directory Structure
# inventory/
# ├── group_vars/
# │   ├── webservers.yml
# │   └── dbservers.yml
# ├── host_vars/
# │   ├── web1.yml
# │   └── db1.yml
# └── hosts

# inventory/hosts file
[webservers]
web1 ansible_host=192.168.1.10
web2 ansible_host=192.168.1.11

[dbservers]
db1 ansible_host=192.168.1.20
db2 ansible_host=192.168.1.21

# inventory/group_vars/webservers.yml
---
http_port: 80
max_clients: 200
document_root: /var/www/html

# inventory/group_vars/dbservers.yml
---
mysql_port: 3306
mysql_max_connections: 100
mysql_root_password: secure_password

# inventory/host_vars/web1.yml
---
server_name: production_web1
memory_limit: 1024M
enable_ssl: true

# Example Playbook (webserver-setup.yml)
---
- name: Configure Web Servers
  hosts: webservers
  tasks:
    - name: Install Apache
      yum:
        name: httpd
        state: present

    - name: Configure Apache Port
      template:
        src: httpd.conf.j2
        dest: /etc/httpd/conf/httpd.conf
      vars:
        port: "{{ http_port }}"
        server_name: "{{ server_name }}"
```










