VER=0.9.2
TCLSH=tclsh
DESTDIR=
PREFIX=/usr/local
TM_MODE=-ziplet	# Compress the generated code and prefix a loader
#TM_MODE=

all: tm docs

tm/docker-$(VER).tm: v1.41.json
	mkdir -p tm
	$(TCLSH) build.tcl $(TM_MODE) -in $< -out $@

#doc/docker.n: doc/docker.md
#	pandoc --standalone --from markdown --to man doc/docker.md --output doc/docker.n

#README.md: doc/docker.md
#	pandoc --standalone --from markdown --to gfm doc/docker.md --output README.md

install-tm: tm
	mkdir -p "$(DESTDIR)$(PREFIX)/lib/tcl8/site-tcl/"
	cp tm/docker-$(VER).tm "$(DESTDIR)$(PREFIX)/lib/tcl8/site-tcl/"

tm: tm/docker-$(VER).tm

test: all
	$(TCLSH) tests/all.tcl $(VER) $(TESTFLAGS)

install: install-tm install-doc

docs: doc/docker.n README.md

install-doc: docs
	mkdir -p "$(DESTDIR)$(PREFIX)/man/mann"
	cp doc/docker.n "$(DESTDIR)$(PREFIX)/man/mann/"

clean:
	-rm -r tm doc/docker.n

.PHONY: all test tm install docs install-tm install-doc clean
