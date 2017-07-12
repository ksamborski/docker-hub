# meedan/nginx

# based on https://github.com/nginxinc/docker-nginx/blob/14aa3b1b80341099afbf90eb0a9b9061b7145f18/mainline/stretch/Dockerfile

FROM meedan/base
MAINTAINER sysops@meedan.com

RUN useradd --no-create-home nginx -G www-data

RUN apt-get install --no-install-recommends --no-install-suggests -y \ 
	nginx-common \
	nginx-extras \
	ca-certificates

CMD ["nginx","-g","daemon off;"]