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
RUN yum -y install gcc make zlib zlib-devel readline readline-devel openssl openssl-devel curl curl-devel bzip2
ADD install.sh install.sh
RUN bash -x install.sh;

# TODO: set dotfiles(.vimrc, .bashrc, ..etc.)
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.vimrc
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.bashrc
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.tmux.conf
