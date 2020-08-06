FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.4.2

# install repository-s3 plugin
RUN elasticsearch-plugin install repository-s3 -b

# enable insecure settings (temporarily)
RUN echo '-Des.allow_insecure_settings=true' >> /usr/share/elasticsearch/config/jvm.options 

# expose elasticsearch data as volume
VOLUME /usr/share/elasticsearch/data

# back to elasticsearch
USER elasticsearch
