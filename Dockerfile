# Use a slim Node.js image for efficiency
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy everything except node_modules
COPY . .

# Install dependencies with schema path
RUN yarn install --frozen-lockfile --schema ./prisma/schema.prisma

# Build the Next.js application (ensure build creates /app/out)
RUN yarn build

# Use a smaller Node.js image for production
FROM node:18-alpine AS runner

# Set working directory
WORKDIR /app

# Copy only the production build
COPY --from=builder /app .

# Expose Next.js port
ENV HOST 0.0.0.0
EXPOSE 3000

# Start the Next.js server
CMD [ "yarn", "start" ]