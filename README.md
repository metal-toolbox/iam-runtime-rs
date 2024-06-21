There are 2 crates in this repo: `builder` and `iam-runtime`.

The `builder` is there to generate the protobuf code. It is not published. The
generated code ends up in `iam-runtime` which is published as the
`iam-runtime-rs` crate.

We separate it like this so that `iam-runtime-rs` does not need to be
responsible for building itself, meaning crates which depend on `iam-runtime-rs`
do not need to have `protoc` installed.

## Prepare a new crate version

When there is a new version of [`iam-runtime`][iamr] navigate to the `Action` tab in Github. Select the `Bump version`
workflow. On the right-hand side, select `Run workflow`. Enter the `iam-runtime`
version you want to generate code for **without the `v` prefix** (eg: `0.4.0`).
The action will fetch the protos for that version, build the code and open a
PR.

When the action completes, review and merge the PR. After that you can trigger
the `Publish workflow.

## Publish a new crate

After merging, navigate to the `Action` tab in Github. Select the `publish`
workflow. On the right-hand side, select `Run workflow`. This will publish a
new crate. Verify that a new one exists on [crates.io][crate] after the task has
run.

## Manual alternative

If either of the workflows do not work, here are the manual steps:

1. Export the new version:
	```
	export VERSION=0.0.0
	```
1. Run `make build`
		This will:

	- Fetch the [proto definitions][proto] from `iam-runtime`, put them in
		./builder/proto.
	- Bump the version number in [`Cargo.toml`][toml].
	- Generate the protobuf code.
	- Check that everything builds.

1. Commit and push your changes.

1. Get an API key from crates.io. _If you are not a member of an owning team you
	 will not be able to do the next steps._

1. Login locally:
	```sh
	cargo login
	# paste in your key when prompted
	```

1. Run `make publish`.
		This will:

	- Do a dry run of the crates.io publish
	- Publish the actual crate.

1. Check the crate has been updated on crates.io

### TODO

- [ ] Automate the PR workflow whenever a new iam-runtime version is released
- [ ] Remove the manual step of publishing

[proto]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
[toml]: ./Cargo.toml
[iamr]: https://github.com/metal-toolbox/iam-runtime
[crate]: https://crates.io/crates/iam-runtime-rs
