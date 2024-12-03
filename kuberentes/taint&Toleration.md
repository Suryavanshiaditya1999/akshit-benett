# TAINT AND TOLERATION

- Taint : nodes par lgta hai 
- Toleration : pods par lgta hai 

jo pod taint ko avoid kr skta hai sirf vhi pod us node par apply hota hai 


**TAINT**

- `NoSchedulee` : Jo bhi pod us node par lge taint ko tolerate nahi kr payega vo us node par nahi schedule hoga
- `PreferNoSchedule` : ye soft version hai no schedule ka , kubernetes kosis krega taint vale nide par koi bhi pod na execute krne ki jiska toleration match nahi ho rha , lekin agar koi 
  option nahi hoga to uss node par schedule bhi kra ja skta hai
- `NoExecute` : Man lete hain ki 3 pod already run kr rhe hain aur aapne baad m taint lga dia node par to jo pod taint ko tolerate nahi kr payenge unhe turant us node s hta dia jayega . 
  Eviction ya to immediately hoga ya phir kuch delay ke baad (depending on eviction policy or grace period).

  -  To add a taint
     ```
     kubectl taint nodes node1 key1=value1:NoSchedule
     ```

  -  To remove taint
    ```
    kubectl taint nodes node1 key1=value1:NoSchedule-
    ```


![image](https://github.com/user-attachments/assets/31ed2870-5155-48e7-b92a-163940816691)

- Taint agar kisi node par lga dia to fir uspe sirf vhi pod schedule ho skte hain jo us taint ko tolerate kre , agar normal pod hai without toleration to vo us taint vali node par schedule nahi hota.
- Toleration lagane k baad pod m , pod k kahi par bhi schedule ho skta hai ya to taint vale node ya fir bina taint vale node par


**TOLERATION**

```
tolerations:
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoSchedule"'
```


- A simple pod yaml with two toleration
  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: my-pod
  spec:
    containers:
    - name: nginx
      image: nginx:latest
    tolerations:
    - key: "key1"
      operator: "Equal"
      value: "value1"
      effect: "NoSchedule"
    - key: "key1"
      operator: "Equal"
      value: "value1"
      effect: "NoExecute"
  ```

**Q. ky ek hi node par multiple taints ho skte hain aur ky ek hi pod par multiple toleration ho skta hai .**

Node par taint apply krte hain 
```
kubectl taint nodes node1 key1=value1:NoSchedule
kubectl taint nodes node1 key1=value1:NoExecute
kubectl taint nodes node1 key2=value2:NoSchedule
```

ab pod m toleration add kr dete hain

```
tolerations:
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoSchedule"
- key: "key1"
  operator: "Equal"
  value: "value1"
  effect: "NoExecute"
```

![image](https://github.com/user-attachments/assets/9e386091-c78f-4fba-a386-674f4131b83d)

**USE CASES**

kis jgah taint and toleration use aa skte hain 

![image](https://github.com/user-attachments/assets/b3cad7ff-6af6-4150-9924-b23f67368364)

