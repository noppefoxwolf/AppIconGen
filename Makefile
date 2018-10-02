PREFIX?=/usr/local

TEMPORARY_FOLDER=./tmp_app_icon_gen

build:
	swift build --disable-sandbox -c release -Xswiftc -static-stdlib

test:
	swift test

lint:
	swiftlint

clean:
	swift package clean

xcode:
	swift package generate-xcodeproj

install: build
	mkdir -p "$(PREFIX)/bin"
	cp -f ".build/release/AppIconGen" "$(PREFIX)/bin/appicongen"

portable_zip: build
	mkdir -p "$(TEMPORARY_FOLDER)"
	cp -f ".build/release/AppIconGen" "$(TEMPORARY_FOLDER)/appicongen"
	cp -f "LICENSE" "$(TEMPORARY_FOLDER)"
	(cd $(TEMPORARY_FOLDER); zip -r - LICENSE appicongen) > "./portable_appicongen.zip"
	rm -r "$(TEMPORARY_FOLDER)"
	