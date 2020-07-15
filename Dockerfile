FROM ubuntu:20.04
RUN apt update && apt upgrade -y && apt install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

ENV HADOOP_VERSION 2.10.0
ADD hadoop-2.10.0.tar.gz /hadoop
ENV HADOOP_HOME /hadoop/hadoop-$HADOOP_VERSION

ENV HIVE_VERSION 2.3.7
ADD apache-hive-2.3.7-bin.tar.gz /hive
ENV HIVE_HOME /hive/apache-hive-$HIVE_VERSION-bin

ENV TEZ_VERSION 0.9.2
ADD apache-tez-0.9.2-bin.tar.gz /tez
ENV TEZ_HOME /tez/apache-tez-0.9.2-bin
ENV TEZ_JARS $TEZ_HOME
ADD tez-site.xml $TEZ_HOME/conf/tez-site.xml

ENV HADOOP_INSTALL $HADOOP_HOME
ENV PATH $PATH:$HADOOP_INSTALL/sbin
ENV HADOOP_MAPRED_HOME $HADOOP_INSTALL
ENV HADOOP_COMMON_HOME $HADOOP_INSTALL
ENV HADOOP_HDFS_HOME $HADOOP_INSTALL
ENV YARN_HOME $HADOOP_INSTALL
ENV PATH $HADOOP_HOME/bin:$PATH
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_CLASSPATH $HADOOP_CLASSPATH:$TEZ_HOME/conf:${TEZ_JARS}/*:${TEZ_JARS}/lib/*

RUN cd $HIVE_HOME && $HIVE_HOME/bin/schematool -initSchema -dbType derby
