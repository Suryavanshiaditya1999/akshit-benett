# [RBAC](https://www.youtube.com/watch?v=MGCF6slXG0w)

**[VIDEO](https://www.youtube.com/watch?v=ywPLGKxV5xU)

In kubernetes RBAC we have four components
![image](https://github.com/user-attachments/assets/4e610359-90e8-48c7-a606-00c85bb7e62e)

so we have 3 things which defines rbac in k8 

- ServiceAccount
- Role/ClusterRole
- Rolebinding/ClusterRolebinding

Q. Can we apply any `deny` policy to Roles 

Ans . NO  , permissions sirf lgai jati hain , hatai ni jati

![image](https://github.com/user-attachments/assets/6e20d85b-783f-4ae9-85ea-9cebe6f523a6)

![image](https://github.com/user-attachments/assets/6c49d6e0-8ff7-4678-852d-e370393e9593)


- **CONFIGURATION**

- configmap , for giving iam user , arn so that , that particular user will have the access to use our k8 cluster

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapUsers: |
    - userarn: arn:aws:iam::357171621133:user/rbac-user
      username: rbac-user
```

- Now , lets create Role here , this role will define what all the permission we want this user to have on our cluster

```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  namespace: rbac-test
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["list","get","watch"]
- apiGroups: ["extensions","apps"]
  resources: ["deployments"]
  verbs: ["get", "list", "watch"]
```

- Rolebinding , the role we have created , will get binded here

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: read-pods
  namespace: rbac-test
subjects:
- kind: User
  name: rbac-user
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```






