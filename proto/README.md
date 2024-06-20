## Auto-copied protos

These files are automatically copied over as part of the build process. The
process _should_ remove them before committing, but alas that may not happen. In
an ideal world, these would be `.gitignore`d, but while `cargo build` is fine
with that, `cargo publish` uses git behind the scenes, and will ignore whatever
it is told to, resulting in failure.

Perhaps one solution is to have another binary which is not part of this crate
do the generation, but I don't have time to do this before I go.
