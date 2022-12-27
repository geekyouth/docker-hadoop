HADOOP_VERSIONS = 3.3.4 3.3.3 3.3.2 3.3.1 3.3.0 3.2.4 3.2.3 3.2.2 3.2.1 3.2.0 3.1.4 3.1.3 3.1.2 3.1.1 3.1.0 3.0.3 3.0.2 3.0.1 3.0.0
PROJECT_VERSION = 3.0.0
JAVA_VERSION = 8

build_base:
	for HADOOP_VERSION in $(HADOOP_VERSIONS) ; do \
		echo "===================> Build for Hadoop-$${HADOOP_VERSION} with java$(JAVA_VERSION)" ; \
		docker login -u geekyouth -p $(DOCKER_TOKEN_RW); \
		docker build --build-arg HADOOP_VERSION=$${HADOOP_VERSION} \
				-t geekyouth/docker-hadoop:base-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:base-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./base; \
        docker push geekyouth/docker-hadoop:base-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
		docker login -u geekyouth -p $(GITHUB_TOKEN) ghcr.io; \
		docker push ghcr.io/geekyouth/docker-hadoop:base-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
	done

build_modules:
	for HADOOP_VERSION in $(HADOOP_VERSIONS) ; do \
		echo "===================> Push for Hadoop-$${HADOOP_VERSION} with java$(JAVA_VERSION)" ; \
		docker login -u geekyouth -p $(DOCKER_TOKEN_RW); \
		sed -i "s/{HADOOP_VERSION}/$${HADOOP_VERSION}/g" */Dockerfile; \
		docker build -t geekyouth/docker-hadoop:namenode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:namenode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./namenode; \
		docker build -t geekyouth/docker-hadoop:datanode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:datanode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./datanode; \
		docker build -t geekyouth/docker-hadoop:resourcemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:resourcemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./resourcemanager; \
		docker build -t geekyouth/docker-hadoop:nodemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:nodemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./nodemanager; \
		docker build -t geekyouth/docker-hadoop:historyserver-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:historyserver-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./historyserver; \
		docker build -t geekyouth/docker-hadoop:submit-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) \
				-t ghcr.io/geekyouth/docker-hadoop:submit-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION) ./submit; \
    	docker push geekyouth/docker-hadoop:namenode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push geekyouth/docker-hadoop:datanode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push geekyouth/docker-hadoop:resourcemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push geekyouth/docker-hadoop:nodemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push geekyouth/docker-hadoop:historyserver-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push geekyouth/docker-hadoop:submit-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker login -u geekyouth -p $(GITHUB_TOKEN) ghcr.io; \
    	docker push ghcr.io/geekyouth/docker-hadoop:namenode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push ghcr.io/geekyouth/docker-hadoop:datanode-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push ghcr.io/geekyouth/docker-hadoop:resourcemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push ghcr.io/geekyouth/docker-hadoop:nodemanager-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push ghcr.io/geekyouth/docker-hadoop:historyserver-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
    	docker push ghcr.io/geekyouth/docker-hadoop:submit-h$${HADOOP_VERSION}-java$(JAVA_VERSION)-$(PROJECT_VERSION); \
	done

# make build_base build_modules
