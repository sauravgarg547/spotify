#!/bin/sh

# Exit script if any command fails
set -e

echo "Applying namespace configuration..."
kubectl apply -f namespace.yml

#echo "Deploying persistent volume for Spotify app..."
#kubectl apply -f spotifyapp-pv.yml

#echo "Setting up MongoDB resources..."
#kubectl apply -f mongodb-pvc.yml
#kubectl apply -f mongodb-service.yml
#kubectl apply -f mongodb-statefulset.yml

echo "Deploying backend application..."
kubectl apply -f backend-deployment.yml
kubectl apply -f backend-service.yml

echo "Deploying frontend application..."
kubectl apply -f frontend-deployment.yml
kubectl apply -f frontend-service.yml

# Wait for frontend pods to be in Running state
echo "Waiting for frontend pod to be ready..."
kubectl wait --for=condition=ready pod -l app=frontend -n spotify --timeout=300s

# Wait for backend pods to be in Running state
echo "Waiting for backend pod to be ready..."
kubectl wait --for=condition=ready pod -l app=backend -n spotify --timeout=300s

echo "Setting up port forwarding for frontend service on port 3000..."
kubectl port-forward service/frontend-service -n spotify 3000:3000 --address=0.0.0.0 &

echo "Setting up port forwarding for backend service on port 5000..."
kubectl port-forward service/backend-service -n spotify 5000:5000 --address=0.0.0.0 &

echo "All resources have been successfully applied and port forwarding is active!"
