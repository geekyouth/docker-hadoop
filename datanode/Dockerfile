FROM geekyouth/docker-hadoop:base-h{HADOOP_VERSION}-java8-3.0.0

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9864

CMD ["/run.sh"]

# docker build -t geekyouth/docker-hadoop:datanode-h3.1.4-java8-3.0.0 ./datanode
