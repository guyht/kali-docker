FROM kalilinux/kali-rolling

LABEL maintainer="github@guy.ht"

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y kali-linux-full

RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y git colordiff colortail rlwrap && apt-get clean all

RUN apt-get install -y python3-pip gobuster websploit iputils-ping

RUN gem install evil-winrm

WORKDIR /root

RUN curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUN sh install.sh --unattended
RUN curl -L git.io/antigen > antigen.zsh

WORKDIR /usr/share/wordlists
RUN gunzip rockyou.txt.gz

WORKDIR /root

# Setup zsh and shortcuts
ADD ./.zshrc /root/.zshrc
RUN ln -s /data/.zsh_history /root/.zsh_history
RUN ln -s /data/.z /root/.z

ENV SPACESHIP_BATTERY_SHOW false

VOLUME ["/data"]

CMD tail -f /dev/null
