## Prepare a new crate version

When there is a new version of [`iam-runtime`][iamr]:

1. Export the new version:
	```
	export VERSION=0.0.0
	```
1. Run `make build`
		This will:

	- Fetch the [proto definitions][proto] from `iam-runtime`, put them in
		./proto.
	- Bump the version number in [`Cargo.toml`][toml].
	- Check that everything builds.

1. Commit and push your changes.

## Publish a new crate

After merging, navigate to the `Action` tab in Github. Select the `publish`
workflow. On the right-hand side, select `Run workflow`. This will publish a
new crate. Verify that a new one exists on [crates.io][crate] after the task has
run.

### Manual alternative

If the workflow does not work, you can publish the crate manually

1. Get an API key from crates.io. _If you are not a member of an owning team you
	 will not be able to do the next steps._

1. Login locally:
	```
	cargo login
	# paste in your key when prompted
	```

1. Run `make release`.
		This will:

	- Do a dry run of the crates.io publish
	- Publish the actual crate.

1. Check the crate has been updated on crates.io

1. Push your changes.

### TODO

- [ ] Automate regenerating whenever a new iam-runtime version is released,
	should open a new PR with that commit above.
- [ ] Remove the manual step of publishing

[proto]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
[toml]: ./Cargo.toml
[iamr]: https://github.com/metal-toolbox/iam-runtime
[crate]: https://crates.io/crates/iam-runtime-rs
