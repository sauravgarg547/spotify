# Use Node.js image for frontend build
FROM node:20 AS frontend

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app files
COPY . ./

# Build the Vite app for production
RUN npm run build

# Stage 2: Use a lightweight Nginx image for production
FROM nginx:alpine AS production

# Copy the build files from the frontend stage
COPY --from=frontend /app/dist /usr/share/nginx/html

# Copy custom Nginx configuration for reverse proxy setup
COPY nginx.conf .

# Expose port 3000 (for Node.js app behind Nginx)
EXPOSE 3000

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
