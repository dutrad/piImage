FROM ubuntu:18.04

RUN apt-get update && apt-get install -y gawk wget git-core diffstat unzip \
            texinfo gcc-multilib build-essential chrpath socat cpio python \
            python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping \
            python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev xterm locales \
            vim bash-completion screen

ARG USERNAME=dev

ARG PUID=1000

ARG PGID=1000

RUN groupadd -g ${PGID} ${USERNAME} \
            && useradd -u ${PUID} -g ${USERNAME} -d /home/${USERNAME} ${USERNAME} \
            && mkdir /home/${USERNAME} \
            && chown -R ${USERNAME}:${USERNAME} /home/${USERNAME}

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

USER ${USERNAME}

WORKDIR /home/${USERNAME}

RUN git clone https://github.com/dutrad/piImage.git
WORKDIR /home/${USERNAME}/piImage
RUN git submodule update --init --recursive

WORKDIR /home/${USERNAME}/piImage

#CMD source /home/${USERNAME}/piImage/build.sh