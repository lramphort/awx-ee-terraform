FROM quay.io/ansible/awx-ee:latest

ENV TERRAFORM_VERSION=1.1.9

USER root
RUN yum install -y unzip
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
RUN unzip -d /usr/local/bin /tmp/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/terraform  && \
    ln -s /usr/local/bin/terraform /usr/bin/terraform

USER 1000:0
