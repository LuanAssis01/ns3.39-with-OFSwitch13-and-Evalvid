FROM ubuntu:20.04
LABEL description="Docker image for NS-3.39"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  wget gnupg vim nano autoconf build-essential clang valgrind \
  gsl-bin libgsl-dev libgslcblas0 flex bison libfl-dev \
  tcpdump tshark sqlite3 libsqlite3-dev libxml2 libxml2-dev \
  vtun lxc qtbase5-dev \
  python3 python3-dev python3-setuptools \
  cmake ninja-build git make pkg-config libtool libboost-dev \
  libc6-dev libc6-dev-i386 g++-multilib g++ \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr

RUN git clone https://gitlab.com/nsnam/ns-3-dev.git && cd ns-3-dev && git checkout ns-3.39

WORKDIR /usr/ns-3-dev/contrib

RUN git clone https://github.com/ljerezchaves/ofswitch13.git && cd ofswitch13 && git checkout 5.2.2

WORKDIR /usr/ns-3-dev

RUN patch -p1 < contrib/ofswitch13/utils/ofswitch13-3_39.patch

RUN ./ns3 configure --enable-examples --enable-tests && ./ns3 build
