# Use a lightweight Nginx image
FROM nginx:alpine
COPY website/ /usr/share/nginx/html
EXPOSE 80

