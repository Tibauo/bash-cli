FROM centos:latest
ARG cli_name
RUN yum update -y
COPY install /tmp
RUN /tmp/installation/install.sh ${cli_name}
