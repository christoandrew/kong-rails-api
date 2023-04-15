FROM ruby:2.7.0-alpine

RUN apk --no-cache add make gcc g++ \ 
    musl-dev binutils autoconf automake \
    libtool pkgconfig check-dev file patch

RUN apk --no-cache update && apk add mysql-client tzdata && rm -rf /var/lib/apt

RUN apk update \
    && apk add --virtual build-deps \
    && apk add --no-cache mariadb-dev

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3005
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3005"]

