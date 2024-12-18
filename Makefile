hooks := .git/hooks
pre-commit := $(hooks)/pre-commit
target := $(HOME)/.local/etc
targets := $(addprefix $(target)/, gitconfig shrc vimrc)

.PHONY: all
all: install $(pre-commit)

.PHONY: format
format:
	prettier --write .

$(hooks):
	mkdir -p $(hooks)

.PHONY: install
install: $(targets)

.PHONY: lint
lint:
	prettier --check .

$(pre-commit): Makefile | $(hooks)
	echo make lint > $(pre-commit)
	chmod 0755 $(pre-commit)

$(target):
	mkdir -p $(target)

$(targets): Makefile src/*/* | $(target)
	cp -r src/static/. $(target)
	cat src/shell/* | grep -Ev '^#' > $(target)/shrc
