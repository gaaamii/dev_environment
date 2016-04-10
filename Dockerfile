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

# Install ruby
# copy ./install.sh to Docker container and run it
ADD install_ruby.sh install_ruby.sh
RUN bash -x install_ruby.sh;

# Insta Node
ADD install_node.sh install_node.sh
RUN install_node.sh install_node.sh

# Set dotfiles(.vimrc, .bashrc, ..etc.)
ADD set_dotfiles.sh set_dotfies.sh
RUN bash -x set_dotfiles.sh
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.vimrc
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.bashrc
# wget https://raw.githubusercontent.com/gaaamii/dotfiles/master/.tmux.conf
