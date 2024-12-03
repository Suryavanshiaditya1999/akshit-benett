# REDUCE DOCKER FILE SIZE

- We can use alpine image , instead of using complete full size image
- Alpine is the base image which is based on Alpine Linux, a very compact Linux distribution. So, node:12.2.0-alpine is a Alpine Linux image with node 12.2.0 installed. For the latest Alpine based image you can simply do node:alpine.


Just by using Alpine image i the image size if half , arround 800 Mb , now lets try reducing it more 

![image](https://github.com/user-attachments/assets/76e2c268-8d3d-4dd5-85d3-ea0bd6f3c047)

- Now to further reduce the size , we can use multi-stage build , since we are using , and we can also expose this application using nginx alpine builder as well so ,

  ```
  FROM node:16-alpine3.16 as builder

  LABEL "Author"="Aditya Suryavanshi"
  
  #RUN useradd -ms /bin/sh appuser
  
  WORKDIR /app
  
  COPY package*.json ./
  
  RUN npm install
  
  COPY . .
  
  RUN npm run build
  
  RUN npm install -g serve
  
  EXPOSE 3000
  
  #USER appuser
  
  ENTRYPOINT ["serve", "-s", "build"]


  FROM nginx:alpine
  
  COPY --from=builder /app/build /usr/share/nginx/html
  
  EXPOSE 80
  
  # Use the default Nginx startup command
  CMD ["nginx", "-g", "daemon off;"]
  ```


![image](https://github.com/user-attachments/assets/103ebd0e-efc8-4bca-8221-9b1cba1c9092)

- as you can see from 1.6 gb to now image is 48 mb.

  

