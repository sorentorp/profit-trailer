FROM openjdk:8-alpine

WORKDIR /app

ADD https://github.com/taniman/profit-trailer/releases/download/2.5.32/ProfitTrailer-2.5.32.zip /app

RUN unzip -jqd /app /app/ProfitTrailer-2.5.32.zip ProfitTrailer-2.5.32/ProfitTrailer.jar && \
    rm /app/ProfitTrailer-2.5.32.zip

VOLUME [ "/app/data", "/app/logs" ]
EXPOSE 8081

CMD [ "java", "-Djava.net.preferIPv4Stack=true", "-Dsun.stdout.encoding=UTF-8", "-Dio.netty.allocator.numDirectArenas=0", "-Djdk.nio.maxCachedBufferSize=262144", "-XX:+UseSerialGC", "-XX:+UseStringDeduplication", "-Xms64m", "-Xmx512m", "-XX:CompressedClassSpaceSize=300m", "-XX:MaxMetaspaceSize=128m", "-jar", "/app/ProfitTrailer.jar" ]
