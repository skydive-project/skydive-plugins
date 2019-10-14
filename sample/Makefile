export GO111MODULE?=on

include $(abspath ../.mk/easyjson.mk)
include $(abspath ../.mk/gendecoder.mk)

sample.so: genlocalfiles
	go build -buildmode=plugin sample.go

.PHONY: genlocalfiles
genlocalfiles: .gendecoder .easyjson
