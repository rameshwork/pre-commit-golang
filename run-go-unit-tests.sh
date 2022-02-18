#!/usr/bin/env bash
FILES=$(go list ./...  | grep -v /vendor/)

go test -tags=unit -timeout 300s -short -v ${FILES}

returncode=$?
if [ $returncode -ne 0 ]; then
  echo "unit tests failed"
  exit 1
fi
