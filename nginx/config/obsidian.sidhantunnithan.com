server {
    listen 80;
    server_name obsidian.example.com;

    # Proxy settings
    location / {
        proxy_pass http://127.0.0.1:5984;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
        proxy_request_buffering off;
        proxy_read_timeout 300;
        proxy_connect_timeout 300;
        proxy_send_timeout 300;
    }

    # Logging
    access_log /var/log/nginx/obsidian.example.com.access.log;
    error_log /var/log/nginx/obsidian.example.com.error.log;
}