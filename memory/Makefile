export GO111MODULE?=on

include $(abspath ../.mk/easyjson.mk)
include $(abspath ../.mk/gendecoder.mk)

memory.so: clean easyjson_issue_236 genlocalfiles
	sed -i 's/^package mainissue236$$/package main/' *.go
	go build -buildmode=plugin ./...

# Does not work with main package
# https://github.com/mailru/easyjson/issues/236
easyjson_issue_236:
	sed -i 's/^package main$$/package mainissue236/' *.go

clean:
	rm -f memory_easyjson.go memory_gendecoder.go

.PHONY: genlocalfiles easyjson_issue_236 clean
genlocalfiles: .gendecoder .easyjson
