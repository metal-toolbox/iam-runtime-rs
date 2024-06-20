.PHONY: release
release:
	cargo publish --dry-run
	cargo publish

.PHONY: build
build: protos bump
	cargo build
	cargo fmt

.PHONY: protos
protos:
	./script/fetch.sh

.PHONY: bump
bump:
	./script/version.sh
