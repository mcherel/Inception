FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl # DIRECTORY TO SAVE THE SSL KEY && CERTIFICATE 

COPY ./conf/ngnx.conf /etc/nginx/conf.d

RUN openssl req -x509 -newkey rsa:4096 -sha256 -nodes -days 365 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=sudent/CN=mcherel-.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "deamon off;"]