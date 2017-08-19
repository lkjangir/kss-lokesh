FROM ubuntu:16.04
MAINTAINER lk.jangir18@gmail.com
RUN apt-get update
RUN apt-get update && apt-get -y install \
   software-properties-common \
   python-software-properties \
   wget \
   curl \
   vim \
   build-essential \
   net-tools \
   unzip

#Install openjdk-8-jre
RUN apt-get update
RUN apt-get install -y openjdk-8-jre
COPY target/kss-lokesh-1.0-SNAPSHOT.jar /root/kss-lokesh.jar
CMD ["java","-jar","root/kss-lokesh.jar"]
