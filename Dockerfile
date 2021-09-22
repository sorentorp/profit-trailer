FROM openjdk:8-alpine

WORKDIR /app

ADD https://github.com/taniman/profit-trailer/releases/download/2.5.0/ProfitTrailer-2.5.0.zip /app
COPY run-profit-trailer.sh /run-profit-trailer.sh

VOLUME /app/ProfitTrailer/data
EXPOSE 8081

CMD ["/bin/sh", "/run-profit-trailer.sh"]
