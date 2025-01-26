# SimpleJavaWebApp-Deployment

A simple Spring Boot web application deployment.

## Project Structure

- **src/main**: Contains the main application source code.
- **k8s/**: Contains Kubernetes deployment configurations.
- **Dockerfile**: Defines the Docker image build instructions.
- **jenkinsfile**: Contains the Jenkins pipeline configuration.
- **pom.xml**: Maven project configuration file.

## Prerequisites

- **Java Development Kit (JDK)**: Ensure JDK is installed on your system.
- **Maven**: Required for building the project.
- **Docker**: Needed for containerizing the application.
- **Kubernetes**: For deploying the application in a Kubernetes cluster.
- **Jenkins**: If you plan to use the provided Jenkins pipeline for CI/CD.

## Getting Started

1. Clone the Repository:
   ```bash
   git clone https://github.com/Vishwasoratur/SimpleJavaWebApp-Deployment.git
   cd SimpleJavaWebApp-Deployment
2. Build the Application:
   Use Maven to build the project
   mvn clean package
3. Build the Docker Image:
   docker build -t simple-java-webapp:latest .
4. Deploy to Kubernetes: Apply the Kubernetes configurations:
   kubectl apply -f k8s/
5. Continuous Integration/Continuous Deployment (CI/CD): If using Jenkins, set up the pipeline using the provided jenkinsfile.
6.  Deploy with Argo CD
Add the Application to Argo CD: Use the following command to add the application to Argo CD:
    argocd app create simple-java-webapp \
  --repo https://github.com/Vishwasoratur/SimpleJavaWebApp-Deployment.git \
  --path k8s \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
