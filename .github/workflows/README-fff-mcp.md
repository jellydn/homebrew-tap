# fff-mcp formula automation

`bump-fff-mcp.yml` keeps `Formula/fff-mcp.rb` aligned with stable releases of [dmtrKovalenko/fff.nvim](https://github.com/dmtrKovalenko/fff.nvim).

## Triggers

| Trigger | When |
| --- | --- |
| `schedule` | Every 6 hours — polls latest stable GitHub release |
| `repository_dispatch` (`fff-release-published`) | Immediately after upstream release (optional) |
| `workflow_dispatch` | Manual bump; optional `version` input |

## Optional: instant bump from fff.nvim releases

Add a fine-grained PAT with **Contents: write** on `jellydn/homebrew-tap` as repo secret `HOMEBREW_TAP_DISPATCH_TOKEN` on `dmtrKovalenko/fff.nvim`, then merge the `bump-homebrew-tap` job in `.github/workflows/release.yaml`.

Without that secret, the 6-hour schedule still updates the tap.

## Manual bump

```bash
./scripts/bump-fff-mcp.sh 0.9.2
```

Or: **Actions → Bump fff-mcp formula → Run workflow**.