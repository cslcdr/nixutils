export DENO_INSTALL ?= $(HOME)/.deno

deno := $(DENO_INSTALL)/bin/deno
run := $(deno) run -A
prettier := $(run) npm:prettier

all: setup clean lint install

clean:
	rm -rf node_modules

format:
	${prettier} --write .

install:
	src/install.sh

lint:
	${prettier} --check .

pre-commit: lint

setup:
	git config core.hooksPath src/git
	test -x $(deno) || \
		curl -fsSL https://deno.land/install.sh | \
		sh > /dev/null
