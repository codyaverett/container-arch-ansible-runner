FROM archlinux/base:latest as intermediate
LABEL Name=ansible-runner Version=0.0.1 Maintainer=cody@codee.codes

# add credentials on build
ARG SSH_PRIVATE_KEY
ARG SSH_PUBLIC_KEY

RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN echo "${SSH_PUBLIC_KEY}" > /root/.ssh/id_rsa.pub

FROM archlinux/base:latest

COPY --from=intermediate /root/.ssh/ /root/.ssh/

# Install packages
RUN pacman -Syyu --noconfirm
RUN pacman -S git ansible openssh nodejs-lts-dubnium npm vim --noconfirm

RUN cat /root/.ssh/id_rsa.pub

WORKDIR /root
