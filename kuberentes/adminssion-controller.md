# [ADMISSION CONTROLLER](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/)

![image](https://github.com/user-attachments/assets/3b05e4a4-9fa6-480a-be0f-8d342869add5)

[Video to learn](https://www.youtube.com/watch?v=eSNetKBe7Z8&t=2087s) , learn it from 20.35


- Admission controller can `mutate` or `validate` the request


- Admission Controller ek Kubernetes ka component hota hai jo API server ke saath kaam karta hai. Jab bhi koi request Kubernetes cluster mein aati hai, Admission Controller us request ko approve ya reject kar sakta hai, based on certain conditions ya rules. Yeh controller ensure karta hai ki cluster mein sahi configurations aur policies ko enforce kiya jaye, taaki cluster secure aur consistent rahe.

-  There are more than 30 admission cotroller by default in kubernetes cluster


```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: myclaim
spec:
  accessModes:
    - ReadWriteOnce
  volumeMode: Filesystem
  resources:
    requests:
      storage: 8Gi
  selector:
    matchLabels:
      release: "stable"
    matchExpressions:
      - {key: environment, operator: In, values: [dev]}
```

- First do
  ```
  kubectl apply -f <yaml_file_name>
  ```

- Now check wether the admission controller has mutated this object or not
  
  ```
  kubectl edit pvc myclaim
  ```

There is no storage class present in this yaml , but since we have storage class admission controller by default in kubernetes cluseter, admission controller intrecept krega aur isme `storage class` add kr dega 

-  The admission controller which intercepted this is `default storage class`



![image](https://github.com/user-attachments/assets/014d6649-ecbf-4a3b-a5ae-18a65331783b)


- To see `validate` we can do
  ```
  apiVersion: v1
  kind: ResourceQuota
  metadata:
    name: quota-demo
  spec:
    hard:
      cpu: "1"
      memory: 2Gi
  ```

  - This will put a limit on resource creation in default namespace
 

- Now try creating a pod that is requesting more resource than allowed
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: demo-pod
  spec:
    containers:
    - name: demo
      image: ubuntu
      command: ["/bin/sh"]
      args: ["-c", "while true; do echo hello; sleep 10;done"]
      resources:
        requests:
          memory: "10Gi"
          cpu: "500m"
        limits:
          memory: "10Gi"
          cpu: "500m"
    ```

    - you will get an error of `excedded quota`
      ![image](https://github.com/user-attachments/assets/bbc7e8ae-2614-45c4-9a42-3590f2be5c8e)

    - So the request is not valdiated , this time the admission controller which didn't allowed resource creating is `resource quota` admission controller

