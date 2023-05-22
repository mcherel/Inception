FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/nginx/ssl 


#RUN chmod 777 execute.sh ERROR
#ENTRYPOINT ["sh", execute.sh] ERROR