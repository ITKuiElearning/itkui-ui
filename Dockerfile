# Use a slim Node.js image for efficiency
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy everything except node_modules
COPY . .

RUN ls -al

# Install dependencies
RUN yarn install --frozen-lockfile --schema ./prisma/schema.prisma

# Build the Next.js application
RUN yarn build

# Verify build output exists before copying (optional)
RUN ls -al
RUN ls -al /app

# Use a smaller Node.js image for production
FROM node:18-alpine AS runner

# Set working directory
WORKDIR /app

# Set the correct permission for prerender cache
RUN mkdir .next
RUN chown nextjs:nodejs .next

# Automatically leverage output traces to reduce image size
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Expose Next.js port
EXPOSE 3000

# Start the Next.js server
CMD [ "npm", "start" ]