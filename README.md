<h1 align="center">Realtime Spotify Application ✨</h1>

![Demo App](/frontend/public/screenshot-for-readme.png)


About This Application:

-   🎸 Listen to music, play next and previous songs
-   🔈 Update the volume with a slider
-   🎧 Admin dashboard to create albums and songs
-   💬 Real-time Chat App integrated into Spotify
-   👨🏼‍💼 Online/Offline status
-   👀 See what other users are listening to in real-time
-   📊 Aggregate data for the analytics page
-   🚀 And a lot more...

## 🛠 Tech Stack

- **Frontend**: React.js
- **Backend**: Node.js, Express.js
- **Database**: MongoDB
- **State Management**: Redux
- **Authentication**: CLERK
- **Cloud Storage**: CLOUDINARY
- **Content Delivery Network**: CLOUDINARY
- **Realtime Chatting**: Web socket.io

## 🛠 Deployment Stack
- **Cloud Platfrom**: AWS
- **Containerization**: Docker
- **CI/CD**: Jenkins
- **Monitoring**: Prometheus, Grafana



##  Jenkins CI/CD Pipeline
The project integrates a robust Jenkins CI/CD pipeline for streamlined deployment.

# Pipeline Overview

- **Code Clone**: Jenkins clones the GitHub repository from the main branch.

- **Build Docker Images**: Jenkins builds the Docker images for both frontend and backend applications.

- **Run Unit Tests**: Jenkins runs the unit tests for both frontend and backend applications.

- **Push Docker Images**: The images are tagged and pushed to the Docker registry for deployment.

- **Deploy to AWS**: Jenkins deploys the Docker containers to the AWS environment.

- **Deployment**: The Docker images are deployed and managed using docker-compose.

# Shared Library for Jenkins
 A shared library has been created to simplify and standardize the Jenkins pipeline. This library contains custom functions to handle repetitive tasks such as cloning the repository, building Docker images, and pushing them to the registry.

## Shared Library Functions
### git Clone : Clones the GitHub repository from the main branch.

      https://github.com/sauravgarg547/devops-library.git

- **gitClone**: Clones the GitHub repository using the provided URL and branch name.


- **pushDockerImage**: Tags and pushes Docker images to the container registry.

## 🚀 Getting Started
# 🛠 Installation

### Prerequisites

- Node.js and npm installed
- MongoDB installed and running

1. **Clone the Repository**

```bash
git clone https://github.com/sauravgarg547/spotify.git
cd spotify
```

2. **Install Dependencies**

```bash
# Install server dependencies
cd backend
npm install
npm run dev

# Install client dependencies
cd frontend
npm install
npm run dev

```
### Environment Variables
Create a `.env` file in the root directory and add the following environment variables:
# Setup .env file in backend folder

```bash
PORT=...
MONGODB_URI=...
ADMIN_EMAIL=...
NODE_ENV=...

CLOUDINARY_API_KEY=...
CLOUDINARY_API_SECRET=...
CLOUDINARY_CLOUD_NAME=...


CLERK_PUBLISHABLE_KEY=...
CLERK_SECRET_KEY=...
```

### Setup .env file in _frontend_ folder

```bash
VITE_CLERK_PUBLISHABLE_KEY=...
```
 **Update your localhost url & Your ec2 Ip**

```bash
# Update url for connect backend to frontend 
cd backend

/backend/src/index.js

origin: "http://add your ip ya localhost:3000",


#update url for connect frontend to backend
cd frontend

/frontend/src/lib/axios.ts

then update your ip or localhost url in the above file  

http://Your ip ya localhost/api"
```


### Run the Application With Port - 
The backend will run on `http://localhost:5000` 

The frontend will run on `http://localhost:3000`.


Feel free to reach out if you have any questions or feedback on Linkdin 
@Sauravgarg547 or Sauravgarg5922@gmail.com. Happy Learning Devops!

---
