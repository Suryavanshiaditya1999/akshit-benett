![image](https://github.com/user-attachments/assets/f07423a3-16b0-4773-aa19-9b41cc6f8fdc)**ImageErrors** 

- InvalidImageName
- ImagePullBackOff


![image](https://github.com/user-attachments/assets/d8173c66-ecd3-4453-8853-c8019ef54986)

## [**CrashLoopBackOff**](https://komodor.com/learn/how-to-fix-crashloopbackoff-kubernetes-error/)

![image](https://github.com/user-attachments/assets/b9445bd6-7679-4391-a357-7fea462e8371)


- When a Kubernetes container repeatedly fails to start, it enters a ‘CrashLoopBackOff’ state, indicating a persistent restart loop within a pod. This error often occurs due to various issues preventing the container from launching properly.

**How Does CrashLoopBackOff Work?**
By default, a pod’s restart policy is Always, meaning it should always restart on failure (other options are Never or OnFailure). Depending on the restart policy defined in the pod template, Kubernetes might try to restart the pod multiple times. When a Pod state is displaying CrashLoopBackOff, it means that it’s currently waiting the indicated time before restarting the pod again. 

Every time the pod is restarted, Kubernetes waits for a longer and longer time, known as a “backoff delay”. The delay between restarts is exponential (10s, 20s, 40s, …) and is capped at five minutes. During this process, Kubernetes displays the CrashLoopBackOff error. 

**Debugging**

- Since the container is not starting we can first do `describe pod`
   - NOTE : if the container is 0/1 means the pod is not started so there will be no logs , dont give answer like we can check the logs , always use describe command

  ![image](https://github.com/user-attachments/assets/db547f72-88ff-4d80-ab15-34b0d3e19823)

  - Now we can see that if the pod is failing it is primarly failing liviliness probe and then readiness probe

- ![image](https://github.com/user-attachments/assets/3af7defb-c760-4aa6-8ee2-2dd6d06eb160)

- Where i got the error , While deploying postgres pod i was getting same error so basically my liveliness and readiness probe was failing

  ```
  livenessProbe:
  exec:
    command:
      - "pg_isready"
      - "-U"
      - "postgres"
  initialDelaySeconds: 30
  periodSeconds: 10

   readinessProbe:
     exec:
       command:
         - "pg_isready"
         - "-U"
         - "postgres"        # postgres is basiclly postgres user
     initialDelaySeconds: 30
     periodSeconds: 10
  ```

  So i added this section in postgres livilines and readiness probe and then container started working , so what these commands are doing

  ![image](https://github.com/user-attachments/assets/cefeec8d-6e8a-4ec2-9c83-8ad8137fc219)

  ![image](https://github.com/user-attachments/assets/4a9985fc-8862-45f8-8e21-76afb435696f)


## liveliness and Readiness probe

![image](https://github.com/user-attachments/assets/e2362938-b9ab-49bc-a900-97b73d68563b)


Q. [Let's say your pod is getting killed because of not enough memory. How would you debug it ?](https://www.youtube.com/watch?v=1VNHxmLp6rI)

- First if you are saying that i already know that my pod is getting killed because of not enough memory then the error is `OOM killed` and probably i have already done `kubectl describe pod <pod_name< `
- `kubectl top pods` krne se hume cpu aur memory utilization ka pta chal jayega kubernetes cluster m ,
  
  ![image](https://github.com/user-attachments/assets/a6587c93-4dd2-435d-b82c-afce4abfad27)
  
  NOTE : Keep in mind for applying this command `metrics` api should be enabled in your cluster otherwise you would get an error
  ![image](https://github.com/user-attachments/assets/2a2539d3-a57b-4fa5-b209-fcfe22e1dc29)

- Same cheez hum prometheus aur grafana par bhi kr skte hain , cpu utilization aur memory k graph dekh kr andanza laga skte hain  ki koi pod resource limits exceed kar raha hai ya nahi.
- Resource m hum limits ya request ko fir se apne according adjust kr skte hain . error avoid krne k liye

Q. 

![image](https://github.com/user-attachments/assets/9018bbc0-b0b1-4e5d-8183-6c8116268b33)


