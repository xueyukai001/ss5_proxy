# socks5_proxy
Socks5 Proxy Server
Usage
Run Socks5 Proxy Server
$ docker run -d --name socks5_proxy -p 1080:1080 --restart=always imdevops/socks5_proxy:latest
The default port is 1080, no authorization required.

Set authorization
You can set authorization, for example:

$ docker run -d --name socks5_proxy -p 1080:1080 -e USER=admin -e PASS=admin --restart=always imdevops/socks5_proxy:latest
