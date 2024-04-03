# WordPress Bedrock Docker Boilerplate

This repository contains a boilerplate setup for WordPress using the Bedrock directory structure and dockerized with containers for Nginx, PHP, and MariaDB.

## Prerequisites

To use this project, ensure that you have the following installed on your computer:

- Docker
- Docker Compose
- Make

## Getting Started

1. **Clone the project:**

    ```bash
    git clone git@github.com:phipngh/dockerized-wordpress.git
    ```

2. **Change directory to the project directory:**

    ```bash
    cd dockerized-wordpress
    ```

3. **Build the infrastructure:**

    ```bash
    make infra-build
    ```

4. **Install WordPress/Composer packages:**

    ```bash
    make install
    ```

5. **(Optional) Import database:**

   You can start over the brand new database by skipping this step or use database in daatbase folder:

    ```bash
    make db-import
    ```

6. **Access WordPress admin panel:**

    - URL: [http://localhost/wp/wp-admin](http://localhost/wp/wp-admin)
    - Username: `admin`
    - Password: `admin`

**Start docker containers:**

   ```bash
   make infra-up
   ```

**Stop docker containers:**

   ```bash
   make infra-stop
   ```

**Clean docker containers:**

   ```bash
   make infra-clean
   ```

**Dump database:**

   ```bash
   make db-export
   ```

**Access inside php container:**

   ```bash
   make php-inside
   ```

**Access inside mariadb container:**

   ```bash
   make db-inside
   ```

[//]: # (## Notes)
