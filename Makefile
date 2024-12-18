run := deno run -A
prettier := ${run} npm:prettier

all: clean lint install

clean:
	rm -rf node_modules

format:
	${prettier} --write .

install:
	src/install.sh

lint:
	${prettier} --check .

pre-commit: lint
