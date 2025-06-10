FROM node:20-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install retypeapp

# Disable ICU/globalization support to avoid missing libicu error
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

EXPOSE 5000

CMD ["npx", "retype", "watch", "--port", "5000"]
