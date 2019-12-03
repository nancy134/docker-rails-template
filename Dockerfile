FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /tenant-service
WORKDIR /tenant-service
COPY Gemfile /tenant-service/Gemfile
COPY Gemfile.lock /tenant-service/Gemfile.lock
RUN bundle install
COPY . /tenant-service

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

