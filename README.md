# Ubuntu16.04 + Apache2.4 + PHP7 + phalcon

docker image based on ubuntu16.04 with last stable PHP Phalcon framework with apache 2.4 webserver installed

This image using ubuntu16.04 image as based image

### Installation

```
$ docker pull engineerball/ubuntu-apache24-php7-phalcon
```

### Usage
```
$ docker run -v /var/www/html:/var/www -p 8080:80 engineerball/ubuntu-apache24-php7-phalcon
```

The apache webserver with Phalcon PHP framework will available on TCP port 8080 on your machine. The document root will be the folder you specified after the -v switch.
