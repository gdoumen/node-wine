FROM node:latest

ENV DEBIAN_FRONTEND noninteractive
ENV WINEARCH win64

RUN dpkg --add-architecture i386

RUN apt-get  update && apt-get -y install --no-install-recommends gnupg2 software-properties-common apt-transport-https
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository https://dl.winehq.org/wine-builds/debian/

RUN wget -O- -q https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_9.0/Release.key | apt-key add -    
RUN echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_9.0 ./" | tee /etc/apt/sources.list.d/wine-obs.list

RUN apt-get update && apt-get install -y --install-recommends winehq-stable mono-complete

