# meedan/pgadmin
# based on https://github.com/AtkinsChang/docker-pgadmin4/blob/master/Dockerfile

FROM meedan/base
MAINTAINER sysops@meedan.com

RUN groupadd -r postgres --gid=999 && useradd -r -g postgres --uid=999 postgres \
    && groupadd -r pgadmin --gid=998 && useradd -r -g pgadmin --uid=998 pgadmin

# libpg
ENV PG_MAJOR 9.6
ENV PG_VERSION 9.6~beta3-1.pgdg16.04+1

RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
    && apt-get update 

RUN apt-get install -y expect python-pip python-dev build-essential libpq-dev postgresql-server-dev-$PG_MAJOR postgresql-client

RUN wget -O pgadmin4-1.0b3-py2-none-any.whl "https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v1.0-beta3/pip/pgadmin4-1.0b3-py2-none-any.whl" 

RUN pip install pgadmin4-1.0b3-py2-none-any.whl \
        && rm pgadmin4-1.0b3-py2-none-any.whl \
        && ln -sf /home/pgadmin/.pgadmin/config_local.py  /usr/local/lib/python2.7/dist-packages/pgadmin4/config_local.py \
        && sed -i "s/DEFAULT_SERVER = 'localhost'/DEFAULT_SERVER = '0.0.0.0'/" /usr/local/lib/python2.7/dist-packages/pgadmin4/config.py

# these ENV vars are intended to get overwritten at docker runtime
ENV PGADMIN_USER admin@pgadmin.org
ENV PGADMIN_PASSWORD pgadmin

VOLUME /home/pgadmin/.pgadmin

COPY bin/docker-entrypoint.sh /opt/bin/docker-entrypoint.sh
RUN chmod 755 /opt/bin/docker-entrypoint.sh

ENTRYPOINT ["/opt/bin/docker-entrypoint.sh"]

EXPOSE 5050
CMD ["/usr/bin/python", "/usr/local/lib/python2.7/dist-packages/pgadmin4/pgAdmin4.py"]