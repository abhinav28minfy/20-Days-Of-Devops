# 📦 Managing Dependencies and Running Apps

---

## 🟩 1. Node.js

### 🔧 Manage Dependencies
- `npm install`  
- `npm ci --only=production`

### 📁 Key Files
- **Metadata** → `package.json`
- **Version Lock** → `package-lock.json`

### 🚀 Deployment
- `npm run build`

### 🐳 Sample Dockerfile (Node.js)

FROM node:20  
WORKDIR /app  
COPY package*.json ./  
RUN npm install --production  
COPY . .  
EXPOSE 3000  
CMD ["node", "server.js"]

---

## 🟪 2. .NET

### 🔧 Manage Dependencies
- `dotnet restore`

### 📁 Key Files
- **Project Config** → `.csproj`
- **Deterministic Restore** → `packages.lock.json` (NuGet global cache)

### 🚀 Deployment
- `dotnet build`  
- `dotnet publish -c Release -o ./publish`

### 🐳 Sample Dockerfile (.NET)

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build  
WORKDIR /src  
COPY . .  
RUN dotnet restore  
RUN dotnet publish -c Release -o /app/publish  

FROM mcr.microsoft.com/dotnet/aspnet:8.0  
WORKDIR /app  
COPY --from=build /app/publish .  
EXPOSE 80  
ENTRYPOINT ["dotnet", "WebApp.dll"]

---

## ☕ 3. Java

### 🔧 Manage Dependencies
- `mvn install`  
- `./gradlew build`

### 📁 Key Files
- **Maven** → `pom.xml`  
- **Gradle** → `build.gradle`

### 🚀 Deployment
- `mvn package`  
- Spring Boot (Gradle): `./gradlew bootJar`

### 🐳 Sample Dockerfile (Java)

FROM maven:3.9.6-eclipse-temurin-17 AS builder  
WORKDIR /app  
COPY . .  
RUN mvn clean package -DskipTests  

FROM eclipse-temurin:17  
WORKDIR /app  
COPY --from=builder /app/target/app.jar app.jar  
EXPOSE 8080  
CMD ["java", "-jar", "app.jar"]

---

## 🦫 4. Go

### 🔧 Manage Dependencies
- Initialize: `go mod init <module-name>`  
- Install/Update: `go get ./...` or `go mod tidy`

### 📁 Key Files
- `go.mod` – Dependency list  
- `go.sum` – Checksum for dependencies

### 🚀 Deployment
- `go build -o app`

### 🐳 Sample Dockerfile (Go)

FROM golang:1.21 AS builder  
WORKDIR /app  
COPY . .  
RUN go mod tidy && go build -o main  

FROM alpine:latest  
WORKDIR /root/  
COPY --from=builder /app/main .  
EXPOSE 8080  
CMD ["./main"]

---

## 🐍 5. Python

### 🔧 Manage Dependencies
- Virtual environment: `python -m venv venv`  
- Activate: `source venv/bin/activate`  
- Install: `pip install -r requirements.txt`

### 📁 Key Files
- `requirements.txt`

### 🚀 Deployment
- Static files (Django): `python manage.py collectstatic`  
- Production server: `gunicorn app:app`

### 🐳 Sample Dockerfile (Python)

FROM python:3.11-slim  
WORKDIR /app  
COPY requirements.txt .  
RUN pip install --no-cache-dir -r requirements.txt  
COPY . .  
EXPOSE 8000  
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
