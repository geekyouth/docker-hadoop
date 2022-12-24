FROM geekyouth/hadoop-base:2.0.0-hadoop3.3.1-java8

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
