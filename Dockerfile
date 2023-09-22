FROM ruby:2.7

WORKDIR /app
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=True

RUN apt-get update && apt-get install -y nodejs npm
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY yarn.lock ./
RUN npm install --production

COPY . .

EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]