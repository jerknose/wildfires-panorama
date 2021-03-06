FROM node:10 as build
 
# Copies everything over to Docker environment
COPY . /usr/src/app/
 
# Switch to work directory
WORKDIR /usr/src/app

# Run production server
FROM nginx:stable-alpine
COPY --from=build /usr/src/app/build /usr/share/nginx/html
# new
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port. Used for local Docker build. Will be overridden by Docker Compose
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]