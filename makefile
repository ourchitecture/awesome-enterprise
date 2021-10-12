
.DEFAULT_GOAL:=all

all: check

# standard target for GNU Make
.PHONY: check
check:
	@yarn lint

# alias for node / yarn devs
.PHONY: test
test: check

# alias for node / yarn devs
.PHONY: lint
lint: check
