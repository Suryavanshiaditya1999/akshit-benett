  ![image](https://github.com/user-attachments/assets/6fa38fe8-1991-4fa1-ab8a-8cb40f392199)

-  See docker container
  ```
  docker ps
  ```

-  see all container even stopped containers
  ```
  docker ps -a
  ```

-  to delete a container first stop it 
  ```
  docker stop <container_id>
  ```

-  now delete it
  ```
  docker rmf <container_id>
  ```


- To start a container
  ```
  docker run -d -p 3000:3000 --network emp-network --name frotend-container venomking1/frontend-app:v1
  ```

  ![image](https://github.com/user-attachments/assets/bcfc5e8f-bccc-45dc-9af1-b4a1fee4b6fe)
