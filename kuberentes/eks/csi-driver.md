# HOW TO MANAGE SECERTS IN KUBERNETES

**[VIDEO](https://www.youtube.com/watch?v=MTnQW9MxnRI)**

- FIRST , Create Secret in Secret Manager

  ![image](https://github.com/user-attachments/assets/7a8687df-8f3c-48de-b806-c6dada7983c7)

- Give your secret some name

   ![image](https://github.com/user-attachments/assets/34de7477-1962-4c26-8c9b-731556b3c6cc)



## WAYS WE CAN IMPLEMENT SECRET IN KUBERNTES

- First way is simply we can put secret directly using `base64` encoded , but the problem is , it's encoded not encrypted meaning that anyone who has access to secret.yaml can decode that base64 secret .
- Second way is using `sealed secret`
- Third way is secret store csi driver , which basically pulls the secret from `secret manager` , `key vault` etc


## CSI DRIVER - COPYING ALL THE VALUES FROM A SECRET INTO A FILE AS A JSON

###  SECRET STORE CSI DRIVER [INSTALLATION](https://secrets-store-csi-driver.sigs.k8s.io/getting-started/installation)



```
helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
```

```
helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
```

- Running the above helm install command will install the Secrets Store CSI Driver on Linux nodes in the kube-system namespace.

- Run this command to verify
  
  ```
  kubectl --namespace=kube-system get pods -l "app=secrets-store-csi-driver"
  ```
  
  ![image](https://github.com/user-attachments/assets/eeb377cb-f84b-4f5b-8688-a39d8cfbdee8)


- Install aws provider now .. [LINK](https://github.com/aws/secrets-store-csi-driver-provider-aws)
  
  ```
  kubectl apply -f https://raw.githubusercontent.com/aws/secrets-store-csi-driver-provider-aws/main/deployment/aws-provider-installer.yaml
  ```

 - Now , create an oidc connect

    ```
    eksctl utils associate-iam-oidc-provider \
    --cluster demo-cluster \
    --region us-west-1 \
    --approve
    ```

 -  Create an iam policy and attach it to service account

    ```
    eksctl create iamserviceaccount \
    --name db-service-acc \
    --region="us-west-1" \
    --cluster "demo-cluster" \
    --attach-policy-arn arn:aws:iam::340847072416:policy/csi-eks-custom-all-permission \
    --override-existing-serviceaccounts \
    --approve
    ```
    

 -  Now create an `SecretProviderClass`

     ```
     apiVersion: secrets-store.csi.x-k8s.io/v1
    kind: SecretProviderClass
    metadata:
      name: db-secret
    spec:
      provider: aws
      parameters:
        usePodIdentity: "true" 
        objects: |
          - objectName: "mysql"
            objectType: "secretsmanager"
     ```

     - Do

       ```
       kubectl apply -f <secret-provider-class-yaml>
       ```

- Now deploy sample application using this `SecretProviderClass` and `ServiceAccount`

  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: sample-pod
    namespace: default
  spec:
    serviceAccountName: db-service-acc # Ensure this is attached to an IAM role with permissions to access the secret
    containers:
    - name: my-app-container
      image: nginx  # Using nginx as a placeholder image
      volumeMounts:
      - name: secrets-store-inline
        mountPath: "/mnt/secrets-store"  # Mount path for the secret
        readOnly: true
    volumes:
    - name: secrets-store-inline
      csi:
        driver: secrets-store.csi.k8s.io
        readOnly: true
        volumeAttributes:
          secretProviderClass: "db-secret"  # Refers to the SecretProviderClass we created
   ```

  - Do

    ```
    kubectl apply -f <pod_yaml>
    ```


- As you can see the secret is mounted , the secret is mounted as a file and it has all the values that are present in that secret as a json
  
    ![image](https://github.com/user-attachments/assets/a8b7a2ef-4fe4-44fe-a0a9-758da646f063)

    ![image](https://github.com/user-attachments/assets/de6c275c-1cd4-45b4-9ed4-db919b7bd69c)


     in this secret , whatever the key and values will be , will get mounted here 

- But what if you are changing values in secret manager then what , how would you tell your csi secret manager to dynamically pull secret from secret managet , well that we can do using `enableSecretRotation=true`

- So if we do `helm search repo csi` to search for helm charts with csi name  , we can find
  
  ![image](https://github.com/user-attachments/assets/4d0f8aec-f324-4aae-b02b-c118562f2945)

- Now `helm show values secrets-store-csi-driver/secrets-store-csi-driver >> values.yaml` , to take the values of this helm chart into a values.yaml file .


- now , change `enableSecretRotation` from false to `true` , by default it is `false`
  
  ![image](https://github.com/user-attachments/assets/3e225d28-cbda-4d9e-8f69-3824a3139971)

- Now lets upgrade our helm release ..

  ![image](https://github.com/user-attachments/assets/1f73978b-59f4-4dd4-b402-4ef4067a4639)

- Now
  ```
  helm upgrade csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --values values.yaml -n kube-system
  ```



## TROUBLESHOOTING

- if the pod secret value is not updating automatically , you can run

  ```
  helm get values csi-secrets-store -n kube-system -o yaml | grep enableSecretRotation
  ```

  to see that the new release value is now changed or not . if changed then `enableSecretRotation: true` , wait for few mins for kubernetes to apply these changed then exec into your pod to see the new value .



 - RELOADER : For Auto Rotation of secrets

  - ultimately debugging is the best friend . 
  
