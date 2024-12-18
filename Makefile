all: clean lint install

clean:
	rm -rf node_modules

format: setup
	deno run -A npm:prettier --write .

install:
	src/install.sh

lint: setup
	deno run -A npm:prettier --check .

pre-commit: lint

setup:
	git config core.hooksPath src/git
	deno install
