FROM ruby:3.2.1

WORKDIR /app
COPY Gemfile* .
RUN bundle install
COPY . .

ENV RAILS_LOG_TO_STDOUT=true

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
