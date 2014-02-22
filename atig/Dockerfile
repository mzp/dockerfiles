# base image
FROM stackbrew/debian
MAINTAINER mzp <mzp@ocaml.jp>
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y install curl git sudo
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN git clone https://github.com/mzp/chef-repo.git /root/chef-repo && cd /root/chef-repo && chef-solo -c solo.rb -j ./servers/atig.json
ADD service.sh /root/service.sh
