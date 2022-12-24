DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t geekyouth/hadoop-base:$(current_branch) ./base
	docker build -t geekyouth/hadoop-namenode:$(current_branch) ./namenode
	docker build -t geekyouth/hadoop-datanode:$(current_branch) ./datanode
	docker build -t geekyouth/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t geekyouth/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t geekyouth/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t geekyouth/hadoop-submit:$(current_branch) ./submit

push:
	docker login -u geekyouth -p $(DOCKER_TOKEN_RW)
	docker push geekyouth/hadoop-base:$(current_branch)
	docker push geekyouth/hadoop-namenode:$(current_branch)
	docker push geekyouth/hadoop-datanode:$(current_branch)
	docker push geekyouth/hadoop-resourcemanager:$(current_branch)
	docker push geekyouth/hadoop-nodemanager:$(current_branch)
	docker push geekyouth/hadoop-historyserver:$(current_branch)
	docker push geekyouth/hadoop-submit:$(current_branch)
	docker login -u geekyouth -p $(GITHUB_TOKEN) ghcr.io
	docker tag geekyouth/hadoop-base:$(current_branch) ghcr.io/geekyouth/hadoop-base:$(current_branch)
	docker tag geekyouth/hadoop-namenode:$(current_branch) ghcr.io/geekyouth/hadoop-namenode:$(current_branch)
	docker tag geekyouth/hadoop-datanode:$(current_branch) ghcr.io/geekyouth/hadoop-datanode:$(current_branch)
	docker tag geekyouth/hadoop-resourcemanager:$(current_branch) ghcr.io/geekyouth/hadoop-resourcemanager:$(current_branch)
	docker tag geekyouth/hadoop-nodemanager:$(current_branch) ghcr.io/geekyouth/hadoop-nodemanager:$(current_branch)
	docker tag geekyouth/hadoop-historyserver:$(current_branch) ghcr.io/geekyouth/hadoop-historyserver:$(current_branch)
	docker tag geekyouth/hadoop-submit:$(current_branch) ghcr.io/geekyouth/hadoop-submit:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-base:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-namenode:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-datanode:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-resourcemanager:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-nodemanager:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-historyserver:$(current_branch)
	docker push ghcr.io/geekyouth/hadoop-submit:$(current_branch)

# make build push
