FROM ergoplatform/ergo:latest

USER root
RUN apt update

# curl, ps and awk commands
RUN apt install curl -y
RUN apt install procps -y
RUN apt install gawk -y

WORKDIR /home/ergo
ENV PATH="/home/ergo:${PATH}"
ADD ./ergo.conf .
ADD ./docker-entrypoint.sh .
ADD ./commands/* .

USER ergo

ENTRYPOINT ["/home/ergo/docker-entrypoint.sh"]
