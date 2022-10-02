FROM openjdk:8
EXPOSE 8081
ADD target/hikari-kafka-docker.jar hikari-kafka-docker.jar
ENTRYPOINT ["java","-jar","/hikari-kafka-docker.jar"]