1: Build the Docker Image: 
First, navigate to the directory containing your Dockerfile and requirements.txt, then run the following command to build the Docker image:
# command
docker build -t your_image_name .   

Replace your_image_name with a desired name for your Docker image.

2:Run the Docker Container
 without Internet Access: To run the container without allowing it to access the internet, you can create a custom bridge network:

 #command
 docker network create --internal my_internal_network

 #command
docker run --network my_internal_network -v /path/to/host/venu:/app/venu -p 8000:8000 your_image_name


Summary of Functionality
Lightweight Python Environment: The Dockerfile sets up a lightweight environment for a Python application, allowing for rapid development and deployment.
Security: By using a non-root user, it enhances security by limiting potential vulnerabilities.
Dependency Management: It efficiently manages Python dependencies through a requirements.txt file.
Data Handling: The declared volume allows for easy file management, making it convenient to share files between the host and the container.
Networking Configuration: The configuration allows you to run the application without internet access, ensuring that it cannot access external networks.