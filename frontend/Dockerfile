# Stage 1: Frontend Build Stage using Node.js 20
FROM node:20 AS frontend

# Set working directory for the frontend application
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package.json package-lock.json ./

# Install frontend dependencies
RUN npm install

# Copy all the application files to the container
COPY . .

# Build the Vite app for production
RUN npm run build

# Stage 2: Production Stage using Nginx and Node.js 20-slim for reverse proxy
FROM nginx:alpine AS production

# Copy the built Vite app from the frontend build stage
COPY --from=frontend /app/dist /usr/share/nginx/html

# Copy custom Nginx configuration for reverse proxy setup
COPY nginx.conf .

# Expose port 80 (for Nginx) and 3000 (for Node.js app)
EXPOSE 80
EXPOSE 3000

# Start Nginx with reverse proxy setup for the Vite frontend
CMD ["nginx", "-g", "daemon off;"]
