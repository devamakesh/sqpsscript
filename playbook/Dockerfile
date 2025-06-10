# Use the official Node.js image as a builder
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy all files to container
COPY . .

# Install Retype globally
RUN npm install -g retypeapp

# Build the site
RUN retype build

# Use a lightweight web server to serve the built site
FROM nginx:alpine

# Copy the built site to the NGINX html directory
COPY --from=builder /app/public /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
