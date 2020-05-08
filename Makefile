all: gen icloud
	
gen:
	swift run --package-path Scripts/GenReadme
	
icloud:
	cp -rf ./LeetCode.playground ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents

clean:
	rm -f README.md
	rm -f ./Scripts/*.json