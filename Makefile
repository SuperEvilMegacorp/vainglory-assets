SHELL := /bin/bash -e

ifneq ($(wildcard .env),)
	include .env
	export $(shell sed 's/=.*//' .env)
endif

.DEFAULT_GOAL := test
.PHONY: deps images

deps:
	brew install jpegoptim optipng rename jsonlint

build: lint filenamefixer images

images:
	find assets -type f -name "*.jpg"  -exec jpegtran -copy none -optimize -outfile {} {} \; && \
	find assets -type f -name "*.png" | xargs optipng -strip all -o7

filenamefixer:
	find assets -type f | xargs rename 's/-/_/g' -v; \
	find assets -type f | xargs rename --force 'y/[A-Z]/[a-z]/' -v; \

lint:
	find . -name \*.json -exec xargs jsonlint -qc {} \;
