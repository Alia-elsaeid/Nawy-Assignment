# Node Hello World

Simple node.js app that servers "hello world"

Great for testing simple deployments to the cloud

```bash
npm start
```
# Node App Deployment with CI/CD
1. Project Overview
This project demonstrates the containerization of a Node.js application using Docker, followed by the deployment of the containerized application through a CI/CD pipeline with GitHub Actions. The application is deployed using Docker and managed via Terraform. Additionally, monitoring and logging are integrated into the application using New Relic to ensure effective tracking and performance monitoring.

2. Setup Instructions
Clone the Repository:
```bash
git clone https://github.com/johnpapa/node-hello.git
cd node-hello 
```
3. Containerize the Application
Using  Dockerfile 

#Build image 
```bash
docker build -t hello-node-app .
docker images
```
#Start the container
```bash
docker run --name hello-container -d -p 3000:3000 hello-node-app
docker ps
```

#4. Make dir for workflow
```bass
mkdir -p .github/workflows
nano .github/workflows/ci.yml
```
This pipeline automates the steps of linting, building the Docker image, and pushing it to the container registry ( Docker Hub).

##5. Deploy Using Terraform:

Ensure that your Terraform configuration files are properly set up to  use local Docker deployment).
Using main.tf 

```bash
terraform init
terraform plan
terraform apply
```




##6. Monitoring and Logging with New Relic:

The application integrates New Relic for performance monitoring and log aggregation.
Using official documentation to configure agent on VM
```bash

url: https://docs.newrelic.com/docs/logs/forward-logs/forward-your-logs-using-infrastructure-agent/
```
Navigate to the log forwarder configuration folder:


Linux: /etc/newrelic-infra/logging.d/

in file `logging.yml` add these lines
```bash

logs:
  - name: containers
    file: /var/lib/docker/containers/*/*.log
    attributes:
      logtype: docker_container
```
 ## ## Logs

![Service Diagram](shortener.png)

