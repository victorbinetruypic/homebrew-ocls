# victorbinetruypic/homebrew-ocls

Homebrew tap for [ocls](https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI) —
the offline security scanner for agentic AI framework installations.

## Install

```bash
brew tap victorbinetruypic/ocls
brew install ocls
```

That's it. `ocls` is now in your `$PATH`.

## Usage

```bash
# Scan your Claude Code or OpenClaw installation (auto-detected)
ocls

# Scan a specific directory
ocls ~/.claude

# Show remediation steps for every finding
ocls -v

# Machine-readable output
ocls --json | jq '.overall_score'
```

For the full CLI reference, see the
[main repository](https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI).

## Update

```bash
brew update && brew upgrade ocls
```

## Uninstall

```bash
brew uninstall ocls
brew untap victorbinetruypic/ocls
```

## Formula

The formula is kept in [`Formula/ocls.rb`](Formula/ocls.rb).
It builds `ocls` from source using `cargo` (Rust is listed as a build dependency
and installed automatically by Homebrew if not already present).

Formula updates are automated: when a new release is tagged in the main repository,
the CI pipeline recomputes the source tarball SHA256 and pushes an updated commit
to this tap.

## License

MIT — see the [main repository](https://gitlab.com/pyratzlabs/software/Openclaw_Security_Tooling_CLI)
for details.
