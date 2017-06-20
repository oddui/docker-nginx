# My nginx docker image [![Docker Build Statu](https://img.shields.io/docker/build/ziyu/nginx.svg)](https://hub.docker.com/r/ziyu/nginx)

Run nginx with [server-configs-nginx](https://github.com/h5bp/server-configs-nginx).

## Volumes

/certs

/content

## Build

```sh
  docker build -t my-nginx .
```

## Run

Forward port and 443 to host.

```sh
  docker run -d \
        -v /my/content:/content:ro \
        -v /my/certs:/certs:ro \
        -p 80:80 \
        -p 443:443 \
        --name nginx \
        my-nginx
```

Or use the host's network stack.

```sh
  docker run -d \
        -v /my/content:/content:ro \
        -v /my/certs:/certs:ro \
        --network host \
        --name nginx \
        my-nginx
```

Run and access shell in the container.

```sh
  docker run -it --rm my-nginx /bin/sh
```

## SSL certs for testing

In Keychain Access
1. Create CA if not already done so
2. Create a certificate signing request
3. Create the certificate as CA using the certificate signing request
4. Export the certificate as .p12 format

Convert the .p12 file to .crt and .key files (see https://gist.github.com/ericharth/8334664)

## SSL certs for production

Use certbot
