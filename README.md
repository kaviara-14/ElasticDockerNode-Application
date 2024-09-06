# Docker Container Hosted on AWS EC2 Instance with Elastic IP Address

This README provides instructions on how to set up and run a Node.js application inside a Docker container on an AWS EC2 instance, with an Elastic IP address attached to it.

### 1. Create a Nodejs application
Start by developing your Node.js application. Ensure your project has a package.json file that lists all dependencies and scripts necessary to run the application. This file is crucial for Docker to install the required packages

### 2. Create a Docker File
Create a Dockerfile in the root directory of your project.This file is crucial for building a Docker image that packages your application and its dependencies into a container.In this repository, you will find the Dockerfile for this project located at Dockerfile

### 3.Launch AWS EC2 Instance
Create a new EC2 instance and choose Amazon Linux 2 Kernel 5.10 AMI and configure the instance type and security groups. Ensure that port 80 is open for HTTP traffic.Use an existing key pair or create a new one for SSH access.

### 4. Install Docker on EC2 Instance
Run the following commands to install and configure Docker

    sudo yum update -y
    sudo amazon-linux-extras install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    pwd

Create a folder to upload your project files

    mkdir downloads
    cd downloads

### 5. Upload Files to EC2 Instance
Use scp to securely copy your project files from local to the EC2 instance

    scp -i "dockerKeyPair.pem" "Dockerfile" "server.js" "package.json" ec2-user@3.133.84.36:/home/ec2-user/downloads

### 6.  Build Docker Image and Run the Container on EC2 Instance
Once the files are on the EC2 instance, build the Docker image

    sudo docker build -t ec2-webapp:v1.0 -f Dockerfile .

Run the Docker container, mapping port 80 on the host to port 3000 in the container
    
    sudo docker run -d -p 80:3000 ec2-webapp:v1.0

This will start your Node.js app in the Docker container, accessible via the EC2 instance's public IP.



### 7. Attach Elastic IP Address 
Go to the Elastic IPs in the AWS EC2,Allocate a new Elastic IP address.And Associate the Elastic IP with your EC2 instance.After attaching the Elastic IP, your Node.js application will be accessible via the Elastic IP at port 80.
