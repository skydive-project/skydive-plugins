GEN_EASYJSON_FILES = $(patsubst %.go,%_easyjson.go,$(shell git grep //go:generate | grep "easyjson" | grep -v Makefile | cut -d ":" -f 1))

%_easyjson.go: %.go
	go generate -run easyjson $<

.PHONY: .easyjson
.easyjson: $(GEN_EASYJSON_FILES)

.PHONY: .easyjson.clean
.easyjson.clean:
	find . \( -name *_easyjson.go ! -path './vendor/*' \) -exec rm {} \;

