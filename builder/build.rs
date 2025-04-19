fn main() -> Result<(), Box<dyn std::error::Error>> {
    // The source for these files is https://github.com/metal-toolbox/iam-runtime/tree/main/proto
    // We copy them down in order to generate the client code.
    // It would be great if we could .gitignore them, but for now we can't because cargo publish
    // will also ignore them and cause the build to fail.
    let authn_proto_file = "./proto/authentication.proto";
    let authz_proto_file = "./proto/authorization.proto";
    let identity_proto_file = "./proto/identity.proto";

    tonic_build::configure()
        .protoc_arg("--experimental_allow_proto3_optional")
        .build_client(true)
        .build_server(true)
        .out_dir("../iam-runtime/src")
        .compile_protos(
            &[authn_proto_file, authz_proto_file, identity_proto_file],
            &["proto"],
        )?;

    Ok(())
}
