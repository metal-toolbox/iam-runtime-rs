## iam-runtime-rs

Crate containing generated protobufs from [`iam-runtime`][iamr] [protos][protos].

### Example:

```rust
use anyhow::{Error, Result};
use tokio::net::UnixStream;
use tonic::transport::{Endpoint, Uri};
use tower::service_fn;

use iam_runtime_rs::iam_runtime::{
    authentication_client::AuthenticationClient, authorization_client::AuthorizationClient,
    AccessRequestAction, CheckAccessRequest, ValidateCredentialRequest,
};

async fn do_auth(token: String) -> Result<(), Error> {
    let channel = Endpoint::try_from(format!("http://[::]:50051/{}", "/tmp/iam_runtime.sock"))?
        .connect_with_connector(service_fn(|u: Uri| {
            UnixStream::connect(String::from(u.path()))
        }))
        .await?;

    let mut authn_client = AuthenticationClient::new(channel.clone());
    let mut authz_client = AuthorizationClient::new(channel);

    let request = tonic::Request::new(ValidateCredentialRequest {
        credential: token.clone(),
    });

    let resp = authn_client
        .validate_credential(request)
        .await?
        .into_inner();

    if resp.result == 1 {
        return Err(Error::msg("invalid token"));
    };

    let action = AccessRequestAction {
        action: String::from("some-action"),
        resource_id: String::from("some-resource"),
    };

    let request = tonic::Request::new(CheckAccessRequest {
        credential: token,
        actions: vec![action],
    });

    let resp = authz_client.check_access(request).await?.into_inner();
    if resp.result == 1 {
        return Err(Error::msg("access denied"));
    }

    Ok(())
}
```

[iamr]: https://github.com/metal-toolbox/iam-runtime
[protos]: https://github.com/metal-toolbox/iam-runtime/tree/main/proto
