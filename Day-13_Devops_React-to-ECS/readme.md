# 🚀 Deploying React App Using ECR & ECS

This section documents the steps taken to deploy a React application using **Amazon ECR** and **Amazon ECS**.

---

## 📦 1. ECS Cluster Created

A new ECS Cluster was successfully created to run the containerized React app.

<div align="center">
  <img src="ECS_SS/Screenshot 2025-07-07 131436.png" alt="ECS Cluster Created" width="700"/>
</div>

---

## 🛠️ 2. Task Definition Created

The Task Definition contains the container configuration using the ECR image.

<div align="center">
  <img src="ECS_SS/Screenshot 2025-07-07 131436.png" alt="ECS Task Definition" width="700"/>
</div>

---

## 📡 3. Service Created

An ECS Service was launched using the defined task and attached to the cluster.

<div align="center">
  <img src="ECS_SS/Screenshot 2025-07-07 131733.png" alt="ECS Service Created" width="700"/>
</div>

---

## 🌐 4. React App Running Successfully

The deployed React application is now live and accessible via the load balancer or EC2 public IP.

<div align="center">
  <img src="ECS_SS/Screenshot 2025-07-07 131850.png" alt="React App Running" width="700"/>
</div>
