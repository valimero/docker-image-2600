FROM debian:11.2
WORKDIR /app
RUN apt-get update && apt-get install -y ssh \
    build-essential \
    gcc \
    libcriterion-dev \
    man \
    watch \
    make \
    python3 \
    gdb \
    vim \
    git \
    python3 \
    tree \
    tmux \
    curl \
    zsh

RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit
