FROM geekyouth/docker-hadoop:base-h{HADOOP_VERSION}-java8-3.0.0

LABEL MAINTAINER=https://github.com/geekyouth/docker-hadoop

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9870

CMD ["/run.sh"]

# docker build -t geekyouth/docker-hadoop:namenode-h3.1.4-java8-3.0.0 ./namenode
