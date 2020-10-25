.PHONY: default build

default: build

build:
	@docker build -t langdon/taskwarrior-web .

