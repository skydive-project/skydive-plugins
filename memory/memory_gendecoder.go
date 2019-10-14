// Code generated - DO NOT EDIT.

package main

import (
	"github.com/skydive-project/skydive/common"
	"strings"
)

func (obj *Usage) GetFieldBool(key string) (bool, error) {
	return false, common.ErrFieldNotFound
}

func (obj *Usage) GetFieldInt64(key string) (int64, error) {
	switch key {
	case "Total":
		return int64(obj.Total), nil
	case "Free":
		return int64(obj.Free), nil
	case "UsedPercent":
		return int64(obj.UsedPercent), nil
	}
	return 0, common.ErrFieldNotFound
}

func (obj *Usage) GetFieldString(key string) (string, error) {
	return "", common.ErrFieldNotFound
}

func (obj *Usage) GetFieldKeys() []string {
	return []string{
		"Total",
		"Free",
		"UsedPercent",
	}
}

func (obj *Usage) MatchBool(key string, predicate common.BoolPredicate) bool {
	return false
}

func (obj *Usage) MatchInt64(key string, predicate common.Int64Predicate) bool {
	if b, err := obj.GetFieldInt64(key); err == nil {
		return predicate(b)
	}
	return false
}

func (obj *Usage) MatchString(key string, predicate common.StringPredicate) bool {
	return false
}

func (obj *Usage) GetField(key string) (interface{}, error) {
	if i, err := obj.GetFieldInt64(key); err == nil {
		return i, nil
	}
	return nil, common.ErrFieldNotFound
}

func init() {
	strings.Index("", ".")
}
