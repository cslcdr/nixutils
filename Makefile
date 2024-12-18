hooks := .git/hooks
pre-commit := $(hooks)/pre-commit
target := ~/.local/etc
files := bashrc gitconfig inputrc vimrc zshrc
targets := $(addprefix $(target)/, $(files))

.PHONY: all
all: install $(pre-commit)

.PHONY: build
build: $(targets)

.PHONY: format
format:
	prettier --write .

$(hooks):
	mkdir -p $(hooks)

.PHONY: install
install: build
	git config --global include.path '$(target)/gitconfig'
	install() { \
		grep -q -F "$${*:2}" "$${1}" \
			|| echo "$${*:2}" >> "$${1}" ; \
	} ; \
	install ~/.vimrc source $(target)/vimrc ; \
	install ~/.inputrc \$$include $(target)/inputrc ; \
	install ~/.bashrc . $(target)/bashrc ; \
	install ~/.zshrc . $(target)/zshrc

.PHONY: lint
lint:
	prettier --check .

.PHONY: pre-commit
pre-commit: lint

$(pre-commit): Makefile | $(hooks)
	echo make pre-commit > $(pre-commit)
	chmod 0755 $(pre-commit)

$(target):
	mkdir -p $(target)

$(targets): src/*/* | $(target)
	cp -r src/static/. $(target)
	cat src/shell/* > $(target)/bashrc > $(target)/zshrc
