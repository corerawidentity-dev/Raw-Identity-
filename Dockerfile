FROM nginx:alpine

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy site files
COPY index.html /usr/share/nginx/html/index.html

# Railway dynamically assigns a port via $PORT env variable
# The nginx.conf reads it at startup via envsubst
EXPOSE 8080

CMD ["sh", "-c", "envsubst '$PORT' < /etc/nginx/nginx.conf > /tmp/nginx.conf && nginx -c /tmp/nginx.conf -g 'daemon off;'"]
