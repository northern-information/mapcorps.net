#!/bin/sh
bundle install
sass assets/stylesheets/style.sass:assets/stylesheets/style.css
jekyll build