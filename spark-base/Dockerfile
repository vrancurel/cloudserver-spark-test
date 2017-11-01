FROM java:openjdk-8-jdk
MAINTAINER Vianney Rancurel <vr@scality.com>

ENV HADOOP_VERSION 2.8.1

RUN apt-get update \
    && apt-get install -y supervisor curl build-essential \
    python git maven --no-install-recommends \
    && mkdir -p /var/log/supervisor \
    && curl --retry 6 \
    -fSL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz -o /tmp/hadoop.tar.gz \
    && apt-get install -y supervisor curl --no-install-recommends \
    && mkdir -p /var/log/supervisor \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz

RUN mkdir -p /apps/build/ && \
    cd /apps/build/ && \
    git clone https://github.com/apache/spark.git && \
    mv spark spark-2.1.1_2.11 && \
    cd spark-2.1.1_2.11 && \
    git checkout tags/v2.1.1 && \
   ./dev/change-scala-version.sh 2.11

RUN cd /apps/build/spark-2.1.1_2.11 && /apps/build/spark-2.1.1_2.11/dev/make-distribution.sh --name spark-2.1.1_2.11 --tgz -Phadoop-2.7 -Dhadoop.version=$HADOOP_VERSION -DskipTests -DXms=2g

ENV SPARK_HOME /spark/

RUN tar -zxvf /apps/build/spark-2.1.1_2.11/spark-2.1.1-bin-spark-2.1.1_2.11.tgz -C /tmp/ && mkdir -p $SPARK_HOME && cp -rf /tmp/spark-2.1.1-bin-spark-2.1.1_2.11/* $SPARK_HOME && \
    rm -rf -- /tmp/spark-2.1.1-bin-spark-2.1.1_2.11/

CMD bash
