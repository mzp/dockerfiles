# base image
FROM stackbrew/debian
MAINTAINER mzp <mzp@ocaml.jp>
RUN echo "deb http://ftp.jp.debian.org/debian testing main contrib non-free"  > /etc/apt/sources.list
RUN echo "deb-src http://ftp.jp.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://ftp.debian.org/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade
RUN apt-get -y install git aptitude curl
