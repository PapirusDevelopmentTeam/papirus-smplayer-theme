INSTALLDIR = $(DESTDIR)/usr/share/smplayer/themes
RM = rm -rf
SHELL = /bin/bash

all:

install: local

clear:
	$(RM) $(INSTALLDIR)/Papirus{,Dark}
local:
	find Papirus{,Dark} -type f -exec install -Dm644 '{}' "$(INSTALLDIR)/{}" \;

uninstall: clear
