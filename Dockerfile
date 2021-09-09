FROM openjdk:8-alpine

VOLUME /app
EXPOSE 8081

ADD https://github.com/taniman/profit-trailer/releases/download/2.5.0/ProfitTrailer-2.5.0.zip /opt
COPY run-profit-trailer.sh /run-profit-trailer.sh

WORKDIR /app
CMD ["/bin/sh", "/run-profit-trailer.sh"]
