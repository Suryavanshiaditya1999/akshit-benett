# VOLUME AND VOLUME MOUNTS

Kubernetes m volume ko mount krvane k liye pehle volume bnti hai , agar volume nahi bnaoge to mount bhi nahi kr skte . 

Volume generally hum 3 tarike ki use krte hain `configMap` `emptyDir` aur `persistenceVolume`

Ab generally hum persistence volume to stateful set k liye use krte hain to deployments m hum generally `emptydir` ya fir `configMap` use krte hain

## EMPTYDIR

![image](https://github.com/user-attachments/assets/0461bc05-0667-4f7b-a9e8-18b28ebef0eb)

- Dekho jo volume hoti hai vo container level p define hoti hai , identation ko dekho , container k level par hi volume hai , ab jo bhi volume k andar nam dia hota hai vhi nam use hota hai volume mount krane k liye .

- according to below configuration , `/upload-on-alpine/image` ye volume bnegi pod k andar , aur tum kuch bhi upload vgera kroge vo yha par jayegi

- emptyDir basically ek ephimeral volume hoti hai pods k andar , aur ye tab delete ho jati hai jab pod delete hota hai .

- pod k andar `upload-on-alpine` par 2 folder create hone , `doc` aur `image` aur jo data hai vo in folders k andar jayega

- Tum ek pod k andar multiple container bna skte ho aur sbko ek volume de skte ho , but jo data data pod1 k volume m jayega vo data pod 2 k volume m nahi jayega since , emptydir hum 2 pods k andar share nahi kr skte . 

```
containers:
  - name: alpine-linux
    image: alpine
    command: ['sh', '-c', 'echo alpine-linux-container is running ; sleep 3600']
    resources:
      limits:
        cpu: "0.5"
        memory: 200M
    volumeMounts:
      - name: upload-image-empty-dir
        mountPath: /upload-on-alpine/image
      - name: upload-doc-empty-dir
        mountPath: /upload-on-alpine/doc
volumes:
  - name: upload-image-empty-dir
    emptyDir:
      sizeLimit: 500Mi
  - name: upload-doc-empty-dir
    emptyDir:
      sizeLimit: 500Mi
```

- Emptydir m agar size specify kr rakha hai , manlo 500mb , aur jis node par ye pod allocate hua hai vha par man lo 500mb space hai hi nahi  , vo already logs ya koi aur data se filled ho chuka hai node , to iss case m emptydir kaam hi nahi kregi

  ![image](https://github.com/user-attachments/assets/39bb68ff-b0bb-4641-91a3-8da7f37d6c38)

  ![image](https://github.com/user-attachments/assets/e3a2ad39-3bf4-4f7b-808a-ea1b0139704c)


## CONFIGMAP

![image](https://github.com/user-attachments/assets/2772b860-ce8f-4b34-84b2-81132079bafe)



## HOSTPATH

- Single node cluster par use krna hi beneficial hai , jese minikube k environment m , kuki , ye ky krta hai ek persistent volume bnata hai node par , manlo ek node par ye volume bn gyi ab pod dusri bar suru hua to iss node par nahi bna to fir to vo uss volume ko access nahi kr payega , to isliye iska fayda single node cluster m hi ho skta hai , aur generally hum single node ka cluster  to bnayenge nahi , isliye iska use nahi hota hai

![image](https://github.com/user-attachments/assets/af8fa9ad-3bf1-4455-a028-dc7e623f2c67)

## PV AND PVC

![image](https://github.com/user-attachments/assets/e4368994-9444-4899-a245-beba30ede66e)


## PVC WORKFLOW

![image](https://github.com/user-attachments/assets/bbd9a896-325e-4a2f-baa8-ce5eeb85a2fc)


## LOCAL VOLUME 

- not really used
- Kuch nahi ek volume bna dete hain , aur ye volume persistent hoti hai hostpath ki trah nahi hoti sirf ek hi node par , ye volume shared hoti hai aur koi bhi pod isko access kr skta hai nodeaffinity use kr k , but isko use nahi krte hain , isko normally on-premise environment m hi use krte hain , cloud par dynammically scale hi psand krte hain  . 

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: example-pv
spec:
  capacity:
    storage: 100Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  persistentVolumeReclaimPolicy: Delete
  storageClassName: local-storage
  local:
    path: /mnt/disks/ssd1
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: kubernetes.io/hostname
          operator: In
          values:
          - example-node
```

![image](https://github.com/user-attachments/assets/47d0cc35-4658-4134-b8e8-3b30f24f8c1e)



