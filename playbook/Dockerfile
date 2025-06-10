# Stage 1: Build with Retype
FROM node:20-slim AS builder

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Retype project files
COPY . .

# Install Retype locally
RUN npm install retypeapp

# Build the static site
RUN npx retype build

# Stage 2: Serve using NGINX
FROM nginx:alpine

# Copy the built site from builder
COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
