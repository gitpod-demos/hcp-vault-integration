<img src="https://www.gitpod.io/images/media-kit/logo-dark-theme.png" width="250">

# Always ready-to-code 🍊
Gitpod is the developer platform for on-demand Cloud Development Environments (CDEs). Say goodbye to slow onboarding and unmanageable dev environments. Gitpod removes pain and frustration from your developer experience, helps you deliver software faster, and makes you more secure and compliant.

# Using Vault CLI with Gitpod Workspace via an OIDC Provider
This guide demonstrates how to use your Gitpod workspace to retrieve secrets from Hashicorp Vault using the OIDC method. This approach leverages your current OIDC provider for authentication, eliminating the need to store multiple secrets as environment variables in the Gitpod dashboard.

## Prerequisites
- A Vault cluster.
- VSCode Desktop connected to your Gitpod workspace.
- Environment variables set in User Settings: `VAULT_ADDR`, `VAULT_NAMESPACE`, and `VAULT_TOKEN`.

## Step-by-Step Procedure

### 1. Configure Environment Variables
Ensure the following environment variables are set in your Gitpod User Settings:
- `VAULT_ADDR`
- `VAULT_NAMESPACE`
- `VAULT_TOKEN`
