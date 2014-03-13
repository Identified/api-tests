#!/bin/bash -x -e
eval "$(rbenv init -)"
rbenv shell 2.1.1
cd $1
bundle
echo Running C Ruby 2.1.1
../bin/ruby-puma & pid=$!
sleep 10
cd -
./test.sh $1-$2-cruby-puma

kill $pid

cd $1
../bin/ruby-unicorn & pid=$!
cd -
sleep 10
./test.sh $1-$2-cruby-unicorn
kill $pid

rbenv shell jruby-1.7.11  

echo Running Jruby 1.7.11
cd $1
bundle
../bin/jruby-puma & pid=$!
sleep 20
cd -
./test.sh $1-$2-jruby-puma
kill $pid

tail -n 20 results/$1-$2*
