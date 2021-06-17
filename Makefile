export PATH := ${HOME}/.deno/bin:${PATH}

.PHONY: all
all: install

.PHONY: format
format:
	deno run -A npm:prettier --write .

.PHONY: install
install:
	./install.sh

.PHONY: pre-commit
pre-commit:
	deno run -A npm:prettier --check .

.PHONY: setup
setup:
	rm -rf node_modules
	git config core.hooksPath hooks
	deno -v || curl -fsSL https://deno.land/install.sh | sh
	deno cache \
		npm:prettier \
		npm:prettier-plugin-ini \
		npm:prettier-plugin-sh
