# Check Vela Docs Actions

This action that automatically check the correctness of the doc.

## Inputs

### `gh-page`

- [**Required**] - github page repo, must be the ssh address. eg: `git@github.com:oam-dev/kubevela.io.git`

### `docs-path`
- path of docs dir. default: `docs`

## Example usage

```yaml
name: docs
on:
  push:
    paths:
      - 'docs/**'
jobs:
  docs-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: webfactory/ssh-agent@v0.5.0
        with:
          ssh-private-key: ${{ secrets.GH_PAGES_DEPLOY }}
      - name: Check Vela Docs
        uses: yangsoon/check-vela-docs
        with:
          gh-page: git@github.com:oam-dev/kubevela.io.git
```