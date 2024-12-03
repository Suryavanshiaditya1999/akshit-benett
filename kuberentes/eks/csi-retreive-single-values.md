# RETREIVING SINGLE KEY AND ITS VALUE USING CSI SECRET STORE DRIVER

- Well , normally we use only json format to store key and value pair , which you can already refer from other csi file that is in this folder , but if a scenario comes , where you need to retreive single single value from secret in secret manager in such case ...



```
helm show values secrets-store-csi-driver/secrets-store-csi-driver >> values.yaml
```

- Change `syncSecret.enabled=true` and apply it

```
helm upgrade csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --values values.yaml -n kube-system
```

- Now , this is how your SecretProviderClass yaml should look like

  ```
    apiVersion: secrets-store.csi.x-k8s.io/v1
    kind: SecretProviderClass
    metadata:
      name: db-secret2
    spec:
      provider: aws
      parameters:
        usePodIdentity: "true"
        objects: |
          - objectName: "mysql"
            objectType: "secretsmanager"
            jmesPath: 
                - path: USERNAME
                  objectAlias: dbUsername
                - path: PASSWORD
                  objectAlias: dbPassword
  ```

  ```
  kubectl apply -f <secret-provider-class-yaml>
  ```

  ![image](https://github.com/user-attachments/assets/eae0e04f-286a-4834-ace9-f3671d8e5dd8)

- your pod configuration should look like

  ```
  apiVersion: v1
  kind: Pod
  metadata:
    name: sample-pod2
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
          secretProviderClass: "db-secret2"  # Refers to the SecretProviderClass we created
  ```

  ```
  kubectl apply -f <pod_yaml>
  ```


- Now , there will be 3 files in your pod , one will be of name , `dbUsername` second will be `dbPassword` and third will be `mysql` , and this is how it will look like

  ```
  kubectl exec -it sample-pod2 -- /bin/bash
  ```

  ![image](https://github.com/user-attachments/assets/c6bc11e2-f40e-458d-98a4-c900b28c72a4)
