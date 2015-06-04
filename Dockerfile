FROM buildpack-deps:jessie-scm
MAINTAINER Ritesh Kumar "singhipstlearn@gmail.com"

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV JAVA_VERSION 7u79
ENV JAVA_DEBIAN_VERSION 7u79-2.5.5-1~deb8u1

RUN apt-get update && apt-get install -y openjdk-7-jdk="$JAVA_DEBIAN_VERSION" && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV JRE_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre
ENV LD_LIBRARY_PATH /usr/lib/jvm/java-7-openjdk-amd64/jre/lib:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$JRE_HOME/lib/amd64/serve:$PATH

RUN echo "/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64" >> /etc/ld.so.conf
RUN echo "/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server" >> /etc/ld.so.conf

CMD ldconfig
