PREFIX ?= /usr

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/smplayer/themes
	cp -R \
		Papirus \
		ePapirus \
		PapirusDark \
		PapirusAdapta \
		PapirusAdaptaNokto \
		$(DESTDIR)$(PREFIX)/share/smplayer/themes

uninstall:
	-rm -rf $(DESTDIR)$(PREFIX)/share/smplayer/themes/Papirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/smplayer/themes/ePapirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/smplayer/themes/PapirusDark
	-rm -rf $(DESTDIR)$(PREFIX)/share/smplayer/themes/PapirusAdapta
	-rm -rf $(DESTDIR)$(PREFIX)/share/smplayer/themes/PapirusAdaptaNokto

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

push:
	git push origin

release: _get_version push
	git tag -f $(VERSION)
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install uninstall _get_version push release undo_release
