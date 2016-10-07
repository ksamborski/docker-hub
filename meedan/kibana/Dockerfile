# meedan/kibana
# kibana 4 with plugins
#  * sense
#  * timelion

FROM kibana:latest
MAINTAINER sysops@meedan.com

RUN gosu kibana /opt/kibana/bin/kibana plugin --install elastic/sense
RUN gosu kibana /opt/kibana/bin/kibana plugin --install elastic/timelion