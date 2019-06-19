FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /spellbook-api2
WORKDIR /spellbook-api2
COPY Gemfile /spellbook-api2/Gemfile
COPY Gemfile.lock /spellbook-api2/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /spellbook-api2

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# COPY entrypoint.sh /spellbook-api2
RUN chmod +x /spellbook-api2/entrypoint.sh
CMD ./entrypoint.sh
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
