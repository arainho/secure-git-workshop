SHELL := /bin/bash
BRANCH ?= step7

ifeq ($(shell uname -s),Darwin)
	SHASUM_CMD := shasum -a 256 -c
	EXTRA_ARG='' -e
endif

ifeq ($(shell uname -s),Linux)
	SHASUM_CMD := sha256sum -c
endif

audit_trufflehog:
	docker run \
		-t \
		--rm \
		-v $(PWD):/target dxa4481/trufflehog \
		--max_depth=20 \
		--json \
		--regex \
		--entropy=False \
		file:///target | jq -C
		trufflehog file:///$(PWD)/ --json --regex --entropy=False --branch=$(BRANCH)

fix:
	sed -i $(EXTRA_ARG) 's/\"secure-password\"/get_api_key\(\)/g' get_wheather.py
	sed -i $(EXTRA_ARG) '/# HARDCODED SECRET.*/d' get_wheather.py

delete:
	if [ -f "supersecrets.txt" ]; then rm -- "supersecrets.txt"; fi
	git rm supersecrets.txt && git commit -m "remove file with secrets"
	$(SHASUM_CMD) utils/bfg_shasum.txt
	if [ -f $(FILE_WITH_SECRETS) ]; then \
		java -jar utils/bfg.jar --delete-files $(FILE_WITH_SECRETS); \
	fi
	git reflog expire --expire=now --all && git gc --prune=now --aggressive

verify:
	@which bfg
	@bfg --version
