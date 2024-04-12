FROM ruby:2.7.1-buster
MAINTAINER yuu

ENV DEBIAN_FRONTEND noninteractive

# https://qiita.com/m-dove/items/a60b1a09d32299d215bb
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends \
    nodejs yarn
RUN apt-get clean
ENV DEBIAN_FRONTEND dialog

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock
RUN yarn install && bundle install
RUN echo

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
