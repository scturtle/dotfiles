# https://github.com/matheusmoreira/.files/blob/master/GNUmakefile

mkdir = mkdir -p ~/$(1)
link = ln -snf $(CURDIR)/$@/$(1) ~/$(1)
batch_link = $(foreach file,$(patsubst $@/%,%,$(wildcard $@/$(1)/*)),$(call link,$(file));)

.PHONY: hints
hints:
	@echo Usage: make git vim fish kitty

force:

fish: force
	$(call mkdir,.config/fish)
	$(call link,.config/fish/config.fish)

fish_mac: force
	$(call mkdir,.config/fish)
	$(call link,.config/fish/config.fish)
	$(call mkdir,.config/fish/functions)
	$(call link,.config/fish/functions/vv.fish)

git: force
	$(call link,.gitignore_global)
	$(call link,.gitconfig)

kitty: dir := .config/kitty
kitty: force
	$(call mkdir,$(dir))
	$(call batch_link,$(dir))

kitty_mac: dir := .config/kitty
kitty_mac: force
	$(call mkdir,$(dir))
	$(call batch_link,$(dir))

squirrel: dir := Library/Rime
squirrel: force
	$(call batch_link,$(dir))

rime: dir := .config/ibus/rime
rime: force
	$(call batch_link,$(dir))

tmux: force
	$(call link,.tmux.conf)

vim: force
	$(call link,.vimrc)

yabai: force
	$(call link,.skhdrc)
	$(call link,.yabairc)

keyd: force
	$(call mkdir,.config/keyd)
	$(call link,.config/keyd/default.conf)

fontconfig: force
	$(call mkdir,.config/fontconfig)
	$(call link,.config/fontconfig/fonts.conf)
