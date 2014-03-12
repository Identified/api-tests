#!/bin/bash -x -e
cd $1
eval "$(rbenv init -)"
rbenv shell 2.1.1
echo Running C Ruby 2.1.1
bundle exec puma -p 8080 & pid=$!
wait 2
read -p "C-ruby puma running hit key to continue"
kill $pid

bundle exec unicorn -p 8080 & pid=$!
read -p "C-ruby unicorn running hit key to continue"
kill $pid

rbenv shell jruby-1.7.11  

echo Running Jruby 1.7.11
bundle exec puma -p 8080 & pid=$!
read -p "Jruby puma running hit key to continue"
kill $pid

cd -