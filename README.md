# TAR2022 Docker commands

# Build container

sudo docker build -t tarhm1 .

# Run

sudo docker run -d -i -p 1935:1935 -p 8080:8080 --network="host" --name=tar tarhm1

# Stop and remove container

sudo docker stop tar
sudo docker rm tar

# Go inside container

sudo docker exec -it tar /bin/bash

# Stream media

ffmpeg -re -i stream1.mp4 -c:v libx264 -c:1 aac -f flv rtmp://localhost/show/stream1

ffmpeg -re -i stream2.mp4 -c:v libx264 -c:1 aac -f flv rtmp://localhost/show/stream2

ffmpeg -re -i stream3.mp4 -c:v libx264 -c:1 aac -f flv rtmp://localhost/show/stream3
