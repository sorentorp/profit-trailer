FROM openjdk:8-alpine

VOLUME /app
EXPOSE 8081

ADD https://github.com/taniman/profit-trailer/releases/download/2.4.60/ProfitTrailer-2.4.60.zip /opt
COPY run-profit-trailer.sh /run-profit-trailer.sh

WORKDIR /app
CMD ["/bin/sh", "/run-profit-trailer.sh"]
