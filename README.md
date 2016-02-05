# docker-ruby

 [![Build Status](https://travis-ci.org/iJJi/docker-ruby.svg?branch=master)](https://travis-ci.org/iJJi/docker-ruby)

Docker containers to build and host ruby applications. It's built on alpine linux so they're tiny!

It's on [docker-hub](https://hub.docker.com/r/fingershock/ruby/) and [github](https://github.com/iJJi/docker-ruby)

## tags and links

 * `latest`, `2.2` [(Dockerfile-runtime)](https://github.com/iJJi/docker-ruby/blob/master/Dockerfile-runtime) [![](https://badge.imagelayers.io/fingershock/ruby:latest.svg)](https://imagelayers.io/?images=fingershock/ruby:latest)
 * `latest-builder`, `2.2` [(Dockerfile-builder)](https://github.com/iJJi/docker-ruby/blob/master/Dockerfile-builder) [![](https://badge.imagelayers.io/fingershock/ruby:latest-builder.svg)](https://imagelayers.io/?images=fingershock/ruby:latest-builder)

## running

The base image is great to run simple ruby scripts or as a base for bundling an app
```sh
docker run --rm fingershock/ruby ruby -e 'puts "Hello World"'
Hello World
```

The -builder image includes build tools and compilers for use by bundler. Use it to assemble dependencies into a shared vendor volume and
then copy those files into a new image based on the runtime.
```sh
docker run --rm -v $PWD/test:/usr/src/app:rw fingershock/ruby:latest-builder bundle update
docker run --rm -v $PWD/test:/usr/src/app:rw fingershock/ruby:latest-builder bundle install --deployment
docker build -t testapp test
docker run -it --rm testapp bundle list
```

