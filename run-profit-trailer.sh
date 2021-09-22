#!/bin/bash

APP=/app

PT_DIR=${APP}/ProfitTrailer
PT_ZIP=${APP}/ProfitTrailer-2.5.0.zip
PT_JAR=${PT_DIR}/ProfitTrailer.jar
PT_START="java -Djava.net.preferIPv4Stack=true -Dsun.stdout.encoding=UTF-8 -Dio.netty.allocator.numDirectArenas=0 -Djdk.nio.maxCachedBufferSize=262144 -XX:+UseSerialGC -XX:+UseStringDeduplication -Xms64m -Xmx512m -XX:CompressedClassSpaceSize=300m -XX:MaxMetaspaceSize=128m -jar $PT_JAR"

[ -d "$PT_DIR" ] || mkdir -p "$PT_DIR" || {
   echo "Error: no $PT_DIR found and could not make it. Exiting."; exit -1;
}
unzip -joqd ${PT_DIR} ${PT_ZIP} ProfitTrailer-2.5.0/ProfitTrailer.jar || {
  echo "Error: no ProfitTrailer jar found. Exiting."; exit -1;
}
cd ${PT_DIR} || {
  echo "Error: problem with $PT_DIR. Exiting."; exit -1;
}

pcnt=$(/bin/ls -1 ${PT_DIR}/*.properties 2>/dev/null|/usr/bin/wc -l)
[[ ${pcnt} -gt 0 ]] || {
  echo "No properties found, extracting..."; unzip -jo ${PT_ZIP} -d ${PT_DIR};
}

# start it
${PT_START}
