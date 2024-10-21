FROM ubuntu:latest

LABEL maintainer="docker@x241c297f.dev"
LABEL description="Common development base image"

# Build arguments

ARG USERNAME
ARG USERID
ARG GROUPNAME
ARG GROUPID

# Timezone
ENV TZ="Europe/Berlin"

RUN <<END
    ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
    echo ${TZ} > /etc/timezone
END

# Updates
RUN <<END
    apt-get update
    apt-get upgrade -y
    apt-get autoremove -y
    apt-get -y clean
END

# Default packages
RUN <<END
    apt-get update
    apt-get install -y curl git iproute2 iputils-ping iputils-tracepath locales sudo vim zsh
    apt-get autoremove -y
    apt-get -y clean
END

# Remove default Ubuntu user and create new one
RUN <<END
    touch /var/mail/ubuntu
    chown ubuntu /var/mail/ubuntu
    userdel -r ubuntu
    getent group ${GROUPNAME} || groupadd -g ${GROUPID} -o ${GROUPNAME}
    useradd -u ${USERID} -g ${GROUPID} -G sudo -m -s /bin/zsh ${USERNAME}
    (umask ug=r,o= ; echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME)
    touch /home/${USERNAME}/.zshrc
    chown ${USERNAME}:${GROUPID} /home/${USERNAME}/.zshrc
END

# Locales
RUN <<END
    echo "C.UTF-8 UTF-8" > /etc/locale.gen
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
    locale-gen
END

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Editor
ENV EDITOR=/usr/bin/vim

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# oh-my-zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
COPY --chown=${USERNAME}:${GROUPID} ["./custom-maran.zsh-theme", "/home/${USERNAME}/.oh-my-zsh/custom/themes/custom-maran.zsh-theme"]
RUN sed -i.bak 's/^ZSH_THEME=.*$/ZSH_THEME="custom-maran"/' ~/.zshrc

CMD [ "/bin/zsh" ]
