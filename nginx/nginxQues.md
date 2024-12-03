### **Q. What is nginx ?**

Ans . It was developed initially as a web server , later on due to the increasing traffic all around the globe , nginx got more developed and it acquired the potential to also do reverse proxy . So it can do following this :

- `Reverse Proxy`
- `Load Balancing`
- `SSL/TLS termination`
- `Caching`

Nginx is mostly useful in microservice architecture , where we see controllers like `nginx controllers` `alb controllers` , which basically helps tools like kubernetees to redirect traffic to differnt microservices running in the background.

- The controllers basically do reverse proxy in K8 environment.


### **Q. How does reverse proxy works ?**

```
http {
    include mime.types
    upstream nodejs_cluster {
        least_conn;
        server 127.0.0.1:3001;
        server 127.0.0.1:3002;
        server 127.0.0.1:3003;
    }

    server {
        listen 8080;
        server_name localhost;

        location / {
            proxy_pass http://nodejs_cluster;
        }
    }
}

```

![image](https://github.com/user-attachments/assets/d20a443b-9174-41a0-b12a-aa465402ed6f)

### **Q. Ky hum SSL nginx m lga skte hain ?**

- Yes , hum ssl ko nginx m khud se lga skte hain , isko bolte hain .. openssl ki madad se hum self signed certificate bna skte hain aur isko use kr k hum ssl certificate bna skte hain but problem ye hai ki ise hum sirf dev environment m hi use kr skte hain , isko hum prod par use nahi kr skte ..

- Below command creates a public key and a private key 

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt
```

![image](https://github.com/user-attachments/assets/2b1317cf-9a9f-447a-97af-014160c30ced)

Now to apply it using nginx 

```
server {
  listen 443 ssl;
  server_name localhost;

  ssl_certificate /home/ubuntu/ssl/nginx-selfsigned.crt;
  ssl_certificate_key /home/ubuntu/ssl/nginx-selfsigned.key;

  location / {
    proxy_pass http://nodejs_cluster;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
  }
}
```

- So basically hum ssl certificate m jha par bhi apna certificate hai uski complete location de dete hain .. ab ssl certificate lgane k baad hum browser ko hit mare to kuch esa dikhta hai

![image](https://github.com/user-attachments/assets/2ea5df9b-b242-4a8f-8200-12ac584dc269)

Now as you can see yha par bhi hmare domain par not secure aa rha hai esa isliye kuki jo certificate humne use kra hai vo self signed hai , aur browser sirf kisi certificate authority k certiicate ko hi manta hai ssl connection k liye

![image](https://github.com/user-attachments/assets/6d80ba98-2bc5-45ac-8b18-a60bc8cf2b64)



### **Q. What is worker_process ??**

ek bar m nginx kitni request ko handle kr skta hai , 1 worker process ka matlab hai ki nginx k pass 1 hi worker hai , 2 ka matlab 2 worker , generally jitne cpu hote hian utne hi hum workder process dena pasand krte hain , aur agar hume chaiye ki nginx khud chun le ki kitne worker process hone chaiye to hum `auto` kr skte hain

```
worker_processes auto; # system cores ke hisaab se worker processes set karna
```

![image](https://github.com/user-attachments/assets/01827f61-ddd0-464c-9c2c-1fce7a65d40d)

### **Q. What is Worker Connection ?**

![image](https://github.com/user-attachments/assets/5b095048-e0cf-468a-a4d3-6055738697f4)

- Means nginx ek bar me kitni request handle kr skta hai , agar worker process `1` hai aur connections m humne `1024` dala hua hai to 1024 request hi handle kr skta hai nginx , by default worker_connection ki value `512` hoti hai

![image](https://github.com/user-attachments/assets/dab9e9e9-8176-4044-88b5-931eaf119a00)


![image](https://github.com/user-attachments/assets/f6e85f28-74d3-4558-94e2-cb16f03675d1)


### Q. What is gzip ?

![image](https://github.com/user-attachments/assets/2fbff426-2e0c-426a-8658-ab26182e219f)

![image](https://github.com/user-attachments/assets/875ced8b-de57-4fb7-ab4f-e8d197fc33ff)

google > developer tools > network > click on request page ( log?hasfast ) > content-encoding 

![image](https://github.com/user-attachments/assets/436496f0-fe71-4d21-93e0-aa0f26e633f3)

![image](https://github.com/user-attachments/assets/68f5d936-7db6-4e9a-96a4-642f2299ed07)


```
http {
    gzip on; # Gzip compression ko ON kar raha hai
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript; # Ye saari file types compress hongi
    gzip_min_length 1024; # Sirf 1KB ya usse badi files ko compress karega
    gzip_vary on; # Client ke 'Accept-Encoding' header ko respect karega
}
```

- gzip_on ka funda

![image](https://github.com/user-attachments/assets/381db173-5b08-48cc-8391-9ea5ecef7c8f)


![image](https://github.com/user-attachments/assets/52a2ef09-ab2a-4950-9a86-d704f8b64216)



### **Q. What is `proxy_set_header` and why do we use it ?**

- Backend par jo request jani hai proxy pass se , backend ko pta kese chalega ki ye konse domain se aayi hain , proxy_set_header krne se use jis domain se hit aayi hai vo domain ki info mil jati hai , lets say backend par request nginx k through `example.com` se aai hai to use pta chal jayega ki client se request `example.com` se aari hai .

- iska main use case tab hai jab aapki application multi domain vali ho , ese m application ko pta chal jayega ki konsi hit konse domain se aari hai , logging m bhi aasani ho jayegi isse . 

![image](https://github.com/user-attachments/assets/1f34fa58-2cac-4fbf-86b2-675aabd764f8)


### **Q. `mime.type` ky hai aur ku use hota hai .. ??**

MIME ( Multipurpose Internet Mail Extensions )

- ek bar cat kro `mime.type` ko

![image](https://github.com/user-attachments/assets/ccede95a-3be5-47bc-8643-1d330c647d59)

to ye kuch mapping ho rakhi hai , file ki unke type k saath , like `text/html html` ese kr k mapping ho rakhi hai .. ab iss file ko include krna isliye jaruri hai kuki

- Simple bolein to ye nginx ka extension hai file browser ko samjhane k liye , jese hum python ki file ko read krvane k liye `.py` extension lgate hain ki vo python file ki hi trah read ho , isi tarike se browser ko bhi to btana padega ki file konse type ki hai , taki vo use usi tarike se read kre . Isiliye isko include krna bhot jaruri hai . 

![image](https://github.com/user-attachments/assets/e722532c-08cf-4fa0-9376-6ca201328cc9)


- `nginx.conf` k andar , kuch iss tarike ki setting milegi

```
http {
    include mime.types;
    default_type application/octet-stream; # Default MIME agar kuch match nahi kare
}

```

![image](https://github.com/user-attachments/assets/8d951184-bb7b-48ba-a49e-318be27dd378)











