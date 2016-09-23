FROM node:6.4

RUN npm install -g elasticdump

RUN apt-get update && apt-get install netcat -qy && apt-get clean

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

RUN mkdir -p /opt/kibana

CMD ["/tmp/entrypoint.sh"]
