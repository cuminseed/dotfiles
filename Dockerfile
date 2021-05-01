FROM alpine

# update
RUN apk update
RUN apk upgrade

# fundamnetal
RUN apk add vim zsh tmux git
RUN apk add python3

# rust
RUN apk add curl g++
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# x
RUN apk add xeyes

