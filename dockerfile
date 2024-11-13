# Use a Node.js base image
FROM node:20

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the Strapi project for production
RUN npm run build

# Expose the port that Strapi will run on
EXPOSE 1337

# Start Strapi in production mode
CMD ["npm", "run", "start"]
