FROM geekyouth/docker-hadoop:base-h{HADOOP_VERSION}-java8-3.0.0

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

ENV JAR_FILEPATH="$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-{HADOOP_VERSION}.jar"
ENV CLASS_TO_RUN="wordcount"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]

# docker build -t geekyouth/docker-hadoop:submit-h3.1.4-java8-3.0.0 .
