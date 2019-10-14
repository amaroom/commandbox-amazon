FROM amazonlinux

# We add the commandbox repo definition so we can install our software.
COPY commandbox.repo /etc/yum.repos.d/commandbox.repo

RUN yum update -y && \
    yum install -y commandbox which && \
    rm -rf /var/cache/yum /var/lib/yum && \
    yum clean all && \
    mkdir -p /web

WORKDIR /web

# Add cfconfig helper to import configurations 
# RUN box install commandbox-cfconfig

COPY server.json ./

# Custom libraries can be placed in the lib folder
COPY lib lib

# You can copy your code into the image when you do a build
COPY webroot ROOT

# Pre-warm servlet
RUN box server start && box server stop

EXPOSE 8080

CMD ["box","server","start","console=true"]
