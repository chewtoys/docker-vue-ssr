# Docker image for VUE/NUXT with SSR

This image contains the minimal setup for running VUE/NUXT projects with SSR.

- Nginx
- Node 10


# Nginx as reverse proxy

 Nginx acts as a reverse proxy, listening on 80 or 8080 port and passing into `http://localhost:3000`.


```bash
[...]
server {
    listen 8080;        
    sendfile on;
    port_in_redirect off;

    root /var/www/web/dist;
    index index.html;

    location / {         
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
[...]
```


So we can start our app through Node server in production

```
# It will start on http://localhost:3000
yarn start
```