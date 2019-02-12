FROM node:10-alpine

LABEL maintainer="TJDFT"
LABEL Description="Docker image for VUE with SSR."

# INSTALL PACKAGES
RUN apk --no-cache --update add \
  nginx \
  bash \ 
  git \
  nano

# ADD DEFAULT USER 
RUN adduser -D appuser

# COPY CONFIG FILES
COPY nginx.conf /etc/nginx/nginx.conf

# DEFAULT DIRECTORY
WORKDIR /var/www/web/

# CHANGE PERMISSIONS TO APPUSER
RUN chown -R appuser:appuser /var/www/web \
  /var/log \
  /var/run \ 
  /var/tmp \ 
  /var/lib \ 
  /run

RUN chmod -R 777 /var/www/web   \        
  /var/log  \
  /var/run \ 
  /var/tmp  \ 
  /var/lib \
  /run

# RUN CONTAINER AS NON ROOT USER
USER appuser

# PORT
EXPOSE 3000 8080 80

CMD ["nginx", "-g", "daemon off;"]
