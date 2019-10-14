GEN_DECODER_FILES = $(patsubst %.go,%_gendecoder.go,$(shell git grep //go:generate | grep "gendecoder" | grep -v Makefile | cut -d ":" -f 1))

%_gendecoder.go: %.go
	go generate -run gendecoder $<

.PHONY: .gendecoder
.gendecoder: $(GEN_DECODER_FILES)

.PHONY: .gendecoder.clean
.gendecoder.clean:
	find . \( -name *_gendecoder.go \) -exec rm {} \;
