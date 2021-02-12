RENDERER = Scripts/Renderer/.build/release/Renderer

all: sync gen icloud

sync:
	rsync -ur Sources/Tag.swift Scripts/Renderer/Sources/Renderer/
	$(foreach file, $(wildcard ./*.playground), rsync -ur Sources ${file};)

$(RENDERER):
	swift build -c release --package-path Scripts/Renderer
rd: 
	@make $(RENDERER)
	
gen: $(RENDERER)
	$(RENDERER)
	
icloud:
	rsync -ur ./LeetCode.playground ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents
	sed -i ".bak" "s/macos/ios/g" ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents/LeetCode.playground/contents.xcplayground
	
lc-%:
	cp -R Templates/LC.playground LeetCode$*.playground
	make sync
	
clean:
	rm -f README.md
	rm -f ./Scripts/*.json