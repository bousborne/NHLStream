# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   "Aditya Patawari" <adimania@fedoraproject.org>

FROM ubuntu:21.04
WORKDIR /NHLStream
#MAINTAINER The CentOS Project <cloud-ops@centos.org>
# ENV TZ=America/Denver
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# RUN apt-get update && apt-get -y upgrade
# RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install apt-utils tzdata
# RUN apt-get install -y python3 python3-pip curl vim
# RUN pip3 install --upgrade pip
# RUN pip3 install pyvmomi
# RUN pip3 install pyyaml
# # Install downrev version of cryptograpy to avoid paramiko warning.  There is a fix for paramiko but it's not yet released
# RUN pip3 install cryptography==2.4.2
# RUN pip3 install cryptography
# RUN pip3 install paramiko
# RUN pip3 install scp
# RUN curl -L -o - "https://github.com/vmware/govmomi/releases/latest/download/govc_$(uname -s)_$(uname -m).tar.gz" | tar -C /usr/local/bin -xvzf - govc
# ENV PYTHONPATH=/deploy/pyvmomi-community-samples/samples/
# WORKDIR /NHL
ENTRYPOINT ["/bin/bash"]
