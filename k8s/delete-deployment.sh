#!/bin/sh

# Exit script if any command fails
set -e

echo "Stopping and deleting port-forward processes..."
# Kill all port-forward processes
pkill -f "kubectl port-forward" || echo "No port-forward processes found."

echo "Deleting frontend resources..."
kubectl delete -f frontend-service.yml || echo "Frontend service not found."
kubectl delete -f frontend-deployment.yml || echo "Frontend deployment not found."

echo "Deleting backend resources..."
kubectl delete -f backend-service.yml || echo "Backend service not found."
kubectl delete -f backend-deployment.yml || echo "Backend deployment not found."

echo "Deleting MongoDB resources..."
kubectl delete -f mongodb-statefulset.yml || echo "MongoDB StatefulSet not found."
kubectl delete -f mongodb-service.yml || echo "MongoDB service not found."
kubectl delete -f mongodb-pvc.yml || echo "MongoDB PVC not found."

echo "Deleting persistent volume..."
kubectl delete -f spotifyapp-pv.yml || echo "Persistent volume not found."

echo "Deleting namespace..."
kubectl delete -f namespace.yml || echo "Namespace not found."

echo "All specified resources have been stopped and deleted successfully!"
