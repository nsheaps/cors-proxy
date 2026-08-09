FROM node:24-alpine@sha256:d32cdf619f63fe0471182d08996dd516c6275bb5fd31ae06e55a570bd9e1ad43 AS build
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
