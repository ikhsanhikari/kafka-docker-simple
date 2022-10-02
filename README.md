# kafka-docker-simple

Aplikasi simple yang akan running spring-boot yang terkoneksi dengan kafka di dalam docker container

## Langkah-langkah
  1. untuk install kafka, kita perlu pull image nya yaitu `wurstmeister/zookeeper` dan `wurstmeister/kafka`
    atau bisa menggunakan docker compose 
    
    version: '3'

    services:
      zookeeper:
        image: wurstmeister/zookeeper
        container_name: zookeeper
        ports:
          - "2181:2181"
      kafka:
        image: wurstmeister/kafka
        container_name: kafka
        ports:
          - "9092:9092"
        environment:
          KAFKA_ADVERTISED_HOST_NAME: localhost
          KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
          
  2. Selanjutnya menjalankan aplikasi dengan docker, buat `Dockerfile` 
    
      ```
      FROM openjdk:8
      EXPOSE 8081
      ADD target/hikari-kafka-docker.jar hikari-kafka-docker.jar
      ENTRYPOINT ["java","-jar","/hikari-kafka-docker.jar"]
      ```
    
      Lalu Build image aplikasi hikari-kafka-docker `docker build -t hikari-kafka:v1 .`
      Create container `docker container create  --name hikari-kafka -p9090:8080 -e KAFKA=kafka:9092 hikari-kafka:v1`
      Cek container `docker ps -a`
      
