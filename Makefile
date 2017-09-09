SHELL := /bin/bash -e

ifneq ($(wildcard .env),)
	include .env
	export $(shell sed 's/=.*//' .env)
endif

.DEFAULT_GOAL := help
.PHONY: assets docs images

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)



deps: ## Install all dependencies
	brew install jpegoptim optipng rename jsonlint git git-lfs nodejs yarn; \

## Assets
assets-build: filenamefixer ## Compress images
	find assets -type f -name "*.jpg"  -exec jpegtran -copy none -optimize -outfile {} {} \; && \
	find assets -type f -name "*.png" | xargs optipng -strip all -o7

assets-filenamefixer: ## Ensures filenames are consistent
	find assets -type f | xargs rename 's/-/_/g' -v; \
	# find assets -type f | xargs rename --force 'y/[A-Z]/[a-z]/' -v; \


## Schema
schema-lint: ## Lint schema files
	find assets/resources -name \*.json -exec xargs ./node_modules/.bin/jsonlint -p \;


## Docs
# TODO: Why aren't these installable via regular YARN/NPM. Weird. @BJC
deps-docs: ## Install docs specific dependencis.
	pushd docs; \
	../node_modules/.bin/gitbook install; \
	popd;

serve-docs: ## Serve the documentation on localhost, useful for development
	pushd docs; \
	../node_modules/.bin/gitbook serve; \
	popd;
