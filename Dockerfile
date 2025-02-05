# Base image
FROM node:16

# Install MongoDB
RUN apt-get update && apt-get install -y mongodb

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install project dependencies
RUN npm install

# Expose the application port
EXPOSE 5000

# Set environment variable for MongoDB
ENV MONGO_URI=mongodb://localhost:27017/your_database_name

# Start MongoDB and the application
CMD ["sh", "-c", "mongod --fork --logpath /var/log/mongodb.log && npm start"]
