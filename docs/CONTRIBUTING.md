# Contributing

## Documentation

- <https://docs.github.com/en/actions/sharing-automations/creating-actions/metadata-syntax-for-github-actions>
- <https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions>
- <https://docs.github.com/en/rest/interactions?apiVersion=2022-11-28>

### Token Permissions

- <https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#permissions>
- <https://docs.github.com/en/rest/interactions?apiVersion=2022-11-28>
- <https://docs.github.com/en/rest/interactions/repos?apiVersion=2022-11-28#set-interaction-restrictions-for-a-repository>
	> "Administration" repository permissions (write)
- <https://docs.github.com/en/rest/interactions/orgs?apiVersion=2022-11-28#set-interaction-restrictions-for-an-organization>
	> "Administration" organization permissions (write)
- <https://docs.github.com/en/rest/interactions/user?apiVersion=2022-11-28#set-interaction-restrictions-for-your-public-repositories>
	> "Interaction limits" user permissions (write)

As you can see, the default GitHub Action issued' `GITHUB_TOKEN` would not have enough permissions

- <https://docs.github.com/en/actions/how-tos/security-for-github-actions/security-guides/use-github_token-in-workflows#granting-additional-permissions>

The user thus needs to either create a Fine-Grained Personal Access Token (PAT) OR a GitHub App and then store the respective secrets in the caller workflow's repository/organization secrets

We chose Fine-Grained Personal Access Token (PAT) for ease of setup for the end-user
