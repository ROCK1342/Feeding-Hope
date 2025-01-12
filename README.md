# Food Donation App

## Prerequisites
- Docker installed on your machine.

## Setup Instructions

1. Clone the repository and navigate into the directory:

    ```bash
    git clone <repository-url>
    cd <repository-name>
    ```

2. Build the Docker image for the app:

    ```bash
    docker build . -t food-donation-app
    ```

3. Start the MongoDB container:

    ```bash
    sudo docker run -d --name mongodb -p 27017:27017 mongo
    ```

4. Run the Food Donation App container and link it to the MongoDB container:

    ```bash
    sudo docker run --name food-donation-app --link mongodb:mongo --env-file .env -p 5000:5000 food-donation-app
    ```

Now, your app should be running on `http://localhost:5000`.
