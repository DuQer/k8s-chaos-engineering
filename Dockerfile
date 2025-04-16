# Stage 1: Build the Astro project
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the static site
RUN npm run build


# Stage 2: Serve the built static files
FROM node:18-alpine

# Install lightweight static file server
RUN npm install -g serve

# Set working directory
WORKDIR /app

# Copy built files from the builder stage
COPY --from=builder /app/dist .

# Expose the port the app runs on
EXPOSE 4321

# Start the static file server
CMD ["serve", ".", "-l", "4321"]
