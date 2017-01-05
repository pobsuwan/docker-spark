FROM ubuntu:14.04

RUN sed -i "s/archive.ubuntu.com/th.archive.ubuntu.com/" /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install curl python

# PYTHON
ENV PYTHONPATH /usr/lib/python2.7

# JAVA
ARG JAVA_ARCHIVE=http://192.168.10.156/server-jre-8u112-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_112

ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -s ${JAVA_ARCHIVE} | tar -xzC /opt/ && ln -s $JAVA_HOME /usr/local/java 

# SPARK
ARG SPARK_ARCHIVE=http://192.168.10.156/spark-2.0.2-bin-hadoop2.7.tgz
ENV SPARK_HOME /opt/spark

ENV PATH $PATH:${SPARK_HOME}/bin
RUN curl -s ${SPARK_ARCHIVE} | tar -xzC /opt/ && mv /opt/spark-* /opt/spark

ENV PYTHONPATH $PYTHONPATH:${SPARK_HOME}/python
ENV PYTHONPATH $PYTHONPATH:${SPARK_HOME}/python/lib/py4j-0.10.3-src.zip

WORKDIR $SPARK_HOME
