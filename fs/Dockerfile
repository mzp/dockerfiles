FROM centos:centos6

# RUN yum -y update
RUN yum -y install curl git hostname
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN echo 20140829-1
RUN git clone https://github.com/mzp/chef-repo.git /root/chef-repo && cd /root/chef-repo && chef-solo -c solo.rb -j ./servers/fs.json

ADD userlist /root/userlist
ADD entry.sh /root/entry.sh
