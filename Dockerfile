FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils wget vim
RUN apt-get install -y openjdk-7-jre
RUN mkdir /etc/minecraft && \
    cd /etc/minecraft && \
    wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.4/minecraft_server.1.8.4.jar && \
    touch eula.txt && \
    echo "eula=true" > eula.txt 
ADD server.properties /etc/minecraft/server.properties
WORKDIR /etc/minecraft
EXPOSE 25565
CMD ["java","-jar","minecraft_server.1.8.4.jar","nogui"]

    
