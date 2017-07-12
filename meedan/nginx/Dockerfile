# meedan/nginx

FROM meedan/base
MAINTAINER sysops@meedan.com

RUN useradd --no-create-home nginx -G www-data \
	&& apt-get install --no-install-recommends --no-install-suggests -y \ 
	nginx-common \
	nginx-extras \
	ca-certificates

CMD ["nginx","-g","daemon off;"]