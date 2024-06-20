.PHONY: publish
publish:
	cargo publish --dry-run --no-verify
	cargo publish --no-verify

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
