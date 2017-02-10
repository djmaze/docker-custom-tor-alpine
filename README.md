# docker-custom-tor-alpine

Small (**14 MB**), customizable docker image with Tor on Alpine Linux.

```
docker run -d -p 9050:9050 mazzolino/custom-tor-alpine
curl --socks5 localhost:9050 https://www.google.com
```

## Configuration

It is possible to define configuration options for the Tor daemon using env variables. Just define a variable prefixed with `TOR_`, as shown in this example:

```
docker run -d -p 9050:9050 -e TOR_ExitNodes="{de}" mazzolino/custom-tor-alpine
```

The `torrc` will now contain:

```
ExitNodes {de}
```

## Known Issues

* We're using `testing` versions of tor and runit in Alpine. Got to keep an eye on future builds, until those packages reach `main` in Alpine.

## Other interesting projects

* [docker-tor-privoxy-alpine](https://github.com/djmaze/docker-tor-privoxy-alpine/tree/allow-configuration), similar image but running privoxy in front of tor
