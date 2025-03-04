# Build stage
FROM node:20.6-alpine AS build

ENV TZ="Asia/Ho_Chi_Minh"

WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .

# Install the Nest CLI globally
RUN npm install -g @nestjs/cli
RUN npx prisma generate

RUN npm run build

# Production stage
FROM node:20.6-alpine

ENV NODE_ENV=production
ENV EXPOSE_PORT=80
ENV TZ="Asia/Ho_Chi_Minh"

WORKDIR /app

RUN apk add --no-cache tzdata
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone

COPY --from=build /app/package*.json ./
RUN npm ci --only=production

# Create logs directory and set permissions: Winston logging
RUN mkdir -p /app/logs && \
    chown -R node:node /app/logs

COPY --chown=nodejs:nodejs --from=build /app/node_modules/.prisma/client  ./node_modules/.prisma/client
COPY --chown=nodejs:nodejs --from=build /app/prisma /app/prisma
COPY --chown=nodejs:nodejs --from=build /app/dist ./dist

USER nodejs

EXPOSE 80
CMD ["node", "dist/main.js"]
