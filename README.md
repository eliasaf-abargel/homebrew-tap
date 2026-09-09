# homebrew-tap

Homebrew tap for [CTX](https://github.com/eliasaf-abargel/CTX), a native cloud and
Kubernetes context manager for macOS.

```sh
brew install --cask eliasaf-abargel/tap/ctx
```

Upgrading later:

```sh
brew upgrade --cask ctx
```

## How the cask stays current

`Casks/ctx.rb` is updated by [`sync-cask.yml`](.github/workflows/sync-cask.yml),
which reads the latest CTX release, hashes the published asset and commits the
result when either the version or the hash has changed.

It runs on a schedule and can be started by hand from the Actions tab. Nothing
needs to be configured for it: it writes to this repository with the token
GitHub gives the run, so there is no personal access token to create, store or
rotate — which is also why publishing a CTX release does not push here directly.
