FROM fingershock/ruby:latest-builder as builder
COPY Gemfile* /usr/src/app/
RUN bundle update
RUN bundle install --deployment

FROM fingershock/ruby:latest
COPY --from=builder /usr/src/app .
COPY . /usr/src/app/
