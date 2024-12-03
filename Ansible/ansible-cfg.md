# ansbile.cfg

The ansible.cfg file is the main configuration file for Ansible, where you can define various settings that control the behavior of Ansible when executing playbooks and commands.

## BENEFIT

1) We can customize complete ansible behaviour from one file .
2) It ensures consistency that all the users and automation scripts use the same setting.
3) We can also have different ansible.cfg for different projects or environments , allowing different configurations that match the specific needs of each project.


## PRECEDENCE OF ansibe.cfg

![image](https://github.com/user-attachments/assets/cd4098bb-f5b9-447d-af78-f9766956d043)


**Q. How to ignore ansible SSH authenticity checking?**

in ansible.cfg

```
[defaults]
host_key_checking = False
```

**Q. Fork vs Serial**

`fork`

  - Fork is given in ansible.cfg
    ```
    fork = 5
    ```
  - default value is 5
  - It basically means number of parallel process ansible can run. Let's say fork=5 then it means that it can execute tasks on 5 managed hosts 
  simultaneously

`serial`

  - It is given in playbook
  
    ```
    - name: Deploy web servers
      hosts: webservers
      serial: 3  # Process 3 hosts at a time
    
      tasks:
        - name: Install Nginx
          apt:
            name: nginx
            state: present
          become: yes
    
        - name: Start Nginx service
          service:
            name: nginx
            state: started
            enabled: true
     ```

  - It basically limits the number of execution , means lets say serial is 5 and fork is 10 , so ansible will execute tasks in playbook first on 5 hosts  and then it will run tasks on another 5 hosts
  - It is useful in the case of Rolling Deployment , because you want to change the configuration of machines slowly , obviously we do it for user's experience .
  - [READ SERIAL EXAMPLE FOR COMPLETE CLARITY](https://medium.com/devops-srilanka/difference-between-forks-and-serial-in-ansible-48677ebe3f36)

Q. How to know which ansible.cfg currently ansible is using 

```
ansible --version
```

![image](https://github.com/user-attachments/assets/be77b6ff-adc5-4e43-bb47-547c48f87d10)

Q. How to generate a new config file

```
 ansible-config init > ansible-config-example.cfg
```

Q. How a general config file might look like

  ```
  [defaults]
  inventory = ./inventory
  remote_user = ubuntu
  private_key_file = ~/.ssh/id_rsa
  host_key_checking = False
  timeout = 30
  forks = 5
  log_path = ./ansible.log
  retry_files_enabled = False
  
  
  [privilege_escalation]
  become = True
  become_method = sudo
  become_user = root
  become_ask_pass = False
  
  
  [ssh_connection]
  ssh_args = -o ControlMaster=auto -o ControlPersist=60s
  control_path = ~/.ssh/ansible-%%h-%%r
  pipelining = True
  
  
  [callback_whitelist]
  callback_whitelist = timer, profile_tasks
  ```

**Q. If we mention remote user and  ssh key path in ansible.cfg then we can remove the key path from inventory.**

  ```
  remote_user = ubuntu
  private_key_file = /home/aditya/.ssh/key.pem
  ```
  
  ![image](https://github.com/user-attachments/assets/131b133f-0315-4a7a-b15a-50f3b3332c8b)

  ![image](https://github.com/user-attachments/assets/e958c729-25aa-4f99-847b-51cd0f2b9f01)

**Q. Explain priveledge escalation**

  ```
    [privilege_escalation]
    become = True
    become_method = sudo
    become_user = root
    become_ask_pass = False
  ```

  ![image](https://github.com/user-attachments/assets/c9dead42-4d3e-49ce-b093-f484e47320dc)

**NOTE: Mostly people use [default] and [priveldge escalation] block and nothing else.**

