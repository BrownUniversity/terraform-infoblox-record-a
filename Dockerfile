FROM hashicorp/terraform:0.12.29

COPY .ruby-version .ruby-version

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk upgrade && \
    apk add --update \
    bash \
    curl-dev \
    curl \
    "ruby-dev=~$(cat .ruby-version)" \
    "ruby-full=~$(cat .ruby-version)" \
    build-base \
    python3 && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile* ./
RUN gem install bundler && \
    bundle config set system 'true' && \
    bundle install


ENTRYPOINT ["/bin/bash"]

