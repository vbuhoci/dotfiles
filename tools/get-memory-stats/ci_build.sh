#!/usr/bin/env bash

rm -rf ./bin/
go clean
go build -o ./bin/get-memory-stats
