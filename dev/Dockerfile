# development image
FROM debian
MAINTAINER mzp <mzp@ocaml.jp>
RUN apt-get update
RUN apt-get -y install aptitude curl git 
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN adduser --disabled-password --gecos "" mzp
RUN echo "mzp:pass" | chpasswd

