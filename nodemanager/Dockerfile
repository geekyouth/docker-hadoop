FROM geekyouth/docker-hadoop:base-h{HADOOP_VERSION}-java8-3.0.0

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]

# docker build -t geekyouth/docker-hadoop:nodemanager-h3.1.4-java8-3.0.0 ./nodemanager
