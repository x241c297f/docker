FROM x241c297f/common-dev-base:latest

LABEL maintainer="docker@x241c297f.dev"
LABEL description="Ansible Development Container"

ARG USERNAME

USER ${USERNAME}

RUN <<END
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install -y ansible ansible-lint
END

CMD [ "/bin/zsh" ]
