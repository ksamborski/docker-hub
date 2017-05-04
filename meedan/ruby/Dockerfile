# meedan/ruby

FROM meedan/nodejs
MAINTAINER sysops@meedan.com

# this and the addition to sources.list is modelled after...
# https://github.com/phusion/passenger-docker/blob/master/image/enable_repos.sh
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
COPY config/apt/passenger-sources.list /etc/apt/sources.list.d/passenger-sources.list

# ruby 2.3 repos
RUN apt-add-repository ppa:brightbox/ruby-ng \
    && apt-get update --fix-missing

# http://www.modrails.com/documentation/Users%20guide%20Nginx.html#_installing_packages
# supervisor is installed since it gets used frequently to kick of delayed job
RUN apt-get install -y \ 
    ruby2.3 \
    ruby2.3-dev \
    ruby2.3-doc \
    build-essential \
    libv8-dev \
    libpq-dev \
    sqlite3 \
    libsqlite3-dev \
    libmysqlclient-dev \
    passenger \
    bcrypt \
		nginx \
    nginx-extras \
    libicu52 \
    supervisor \
    tidy
    
# ruby config
RUN rm /usr/bin/ruby \
    && ln -s /usr/bin/ruby2.3 /usr/bin/ruby \
    && rm -f /usr/bin/gem \
    && ln -s /usr/bin/gem2.3 /usr/bin/gem \
    && rm -f /usr/bin/rake \
    && ln -s /usr/bin/rake2.3 /usr/bin/rake

# bundler
RUN gem install bundler --no-rdoc --no-ri

# nginx
COPY ./config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./config/nginx/passenger.conf /etc/nginx/conf.d/passenger.conf

ONBUILD EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]