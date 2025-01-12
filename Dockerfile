# Base image
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Update system and install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    gnupg \
    ca-certificates \
    lsb-release \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean

COPY . /app
# Set working directory to the cloned project
WORKDIR /app

# Install project dependencies
RUN npm install

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]

