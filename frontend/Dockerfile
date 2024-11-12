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

# Stage 2: Production Stage using Node.js 20-slim for serving the app
FROM node:20-slim

# Set the working directory in the production image
WORKDIR /app

# Copy the built files from the frontend stage
COPY --from=frontend /app ./

# Expose the port that the app will run on
EXPOSE 3000

# Start the Vite development server to serve the app
CMD ["npm", "run", "dev"]

