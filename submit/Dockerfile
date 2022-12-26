FROM geekyouth/hadoop-base:2.0.0-hadoop2.10.2-java8

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

ENV JAR_FILEPATH="$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.4.jar"
ENV CLASS_TO_RUN="wordcount"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
