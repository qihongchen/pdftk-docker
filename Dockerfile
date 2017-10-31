From centos:6.6

RUN yum -y install libgcj \
  && yum -y install wget \
  && wget -O /root/pdftk-2.02-1.el6.x86_64.rpm https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-2.02-1.el6.x86_64.rpm \
  && rpm -i /root/pdftk-2.02-1.el6.x86_64.rpm

WORKDIR /root
