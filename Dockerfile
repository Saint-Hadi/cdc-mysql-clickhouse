FROM docker.arvancloud.ir/confluentinc/cp-kafka-connect:6.2.0 as cp
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-avro-converter:6.2.0
FROM docker.arvancloud.ir/debezium/connect:2.3

USER root
RUN mkdir -p /kafka/connect/plugins/avro/
COPY --from=cp /usr/share/confluent-hub-components/confluentinc-kafka-connect-avro-converter/lib /kafka/connect/plugins/avro/

USER 1001
