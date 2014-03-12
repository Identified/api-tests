#!/bin/bash -x -e
read -p "Start C-ruby puma Server"
./test.sh $1 $1-cruby-puma
read -p "Start C-ruby unicorn Server"
./test.sh $1 $1-cruby-unicorn
read -p "Start Jruby puma Server"
./test.sh $1 $1-jruby-puma
