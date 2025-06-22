# GitHub Action - Permanent Interaction Limits

This GitHub Action cyclically re-enables temporary interaction limits to make them effectively permanent

You can apply these limits to a repository, an organization, or a user account

## Usage

### Repository Interaction Limits

To apply interaction limits to the repository where the action is running, use the following workflow:

```yml
name: Permanent Interaction Limits
on:
  schedule:
    - cron: '0 0 1 */6 *' # 6 Months (Maximum temporary interaction limit allowed by GitHub)
  workflow_dispatch:

jobs:
  update-interaction-limits:
    runs-on: ubuntu-latest
    steps:
      - name: Permanent Interaction Limits
        uses: Malix-Labs/GitHub-Action_Permanent-Interaction-Limits@v1
        # with: # [documentation](https://github.com/marketplace/actions/permanent-interaction-limits#inputs)
          # scope: contributors_only
```

## Inputs

| Input | Required | Type | Default | Description |
|-|-|-|-|-|
| `scope` | False | `"existing_users"` \| `"contributors_only"` \| `"collaborators_only"` | Currently set interaction limits scope on GitHub settings | The scope of the interaction limits |

## Applying Limits to an Owner (Organization or User)

This action is designed to work at the repository level out-of-the-box. However, you can also apply interaction limits at the organization or user level by creating a dedicated workflow that uses the `gh` CLI.

The "owner" can be an organization or a user account. Here are the recommended best practices for setting up these workflows:

*   **For an organization:** Create the workflow in a `.github` repository within your organization. This provides a central place to manage organization-wide settings.
*   **For a user:** Create the workflow in a repository that has the same name as your username (e.g., `Malix-Labs/Malix-Labs`).

### Organization-level Limits

Here is an example workflow to set interaction limits for an entire organization. You will need to create a Personal Access Token (PAT) with `org:write` scope and add it as a secret to the repository.

```yaml
# Place this workflow in .github/workflows/org-interaction-limits.yml in your organization's .github repository
name: Set Organization Interaction Limits
on:
  schedule:
    - cron: '0 0 1 */6 *' # Run every 6 months
  workflow_dispatch:

jobs:
  set-limits:
    runs-on: ubuntu-latest
    steps:
      - name: Apply interaction limit to organization
        env:
          GITHUB_TOKEN: ${{ secrets.PAT_WITH_ORG_ACCESS }} # PAT with org:write scope
          OWNER: "your-org-name" # Replace with your organization's name
          LIMIT: "contributors_only" # Choose your desired limit
        run: |
          gh api 'orgs/${{ env.OWNER }}/interaction-limits' \
            --method PUT \
            --field "limit=${{ env.LIMIT }}" \
            --field "expiry=six_months"
```

### User-level Limits

Here is an example workflow to set interaction limits for your user account. You will need a PAT with `user` scope.

```yaml
# Place this workflow in .github/workflows/user-interaction-limits.yml in your <username>/<username> repository
name: Set User Interaction Limits
on:
  schedule:
    - cron: '0 0 1 */6 *' # Run every 6 months
  workflow_dispatch:

jobs:
  set-limits:
    runs-on: ubuntu-latest
    steps:
      - name: Apply interaction limit to user
        env:
          GITHUB_TOKEN: ${{ secrets.PAT_WITH_USER_SCOPE }} # PAT with user scope
          LIMIT: "collaborators_only" # Choose your desired limit
        run: |
          gh api 'user/interaction-limits' \
            --method PUT \
            --field "limit=${{ env.LIMIT }}" \
            --field "expiry=six_months"
```
