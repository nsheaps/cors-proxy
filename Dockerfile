FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM scratch AS artifact
COPY --from=build /app/dist/ /dist/

# The container holds the built worker bundle at /dist/index.js
# For deployment: docker cp $(docker create ghcr.io/nsheaps/cors-proxy:latest):/dist/index.js .
# Or use as a build stage in Pulumi/CI pipelines.
