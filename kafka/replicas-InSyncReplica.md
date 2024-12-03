# [REPLICA AND IN-SYNC REPLICA](https://www.youtube.com/watch?v=JWrVRILzoQs&list=PLA3GkZPtsafbAjKYkhWnD6GdhRtm6JrD1&index=10&t=181s)

if we create a kafka cluster with 3 brokers, 3 partition and 3 replication factor , and then lets say describe the topic to see the result , we can see something like this

![image](https://github.com/user-attachments/assets/f4e7e2a1-063b-493e-bca0-12168d1bbb64)

- Now lets say we terminate one broker then what ?
  
    ![image](https://github.com/user-attachments/assets/3d61b175-e9c1-4ad1-b7ed-08593f1cb1d6)

  - ab iss image ko dekhein to ISR( in sync replica to adjust ho chuka hai , lekin replicas m abhi bhi broker 3 dikha ra hai , uska reason ..
    
    ![image](https://github.com/user-attachments/assets/92ca82e2-bc13-441a-97cd-8624c5fe4a89)

![image](https://github.com/user-attachments/assets/1626629d-0a61-4263-84ae-839b7092b9df)
