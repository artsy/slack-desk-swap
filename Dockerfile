FROM ruby:2.5.3

ENV PORT 8080
EXPOSE 8080
WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler && \
    bundle install --frozen --jobs $(nproc)

COPY . ./

CMD bundle exec unicorn -p $PORT
