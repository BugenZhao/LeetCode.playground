all:
	@echo "Hello!"
gen:
	./Scripts/gen_readme.py
clean:
	rm -f ./Scripts/*.json