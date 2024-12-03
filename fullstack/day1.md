## PRE REQUISSITE

- Node
- Mysql workspace

## Create two folder

-  `client` for frontend and `server` for api .

   ![image](https://github.com/user-attachments/assets/3802af59-e6b1-4696-a326-3f7d8613cf5a)


## 

- Install npm package
  ```
  npm init
  ```
  ![Screenshot 2024-09-01 024043](https://github.com/user-attachments/assets/2d67a390-b58f-435f-a961-808215eb5c3e)
  ![Screenshot 2024-09-01 024055](https://github.com/user-attachments/assets/1d552aad-1e5f-45b5-907d-5aac81317479)



- Now do `npm install express` -> this will install express library ( express is the framework we use to create Rest API)

- `npm install cors` -> cors creates connection between our frontend and backend

- `npm install mysql2` -> because this is the database we are using in this application and it exist in npm , this package allows us to connect with MySQL database very easily.

- We can install all the packages at once as well

  ```
  npm install express cors mysql2
  ```
  ![Screenshot 2024-09-01 024524](https://github.com/user-attachments/assets/54567a3e-bb65-4ce8-addf-5b306e7243b9)


- in package.json all the packages that the application is using can be seen under dependencies

  ![Screenshot 2024-09-01 024539](https://github.com/user-attachments/assets/2de068a6-f052-4f3c-aba2-0fe5a113898f)

- Now lets create our first file `index.js` but why only name it `index.js` -> because in package.json we have given the main entry point , index.js , if we want to give some other name then we have to change package.json as well with that name.

  ![made1](https://github.com/user-attachments/assets/76f4fbdf-cb98-48aa-85ca-58110f17c3b9)

- start with these lines first in index.js
  ```
  const express = require("express");
  const app = express();
  ```

- in javascript we declare variable with different keywords  , let , var or const . const is different , How ?
  
  -  A variable declared with const cannot be reassigned to a different value after it is initialized. 
    ```
    const x = 10;
    x = 20; // This will cause an error
    ```

    ![Screenshot 2024-09-01 030146](https://github.com/user-attachments/assets/16f2aee8-931e-4fcb-ab3a-fcb60ae03ceb)

  -  app is a express application instance that we have created , listen is the method provided by express application , this is used for starting HTTP server

-  now add another function

- so the whole code in `index.js` will look like

  ```
  const express = require("express");
  const app = express();
  app.listen(3001, () => {
    console.log("Server is running on port 3001");
  });

  ```

  ![Screenshot 2024-09-01 030935](https://github.com/user-attachments/assets/f2bdde85-e621-47ad-9c32-2445199f15b1)

  ![Screenshot 2024-09-01 031112](https://github.com/user-attachments/assets/0fa1a17c-6961-49bf-97c7-e07ec824f0f4)

  ![Screenshot 2024-09-01 031142](https://github.com/user-attachments/assets/a029d14f-acac-49f6-a202-174995a6a977)



- Now let's install another package

    ```
    npm install nodemon
    ```
    ![Screenshot 2024-09-01 031708](https://github.com/user-attachments/assets/0326e227-9f89-44fe-933b-091b4d42541c)

- if you run your server by just doing `node index.js` then everytime you make some changes on the index.js it wont be reflected on browser . it will be showing only old page , So what nodemon does it whenever we make some changes on index.js it checks it and restart our server , so that's how we see refereshed page with updated changes everytime.

- add this lines in package.json 
    ```
    "start": "nodemon index.js"
    ```
    what it does is everytime we run , `npm start` it runs , nodemon index.js in the background , and that's how we keep getting updated configuration on server

    ![Screenshot 2024-09-01 031755](https://github.com/user-attachments/assets/f84d2654-3352-4b41-96f0-d1edb6b63e1a)

- [Now for further session install MYSQL WorKbench](https://www.youtube.com/watch?v=uj4OYk5nKCg)


- Now we need to create schema in MySQL workbench
- so the schema that we have created is named `fullstackschema`

  ![Screenshot 2024-09-01 044239](https://github.com/user-attachments/assets/4097d54f-a9e3-4d18-964d-ccd1f5f6b743)

- in order to create database from code only , we will install ORM -> sequelize

  ![Screenshot 2024-09-01 044511](https://github.com/user-attachments/assets/2a7b3374-475a-49f5-a2ff-7a014e42c52a)

- to use this orm we will install sequilize
  ```
  npm install -g sequilize sequelize-cli
  ```

- Now , after installing we should initialize sequelize , to do that
  ```
  sequelize init
  ```

- This will create bunch of folders `config` `migrations`  `modeles` `seeders`

  ![Screenshot 2024-09-01 045501](https://github.com/user-attachments/assets/bd81f9a2-3e94-462c-85d1-aecf37589626)

- lets delete additional folder i.e `migration` and `seeders`

  ![image](https://github.com/user-attachments/assets/796bc5d7-a108-4ded-ae0d-baa0ef3882fe)

- Now in models , lets create a file Posts.js , because we want user to post something , that's why we are using Post.js name if your app perform some other kind of functionality you can give some other name as well .

- To connect with database , give database name in config.json

  ![Screenshot 2024-09-01 061601](https://github.com/user-attachments/assets/4773f43a-89c3-4eb7-be66-50799ecbce85)




