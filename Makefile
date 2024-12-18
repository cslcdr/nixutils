.PHONY: all
all: clean install .git/hooks/pre-commit

.PHONY: build
build: target/initrc target/*

.PHONY: clean
clean:
	rm -rf target

.PHONY: format
format:
	prettier --write .

.git/hooks:
	mkdir -p .git/hooks

.git/hooks/pre-commit: Makefile .git/hooks
	echo make pre-commit > .git/hooks/pre-commit
	chmod 0755 .git/hooks/pre-commit

.PHONY: install
install: build
	src/install.sh

.PHONY: lint
lint:
	prettier --check .

.PHONY: pre-commit
pre-commit: lint

target:
	mkdir target

target/%: src/assets/* target
	cp -r src/assets/. target

target/initrc: src/init/* target
	cat src/init/* > target/initrc
