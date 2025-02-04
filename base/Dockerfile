FROM debian:9

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop
ENV TZ=Asia/Shanghai

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    net-tools \
    curl \
    netcat \
    gnupg \
    libsnappy-dev \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

# https://refine.dev/blog/docker-build-args-and-env-vars/
ARG HADOOP_VERSION=3.1.4
ENV HADOOP_VERSION=$HADOOP_VERSION
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg -q --import KEYS

RUN set -x \
    && curl -fsSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fsSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg -q --verify /tmp/hadoop.tar.gz.asc \
    && tar -xf /tmp/hadoop.tar.gz -C /opt/ \
    && rm -rf /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# docker build --build-arg HADOOP_VERSION=3.1.4 -t geekyouth/docker-hadoop:base-h3.1.4-java8-3.0.0 ./base
# docker push geekyouth/docker-hadoop:base-h3.1.4-java8-3.0.0
