# [KAFKA](https://youtu.be/2YnutJ8tNos)

![image](https://github.com/user-attachments/assets/c8a568fd-e0b4-4813-816d-26632da7e314)

Kafka smoothes the flow of data from source to destination



## ONE SERVER ONE BROKER

Agar ek server par sirf ek broker ho, aur uske andar ek topic ho jo multiple partitions me divided ho, to us case me saare partitions usi ek broker par store honge kyunki aur koi broker available nahi hai.

```

[SINGLE SERVER]
  +-------------------------------------+
  |  BROKER 1                          |
  |  +-----------------------------+   |
  |  |  Topic: "orders"             |   |
  |  |  +-----------------------+   |   |
  |  |  | Partition 1            |   |   |
  |  |  +-----------------------+   |   |
  |  |  | Partition 2            |   |   |
  |  |  +-----------------------+   |   |
  |  |  | Partition 3            |   |   |
  |  +-----------------------------+   |
  +-------------------------------------+

```


## PARTITION

 Ek broker ke paas kai topics ho sakte hain, aur topics further partitions me divide hote hain. Partitions data ko multiple servers (brokers) me distribute karne ka tareeka hote hain


## MULTIPLE SERVER AND MULTIPLE BROKER

In a Kafka cluster, a single topic can be distributed across multiple brokers via its partitions. Each partition of a topic is stored on different brokers, which helps in efficient data handling and scaling.

```


[SERVER 1]                [SERVER 2]                 [SERVER 3]
  +------------------+     +-------------------+     +-------------------+
  |  BROKER 1        |     |  BROKER 2         |     |  BROKER 3         |
  |  +-------------+ |     |  +-------------+  |     |  +-------------+  |
  |  | Topic:       | |     |  | Topic:       |  |     |  | Topic:       |  |
  |  | "orders"     | |     |  | "orders"     |  |     |  | "orders"     |  |
  |  | +----------+ | |     |  | +----------+ |  |     |  | +----------+ |  |
  |  | | Partition | | |     |  | | Partition |  |     |  | | Partition |  |  
  |  | | 1        | | |     |  | | 2        |  |     |  | | 3        |  |
  |  | +----------+ | |     |  | +----------+ |  |     |  | +----------+ |  |
  |  +-------------+ |     |  +-------------+  |     |  +-------------------+
  +------------------+     +-------------------+     +-------------------+
```


## PARTITONER

![image](https://github.com/user-attachments/assets/d8d16324-8fb2-49dc-9207-aca4dd5d2adf)


[**KAFKA TOPIC AND PARTITION**](https://www.youtube.com/watch?v=bIaxc14te7U&list=PLA3GkZPtsafbAjKYkhWnD6GdhRtm6JrD1&index=3)

![image](https://github.com/user-attachments/assets/da3f73b6-f7ac-40d5-94d8-cf1b0932c550)


**Message sent with same key goes into same partition**

- Messages jo same key k saath bheje jate hain vo same partition m jate hain , jese hello key se bheje gye message ek partition m aayenge aur bye se bheje gye ek partition m aayenge , so jab 
 hum consumers se inn messages ko dekhenge , ek key vale message ek jgah dikhaye denge

  - Message getting sent
      ![image](https://github.com/user-attachments/assets/eb7f755b-aa40-4f61-b5dc-33a556ce4414)
  - Message getting consumed by consumer , same key se bheje gye message ek saath hain 
      ![image](https://github.com/user-attachments/assets/9d2f2b6f-8c16-4b18-941b-7363a513bb50)


## Decouple

![image](https://github.com/user-attachments/assets/589e2a64-971b-4d87-baf7-432efc4d7750)


producer and consumer  ek dusre p depeend nahi hote , means even if consumer offline hai aur producer n data ko send kr dia hai to kafka data ko store rakhega aur kuch der baad jab consumer vapis online aayega to use vo data de dia jata hai . 

## ASYNCHRONOUS IN KAFKA

![image](https://github.com/user-attachments/assets/86920392-d883-4c35-b67e-cd0154465b33)

  
