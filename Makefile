SHELL := /bin/bash
PACKAGES = git make python3 curl jq bat

DC_VERSION ?= "latest"
DC_DIRECTORY ?= $(PWD)/tmp/OWASP-Dependency-Check
DC_PROJECT ?= "dependency-check scan: $(shell pwd)"
DATA_DIRECTORY ?= "$(DC_DIRECTORY)/data"
CACHE_DIRECTORY ?= "$(DC_DIRECTORY)/data/cache"

ifeq ($(shell uname -s),Darwin)
	PKG_SYSTEM=brew
	EXTRA_ARG='' -e
endif

ifeq ($(shell uname -s),Linux)
	PKG_SYSTEM=apt
	#PKG_SYSTEM := yum
endif

fix_gi:
	@if grep -r --color Makefile .gitignore; \
	then \
		sed -i $(EXTRA_ARG) 's/^Makefile/#Makefile/' .gitignore; \
	fi
	@grep -r --color Makefile .gitignore

setup:
	$(foreach var,$(PACKAGES),sudo $(PKG_SYSTEM) install $(var);)

versions:
	@git --version
	@docker --version
	@python3 -V
	@jq --version
	@curl --version
	@make --version

verify:
	@which git
	@which docker
	@which python3
	@which jq
	@which curl
	@which make

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

dependency_scan_prepare:
	if [ ! -d /tmp ]; then mkdir -- tmp; fi
	if [ ! -d "$(DATA_DIRECTORY)" ]; then \
	    echo "Initially creating persistent directory: $(DATA_DIRECTORY)" \
	    mkdir -p -- "$(DATA_DIRECTORY)"; \
	fi
	if [ ! -d "$(CACHE_DIRECTORY)" ]; then \
	    echo "Initially creating persistent directory: $(CACHE_DIRECTORY)" \
	    mkdir -p -- "$(CACHE_DIRECTORY)"; \
	fi

	# Make sure we are using the latest version
	docker pull owasp/dependency-check:$(DC_VERSION)

dependency_scan: dependency_scan_prepare
	docker run --rm \
	    -e user=$(USER) \
	    -u $(id -u ${USER}):$(id -g ${USER}) \
	    --volume $(PWD):/src:z \
	    --volume "$(DATA_DIRECTORY)":/usr/share/dependency-check/data:z \
	    --volume $(PWD)/odc-reports:/report:z \
	    owasp/dependency-check:$(DC_VERSION) \
	    --scan /src \
	    --format "ALL" \
	    --project "$(DC_PROJECT)" \
	    --out /report
	    # Use suppression like this: (where /src == $pwd)
	    # --suppression "/src/security/dependency-check-suppression.xml"
