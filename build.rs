fn main() -> Result<(), Box<dyn std::error::Error>> {
    // The source for these files is https://github.com/metal-toolbox/iam-runtime/tree/main/proto
    // We copy them down in order to generate the client code.
    // Right now the files are pinned at 0.4.1.
    // My next task is to create a github action which will watch for releases
    // in the iam-runtime repo and fetch the latest version of the files.
    // TODO: github action, chat to identity
    let authn_proto_file = "./proto/authentication.proto";
    let authz_proto_file = "./proto/authorization.proto";

    tonic_build::configure()
        .protoc_arg("--experimental_allow_proto3_optional")
        .build_client(true)
        .build_server(false)
        .out_dir("./src")
        .compile(&[authn_proto_file, authz_proto_file], &["proto"])?;

    Ok(())
}
