## iam-runtime-rs

Crate containing generated protobufs from [`iam-runtime` protos][protos].

### Regenerate the protos

When there is a new version of [`iam-runtime`][iamr]:

1. Copy the [`authentication.proto`][authn], [`authorization.proto`][authz],
	and [`identity.proto`][id] files to the [`proto`](./proto) directory.

1. Update the version in [`Cargo.toml`][toml] to match.

1. Run `cargo build`.

### Publish a new crate version

TODO

### TODO

- [ ] Automate regenerating the client whenever a new iam-runtime version is
	released.
- [ ] Automate releasing new crates.

[protos]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
[c-index]: https://github.com/ehuss/cargo-index
[crate]: ./ia/m-/iam-runtime-rs
[releases]: https://github.com/equinixmetal/iam-runtime-rs/releases
[toml]: ./Cargo.toml
[iamr]: https://github.com/metal-toolbox/iam-runtime
[authn]: https://github.com/metal-toolbox/iam-runtime/blob/main/proto/authentication/authentication.proto
[authz]: https://github.com/metal-toolbox/iam-runtime/blob/main/proto/authorization/authorization.proto
[id]: https://github.com/metal-toolbox/iam-runtime/blob/main/proto/identity/identity.proto
