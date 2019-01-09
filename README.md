# SS5 Proxy Server
## Usage
### Run SS5 Proxy Server

```
$ docker run -d --name ss5_proxy -p 1080:1080 --restart=always imdevops/ss5_proxy:latest
```
The default socks5 port is 1080, no authorization required.

### Set authorization
You can set authorization, for example:

```
$ docker run -d --name ss5_proxy -p 1080:1080 -e USER=admin -e PASS=admin --restart=always imdevops/ss5_proxy:latest
```
