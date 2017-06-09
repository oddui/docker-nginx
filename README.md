# My nginx docker image

Run nginx in a container.

## Volumes

/certs
/content

## Build

```sh
  docker build -t my-nginx .
```

## Run

```sh
  docker run -d \
        -p 80:80 \
        -p 443:443 \
        -v /my/content:/content:ro \
        -v /my/certs:/certs:ro \
        --name nginx \
        my-nginx
```

```sh
  docker run -it --rm my-nginx /bin/sh
```

## Configs

See https://github.com/h5bp/server-configs-nginx for nginx configs.

## SSL certs for testing

In Keychain Access
1. Create CA if not already done so
2. Create a certificate signing request
3. Create the certificate as CA using the certificate signing request
4. Export the certificate as .p12 format

Convert the .p12 file to .crt and .key files (see https://gist.github.com/ericharth/8334664)


## SSL certs for production

Use certbot
