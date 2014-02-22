# base image
FROM stackbrew/debian
MAINTAINER mzp <mzp@ocaml.jp>
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y install ruby rubygems ruby-dev libsqlite3-dev ca-certificates
RUN gem install atig
