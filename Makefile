SHELL := /bin/bash

BRANCH ?= step2

talisman_setup:
	@echo configure
	if ! test -d bin; then mkdir -p bin/; fi
	curl https://thoughtworks.github.io/talisman/install.sh > bin/install-talisman.sh
	chmod +x bin/install-talisman.sh
	
	@echo cleanup
	if test -f .git/hooks/pre-commit; then rm -i .git/hooks/pre-commit; fi
	if test -f .git/hooks/commit-msg; then rm -i .git/hooks/commit-msg; fi
	if test -f .git/hooks/prepare-commit-msg; then rm -i .git/hooks/prepare-commit-msg; fi

	@echo install
	./bin/install-talisman.sh pre-commit

secret_detection: audit_trufflehog

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
