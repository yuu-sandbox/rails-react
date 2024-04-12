FROM node:16.20.2-slim as node

FROM ruby:2.7.0-slim-buster as base

ARG APP_VER=unknown
ARG RAILS_ENV=production
ARG NODE_ENV=production
ARG WORK_DIR=/app

ENV APP_VER=${APP_VER}
ENV RAILS_ENV=${RAILS_ENV}
ENV NODE_ENV=${NODE_ENV}

RUN mkdir -p /opt
COPY --from=node /opt/yarn-v1.22.19 /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarnpkg /usr/local/bin/yarnpkg

WORKDIR ${WORK_DIR}

RUN bundle config set force_ruby_platform true

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["sh", "-c", "bundle exec whenever --update-crontab && bundle exec rails s -b 0.0.0.0"]

FROM base as development

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
            build-essential \
            libpq-dev \
            cron \
   ; \
   rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ${WORK_DIR}/
RUN bundle install
COPY package.json yarn.lock ${WORK_DIR}/
RUN yarn install --check-files

FROM base as builder

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
            build-essential \
            libpq-dev \
            cron \
   ; \
   rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ${WORK_DIR}/
RUN bundle install --without test
COPY package.json yarn.lock ${WORK_DIR}/
RUN yarn install --check-files --production
COPY . ${WORK_DIR}/
RUN SECRET_KEY_BASE=dummy_secret_key bundle exec rake assets:precompile

FROM base as production

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
            libpq5 \
            cron \
   ; \
   rm -rf /var/lib/apt/lists/*

COPY . ${WORK_DIR}/
COPY --from=builder /usr/local/ /usr/local/
COPY --from=builder ${WORK_DIR}/public ${WORK_DIR}/public
