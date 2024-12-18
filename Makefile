prettier := deno run -A npm:prettier

all: clean lint install
	git config core.hooksPath src/git

clean:
	rm -rf node_modules

format:
	${prettier} --write .

install:
	src/install.sh

lint:
	${prettier} --check .

pre-commit: lint
