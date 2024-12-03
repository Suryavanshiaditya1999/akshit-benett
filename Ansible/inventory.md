# INVENTORY

An Ansible inventory is a list of managed nodes (hosts) that Ansible can connect to and automate tasks on.  It is central to how Ansible works, as it defines the hosts and groups of hosts that you can manage.

## TYPES

1) Static Inventory
2) Dynamic Inventory


**Static Inventory:** List of hosts on which we want to deploy our configuration are put into a small text file . 

- To create inventory for remote host

   ```
  [servers]
  server1 ansible_host=192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
  server2 ansible_host=192.18.2.90 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa

   ```

- We can also put multiple groups in our inventory

  ```
  [webservers]
  203.0.113.111
  203.0.113.112

  [dbservers]
  203.0.113.113

  [development]
  203.0.113.111
  203.0.113.113
  ```

**Dynamic Inventory:** Suppose you don't have ip address of the instances on which you want to deploy your application , but you have tag name of the instances . So to deploy application on the basis of tag name we use dynamic inventory. Dynamic Inventory basically calls AWS API to retrieve the IP addresses of all instances matching that tag . This approach is useful when we are working in cloud and the ips can be changed over time

   - Ansible provides a dynamic inventory script for AWS EC2 instances, typically using the aws_ec2 inventory plugin.





   
