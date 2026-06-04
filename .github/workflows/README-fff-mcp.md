# fff-mcp formula automation

`bump-fff-mcp.yml` keeps `Formula/fff-mcp.rb` aligned with stable releases of [dmtrKovalenko/fff.nvim](https://github.com/dmtrKovalenko/fff.nvim).

## Triggers

| Trigger | Who can run | Behavior |
| --- | --- | --- |
| `schedule` | GitHub (no user) | Every 6h — polls latest stable release |
| `repository_dispatch` | Official fff release workflow only | Instant bump; requires matching `FFF_RELEASE_BUMP_SECRET` |
| `workflow_dispatch` | **jellydn** or **dmtrKovalenko** only | Manual bump; optional `version` input |

## Secrets (instant bump from fff.nvim)

On **dmtrKovalenko/fff.nvim** (maintainer repo):

| Secret | Purpose |
| --- | --- |
| `HOMEBREW_TAP_DISPATCH_TOKEN` | PAT with **Contents: write** on `jellydn/homebrew-tap` |
| `FFF_RELEASE_BUMP_SECRET` | Shared random string; sent in dispatch payload |

On **jellydn/homebrew-tap** (same value):

| Secret | Purpose |
| --- | --- |
| `FFF_RELEASE_BUMP_SECRET` | Must match fff.nvim — rejects unauthorized dispatches |

Without these, the 6-hour schedule still updates the formula.

## Manual bump (jellydn / dmtrKovalenko)

```bash
./scripts/bump-fff-mcp.sh 0.9.2
```

Or: **Actions → Bump fff-mcp formula → Run workflow** (GitHub UI; actor must be jellydn or dmtrKovalenko).