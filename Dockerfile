# Pull base image.
#FROM bigboards/cdh-base-__arch__
FROM bigboards/cdh-base-x86_64

MAINTAINER bigboards
USER root 

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y impala impala-state-store impala-catalog impala-server impala-shell \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

ADD docker_files/impala-server-run.sh /apps/impala-server-run.sh
ADD docker_files/impala-statestore-run.sh /apps/impala-statestore-run.sh
ADD docker_files/impala-catalog-run.sh /apps/impala-catalog-run.sh
RUN chmod a+x /apps/impala-server-run.sh /apps/impala-statestore-run.sh /apps/impala-catalog-run.sh

# declare the volumes
RUN mkdir /etc/impala/conf.bb && \
    update-alternatives --install /etc/impala/conf impala-conf /etc/impala/conf.bb 1 && \
    update-alternatives --set impala-conf /etc/impala/conf.bb
VOLUME /etc/impala/conf.bb

# https://www.cloudera.com/documentation/enterprise/latest/topics/cm_ig_ports_impala.html
EXPOSE 15000 15001 15002 21000 21050 22000 23000 23020 24000 26000 28000 25000 25010 25020

CMD ["/bin/bash"]
