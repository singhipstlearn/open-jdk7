FROM buildpack-deps:jessie-scm
MAINTAINER Ritesh Kumar "singhipstlearn@gmail.com"

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV JAVA_VERSION 7u79
ENV JAVA_DEBIAN_VERSION 7u79-2.5.5-1~deb8u1

RUN apt-get update && apt-get install -y openjdk-7-jdk="$JAVA_DEBIAN_VERSION" && rm -rf /var/lib/apt/lists/*
