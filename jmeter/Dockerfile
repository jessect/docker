FROM alpine:latest

# jmeter version
ARG JMETER_VERSION=5.2.1

# download and install packages
RUN set -ex && \
    apk update -f && \
    apk --no-cache add -f openjdk11-jdk ttf-dejavu freetype wget telnet zip && \
    rm -rf /var/cache/apk/*

# install jmeter
RUN   mkdir -p /jmeter/scripts /jmeter/reports \
      && cd /jmeter/ \
      && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
      && tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
      && rm apache-jmeter-$JMETER_VERSION.tgz

# add plugins
ADD jmeter-plugins/ /jmeter/apache-jmeter-$JMETER_VERSION/

# set jmeter vars
ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/
ENV PATH $JMETER_HOME/bin:$PATH

# configure entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
COPY jmeter-load.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

# default command
CMD ["/usr/local/bin/jmeter-load.sh"]
