#!/bin/bash

set -e

# Step 1: Start MySQL container
docker run -d --name mysql_server -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root123 mysql:latest

# Step 2: Wait until MySQL is ready
echo "Waiting for MySQL to start..."
sleep 20  # simple wait; for production you'd poll the port instead

# Step 3: Run SQL commands directly inside the container
docker exec -i mysql_server mysql -u root -proot123 <<EOF
CREATE DATABASE testdb;
USE testdb;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);
INSERT INTO users (name, email) VALUES
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');
SELECT * FROM users;
EOF
