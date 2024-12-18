all: clean lint install

clean:
	rm -rf node_modules

format: node_modules
	deno run -A npm:prettier --write .

install:
	src/install.sh

lint: node_modules
	deno run -A npm:prettier --check .

node_modules:
	deno install
	git config core.hooksPath src/git

pre-commit: lint
