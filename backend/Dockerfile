# Stage 1: Install dependencies and build the application
FROM node:20 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire source code to the container
COPY . .

# Build the application (optional, for TypeScript or other build steps)
# Uncomment the line below if you need to compile (e.g., TypeScript to JavaScript)
# RUN npm run build

# Stage 2: Run the application in a lightweight environment
FROM node:18-alpine AS production

# Set the working directory
WORKDIR /app

# Copy only the node_modules and build files from the build stage
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app .

# Expose the backend port (change if your app runs on a different port)
EXPOSE 5000

# Command to start the application
CMD ["npm", "start"]
