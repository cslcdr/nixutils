makefile := $(lastword $(MAKEFILE_LIST))
root := $(realpath $(dir $(makefile)))
hooks := $(root)/.git/hooks
pre-commit := $(hooks)/pre-commit
src := $(root)/src
target := $(root)/target
targets := $(addprefix $(target)/,gitconfig shrc vimrc)

define install
grep -qF "$(1)" $(2) && \
	printf '\n$(2) is up-to-date\n\n' || \
	echo "$(1)" >> $(2)
endef

.PHONY: all
all: clean install $(pre-commit)

.PHONY: clean
clean:
	rm -rf '$(target)'

.PHONY: format
format:
	prettier --write .

$(hooks):
	mkdir -p '$(hooks)'

.PHONY: install
install: $(targets)

.PHONY: lint
lint:
	prettier --check .

$(pre-commit): $(makefile) | $(hooks)
	echo make lint > '$(pre-commit)'
	chmod 0755 '$(pre-commit)'

$(target):
	mkdir -p '$(target)'

$(targets): $(makefile) $(src)/*/* | $(target)
	cp -r '$(src)'/static/. '$(target)'
	echo '#!/usr/bin/env bash' > '$(target)'/shrc
	cat '$(src)'/shell/* | grep -v '^#' >> '$(target)'/shrc
	perl -pi -e 's|path/to|$(target)|g' '$(target)'/*
	git config --global --get-all include.path | \
		grep -qF '$(target)'/gitconfig && \
		printf '\ngit config is up-to-date\n\n' || \
		git config --global --add include.path '$(target)'/gitconfig
	$(call install,. '$(target)/shrc',~/.bashrc)
	$(call install,. '$(target)/shrc',~/.zshrc)
	$(call install,source $(shell echo '$(target)' | perl -p -e 's/ /\\\\ /g')/vimrc,~/.vimrc)
