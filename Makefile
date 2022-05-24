SHELL := /bin/bash

DC_VERSION ?= "latest"
DC_DIRECTORY ?= $(PWD)/tmp/OWASP-Dependency-Check
DC_PROJECT ?= "dependency-check scan: $(shell pwd)"
DATA_DIRECTORY ?= "$(DC_DIRECTORY)/data"
CACHE_DIRECTORY ?= "$(DC_DIRECTORY)/data/cache"

logout:
	docker logout

dependency_scan_prepare: logout
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
