# KAFKA 

programmer ne ek application m ek servce k liye code likha hoga ki vo ek message produce kregi aur dusri service k liye code likha hoga ki vo isko consume kregi , man lete hain ki consume krne vali 2 service hain ek message ko.

![image](https://github.com/user-attachments/assets/e4438f16-bd9c-4460-96bb-aa3b18dc9795)

![image](https://github.com/user-attachments/assets/b41c0fb7-3cbd-4e32-ad5d-0257a5ed40dc)

![image](https://github.com/user-attachments/assets/4b429651-7119-4862-ac66-4033303ec7c7)



kafka m producer jo hota hai vo kafka architecture k bhar hota hai iska matlab ki jo producer hai vo message produce krta hai aur jo jo consumer hota hai vo kafka broker se consume krta hai message , to jo consumer vala part hai vo kafka architecture m aata hai jese , kafka client , connect etc . 


Kafka producer ko hum kafka client library k through configure krte hain application aur ye kafak pub sub model par kaam krta hai , yaani ki producer publish krta hai message aur consumer subscribe krta hai un messages ko receive krne k liye.

Same key k messages ek partition m jate hain , taki jitne bhi messages ho same key vale vo same partition m jaye aur consumer service jinhone unko subscribe kia hai ek hi jgah se pick kr lein .


## PRODUCER

![image](https://github.com/user-attachments/assets/d319167b-9905-4cae-be1f-8710ab1e945f)

![image](https://github.com/user-attachments/assets/7998804a-93cb-49e4-83fc-57c39b891b21)


![image](https://github.com/user-attachments/assets/0b03b410-3d99-4988-9285-83f99a366bde)


## BROKER

![image](https://github.com/user-attachments/assets/82625583-e9ed-4356-a306-a19518f5c90a)

## PARTITION

Hume ek topic m kitne partition bnane hain ye bhi hum code m define krte hain

![image](https://github.com/user-attachments/assets/e37b4334-4f1b-4247-8bea-44cf46e2dae1)


![image](https://github.com/user-attachments/assets/127baf42-9861-4b86-881e-8b568c847d2e)

