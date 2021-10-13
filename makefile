
.DEFAULT_GOAL:=all

all: start

# standard target for GNU Make
.PHONY: check
check:
	@yarn lint

# convenient alias
.PHONY: test
test: check

# convenient alias
.PHONY: lint
lint: check

.PHONY: start
start:
	@docker-compose up -d --build

# convenient alias
.PHONY: run
run: start

# convenient alias
.PHONY: serve
serve: start

# convenient alias
.PHONY: up
up: start

.PHONY: stop
stop:
	@docker-compose down

# convenient alias
.PHONY: down
down: stop

.PHONY: restart
restart: stop start

.PHONY: install
install:
	@docker run \
		--rm \
		-it \
		-v $(shell pwd):/app \
		-w /app \
		-t squidfunk/mkdocs-material \
		build \
			--clean \
			--verbose \
			--strict \
			--config-file mkdocs.yml \
			--site-dir ./docs

# convenient alias
.PHONY: build
build: install
