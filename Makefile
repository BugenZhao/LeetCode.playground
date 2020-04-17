all:
	@echo "Hello!"
gen:
	swift ./Scripts/GenReadme.swift
clean_readme:
	rm -f README.md
	rm -f ./Scripts/*.json