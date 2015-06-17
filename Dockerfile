FROM ubuntu:14.04
MAINTAINER Ritesh Kumar "singhipstlearn@gmail.com"

RUN locale-gen en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN apt-get update && apt-get install -y unzip && apt-get install -y locales && rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV JAVA_VERSION 7u79
ENV JAVA_DEBIAN_VERSION 7u79-2.5.5-1~deb8u1

RUN apt-get update && apt-get install -y openjdk-7-jdk="$JAVA_DEBIAN_VERSION" && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JRE_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre
ENV LD_LIBRARY_PATH /usr/lib/jvm/java-7-openjdk-amd64/jre/lib:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$JRE_HOME/lib/amd64/serve:$PATH

EXPOSE 22

RUN echo "/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64" >> /etc/ld.so.conf
RUN echo "/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server" >> /etc/ld.so.conf

RUN ldconfig
