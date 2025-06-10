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

EXPOSE 5000

# For production serve:
CMD ["npx", "retype", "serve", "--port", "5000"]

# For development with live reload, replace CMD with:
# CMD ["npx", "retype", "watch", "--port", "5000"]