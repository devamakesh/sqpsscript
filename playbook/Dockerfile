FROM node:20-slim

# Install system dependencies including ICU for .NET globalization support
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    libicu67 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy all files to the container
COPY . .

# Install Retype CLI locally
RUN npm install retypeapp

# Expose default Retype server port
EXPOSE 5000

# Start Retype in watch mode for live reload during development
CMD ["npx", "retype", "watch", "--port", "5000"]
