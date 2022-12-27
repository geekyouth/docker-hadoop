FROM geekyouth/docker-hadoop:base-h{HADOOP_VERSION}-java8-3.0.0

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1

ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/hadoop/yarn/timeline
RUN mkdir -p /hadoop/yarn/timeline
VOLUME /hadoop/yarn/timeline

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8188

CMD ["/run.sh"]

# docker build -t geekyouth/docker-hadoop:historyserver-h3.1.4-java8-3.0.0 ./historyserver
