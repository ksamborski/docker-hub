# meedan/kibana
# kibana 4 with the sense and marvel plugins

FROM kibana:latest
MAINTAINER sysops@meedan.com

RUN gosu kibana /opt/kibana/bin/kibana plugin --install elastic/sense
RUN gosu kibana kibana plugin --install elasticsearch/marvel