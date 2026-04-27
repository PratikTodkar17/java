FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY helooo.java .

RUN javac helooo.java

CMD ["java", "helooo"]
