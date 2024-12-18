.PHONY: all clean format install lint

root := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
makefile := $(root)/Makefile
hooks := $(root)/.git/hooks
pre-commit := $(hooks)/pre-commit
src := $(root)/src

target := $(root)/target
targets := $(addprefix $(target)/, gitconfig shrc vimrc)

all: clean install $(pre-commit)

clean:
	rm -rf $(target)

format:
	prettier --write .

$(hooks):
	mkdir -p $(hooks)

install: $(targets)

lint:
	prettier --check .

$(pre-commit): $(makefile) | $(hooks)
	echo make lint > $(pre-commit)
	chmod 0755 $(pre-commit)

$(target):
	mkdir -p $(target)

$(targets): $(makefile) $(src)/*/* | $(target)
	cp -r $(src)/static/. $(target)
	cat $(src)/shell/* | grep -v '^#' > $(target)/shrc
	ex -s -c 'bufdo %s@path/to@$(target)@ge | update' -c q $(target)/*
	@echo
	@echo \# UPDATE YOUR SHELL CONFIGURATION
	@echo . \''$(target)/shrc'\'
	@echo
	@echo \# UPDATE YOUR VIM CONFIGURATION
	@echo source $(target)/vimrc
	@echo
	@echo \# UPDATE YOUR GLOBAL GIT CONFIGURATION
	@echo git config --global --add include.path \'$(target)/gitconfig\'
	@echo
