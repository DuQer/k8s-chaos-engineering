# Stage 1: Build the Astro project
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy dependency files and install packages
COPY package*.json ./
RUN npm install

# Copy the rest of the source code and build the site
COPY . .
RUN npm run build

# Stage 2: Serve the built site using a lightweight static server
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install a simple static file server
RUN npm install -g serve

# Copy the build output from the previous stage
COPY --from=builder /app/dist ./dist

# Set default port
ENV PORT=4321

# Expose the port
EXPOSE 4321

# Start the static file server
CMD ["serve", "dist", "-l", "4321"]
