FROM ruby:2.3-alpine
MAINTAINER anton.osenenko@gmail.com
ENV LANG C.UTF-8

RUN apk add --update --no-cache \
    bash \
    git \
    curl \
    build-base \
    sqlite \
    sqlite-libs \
    sqlite-dev

WORKDIR /opt/lifetest
RUN mkdir /opt/lifetest/var

COPY Gemfile Gemfile.lock /opt/lifetest/
RUN bundle install --deployment

COPY config.ru Rakefile /opt/lifetest/
COPY app /opt/lifetest/app
COPY bin /opt/lifetest/bin
COPY config /opt/lifetest/config
COPY db /opt/lifetest/db
COPY lib /opt/lifetest/lib

RUN bundle exec rake sequel:migrate \
    && bundle exec ruby bin/fake_data

EXPOSE 9292
CMD bundle exec rackup --host 0.0.0.0
