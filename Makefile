PREFIX ?= /usr

all:

build: clean
	bash build.sh

clean:
	-rm -rf build/

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

release: _get_version
	git tag -f $(VERSION)
	git push origin --tags
	git push origin

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all build clean install uninstall _get_version push release undo_release
