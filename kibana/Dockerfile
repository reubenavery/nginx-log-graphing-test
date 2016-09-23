FROM kibana:4.6.1

RUN apt-get update -qq && apt-get install -y netcat curl && apt-get clean

RUN kibana plugin --install elastic/sense

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

CMD ["/tmp/entrypoint.sh"]
