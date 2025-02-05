# Base image
FROM node:16
 
 #Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install gnupg and curl
RUN apt-get update && apt-get install -y gnupg curl

# Import the MongoDB public GPG key
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
    gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor

# Create the list file for MongoDB
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Reload the package database
RUN apt-get update

# Install MongoDB Community Server
RUN apt-get install -y mongodb-org

#

# Install project dependencies
RUN npm install

# Expose the application port
EXPOSE 5000

# Start MongoDB and the application
CMD ["sh", "-c", "mongod --fork --logpath /var/log/mongodb.log && npm start"]
