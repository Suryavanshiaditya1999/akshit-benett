# [HOW TO CREATE A KAFKA CLUSTER](https://www.youtube.com/watch?v=m9AOYW2GF00&list=PLA3GkZPtsafbAjKYkhWnD6GdhRtm6JrD1&index=9)

- Change `server.properties` since this is a file for broker , and it contains the setting for broker .
- if you want to create 3 brokers , copy server.properties 3 times , in it change broker id , broker port number and change logs directory , since all the brokers are connected to one zookeper this will become a kafka cluster with 3 broker 

![image](https://github.com/user-attachments/assets/d3525acd-d4b0-46e2-af9b-bc9bceea1d13)

jo leader hota hai vo decide hota hai partition level p , yaani ki man lete hain agar 3 broker hain , aur 1 partition ka man lo leader broker1 ho gya , 2 ka broker3 aur 3 ka broker 2 ho gya .

![image](https://github.com/user-attachments/assets/255f9062-e34b-4e6b-945a-211f3bcce6fa)
