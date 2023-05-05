FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Canada/Pacific

RUN ( \
    apt update \
    && apt-get -yy install locales \
    && apt -yy install \
            wget curl \
            libssl-dev automake autoconf zip ninja-build python-jinja2 build-essential \
            libncurses5-dev libncursesw5-dev gperf bison flex libtool graphviz doxygen iputils-ping \
            bsdiff libbz2-dev zlib1g-dev libcurl4-gnutls-dev gcovr libxml2-utils bc cpio chrpath gawk texinfo diffstat \
            git cmake python-xmltodict python3-git repo \
            default-jre lbzip2 sshpass screen subversion socat gcc-multilib libsdl-dev \
    # Install leaf
    && wget https://downloads.sierrawireless.com/tools/leaf/leaf_latest.deb -O /tmp/leaf_latest.deb \
    && apt -yy install /tmp/leaf_latest.deb \
    && rm /tmp/leaf_latest.deb \
    # Install swiflash
    && wget https://downloads.sierrawireless.com/tools/swiflash/swiflash_latest.deb -O /tmp/swiflash_latest.deb \
    && apt-get -yy install /tmp/swiflash_latest.deb \
    && rm /tmp/swiflash_latest.deb \
    # Install swicwe
    && wget https://downloads.sierrawireless.com/tools/swicwe/swicwe_latest.deb -O /tmp/swicwe_latest.deb \
    && apt-get -yy install /tmp/swicwe_latest.deb \
    && rm /tmp/swicwe_latest.deb \
    # Clean system
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
)

RUN ( \
    git config --global user.email "leaf-user@example.com" \
    && git config --global user.name "Leaf User" \
    && curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/bin/repo \
    && chmod a+rx /usr/bin/repo \
)

RUN ( \
    mkdir /leaf \
    && cd /leaf \
    && leaf init \
)

WORKDIR /leaf
