## Publish a new crate version

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

1. Commit your changes.

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
- [ ] Automate releasing new crates when that PR is merged.

[protos]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
[toml]: ./Cargo.toml
[iamr]: https://github.com/metal-toolbox/iam-runtime
