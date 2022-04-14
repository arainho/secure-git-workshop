SHELL := /bin/bash

ifeq ($(shell uname -s),Darwin)
  SHASUM=shasum -a 256 -c
endif

ifeq ($(shell uname -s),Linux)
  SHASUM_CMD=sha256sum -c
endif

setup:
	$(SHASUM_CMD) utils/bfg_shasum.txt
	alias bfg="java -jar utils/bfg.jar"

verify:
	@which bfg
	@bfg --version
