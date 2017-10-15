# This Dockerfile imitates https://github.com/yss44/docker_rails_base

FROM centos
MAINTAINER gaaamii

# Dev tools
RUN yum -y update
RUN yum -y install git vim passwd sudo

# create user
RUN useradd gaaamii
RUN passwd -f -u gaaamii
# setup sudoers
RUN echo "gaaamii ALL=(ALL) ALL" >> /etc/sudoers.d/gaaamii

# Installing Rails Runtime, Ruby and Node.js
RUN yum -y install gcc make zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel bzip2 wget

# Install ruby
# copy ./install.sh to Docker container and run it
ADD install.sh install.sh
RUN bash -x install.sh;

# Set dotfiles(.vimrc, .bashrc, ..etc.)
ADD set_dotfiles.sh set_dotfies.sh
RUN bash -x set_dotfiles.sh
