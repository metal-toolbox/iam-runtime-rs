.PHONY: publish
publish:
	cargo publish -p iam-runtime-rs --dry-run --no-verify
	cargo publish -p iam-runtime-rs --no-verify

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
