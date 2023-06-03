FROM ubuntu:22.04

# ユーザの追加
ARG USERNAME
ARG PASSWORD
RUN useradd -m ${USERNAME} && \
    echo ${USERNAME}:${PASSWORD} | chpasswd && \
    usermod --shell /bin/bash ${USERNAME} && \
    usermod -aG sudo ${USERNAME}

# 必要なパッケージや設定のインストール
RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential curl git make openssh-server tmux vim zsh

# ユーザーの切り替え
USER ${USERNAME}