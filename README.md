# Homebrew tap for SmartTimeArchive

[SmartTimeArchive](https://github.com/juniorbarchini-oss/smarttimearchive-app) archives the history of
a Time Machine (APFS) backup disk into plain, dated folders. Your Time Machine disk is only read, never
changed.

## Install

```bash
brew tap juniorbarchini-oss/tap
brew install --cask smarttimearchive
```

It installs the official `.pkg` from the project's GitHub release (checked against its SHA-256), so the
result is the same as double-clicking the installer: the engine, with its own Python, owned by root in
`/usr/local/lib/smarttimearchive` (it runs as administrator), the `sta` command and the app in
Applications. Homebrew asks for your password because the installer needs it.

Then open **SmartTimeArchive** from Applications, or type `sta`.

## Update and remove

```bash
brew upgrade --cask smarttimearchive
brew uninstall --cask smarttimearchive          # keeps the scan cache
brew uninstall --cask --zap smarttimearchive    # also deletes the scan cache (~/Library/Caches/sta)
```

Your archives (the folders and disk images you made) are never touched.

## Why a cask and not a formula

The engine runs with administrator rights. A formula would install it under Homebrew's folder, which
belongs to your user, and root would end up running code your user can modify. The cask installs the
package, which puts everything owned by root.

## Notes

- The package is **not signed by Apple**. Homebrew installs it from the command line, so macOS should
  not show the "unidentified developer" warning; if it does, see the
  [project README](https://github.com/juniorbarchini-oss/smarttimearchive-app#install).
- macOS 11 (Big Sur) or newer, Intel or Apple silicon.
- Released under the MIT license.
