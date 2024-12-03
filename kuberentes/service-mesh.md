#  SERVICE MESH

- service mesh layer 7 par chalta hai , aur ye ky ky de skta hai 
    - monitoring and tracing
    - mtls
    - retry logic
    - traffic management
    - circuit breaking

Different types of service mesh 
    - Istio
    - Traefik Mesh
    - Linkerd 
    - Consul


To sidecar container ka matlab hai ki vo container  jo mere pod m application k saath run kr rha hai , but  istios ki baat kre to vo container jo mere applicatio k saath m run kr rha hai vo actually m `envoy proxy` hi h 

- sidecar nam h bas jo hum bol re hain ki jo container hmare application k pod m run kr rha hai
- aur jo container run kr rha hai istios k case m vo `envoy proxy` hi hai

![image](https://github.com/user-attachments/assets/e3b31986-b2df-4926-a270-22b8f0871a88)


![image](https://github.com/user-attachments/assets/5f5552a9-0c23-4e21-8d71-966c96e5cc4b)
![image](https://github.com/user-attachments/assets/a6788dac-e007-4b2e-a5e7-e723f077993d)


Istiod is control plane component of istio , which manages and injects envoy proxy in pods

![image](https://github.com/user-attachments/assets/ea7a4811-cbe2-44d4-997d-e794af3dd564)


[**ADMISSION CONTROLLER**](https://www.youtube.com/watch?v=eSNetKBe7Z8)

- For better clarity watch above mention from 19.00

![image](https://github.com/user-attachments/assets/9761a47b-e441-4fff-9cfa-c048e52bf4bd)
- There are more than 30 admission controller in kubernetes cluster automatically , for e.g you are creating a stateful set and you are defining pvc so that validate it we have `storage class` admission controller .


