#!/bin/bash

# 等待 hdfs 自动退出安全模式，防止提交报错
hdfs dfsadmin -safemode wait
# 生成临时目录（"yyyymmdd-hhmmss.SSS"），防止已存在的目录导致任务失败
TMP=$(date +%Y%m%d-%H%M%S.%3N); echo TMP=$TMP
hdfs dfs -mkdir -p /input/$TMP
hdfs dfs -put $HADOOP_CONF_DIR/* /input/$TMP
# input/$TMP/* 包含所有子目录下的文件，防止报错
hadoop jar $JAR_FILEPATH $CLASS_TO_RUN /input/$TMP/* /output/$TMP
hdfs dfs -cat /output/$TMP/*
