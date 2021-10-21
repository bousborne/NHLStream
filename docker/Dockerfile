# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Aditya Patawari" <adimania@fedoraproject.org>

FROM centos:centos7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install python36 python36-pip; yum clean all
RUN pip3 install --upgrade pip
RUN pip3 install pyvmomi 
RUN pip3 install pyyaml
# Install downrev version of cryptograpy to avoid paramiko warning.  There is a fix for paramiko but it's not yet released
RUN pip3 install cryptography==2.4.2
#RUN pip3 install cryptography
RUN pip3 install paramiko
RUN pip3 install scp
RUN curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" | tar -C /usr/local/bin -xvzf - govc
ENV PYTHONPATH=/deploy/pyvmomi-community-samples/samples/
WORKDIR /deploy
ENTRYPOINT ["/bin/bash"]
