# SS5 Proxy Server

FROM centos:7.6.1810

MAINTAINER Soar

RUN TOOLS="wget gcc make pam-devel openldap-devel openssl-devel" \
  && yum -y install $TOOLS --nogpgcheck \ 
  && wget https://superb-dca2.dl.sourceforge.net/project/ss5/ss5/3.8.9-8/ss5-3.8.9-8.tar.gz \
  && tar xvf ss5-3.8.9-8.tar.gz \
  && cd ss5-3.8.9 \
  && ./configure \
  && make \
  && make install \
  && cd / \
  && chmod +x /etc/init.d/ss5 \
  && rm -rf ss5-3.8.9 \
  && rm -f ss5-3.8.9-8.tar.gz \
  && yum remove -y $TOOLS \
  && rm -rf  /var/cache/yum \
  && sed -i "/#auth/a\auth 0.0.0.0\/0 - -" /etc/opt/ss5/ss5.conf \
  && sed -i "/#permit/a\permit - 0.0.0.0\/0 - 0.0.0.0\/0 - - - - -" /etc/opt/ss5/ss5.conf \
  && groupadd -r ss5 \
  && useradd -r -g ss5 ss5

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 1080

ENTRYPOINT ["/entrypoint.sh"]
