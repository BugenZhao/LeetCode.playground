all: gen icloud
	
gen:
	rsync -u LeetCode.playground/Sources/Tag.swift Scripts/Renderer/Sources/Renderer/
	swift run -c release --package-path Scripts/Renderer
	
icloud:
	rsync -u -r ./LeetCode.playground ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents

clean:
	rm -f README.md
	rm -f ./Scripts/*.json