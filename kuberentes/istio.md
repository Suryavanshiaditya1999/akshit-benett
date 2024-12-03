# ISTIO 

### ISTIO INSTALL

![image](https://github.com/user-attachments/assets/5776b335-0555-4386-ba11-edf39eda5fff)


## ENABLE ISTIO ENJECTION IN NAMESPACE

- To see if the istio injection is enabled on a namespace or not

 ```
 kubectl get namespace <namespace-name> --show-labels
 ```
![image](https://github.com/user-attachments/assets/1d8ad410-30b1-4902-a58b-71dc61cb255d)

Niche vali picture m hum dekh stke hain ki istio injection enabled nahi hai
![image](https://github.com/user-attachments/assets/c176d4b0-7945-4ab1-9273-575d3ee9ef84)

- To enable istio -injection

```
kubectl label namespace <namespace-name> istio-injection=enabled
```

To see labels
```
kubectl get namespace <namespace-name> --show-labels
```

- agar hum khud se namespace m injection enable na kre to hume har yaml file m enable krni padegi

  ```
  apiVersion: apps/v1
  kind: Deployment
  metadata:
    name: my-service
  spec:
    replicas: 1
    selector:
      matchLabels:
        app: my-service
    template:
      metadata:
        labels:
          app: my-service
        annotations:
          sidecar.istio.io/inject: "true"  # Istio ko batata hai ki sidecar inject kare
      spec:
        containers:
        - name: my-service
          image: my-service-image
   ```
   
     - agar hum namespace k liye istio-injection enable na kre to hume har yaml file m ye enable krna pdega . Isliye hum log namespace m hi dalte hain istio-injection
 


 ### DEPLOYING APPLICATION

 - Inject istio in namespace
   ```
   kubectl label namespace default istio-injection=enabled
   ```

- Now apply the sample application

  in this location
  ```
  /home/aditya/istio-1.23.2/samples/bookinfo/platform/kube
  ```

  - ![image](https://github.com/user-attachments/assets/88e212a5-8cc5-4d43-8bb3-113be78163fa)

  - ![image](https://github.com/user-attachments/assets/9b84110c-45d0-42d5-9d30-b72e3f3c0faa)
  - as you can see in pods two containers are running , one is normal pod container and other one is sidecar container , since we have embaled istio so its a envoy proxy container.


## MTLS

- To set up mtls create a yaml and apply it

```
apiVersion: security.istio.io/v1beta1
kind: PeerAuthentication
metadata:
  name: mtls-mode
  namespace: default
spec:
  mtls:
    mode: STRICT
```

```
kubectl apply -f <yaml_file_name>
```

- mode 2 type k hote hain `strict` aur `permissive` . Agar aapne kisi service par PERMISSIVE mode set kiya hai, toh yeh mTLS ke sath non-TLS traffic bhi allow karega. Isse connection issues 
  aa sakte hain.

BEFORE APPLYING MTLS we can do curl from master node

![image](https://github.com/user-attachments/assets/cd1b3097-1ffb-4a9e-a432-09826fa2851d)

AFTER THAT WE CANNOT DO CURL

![image](https://github.com/user-attachments/assets/5b7b3702-3a1a-4db3-844a-05127910df34)

- To istio ne yha par ye kra ki koi bhi agar service ko access krne ki kosis krega without the proper certificate it will throw an error . 


 
      
