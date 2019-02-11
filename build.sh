#!/bin/bash

git fetch
pipenv run mkdocs build --clean
aws s3 sync ./site s3://dlpx-masking-docs --delete --cache-control "public, max-age=1" --profile delphix
aws s3api put-object-acl --bucket dlpx-masking-docs --key 404.html --acl public-read --profile delphix
