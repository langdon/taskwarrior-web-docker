
.PHONY: all

all: build

build:
	docker build -t ndufour/taskwarrior-web .


