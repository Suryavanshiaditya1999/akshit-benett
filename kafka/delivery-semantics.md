# ACKS in KAFKA 


Acks ki jarurat ku hai 

![image](https://github.com/user-attachments/assets/50279cc1-594c-4854-b710-ebedfa97feb0)

yha par agar hum kafka k architecture ko dekhein to failure k kai point ho skte hain

jese storage ka run out ho jana broker m 

network man lo producer m aa ra tha lekin consumer tak message pohchne tak net chala gya so network issue bhi ek h


## **There are three different delivery semantics available:**

- at-most-once ( acks = 0 )
- at-least-once ( acks = 1 )  
- exactly-once ( acks = all )

![image](https://github.com/user-attachments/assets/9aa382b4-7fbf-4035-a8d9-7c1db6b7cafa)

![image](https://github.com/user-attachments/assets/2550f2a8-051a-4775-a353-84f6217ca2c6)

NOTE : acks ko hum directly code m set kr skte hain , producer side k code m ye likha jata hai ki kitna ack rakhna hai , by default acks 1 hi hota hai aur hum generally rakhte bhi 1 hi hain , kuki jo bhi badi banking ya ecomerce application hoti hain usme message ki duplication chal skti hai lekin ye nahi chal skta ki message pohche hi na . 
