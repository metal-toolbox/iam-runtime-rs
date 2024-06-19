## iam-runtime-rs

Crate containing runtime client generated from [`iam-runtime` protos][protos].

### Create a new version

1. Check the latest tag in [releases][releases].

1. Update the version to the next one in [`Cargo.toml`][toml].

1. Install [`cargo index`][c-index].

1. Run:
	```
	cargo index add --index . --index-url https://github.com/equinixmetal/iam-runtime-rs -- --allow-dirty
	```

1. The `index add` command will create a new entry in [ia/m-/iam-runtime-rs][crate]
	and commit the change. The commit message is not great, so amend it first.
	```
	git commit --amend -m "Add <version> index"
	```

1. Push the changes.

1. Run `cargo package`. A new file will be created at
	 `target/package/iam-runtime-rs-<version>.crate`.

1. In Github, create a new release. Put in the new version number (eg `v0.0.0`),
	 to create the tag. Attache the `target/package/iam-runtime-rs-<version>.crate`
	 file, and click Publish.


[protos]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
[c-index]: https://github.com/ehuss/cargo-index
[crate]: ./ia/m-/iam-runtime-rs
[releases]: https://github.com/equinixmetal/iam-runtime-rs/releases
[toml]: ./Cargo.toml
