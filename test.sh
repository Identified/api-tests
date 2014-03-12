#!/bin/bash
HOST=${HOST:=127.0.0.1}
PORT=${PORT:=8080}

COUNT=100 
CONCURRENCY=1

ab -n $COUNT -c $CONCURRENCY $HOST:$PORT/hello | tee results/$1-hello.txt

ab -n $COUNT -c $CONCURRENCY -p 1.json -T 'application/json' $HOST:$PORT/v1/json | tee results/$1-json-1.txt
ab -n $COUNT -c $CONCURRENCY -p 2.json -T 'application/json' $HOST:$PORT/v2/json | tee results/$1-json-2.txt