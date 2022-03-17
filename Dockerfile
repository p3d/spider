FROM ruby:3.1.1-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  ruby-dev libsqlite3-dev

COPY Gemfile* /tmp/
WORKDIR /tmp
RUN gem install bundler:2.3.7
RUN bundle install

# COPY Gemfile Gemfile.lock ./
# RUN bundle install --jobs=3 --retry=3

WORKDIR /app
COPY . /app

ENTRYPOINT ["/app/entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
