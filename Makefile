SHELL := /bin/bash

ifeq ($(shell uname -s),Darwin)
	SHASUM_CMD := shasum -a 256 -c
endif

ifeq ($(shell uname -s),Linux)
	SHASUM_CMD := sha256sum -c
endif

fix:
	sed -i 's/\"secure-password\"/get_api_key\(\)/g' get_wheather.py

delete:
	$(SHASUM_CMD) utils/bfg_shasum.txt
	alias bfg="java -jar utils/bfg.jar"
	if [[ -f $(FILE_WITH_SECRETS) ]]; then \
	bfg --delete-files $(FILE_WITH_SECRETS); \
	fi

verify:
	@which bfg
	@bfg --version