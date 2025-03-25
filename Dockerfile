# Base image
FROM node:16 AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy project files
COPY . .

# Build the application (if applicable)
# RUN npm run build

# Use a smaller base image for the final stage
FROM node:16-slim

# Set working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app .

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]
