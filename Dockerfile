FROM ruby:2.3.3-slim


RUN apt-get update -qq
RUN apt-get install -y build-essential nodejs git

RUN mkdir /app
WORKDIR /app
RUN gem install bundler

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install --system --jobs=2

COPY . /app/

CMD ["middleman", "server", "--watcher-force-polling"]
