all: gen icloud
	
gen:
	cp LeetCode.playground/Sources/Tag.swift Scripts/GenReadme/Sources/GenReadme/
	swift run -c release --package-path Scripts/GenReadme
	
icloud:
	cp -rf ./LeetCode.playground ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents

clean:
	rm -f README.md
	rm -f ./Scripts/*.json