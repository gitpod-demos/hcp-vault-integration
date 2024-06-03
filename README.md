<img src="https://www.gitpod.io/images/media-kit/logo-dark-theme.png" width="250">

# Connecting Your Gitpod Workspace To Vault 🍊
This guide demonstrates how to use your Gitpod workspace to retrieve secrets from Hashicorp Vault using **OpenID Connect (OIDC) method**. This approach leverages your current OIDC provider for authentication, eliminating the need to store multiple secrets as environment variables in the Gitpod dashboard.

## Pre-requisites
- A Vault cluster.
- Desktop IDE connected to your [Gitpod workspace via SSH](https://www.gitpod.io/docs/configure/user-settings/ssh).

## Step-by-Step Procedure

### 1. Configure Environment Variables
Ensure the following environment variables are set in your Gitpod User Settings:
- `VAULT_ADDR`
- `VAULT_NAMESPACE`
- `VAULT_TOKEN`

See how to [Access a Vault Cluster on HCP](https://developer.hashicorp.com/vault/tutorials/get-started-hcp-vault-dedicated/vault-access-cluster)

### 2. Workspace Image Configuration
Your workspace image should be configured to use Vault CLI. In your `.gitpod.Dockerfile`, include the following:
```Dockerfile
FROM gitpod/workspace-full

RUN brew tap hashicorp/tap
RUN brew install hashicorp/tap/vault
```

This is then called in your `gitpod.yml` with
```yaml
image:
  file: .gitpod.Dockerfile
```

For officially signed HashiCorp packages for Linux; See [Getting Started](https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install)

### 3. Verify Vault Connectivity
In your workspace terminal, run the following command to verify connectivity to the Vault cluster:
```sh
vault status
```

### 4. Setting up authentication with Vault
Follow Hashicorp's documentation to configure OIDC with Vault. This includes registering Vault with your OIDC provider of choice and setting necessary policies. This can all be done within your Gitpod workspace. OIDC Providers include:
- [OIDC Auth method with Auth0](https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-auth)
- [OIDC Auth method with AzureAD](https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-auth-azure)
- [OIDC Auth method with Okta](https://developer.hashicorp.com/vault/tutorials/auth-methods/vault-oidc-okta)
- [Vault as an OIDC Identity Provider](https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-identity-provider)

### 5. Login to Vault
Once OIDC is configured, log in to Vault using the command:
```sh
vault login -method=oidc
```
This will link to open a pop-up window to complete authentication

### 6. Interact with Vault
After logging in, you can interact with Vault using the following commands:
```sh
vault kv list <secret>
vault kv get <path/to/secrets>
```
## Notes
- When registering Vault with your OIDC provider, the redirect URI `localhost:8250` will only work if you are running your IDE locally rather than in a browser.

