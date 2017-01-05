FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get -y install curl

# JAVA
ARG JAVA_ARCHIVE=http://repo.softnix.dev/server-jre-8u112-linux-x64.tar.gz
ENV JAVA_HOME /usr/local/jdk1.8.0_112

ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -s ${JAVA_ARCHIVE} | tar -xz -C /usr/local/ && ln -s $JAVA_HOME /usr/local/java 

# SPARK
ARG SPARK_ARCHIVE=http://repo.softnix.dev/spark-2.0.2-bin-hadoop2.7.tgz
ENV SPARK_HOME /usr/local/spark-2.0.2-bin-hadoop2.7

ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/

WORKDIR $SPARK_HOME
