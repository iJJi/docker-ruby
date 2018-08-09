FROM fingershock/ruby:latest-builder as builder
COPY Gemfile* /usr/src/app/
# test only: generates Gemfile.lock needed with --deployment
RUN bundle update
RUN bundle install --deployment

FROM fingershock/ruby:latest
COPY --from=builder /usr/src/app .
COPY . /usr/src/app/
