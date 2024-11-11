# Stage 1: Build the application
FROM node:20 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Vite app for production
RUN npm run build

# Stage 2: Serve the application with a lightweight image
FROM node:18-alpine AS production

# Install a lightweight HTTP server
RUN npm install -g serve

# Set the working directory
WORKDIR /app

# Copy the built files from the previous stage
COPY --from=build /app/dist /app/dist

# Expose the production port
EXPOSE 3000

# Serve the app
CMD ["serve", "-s", "dist"]
