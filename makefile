
.DEFAULT_GOAL:=all

# TODO: include "check" once the repo is > 30 days old
# all: check install
all: install

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

.PHONY: pr
pr:
	@git-town new-pull-request

.PHONY: sync
sync:
	@git-town sync
	@git-town prune-branches

.PHONY: main
main:
	@git checkout main
	@make sync
