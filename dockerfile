FROM ubuntu:latest
WORKDIR /tar/

#Install Dependencies
RUN apt-get -y update
RUN apt-get -y install git nginx
RUN apt-get install build-essential libpcre3 libpcre3-dev libssl-dev -y

#Clone nginx-rtmp-module
RUN git clone https://github.com/sergey-dryabzhinsky/nginx-rtmp-module.git

#Download Nginx
RUN apt-get -y install wget
RUN git clone https://github.com/nginx/nginx

#Compile Nginx
WORKDIR /tar/nginx/
RUN apt-get install zlib1g-dev
RUN ./auto/configure --with-http_ssl_module --add-module=../nginx-rtmp-module

RUN make
RUN make install

#Configure nginx.conf file
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

RUN apt-get install curl net-tools -y

#Start nginx
RUN /usr/local/nginx/sbin/nginx -t

EXPOSE 1935 80 8080

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"] 
