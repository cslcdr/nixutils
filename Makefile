DENO := ~/.deno/bin/deno

all: lint install

format: node_modules
	${DENO} run -A npm:prettier --write .

install:
	./src/install.sh

lint: node_modules
	${DENO} run -A npm:prettier --check .

node_modules: ${DENO}
	git config core.hooksPath src/git
	${DENO} cache $$(cat deps.txt)

pre-commit: lint

${DENO}:
	curl -fsSL https://deno.land/install.sh | \
	sh -s -- --yes --no-modify-path
