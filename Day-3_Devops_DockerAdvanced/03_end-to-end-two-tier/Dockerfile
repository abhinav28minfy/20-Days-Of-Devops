# Base image for our application
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/app

# Copy package.json to install dependencies first (for layer caching)
COPY package.json .
RUN npm install

# Copy the rest of the application source code
COPY . .

# Command to run the application
CMD ["npm", "start"]
