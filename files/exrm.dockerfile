FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y wget git build-essential && \
    wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
    dpkg -i erlang-solutions_1.0_all.deb && \
    apt-get update && \
    apt-get install -y erlang && \
    echo "set nocompatible" > /root/.vimrc

# ENSURE UTF-8
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV MIX_ENV prod

ADD bin /usr/local/dockerbin
ENV PATH /usr/local/dockerbin:$PATH

WORKDIR /opt/elixir-build/@ELIXIR_VERSION@
RUN git clone --branch @ELIXIR_VERSION@ --depth 1 https://github.com/elixir-lang/elixir.git && \
  cd /opt/elixir-build/@ELIXIR_VERSION@/elixir && \
  make install

RUN cd /opt && \
  git clone @EXRM_REPO@ app && \
  cd app && \
  git checkout @EXRM_VERSION@ && \
  mix local.hex --force && \
  mix local.rebar --force && \
  mix deps.get && \
  mix release

WORKDIR /opt/app