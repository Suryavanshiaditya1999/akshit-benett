Q. How to temporary scale deployment or pod without updating yaml file 

- using `scale` command
  
  ```
  kubectl scale deployment my-deployment --replicas=3
  ```

Q. explain different component of helm ? How would you create an helm chart , what is the dir structure everything ...

  - helm commands

    ```
    # Create a new chart
    helm create mychart
    
    # Package a chart
    helm package mychart
    ```

    - package command actually uss helm chart ko tar file m convert deti hai jisko hum baad m untar kr lete hain 

      ![image](https://github.com/user-attachments/assets/97076da3-892e-4404-870b-90a7eb1d939d)


    ```
    # Install a chart
    helm install [release-name] [chart-name]
    
    # Upgrade a release
    helm upgrade [release-name] [chart-name]
    
    # Rollback a release
    helm rollback [release-name] [revision]
    
    # Uninstall a release
    helm uninstall [release-name]
    ```



  -  ```
     Chart.yaml  charts  templates  values.yaml
     ```

     Chart.yaml : iske andar metadata hota hai helm chart ka , like use chart ka `nam` ky hai , `description` , helm chart ka `version` ky hai etc

Q. if you delete `Chart.yaml` then what will happen ?? 

![image](https://github.com/user-attachments/assets/779dab28-820c-422d-8fbf-4aba24d1f2e5)

- aata hai error , chatgpt shi keh ra hai

  ![image](https://github.com/user-attachments/assets/82dd384c-7900-4937-99bd-3d15e007bbb1)


Q. The repository from where you can different application using helm  ? 

```
https://artifacthub.io/
```

### Q. What is the difference between liveliness and readiness probe ?

![image](https://github.com/user-attachments/assets/65e90063-301a-4c79-9204-530ecdd2734c)

![image](https://github.com/user-attachments/assets/84a116ad-d9ca-4c43-b2b5-30d70b836d08)

![image](https://github.com/user-attachments/assets/483d404e-72ed-4ea2-850e-de0c2a0faa54)

![image](https://github.com/user-attachments/assets/ec386457-723d-4922-92ed-0505c04012be)

![image](https://github.com/user-attachments/assets/96e50609-4d6d-46c8-8c68-a4122592b6b9)


![image](https://github.com/user-attachments/assets/e42ae0a8-359e-4ce4-977e-52bd7261ad3f)

- *Ese scenario m jab liviliness probe bar bar fail kr rha hota hai to fir , `crashloopbackoff` error aata hai*

![image](https://github.com/user-attachments/assets/ed6653f1-f082-4c31-8d05-aa4a32b2395b)

![image](https://github.com/user-attachments/assets/721c0faa-eb79-4845-ae24-87a161c383ae)

**SOLUTION**

![image](https://github.com/user-attachments/assets/64131c6d-9464-46fa-8eb8-8cc687819608)

*intial delay second badhane se pod sirf tabhi up aayega jab conneciton m manlo issue aa ra ho , esa nahi ki manlo tumhara app hi bekar hai ya endpoint galat hai aur liveliness probe m intialdelay second badhane se sab kuch thk ho jayega*

![image](https://github.com/user-attachments/assets/0176df39-8aeb-41f6-921a-99b38a6e6830)





Q. What is resource `resourcequota` ? or ... How would you limit the resource usage on a namespace ??

Ans . using kubernetes api object named `resourcequota`

      ```
      apiVersion: v1
      kind: Namespace
      metadata:
        name:  devops
      
      ---
      
      apiVersion: v1
      kind: ResourceQuota
      metadata:
        name: devops-namespace-quota
        namespace: devops
      spec:
        hard:
          limits.cpu: "2"
          limits.memory: 8Gi
          configmaps: "4"
      ```

   - Command to see resource quota

     ```
     kubectl descrine resourcequota -n devops
     ```

Q. 

Q. How does `taint` and `toleration` work , have you used it ? In which scenario you used it how was it beneficial ??


Q. What happens when you do `kubectl apply -f <yaml>` ? Explain complete architecture flow 

Q. What is the difference between `replicaset` and `deployment` ?  

Q. What is the differnce between `statefulset` and `deployment`

Q. Explain which monitoring have you used and how you configured it , what was the problem you faced ? 

Q. What are operators in k8 ? 

Q. What are different types of services ?? Explain `headless service` and when can we use it ??

Q. What is istios ? Have you used it ? What is service mesh ? 

Q. What are ingress controllers ? Which ingress controllers you have used ? What are the problems you have faced ? 

Q. What is api gateway ?

Q. What is `ca` ? What are differnt types of `ca` .. What is the differnence between `cluster autoscaler` in aws and `karpenter` ? When to use which one ?

Q. What is the difference between `node affinity` and `pod affinity`

Q. Explain `rbac` in k8 ? In which scenario you have used it ?? How do we use it ??

Q. What is `helm` suppose I have different `values` file how would you pass different `values` file ??


Q. Explain file strucuture of Helm ? 

Q. Give some commands that you have used with `helm` ? 

Q. What are the different ways we keep `secrets` in k8 ? 

Q. What is `service account`  ?

Q. Explain `secret store csi driver` working ? Also how would you implement it ? 

Q. What is `pdb(pod distription budget` ?? 

