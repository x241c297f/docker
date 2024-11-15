FROM x241c297f/common-development-base:latest

LABEL maintainer="docker@x241c297f.dev"
LABEL description="Ansible Development Container"

RUN <<END
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt-get install -y ansible ansible-lint
END

CMD [ "/bin/zsh" ]
