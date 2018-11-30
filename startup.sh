#!/usr/bin/env bash
sudo docker stop wangw469.github.io

sudo docker run --rm --name wangw469.github.io \
 -p 4000:4000 \
 -v "$(pwd)":/usr/src/jekyll\
 -w /usr/src/jekyll\
 --volume="$HOME/.gem_cache:/usr/local/bundle" \
 --detach=true \
 jekyll/jekyll \
 bundle exec jekyll serve --host "0.0.0.0"
