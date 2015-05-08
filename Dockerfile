FROM debian:wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get install -y apt-utils wget vim
RUN apt-get install -y openjdk-7-jre
RUN mkdir /etc/minecraft && \
    cd /etc/minecraft && \
    wget https://s3.amazonaws.com/Minecraft.Download/versions/1.7.10/minecraft_server.1.7.10.jar && \
    wget http://files.minecraftforge.net/maven/net/minecraftforge/forge/1.7.10-10.13.2.1291/forge-1.7.10-10.13.2.1291-installer.jar && \
    java -jar forge-1.7.10-10.13.2.1291-installer.jar --installServer && \ 
    touch eula.txt && \
    echo "eula=true" > eula.txt && \
    mkdir /etc/minecraft/mods/
ADD server.properties /etc/minecraft/server.properties
ADD mods /etc/minecraft/mods/
WORKDIR /etc/minecraft
EXPOSE 25565
CMD ["java","-jar","forge-1.7.10-10.13.2.1291-universal.jar","nogui"]

    
