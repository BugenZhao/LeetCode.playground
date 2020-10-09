all: sync gen icloud

sync:
	rsync -ur Sources/Tag.swift Scripts/Renderer/Sources/Renderer/
	$(foreach file, $(wildcard ./*.playground), rsync -ur Sources ${file};)
	
gen:
	swift run -c release --package-path Scripts/Renderer
	
icloud:
	rsync -ur ./LeetCode.playground ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents
	sed -i ".bak" "s/macos/ios/g" ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents/LeetCode.playground/contents.xcplayground
	
clean:
	rm -f README.md
	rm -f ./Scripts/*.json