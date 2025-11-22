covert the following text into markdown "Step 31: Create README.md
bash
cat > README.md << 'EOF'
# Wisecow Kubernetes Deployment Project

A containerized deployment of the Wisecow application on Kubernetes with automated CI/CD pipeline and secure TLS support.

## 📋 Overview

Wisecow is a simple web server that displays random fortune cookies with ASCII cow art using Linux `fortune` and `cowsay` commands.

### Key Features
- ✅ Dockerized application with optimized Ubuntu base image
- ✅ Kubernetes deployment with high availability (2 replicas)
- ✅ Automated CI/CD pipeline using GitHub Actions
- ✅ NGINX Ingress Controller for external access
- ✅ Optional TLS/HTTPS support with cert-manager
- ✅ Health checks and resource management
- ✅ Production-ready configuration

## 🏗️ Architecture

- **Application**: Fortune + Cowsay web server (Port 4499)
- **Container**: Ubuntu 22.04 with fortune-mod, cowsay, netcat
- **Orchestration**: Kubernetes (Minikube for local testing)
- **Ingress**: NGINX Ingress Controller
- **CI/CD**: GitHub Actions for automated builds and deployments
- **Registry**: Docker Hub for container images

## 📁 Repository Structure


wisecow/
├── .github/
│ └── workflows/
│ └── docker-build-deploy.yaml # CI/CD pipeline
├── k8s/
│ ├── namespace.yaml # Kubernetes namespace
│ ├── deployment.yaml # Application deployment
│ ├── service.yaml # Kubernetes service
│ ├── ingress.yaml # Ingress configuration
│ └── cluster-issuer-staging.yaml # TLS certificate issuer
├── Dockerfile # Container image definition
├── wisecow.sh # Application script
├── .gitignore # Git ignore rules
└── README.md # Project documentation
text

## 🚀 Quick Start

### Prerequisites
- Docker (v20.10+)
- Minikube (v1.25+)
- kubectl (v1.23+)
- Docker Hub account

### Local Deployment

1. **Clone the repository**

git clone [https://github.com/YOUR_USERNAME/wisecow.git](https://github.com/rohittsinghh/wisecow.git)
cd wisecow
text

2. **Start Minikube**

minikube start --driver=docker --cpus=2 --memory=4096
minikube addons enable ingress
text

3. **Deploy to Kubernetes**

kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml
text

4. **Access the application**

Add to /etc/hosts
echo "$(minikube ip) wisecow.local" | sudo tee -a /etc/hosts
Open in browser
curl [http://wisecow.local](http://wisecow.local/)
text

## 🔄 CI/CD Pipeline

The GitHub Actions workflow automatically:
1. Triggers on push to `main` branch
2. Builds Docker image
3. Pushes image to Docker Hub
4. (Optional) Deploys to configured Kubernetes cluster

## 🛠️ Development

### Build Docker Image

docker build -t YOUR_DOCKERHUB_USERNAME/wisecow:latest .
docker push YOUR_DOCKERHUB_USERNAME/wisecow:latest
text

### Test Locally

docker run -d -p 4499:4499 YOUR_DOCKERHUB_USERNAME/wisecow:latest
curl [http://localhost:4499](http://localhost:4499/)
text

## 📊 Monitoring


Check deployment status
kubectl get all -n wisecow-app
View logs
kubectl logs -n wisecow-app -l app=wisecow -f
Check pod health
kubectl describe pod -n wisecow-app -l app=wisecow
text

## 🔐 Security Features
- Resource limits and health checks
- Read-only container filesystem (where applicable)
- Optional TLS encryption for all traffic
- Automated certificate management with cert-manager"
