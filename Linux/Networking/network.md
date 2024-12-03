# NETWORKING COMMANDS

- ping
- dig
- ifconfig
- nslookup
- telnet
- netstat

## ping

Sends packets to Google's server and shows response times.

![image](https://github.com/user-attachments/assets/b1d8901a-6e73-4872-b9d7-9b83d9265254)

   - ping is sending data packets to the server at IP address 172.217.160.238, and the response shows the server's address, the round-trip time (7.39 ms), and other details.
   - also since ping works on ICMP protocol so you can see `icmp_seq` . `icmp_seq=1` means this is the first packet sent in the sequence . Each subsequent ping will increment this sequence number.

## dig

The dig (Domain Information Groper) command is used to query DNS servers to retrieve information about domain names, IP addresses, and other DNS records.

![image](https://github.com/user-attachments/assets/12b22a36-0d19-4faa-9f88-8d248c689e0c)

we can also pass record type
![image](https://github.com/user-attachments/assets/8134ddb2-13ee-45a7-933f-c2f38b494aea)


## nslookup

The nslookup command is used to query DNS servers to obtain domain name or IP address information.

![image](https://github.com/user-attachments/assets/cc8c46cf-096f-417a-b11c-38db9433ebaf)
