FROM debian:trixie-slim as builder

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    gfortran \
    unzip \
    zlib1g-dev \
    libx11-dev \
    cmake \
    tcsh \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash mesauser
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



# Stage 2: Create the final image with just the necessary runtime components
FROM debian:trixie-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    gfortran \
    unzip \
    zlib1g-dev \
    libx11-dev \
    cmake \
    tcsh \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash mesauser
USER mesauser
WORKDIR /home/mesauser
ENV HOME /home/mesauser

COPY --from=builder /home/mesauser/mesa-r24.03.1/lib /home/mesauser/mesa-r24.03.1/lib
COPY --from=builder /home/mesauser/mesa-r24.03.1/include /home/mesauser/mesa-r24.03.1/include
COPY --from=builder /home/mesauser/mesa-r24.03.1/data/kap_data /home/mesauser/mesa-r24.03.1/data/kap_data
COPY --from=builder /home/mesauser/mesa-r24.03.1/data/chem_data /home/mesauser/mesa-r24.03.1/data/chem_data

COPY --from=builder /home/mesauser/mesasdk /home/mesauser/mesasdk

COPY runTests.sh /home/mesauser
USER root
RUN chmod a+x runTests.sh
USER mesauser
ENV MESA_DIR=/home/mesauser/mesa-r24.03.1
ENV MESASDK_ROOT=/home/mesauser/mesasdk

ENTRYPOINT ["./runTests.sh"]


