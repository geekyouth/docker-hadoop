#!/bin/bash

# 等待 hdfs 自动退出安全模式，防止提交报错
hdfs dfsadmin -safemode wait
# 生成临时目录，防止已存在的目录导致任务失败
TMP=$(date +%s); echo TMP=$TMP
hdfs dfs -mkdir -p /input
hdfs dfs -put $HADOOP_CONF_DIR/* /input
# input/* 包含所有子目录下的文件，防止报错
hadoop jar $JAR_FILEPATH $CLASS_TO_RUN /input/* /output/$TMP
hdfs dfs -cat /output/$TMP/*
