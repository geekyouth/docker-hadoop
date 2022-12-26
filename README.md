# Changes
## 2022-12-24 
- build version `2.0.0-hadoop2.10.2-java8`
- build version `2.0.0-hadoop3.0.1-java8`
- build version `2.0.0-hadoop3.0.2-java8`
- build version `2.0.0-hadoop3.0.3-java8`
- build version `2.0.0-hadoop3.1.0-java8`
- build version `2.0.0-hadoop3.1.1-java8`
- build version `2.0.0-hadoop3.1.2-java8`
- build version `2.0.0-hadoop3.1.3-java8`
- build version `2.0.0-hadoop3.1.4-java8` 💘💘💘
- build version `2.0.0-hadoop3.2.0-java8`
- build version `2.0.0-hadoop3.2.1-java8`
- build version `2.0.0-hadoop3.2.2-java8`
- build version `2.0.0-hadoop3.2.3-java8`
- build version `2.0.0-hadoop3.2.4-java8`
- build version `2.0.0-hadoop3.3.0-java8`
- build version `2.0.0-hadoop3.3.1-java8`
- build version `2.0.0-hadoop3.3.2-java8`
- build version `2.0.0-hadoop3.3.3-java8`
- build version `2.0.0-hadoop3.3.4-java8`

## 2022-12-26
- `./docker-compose.yml` docker compose build and up/restart 挂载 .data/ 目录，反复测试已保证 HDFS数据 + YARN日志 复用
- `./submit/run.sh` 生成临时目录（"yyyymmdd-hhmmss.SSS"），防止已存在的目录导致任务失败
- `./submit` 补充一个完整的单元测试
- `./resourcemanager` 等待 hdfs 自动退出安全模式，防止 resourcemanager 报错
- `./historyserver` historyserver 升级为 timelineserver
- `./.doc` 补充 hadoop stack 兼容性报告

Version 2.0.0 introduces uses wait_for_it script for the cluster startup

# Hadoop Docker

## Supported Hadoop Versions
See repository branches for supported hadoop versions

## Quick Start

To deploy an example HDFS cluster, run:
```
  docker compose up
```

Run example wordcount job:
```
  make wordcount
```

## Configure Environment Variables

The configuration parameters can be specified in the hadoop.env file or as environmental variables for specific services (e.g. namenode, datanode etc.):
```
  CORE_CONF_fs_defaultFS=hdfs://namenode:8020
```

CORE_CONF corresponds to core-site.xml. fs_defaultFS=hdfs://namenode:8020 will be transformed into:
```
  <property><name>fs.defaultFS</name><value>hdfs://namenode:8020</value></property>
```
To define dash inside a configuration parameter, use triple underscore, such as YARN_CONF_yarn_log___aggregation___enable=true (yarn-site.xml):
```
  <property><name>yarn.log-aggregation-enable</name><value>true</value></property>
```

The available configurations are:
* /etc/hadoop/core-site.xml CORE_CONF
* /etc/hadoop/hdfs-site.xml HDFS_CONF
* /etc/hadoop/yarn-site.xml YARN_CONF
* /etc/hadoop/httpfs-site.xml HTTPFS_CONF
* /etc/hadoop/kms-site.xml KMS_CONF
* /etc/hadoop/mapred-site.xml MAPRED_CONF

If you need to extend some other configuration file, refer to base/entrypoint.sh bash script.

---
# important command !!!
```shell
make -f Makefile;
docker compose up;

docker run -it --network=docker-hadoop_default --env-file=hadoop.env --rm geekyouth/hadoop-submit:2.0.0-hadoop3.1.4-java8 /bin/bash

hdfs dfs -mkdir -p /input; \
hdfs dfs -put /opt/hadoop-3.1.4/README.txt /input; \
hadoop jar /opt/hadoop/applications/WordCount.jar WordCount /input /output; \
hdfs dfs -cat /output/*

hdfs dfs -rm -r -f /input
hdfs dfs -rm -r -f /output
```

# important port !!!
- Namenode: <http://127.0.0.1:9870>
- Datanode: <http://127.0.0.1:9864>
- Resource manager: <http://127.0.0.1:8088>
- Nodemanager: <http://127.0.0.1:8042>
- History server: <http://127.0.0.1:8188>

# hosts:
```
127.0.0.1 namenode datanode resourcemanager nodemanager historyserver

```
