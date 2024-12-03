# HELM

```
helm create <chart_name>
```

![image](https://github.com/user-attachments/assets/14f071c9-5d90-4d72-8154-55046a857d52)


![image](https://github.com/user-attachments/assets/d20d739b-5458-4cea-9abc-548be649f826)



- to add existing from helm
  ```
  helm repo add <chart_name>
  ```


- change `values.yaml` according to your need

  ```
  nano values.yaml
  ```

- to deploy pod with helm

  ```
  helm install <release_version> .
  ```

![image](https://github.com/user-attachments/assets/396d0d9c-0c67-41bf-a258-fd600a0a737c)

