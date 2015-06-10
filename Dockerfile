# Creates distributed hadoop 2.6.0

FROM buildpack-deps:wheezy
MAINTAINER kusimari


### JDK 7 http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html #####
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
    && apt-get update \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle/
ENV PATH $JAVA_HOME/bin:$PATH

## SPARK 1.3.1
RUN curl http://d3kbcqa49mib13.cloudfront.net/spark-1.3.1-bin-hadoop2.6.tgz | tar -xz -C /opt/
RUN mv /opt/spark-1.3.1-bin-hadoop2.6 /opt/spark

## PIP and IPYTHON
RUN apt-get install -y python-dev
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install ipython[all]

## BOOT script
ADD boot.sh /etc/boot.sh
RUN chmod +x /etc/boot.sh

### start based on type of node ##########################################################
CMD /etc/boot.sh