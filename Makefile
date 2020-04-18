all:
	@echo "Hello!"
gen:
	swift run --package-path Scripts/GenReadme
clean_readme:
	rm -f README.md
	rm -f ./Scripts/*.json