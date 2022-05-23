FROM ubuntu:22.10
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
    zsh \
    cmake

# Install Oh-My-Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)"

# Install Peda
RUN git clone https://github.com/longld/peda.git ~/peda
RUN echo "source ~/peda/peda.py" >> ~/.gdbinit

# Installation of Cmake from the source
RUN wget https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1.tar.gz
RUN tar -zxvf cmake-3.23.1.tar.gz
RUN cd cmake-3.23.1 && ./bootstrap
RUN cd cmake-3.23.1 && gmake 
RUN cd cmake-3.23.1 && make install
# Clean installation
RUN rm -rf cmake-3.23.1 cmake-3.23.1.tar.gz
