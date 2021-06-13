
# stage 1

FROM node:alpine AS demoapp
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=demoapp /app/dist/demoapp /usr/share/nginx/html
EXPOSE 80