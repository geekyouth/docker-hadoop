#!/bin/bash

# 等待 hdfs 自动退出安全模式，防止 resourcemanager 报错
hdfs dfsadmin -safemode wait
yarn --config $HADOOP_CONF_DIR resourcemanager
