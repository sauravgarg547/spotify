# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files from the current directory
COPY . .

# Expose the port the app will run on
EXPOSE 5000

# Run the backend server
CMD ["npm", "run", "dev"]

