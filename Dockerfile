FROM openjdk:8-alpine

ARG PT_VER=2.5.56

WORKDIR /app

ADD https://github.com/taniman/profit-trailer/releases/download/${PT_VER}/ProfitTrailer-${PT_VER}.zip /app

RUN unzip -jqd /app /app/ProfitTrailer-${PT_VER}.zip ProfitTrailer-${PT_VER}/ProfitTrailer.jar && \
    rm /app/ProfitTrailer-${PT_VER}.zip

VOLUME [ "/app/data", "/app/logs" ]
EXPOSE 8081

CMD [ "java", "-Djava.net.preferIPv4Stack=true", "-Dsun.stdout.encoding=UTF-8", "-Dio.netty.allocator.numDirectArenas=0", "-Djdk.nio.maxCachedBufferSize=262144", "-XX:+UseSerialGC", "-XX:+UseStringDeduplication", "-Xms64m", "-Xmx512m", "-XX:CompressedClassSpaceSize=300m", "-XX:MaxMetaspaceSize=128m", "-jar", "/app/ProfitTrailer.jar" ]
