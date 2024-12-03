Q. What is daemon-set and What is the difference between deployment and daemon-set?

![image](https://github.com/user-attachments/assets/3af087a7-3bc9-44a6-a606-9d8eeeb882c8)

Q. What is container runtime in kubernetes ? What are popular runtime , which runtime currently kubernetes uses ?

![image](https://github.com/user-attachments/assets/4b96ab7d-0a84-44df-8ad0-eb44a0afe549)
![image](https://github.com/user-attachments/assets/f108ca23-3414-476f-ad0f-f58f2c5f2d01)

Currently kubernetes uses `ContainerD` runtime , before kubernetes v1.20 it uses Docker runtime but now it is ContainerD.

Q. Pv and Pvc ?

Pv : persisten volume 

- Storage that is provisioned by cluster admin or created by kubernetes .
- It's a cluster wide storage that can be claimed by any pod

PVC : Persistent volume claim

- The volume claimed by pod
- the pod is binded with P.V to use storage of it

**PV**

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: "/mnt/data"
```

**PVC**

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: manual
```

The binding between pvc and pv happens on the basis of `spec` field . 
![image](https://github.com/user-attachments/assets/f637b294-b7da-4fb1-90cd-bf68b55b37ba)

![image](https://github.com/user-attachments/assets/1b90ba9c-4dc3-4a54-9da4-4f259b428b44)

![image](https://github.com/user-attachments/assets/8cb608f1-79b6-481e-a844-e3050926e0f3)


- Matlab 3 pv banana padega fir 3 pvc banana padega agar apko 3 replicas use krna hai stateful set m to

**AB YE TO HO GYA STATIC PV AUR PVC KA CONCEPT**

- DYNAMIC PVC
- Ap bas ek add on use kro apne cluster provisioning k waqt jese EKS m use krte hain `EBS CSI DRIVER`
  ![image](https://github.com/user-attachments/assets/4cba5817-6d73-4748-8b15-6e04a4d1b44d)

- Ab aap directly pvc bnano apne stateful set , kubernetes apne aap pv bna dega apke claim k according

  [Iss repo m dekho stateful set ki configuration ko](https://github.com/N4si/K8s-voting-app/blob/main/manifests/mongo-statefulset.yaml)

  ```
    volumeClaimTemplates:
    - metadata:
        name: mongodb-persistent-storage-claim
      spec:
        accessModes:
          - ReadWriteOnce
        storageClassName: gp2
        resources:
          requests:
            storage: 0.5Gi
  ```

  ![image](https://github.com/user-attachments/assets/486e03cf-7458-44e3-a427-f1a9fe88b0bf)

Q. Resource and limits ?

```
---
apiVersion: v1
kind: Pod
metadata:
  name: frontend
spec:
  containers:
  - name: app
    image: images.my-company.example/app:v4
    resources:
      requests:
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "500m"
```

![image](https://github.com/user-attachments/assets/0cad98c2-0cbf-4351-8890-52e043a190b9)

[OOM ERROR](https://github.com/devops-by-examples/Kubernetes/blob/main/Troubleshooting_Questions/OOMKilled.md)

![image](https://github.com/user-attachments/assets/5d64efcf-e56e-4a7c-97d1-9733a18f9333)

Q. HPA and CA ?

**HPA**

- it's an object just like `deployment` and `statefulset`
- HPA can only work if `resource limit` or `resource request` is set in deployment or statefulSet.
- Horizontal Pod Autoscaling

  ```
  apiVersion: autoscaling/v2
  kind: HorizontalPodAutoscaler
  metadata:
    name: php-apache
  spec:
    scaleTargetRef:
      apiVersion: apps/v1
      kind: Deployment
      name: php-apache
    minReplicas: 1
    maxReplicas: 10
    metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 50
    ```
  - to see hpa do `kubectl get hpa`
