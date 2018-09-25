FROM centos:7

USER root
RUN useradd -m -s /bin/bash default
RUN yum -y install bind-utils openssh-clients iproute nc wget vim telnet \
tcpdump net-tools epel-release stress \
&& yum -y install python-pip htop iotop \
&& yum clean all
RUN pip install kubernetes

USER default
ENTRYPOINT ["/bin/nc", "-vlkp", "7000"]
EXPOSE 7000
