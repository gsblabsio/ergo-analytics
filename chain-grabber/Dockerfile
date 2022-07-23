FROM debian:latest

ARG EXPLORER_VERSION

# Preparing the RPi
RUN apt update -y
RUN apt full-upgrade -y

# Download latest Java version
RUN apt install default-jdk -y

# Install useful utilities
RUN apt install wget unzip curl gnupg2 -y

# Download sbt
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt update -y
RUN apt install sbt -y

# Download and unzip precompiled JAR
RUN wget -O explorer-backend-$EXPLORER_VERSION.zip https://github.com/ergoplatform/explorer-backend/archive/refs/tags/$EXPLORER_VERSION.zip
RUN unzip explorer-backend-$EXPLORER_VERSION
RUN rm explorer-backend-$EXPLORER_VERSION.zip

# Install PostgreSQL client
RUN apt install postgresql-client -y

# Set up entrypoint
ADD ./docker-entrypoint.sh .
WORKDIR /explorer-backend-$EXPLORER_VERSION
ENTRYPOINT ["/docker-entrypoint.sh"]
