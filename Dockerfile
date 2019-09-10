FROM openjdk:8

WORKDIR /minecraft
RUN mkdir minecraft_py; \
    cd minecraft_py; \
    mkdir spigot; \
    cd spigot ; \
    wget https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar ; \
    wget -O spigot.jar https://cdn.getbukkit.org/spigot/spigot-1.13.1.jar ; \
    echo eula=true > eula.txt ; \
    mkdir plugins ; \
    cd plugins ; \
    wget -O raspberryjuice-1.11.jar https://dev.bukkit.org/projects/raspberryjuice/files/2496319/download ; \
    cd ../.. ; \
    git clone https://github.com/zhuowei/RaspberryJuice.git ; \
    mkdir py ; \
    cp -r RaspberryJuice/src/main/resources/mcpi/api/python/modded/mcpi py/

# RUN ls -lah /minecraft/minecraft_py/spigot/spigot.jar

# /minecraft_py/spigot

# RUN cd py ; \
#     wget -O rainbow.py https://www.dropbox.com/s/k29ms42nzvgehjk/rainbow.py\?dl\=1

# RUN python --version
# ENTRYPOINT cd ../spigot; \ java -jar spigot.jar

WORKDIR /minecraft/minecraft_py/spigot/

RUN ls -l -ah 

EXPOSE 25565

ENTRYPOINT ["java", "-jar", "spigot.jar"]
