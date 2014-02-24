FROM centos
RUN yum -y update
RUN yum -y install curl git 
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN git clone https://github.com/mzp/chef-repo.git /root/chef-repo && cd /root/chef-repo && chef-solo -c solo.rb -j ./servers/nameserver.json
