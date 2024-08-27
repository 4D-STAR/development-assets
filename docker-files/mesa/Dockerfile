# Example Dockerfile
FROM ubuntu:22.04

# Install dependencies (e.g., MESA and its SDK)
RUN apt-get update && apt-get install -y \
    build-essential \
    libreadline-dev \
    curl \
    git \
    wget \
    unzip \
    tcsh \
    zlib1g-dev \
    libx11-dev \
    sudo \
    cmake \
    vim \
    gfortran \
    gcc \
    libgtest-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd /usr/src/gtest/ \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && cp lib/libgtest* /usr/lib/

RUN useradd -m -s /bin/bash mesauser
USER mesauser
WORKDIR /home/mesauser
ENV HOME /home/mesauser

COPY mesasdk-x86_64-linux-23.7.3.tar.gz /home/mesauser
RUN tar -xzf mesasdk-x86_64-linux-23.7.3.tar.gz -C /home/mesauser \
    && echo "export MESASDK_ROOT=/home/mesauser/mesasdk" >>  ~/.bashrc \
    && echo "source /home/mesauser/mesasdk/bin/mesasdk_init.sh" >> ~/.bashrc

ENV MESA_DIR=/home/mesauser/mesa-r24.03.1
ENV MESASDK_ROOT=/home/mesauser/mesasdk
COPY mesa-r24.03.1.zip /home/mesauser
# Install MESA
RUN cd /home/mesauser \
    && unzip mesa-r24.03.1.zip -d /home/mesauser \
    && cd mesa-r24.03.1 \
    && /bin/bash -c "source /home/mesauser/mesasdk/bin/mesasdk_init.sh && ./install"


COPY runTests.sh /home/mesauser

# Set the entrypoint if necessary
ENTRYPOINT ["./runTests.sh"]

