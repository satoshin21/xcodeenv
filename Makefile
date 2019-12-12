usr_local ?= /usr/local

bindir = $(usr_local)/bin
libdir = $(usr_local)/lib

build:
	swift build -c release --disable-sandbox

install: build
	install ".build/release/xcodeenv" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/xcodeenv"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
