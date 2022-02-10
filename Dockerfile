FROM centos:7 AS builder

ARG GIT_COMMITISH="develop"
ARG NPROCS="1"

RUN yum groupinstall -y "Development Tools"

WORKDIR /opt/hmmer
RUN git clone https://github.com/EddyRivasLab/hmmer . \
    && git checkout $GIT_COMMITISH \
    && git clone https://github.com/EddyRivasLab/easel \
    && (cd easel && git checkout $GIT_COMMITISH) \
    && autoconf \
    && CFLAGS='-std=gnu99' ./configure --prefix /opt/hmmer/ \
    && make -j $NPROCS \
    && make install \
    && (cd easel && make install)

FROM ubuntu:20.04
WORKDIR /opt/hmmer
COPY --from=builder /opt/hmmer .
