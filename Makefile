.PHONY: all
all: clean test

.PHONY: test
test: lint
	go test $(TESTFLAGS) ./...

.PHONY: devel-deps
devel-deps:
	go install golang.org/x/lint/golint

.PHONY: lint
lint: devel-deps
	go vet ./...
	golint -set_exit_status ./...

.PHONY: cover
cover: lint
	go test -race -covermode atomic -coverprofile=profile.cov ./...

.PHONY: clean
clean:
	go clean
