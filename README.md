# Tech_Cloud API

## Short Description
This project is a backend API built with Express.js for a platform similar to Stack Overflow, named **USOF**. The API allows users to register, log in, post questions, add comments, like/dislike posts, and manage other interactions.

## Screenshots of Solution
Please refer to the `docs/openapi.json` file for detailed API documentation and example screenshots of the solution in action.

## Requirements and Dependencies
- **Node.JS** >= v22
- **NPM** >= v10
- **MySQL** >= 8.0

Before starting, ensure the required technologies are installed.

## Database Setup
The database schema is provided in the `config/db.sql` file. Run the SQL commands in your MySQL database to set up the required tables.

## How to Run the Solution
1. Clone this repository and move to the project directory.
   ```bash
   git clone <repository-url>
   ```
2. Install the dependencies.
   ```bash
   npm install
   ```
5. Configure the database connection by updating the `.env` file with your MySQL database credentials. Example:
   ```
   DATABASE_HOST=localhost
   DATABASE_PORT=3306
   DATABASE_USER=root
   DATABASE_PASSWORD=root
   ```

5. Log in to your MySQL. 
6. Copy the contents of the [config/schema.sql](config/schema.sql) file and execute it in MySQL. You can also execute the SQL query through the MySQL CLI. To do this, run the command `mysql -u {USER_NAME} -p < config/db.sql`. You need to provide your MySQL login and password.
7. Apply similar steps as in **step 6**, but use the data file [config/data.sql](config/data.sql).
8. Start the server.
   ```bash
   npm run start
   ```

## Mailing Service
[Ethereal](https://ethereal.email/) is a fake SMTP service, mostly aimed at Nodemailer and EmailEngine users (but not limited to). It's a completely free anti-transactional email service where messages never get delivered.
To view the letter that the user will receive, you need to log in to this service using a test login and password.

```text
login: ricky43@ethereal.email
password: 4e1zbM2nxsMu2d823E
```

![](docs/ethereal.png)

## REST API documentation
The documentation of all available endpoints can be found [http://localhost:8080/api-docs/](http://localhost:8080/api-docs/). The [Swagger](https://swagger.io/) library is used.

![](docs/swagger.png)

## Admin Panel
The admin panel are available [http://localhost:8080/admin/](http://localhost:8080/admin/). The [AdminJS](https://adminjs.co/) library is used.

![](docs/adminjs_login.png)

![](docs/adminjs_list.png)

## Additional Features
- Favorite posts - users can add posts to favorites and see this list.
- Most useful comment - the author of the post can set the most useful comments that solved their problem described in the post. Only post authors can set this value.
- Most interesting posts - administrators can select the posts that will be displayed on the main page of the site. Usually these are the most interesting posts.

## Full Documentation
This project follows Challenge-Based Learning (CBL) principles. Each phase of the challenge (Engage, Investigate, Act) is documented to help analyze the project's progress and implementation steps. The full documentation includes:
- Descriptions of progress for each completed CBL stage.
- An algorithm of the program's logic and functionality.

## Fake Data
All users with role `user` has password: `$User2024`. It's fake data for presentations.

### Admin for presentations
   ```text
      login: admin
      password: admin@gmail.com
      password: $Admin2024
   ```
