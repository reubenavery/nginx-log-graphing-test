FROM ubuntu:trusty

RUN apt-get update && apt-get install curl -qy && apt-get clean

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
