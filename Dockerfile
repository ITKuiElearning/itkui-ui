# Use a slim Node.js image for efficiency
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy everything except node_modules
COPY . . .node_modules

RUN ls -al

# Install dependencies
RUN yarn install --frozen-lockfile --schema ./prisma/schema.prisma

# Build the Next.js application
RUN yarn build

# Use a smaller Node.js image for production
FROM node:18-alpine AS runner

# Set working directory
WORKDIR /app

# Copy only the production build
COPY --from=builder /app/out .

# Expose Next.js port
EXPOSE 3000

# Start the Next.js server
CMD [ "npm", "start" ]