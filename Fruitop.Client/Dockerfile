# Stage 1: Base (shared across dev and build)
FROM node:22-alpine AS base
WORKDIR /app

RUN corepack enable pnpm
COPY package.json .
RUN pnpm i

COPY . .

# Stage 2: Development environment
FROM base AS dev
EXPOSE 8585
# Use Vite’s development server for hot reloading
CMD ["pnpm", "dev"]

# Stage 3: Build for Production
FROM base AS build
RUN pnpm run build

# Stage 4: Production runtime environment
FROM nginx:alpine AS prod
WORKDIR /usr/share/nginx/html
COPY --from=build /app/dist .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
