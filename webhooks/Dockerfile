FROM ruby:3.2-slim

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

COPY . .

CMD ["ruby", "main.rb"]
