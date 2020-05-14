export GO111MODULE?=on

include $(abspath ../.mk/easyjson.mk)
include $(abspath ../.mk/gendecoder.mk)

memory.so: genlocalfiles
	go build -buildmode=plugin ./...

.PHONY: genlocalfiles
genlocalfiles: .gendecoder .easyjson
