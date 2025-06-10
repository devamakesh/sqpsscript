# Stage 1: Build Retype static site
FROM node:20-slim AS builder

RUN apt-get update && apt-get install -y libicu-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install retypeapp
RUN npx retype build

# Stage 2: Serve with Nginx
FROM nginx:alpine

COPY --from=builder /app/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
     
