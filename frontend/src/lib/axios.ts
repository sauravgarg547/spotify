import axios from "axios";

export const axiosInstance = axios.create({
  baseURL: import.meta.env.MODE === "development"
    ? "http://43.204.126.146:5000/api" // production me external IP address use kar rahe ho
    : "http://backend:5000/api", // Docker Compose me backend service ka naam use kar rahe ho
});

