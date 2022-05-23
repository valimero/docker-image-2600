FROM ubuntu:22.10
WORKDIR /app
RUN apt-get update && apt-get install -y ssh \
    tar zip unzip curl \
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
    zsh \
    cmake

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)"

# Install Peda
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit
