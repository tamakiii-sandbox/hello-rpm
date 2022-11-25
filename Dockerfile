FROM amazonlinux:2.0.20221103.3

RUN yum update -y && \
    yum install -y \
      rpmdevtools \
      rpmlint \
      make \
      which \
      less \
      tree \
      && \
    yum clean all && \
    rm -rf /var/cache/yum
