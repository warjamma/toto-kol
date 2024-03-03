
echo "
server { 
  listen 80;

  sendfile on;

  default_type application/octet-stream;

  gzip on;
  gzip_http_version 1.1;
  gzip_disable      \"MSIE [1-6]\.\";
  gzip_min_length   256;
  gzip_vary         on;
  gzip_proxied      expired no-cache no-store private auth;
  gzip_types        text/plain text/css application/json application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript;
  gzip_comp_level   9;

  root /app;

  location / {
    try_files \$uri \$uri/ /index.html =404;
  }

  location /api/ {
    proxy_set_header EL-Real-IP \$http_cf_connecting_ip;
    proxy_pass http://$1/;
  }
  
  location ~ ^/(account|payment|report|common|l)/ {
    proxy_set_header EL-Real-IP \$http_cf_connecting_ip;
    proxy_pass http://$1\$request_uri;
  }
}
"
