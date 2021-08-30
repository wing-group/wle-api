FROM ruby:3.0.1

WORKDIR /app

COPY Gemfile* .

RUN bundle install

COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
