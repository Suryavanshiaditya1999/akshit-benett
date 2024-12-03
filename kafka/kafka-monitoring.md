# KAFKA MONITORING

[video](https://www.youtube.com/watch?v=3fsquXqgb5w)

- first install jmx exporter
  ```
  wget https://repo.maven.apache.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.20.0/jmx_prometheus_javaagent-0.20.0.jar
  ```

- second step
  ```
  sudo mv jmx_prometheus_javaagent-0.20.0.jar  /opt/kafka/libs/
  ```

  ![image](https://github.com/user-attachments/assets/0d98f79d-0914-41c6-af9c-e9802a714035)

- Configure Kafka to use the JMX Exporter
  ```
  sudo nano /opt/kafka/bin/kafka-server-start.sh
  ```

  add this line in script at the end
  ```
  KAFKA_OPTS="-javaagent:/opt/kafka/libs/jmx_prometheus_javaagent-0.20.0.jar=9091:/etc/prometheus/prometheus.yml"
  ```

  ```
  KAFKA_OPTS="-javaagent:/opt/kafka/libs/jmx_prometheus_javaagent-0.20.0.jar=9091:/opt/kafka/config/sample_jmx_exporter.yml"
  ```

- Now reload to make the changes take effect
  ```
  sudo systemctl daemon-reload
  ```

  ```
  sudo systemctl restart kafka
  ```

- [Now edit the sample](https://www.fosstechnix.com/monitor-apache-kafka-using-prometheus-grafana/)
  ```
  nano /opt/kafka/config/sample_jmx_exporter.yml
  ```
- Now edit prometheus yaml file to scrape jmx exporter metrics

  ```
  sudo nano /etc/prometheus/prometheus.yml
  ```

  ```
  - job_name: 'kafka'
    static_configs:
      - targets: ["localhost:9091"]  # JMX Exporter endpoint for Kafka metrics
  ```

  ```
  sudo systemctl daemon-reload
  ```

- restart prometheus
  ```
  sudo systemctl restart prometheus
  ```

- Now edit kafka systemd file
  ```
  [Unit]
  Description=Apache Kafka Service
  Documentation=http://kafka.apache.org/documentation.html
  Requires=zookeeper.service
  
  [Service]
  Type=simple
  Environment="JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64"
  Environment="KAFKA_OPTS=-javaagent:/opt/kafka/libs/jmx_prometheus_javaagent-0.20.0.jar=9091:/etc/prometheus/prometheus.yml"
  Environment="KAFKA_OPTS=-javaagent:/opt/kafka/libs/jmx_prometheus_javaagent-0.20.0.jar=9091:/opt/kafka/config/sample_jmx_exporter.yml"
  ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
  ExecStop=/opt/kafka/bin/kafka-server-stop.sh
  Restart=on-failure
  
  [Install]
  WantedBy=multi-user.target
  ```

  ```
  sudo systemctl daemon-reload
  ```

  ```
  sudo systemctl restart kafka
  ```
  
  
