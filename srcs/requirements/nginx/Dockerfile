FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # DIRECTORY TO SAVE THE SSL KEY && CERTIFICATE 
    mkdir -p /etc/nginx/ssl 

# COPY OUR CONFIG FILE TO REPLACE NGINX CONFIG FILE
COPY conf/nginx.conf /etc/nginx/conf.d

# GENERATING SSL CERTIFICATE
RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -days 365 \
    -keyout /etc/nginx/ssl/mcherel-.42.fr.key \
    -out /etc/nginx/ssl/mcherel-.42.fr.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=sudent/CN=mcherel-.42.fr"
RUN    mkdir -p /var/www/html &&\
    chmod 755 /var/www/html

# CONNEXION HTTPS ON PORT 443
EXPOSE 443
# TO LAUNCH NGINX AND MAKING SURE THAT THE CONTAINER DOES NOT STOP
CMD ["nginx", "-g", "daemon off;"]
