//go:generate go run github.com/skydive-project/skydive/graffiti/gendecoder --package github.com/skydive-project/skydive-plugins/memory
//go:generate go run github.com/mailru/easyjson/easyjson $GOFILE

/*
 * Copyright (C) 2019 Red Hat, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

// This package implement a probe which reports memory usage to the host node.
// This probe is fairly basic and provide a good example
// to start writting a probe.
package main

import (
	json "encoding/json"
	"fmt"
	"time"

	"github.com/shirou/gopsutil/mem"

	"github.com/skydive-project/skydive/graffiti/getter"
	"github.com/skydive-project/skydive/graffiti/graph"
	"github.com/skydive-project/skydive/probe"
	"github.com/skydive-project/skydive/topology/probes"
)

// ProbeHandler describes a memory probe handler.
// It implements the probe.Handler interface.
type ProbeHandler struct {
	Ctx  probes.Context
	quit chan struct{}
}

// Usage defines how the topology metadata will look like. Tags below
// are used in order to generate marshal/unmarshal functions and getters.
// easyjson:json
// gendecoder
type Usage struct {
	Total       int64
	Free        int64
	UsedPercent int64
}

// Start the handler. Implements the probe.Handler interface.
func (p *ProbeHandler) Start() error {
	// start a goroutine in order to update the graph
	go func() {
		// update the graph each five seconds
		ticker := time.NewTicker(5 * time.Second)
		defer ticker.Stop()

		for {
			select {
			case <-p.quit:
				// got a message on the quit chan
				return
			case <-ticker.C:
				v, err := mem.VirtualMemory()
				if err != nil {
					p.Ctx.Logger.Errorf("unable to retrieve memory information: %s", err)
					continue
				}

				usage := &Usage{
					Total:       int64(v.Total),
					Free:        int64(v.Free),
					UsedPercent: int64(v.UsedPercent),
				}

				// lock the graph for modification
				p.Ctx.Graph.Lock()

				// add metadata entry to the root node
				p.Ctx.Graph.AddMetadata(p.Ctx.RootNode, "Memory", usage)

				// release the graph lock
				p.Ctx.Graph.Unlock()
			}
		}
	}()

	return nil
}

// Stop the handler. Implements the probe.Handler interface.
func (p *ProbeHandler) Stop() {
	p.quit <- struct{}{}
}

// NewAgentProbe returns a new topology memory probe
func NewAgentProbe(ctx probes.Context, bundle *probe.Bundle) (probes.Handler, error) {
	return &ProbeHandler{
		Ctx:  ctx,
		quit: make(chan struct{}),
	}, nil
}

// MetadataDecoder implements a json message raw decoder. It is used
// by the analyzer to decode properly the JSON message with the proper types.
// the Getter interface functions will be generated by the gendecoder generator.
// See the first line and the tag at the struct declaration.
func MetadataDecoder(raw json.RawMessage) (getter.Getter, error) {
	var usage Usage
	if err := json.Unmarshal(raw, &usage); err != nil {
		return nil, fmt.Errorf("unable to unmarshal routing table %s: %s", string(raw), err)
	}

	return &usage, nil
}

// RegisterDecoders registers metadata decoders
func RegisterDecoders() {
	// register the MemoryDecoder so that the graph knows how to decode the
	// Memory metadata field.
	graph.NodeMetadataDecoders["Memory"] = MetadataDecoder
}

func main() {
}
