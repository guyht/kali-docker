FROM kalilinux/kali-rolling

LABEL maintainer="github@guy.ht"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y kali-linux-full

RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y git colordiff colortail unzip vim zsh curl rlwrap && apt-get clean all

RUN apt-get install -y python python-pip python3-pip ruby openvpn gobuster websploit


RUN pip install websploit
RUN gem install evil-winrm

RUN curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUN sh install.sh --unattended
RUN curl -L git.io/antigen > antigen.zsh

# Setup zsh and shortcuts
ADD ./.zshrc /root/.zshrc
RUN ln -s /dots/zsh_history /root/.zsh_history
RUN ln -s /dots/z /root/.z


CMD ["/bin/zsh"]