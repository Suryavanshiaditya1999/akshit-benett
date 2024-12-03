# POD DISTRUPTION BUDGET

[**THE EXAMPLE GIVEN IN OFFICIAL DOCUMENTATION IS GOOD FOR UNDERSTANDING WHAT IS PDB**](https://kubernetes.io/docs/concepts/workloads/pods/disruptions/)

Please go through the example given in official doc for pdb.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- PDB ensure krta hai ki minm ya maxm itne numbers of pods to run krenge hi krenge . 
- Iska main use maintainance k time hota hai , jese node draining , cluster upgrade etc , to us waqt ye ensure krta hai ki itne pods to run krenge hi krenge to application k downtime s bacha ja skta hai iski madad se 

```
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: my-app-pdb
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app: my-app
```
![image](https://github.com/user-attachments/assets/266bf62b-4884-4688-86a4-ba55fb479c8a)

Q. To fir fark ky hai replica aur pdb m , matlab dono hi to ye ensure kr rhe hain na ki minimum number of itne pods to run krne hi krne chaiye 

![image](https://github.com/user-attachments/assets/e653638a-09ac-4449-978f-03e8f250546c)

