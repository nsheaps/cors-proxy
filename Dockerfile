FROM node:26-alpine@sha256:6bd9ab43c0ec0190ca7b2d193906cb8b7edf6e7f4afa43ddeccd6452710bffb5 AS build
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
