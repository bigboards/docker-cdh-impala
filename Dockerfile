# Pull base image.
#FROM bigboards/cdh-base-__arch__
FROM bigboards/cdh-base-x86_64

MAINTAINER bigboards
USER root 

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y impala impala-shell \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

ADD docker_files/impala-server-run.sh /apps/impala-server-run.sh
ADD docker_files/impala-statestore-run.sh /apps/impala-statestore-run.sh
ADD docker_files/impala-catalog-run.sh /apps/impala-catalog-run.sh
RUN chmod a+x /apps/impala-server-run.sh /apps/impala-statestore-run.sh /apps/impala-catalog-run.sh

# declare the volumes
RUN mkdir /etc/hadoop/conf.bb && \
    update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.bb 1 && \
    update-alternatives --set hadoop-conf /etc/hadoop/conf.bb
VOLUME /etc/hadoop/conf.bb

# external ports
EXPOSE 25000 25010 25020

CMD ["/bin/bash"]
