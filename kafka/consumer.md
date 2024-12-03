# CONSUMER

## CONSUMER GROUP

- By default jab ek consumer bnta hai kafka m to use ek consumer id apne aap assign kr di jati hai , multiple consumers ek hi group id k andar jab hote hain to use hum consumer group kehte hain.
- ab ye decide kese hota hai ki multiple consumers ek hi group id m bne ?
- To iss chiz ko code k through samajhte hain


producer ka code kuch bhi ho skta hai depending upon configuration , similary consumer ka code bhi kuch bhi ho skta hai but `group id` hum define kr dete hain code m aur jo bhi consumer hume ek group m rakhne hote hain vo isi group id m bnate hain

```
from confluent_kafka import Consumer, KafkaError

# Kafka Consumer Configuration
conf = {
    'bootstrap.servers': "localhost:9092",
    'group.id': "order-consumer-group",  #group id jo ki same hai consumer1 aur consumer2 k liye , isliye ye dono ek hi consumer group m bnenge
    'auto.offset.reset': 'earliest'
}

consumer1 = Consumer(conf)
consumer2 = Consumer(conf)

topic = "test-topic"

consumer1.subscribe([topic])
consumer2.subscribe([topic])
```


## CONSUMER OFFSET

offset is nothing but simply bookmark

- position of a consumer in a specific partition of a topic
- 

![image](https://github.com/user-attachments/assets/71a1ec02-becd-4f24-99de-0b238ca821e2)


Q. man lete hain ki mene ek topic create kra hai aur uske andar jo messages hain vo key aur value m jaa re hain yaani agar same key se jaa re hain messages to ek hi partition m jayenge ese case m consumer ko 4 partition to assign ho gye lekin messages to same key vale ek hi partition m gye honge to ky hoga ?

- jinse keys milengi sirf vhi partition ke messages consume kre jayenge

![image](https://github.com/user-attachments/assets/f2849b72-1d6e-4290-b0be-f164e1f88f63)


-----------------------------------------------------

- jitni bar kafka consumer console chalyenge utni bar ek nya consumer group create hoga with different id
      - consumer coordinater apne aap ek different group id assign kr deta hai
      ![image](https://github.com/user-attachments/assets/bf5814fb-f668-487a-9b30-2d64f9567d98)



