DENO := ${HOME}/.deno/bin/deno

all: lint install

format: node_modules
	${DENO} run -A npm:prettier --write .

install:
	./src/install.sh

lint: node_modules
	${DENO} run -A npm:prettier --check .

node_modules: ${DENO}
	git config core.hooksPath src/git
	${DENO} cache --node-modules-dir \
		npm:prettier npm:prettier-plugin-ini npm:prettier-plugin-sh

pre-commit: lint

${DENO}:
	curl -fsSL https://deno.land/install.sh | sh
