# COMMIT LOGS , SEGMENTS AND RETENTION POLICY

## COMMIT LOGS

Q. Kafka messages ko store kha krta hai jab producer use bhejta hai to ? 

Ans. Jo actual data to kafka producer produce krta hai vo `.logs` file m store hota hai , Yhi cheez **commit logs** kehlati hai , ab ye `.log` file kha hoti hai usko dekhne k liye hum `server.properties` ko dekhna padega. 

   ![image](https://github.com/user-attachments/assets/be447c1b-c14d-4244-aab6-1ef9bfd7d1e9)

   -  Normally iss file ki location `/tmp/kafka-logs` hi hoti hai


   EXAMPLE
   
   - Ab man lete hain humne ek topic create kra aditya aur usme 3 partition rakhe aur 1 replication ab isme ek message send kra producer se , ab dekhte hain ky hota hai 
   ![image](https://github.com/user-attachments/assets/e2f0763d-628c-4947-8a2a-1b360662c760)

  - Ab ye dekho 3 aditya create hue hain , aditya-0 , aditya-1 , aditya-2 , kuki humne 3 partition create kre the
    ![image](https://github.com/user-attachments/assets/0e7773fa-faf9-4802-a1cf-2a76df3624a4)

    - inn directory k andar jate hain
      ![image](https://github.com/user-attachments/assets/a10984bb-4a5a-444e-a654-9703e78e9fa1)

      -  jo ye .log file hai yhi file hmara message contain krti hai jo producer k through bheja jata hai

         - agar m aditya-1 k andar cat krun iss .log file ko to kuch bhi ni dikh rha
           ![image](https://github.com/user-attachments/assets/0139e60e-91b8-4dd8-82c7-64461615b3ad)

         - par aditya-2 k andar mujhe ye message dikh rha hai , kuki humne message bina key k bheja tha to vo randomly kisi partition m chala gya aur uski .log file m jake encoded form m store ho gya , ab consumer iss message ko read krne k liye ise decode kr lega
           ![image](https://github.com/user-attachments/assets/2c861a33-89ec-4f6b-adf7-c226d1a0f5d2)


![image](https://github.com/user-attachments/assets/d202ce4c-c1bf-4c83-b67e-cc67b3339deb)



## SEGMENT

- jo ye .log file bnti hai hum iske size ko define kr skte hain , ki agar man lo 1gb se exceed kre to ek nai  file bn jaye , isi cheez ko hum segment kehte hain , kafka segments m hi apne messages ko store krta hai , segments matlan kuch nahi tukde , kuki ye .log file tukdo m hoti hain iss liye inhe segments kehte hain .

- ![image](https://github.com/user-attachments/assets/f2d1741a-6665-4ba2-9d9c-86f6c561f94e)

  - jo ye segment.size dikh raha hai server.properties m isi k through hum segment ka size define kr skte hain kafka m
  - ![image](https://github.com/user-attachments/assets/2df14848-797b-4e60-8810-32ec077fe3d5)
 


## RETENTION POLICY

   ![image](https://github.com/user-attachments/assets/e0e488db-6d7a-47d0-a916-5a19192dab39)

   - Retention ya to timebased par ho skta hai ya fir size based par

   ![image](https://github.com/user-attachments/assets/85cf4b65-d593-4066-8bc6-39ae8abb6d8d)

   ![image](https://github.com/user-attachments/assets/e6696b7e-dade-44cc-a7b4-f9b46234258a)

   ![image](https://github.com/user-attachments/assets/b41d491a-1b3d-404b-a2a7-b3b3981de7b7)


   










