FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget git build-essential

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y erlang

# ENSURE UTF-8
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN echo "set nocompatible" > /root/.vimrc

WORKDIR /opt/elixir-build/@ELIXIR_VERSION@
RUN git clone https://github.com/elixir-lang/elixir.git

WORKDIR elixir
RUN git checkout @ELIXIR_VERSION@
RUN make install
