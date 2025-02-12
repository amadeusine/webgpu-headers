.PHONY: gen

gen: schema.json webgpu.yml
	go run ./gen -schema schema.json -yaml webgpu.yml -header webgpu.h

gen-check: gen
	@git diff --quiet -- webgpu.h || { git diff -- webgpu.h; exit 1; }
