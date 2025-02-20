FROM ubuntu

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY App.java .
COPY pom.xml .

RUN mkdir -p /app/java-client/src/main/java/org/example && \
    mv /app/App.java /app/java-client/src/main/java/org/example/App.java && \
    mv /app/pom.xml /app/java-client/pom.xml && \
    cd /app/java-client && \
    mvn clean package

CMD [ "java", "-jar", "/app/java-client/target/java-client-1.0-SNAPSHOT.jar" ]