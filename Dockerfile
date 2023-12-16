FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/ms-config-server-*-SNAPSHOT.jar
COPY ${JAR_FILE} ms-config-server.jar
RUN addgroup -S bootcampgroup && adduser -S bootcampuser -G bootcampgroup
RUN mkdir -p /opt/logs/ms-config-server
RUN chown -R bootcampuser:bootcampgroup /opt/logs/ms-config-server
USER bootcampuser:bootcampgroup
ENTRYPOINT ["java", "-jar", "/ms-config-server.jar"]