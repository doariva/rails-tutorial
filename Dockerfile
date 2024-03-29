FROM ruby:2.5
RUN apt update -qq && apt install -y nodejs postgresql-client
WORKDIR /rails-tutorial
COPY Gemfile /rails-tutorial/Gemfile
COPY Gemfile.lock /rails-tutorial/Gemfile.lock
RUN bundle install
COPY . /rails-tutorial

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]