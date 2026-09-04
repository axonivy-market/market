# Onboard a Product

New products are onboarded with the `Onboard Product` GitHub Actions workflow.
The workflow creates a public repository in the `axonivy-market` organization,
pushes the first source commit to `master`, pushes the latest source state to an
`onboard` branch, and opens a pull request from `onboard` to `master`.

## Run the Workflow

1. Open the `market` repository on GitHub.
2. Go to `Actions` > `Onboard Product` > `Run workflow`.
3. Enter the source repository URL, for example:
   `https://github.com/someuser/some-connector`.
4. Start the workflow and approve the `onboarding` environment review.

## Permissions

The workflow uses the `MARKET_ORG_TOKEN` secret from the protected `onboarding`
environment. The token is only needed for public repositories and should have a
short expiration.

`MARKET_ORG_TOKEN` is a classic personal access token. GitHub does not issue
classic personal access tokens for an organization directly; the token belongs
to a GitHub user, and the user's organization membership allows the workflow to
create repositories in `axonivy-market`. Store that user token as an environment
secret in this repository.

### Lease

If the token is no longer valid, generate a new token as follows:

1. Use a GitHub user that is a member of `axonivy-market` and is allowed to
   create public repositories in the organization.
2. Navigate to that user's GitHub profile > Settings > Developer settings >
   Personal access tokens > Tokens (classic) > Generate new token.
3. Configure the token:
   - Expiration: 30 days or less.
   - Scope: `public_repo`.
4. Generate the token and copy it to your clipboard.
5. Go to the `market` repository settings on GitHub:
   Settings > Environments > `onboarding` > Environment secrets.
6. Edit or create the secret named `MARKET_ORG_TOKEN`.
7. Paste the personal token and save it.

If the organization requires SAML SSO, authorize the token for `axonivy-market`.

Ready: now launch the workflow.