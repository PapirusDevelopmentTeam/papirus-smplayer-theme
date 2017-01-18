all:

install:
	mkdir -p $(DESTDIR)/usr/share/smplayer/themes
	cp --no-preserve=mode,ownership -r \
		Papirus \
		PapirusDark \
		$(DESTDIR)/usr/share/smplayer/themes

uninstall:
	-rm -rf $(DESTDIR)/usr/share/smplayer/themes/Papirus
	-rm -rf $(DESTDIR)/usr/share/smplayer/themes/PapirusDark

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
