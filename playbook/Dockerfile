# Use a Debian-based Node.js image
FROM node:20-slim AS builder

# Install curl and unzip
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Download and install retype manually
RUN curl -fsSL https://retype.com/downloads/retype-linux.zip -o retype.zip \
    && unzip retype.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/retype \
    && rm retype.zip

# Build the site
RUN /usr/local/bin/retype build

# Final image: serve using nginx
FROM nginx:alpine

COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
