#!/usr/bin/env bash
sudo docker stop wangw469.github.io

export JEKYLL_VERSION=3.8
docker run --rm --name wangw469.github.io \
  -p 4000:4000 \
  --volume="$PWD:/srv/jekyll" \
  -v "/Users/xp/.gem_cache:/usr/local/bundle" \
  -it jekyll/jekyll:$JEKYLL_VERSION \
  jekyll server --host "0.0.0.0"

