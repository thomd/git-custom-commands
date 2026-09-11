# Custom Git Commands

Collection of custom `git` subcommands.

## Setup

```
make list
make install
```

## Commands

| Command     | Description                                                                        |
| ----------- | ---------------------------------------------------------------------------------- |
| `git repos` | Recursively scan subdirectories for git repositories and list, fetch, or pull them |

## Completions

Besides the `git-*` commands above, `bash_completion.d/` also carries completion scripts for
third-party CLIs that don't ship their own:

| Completion | Description                                                                          |
| ---------- | ------------------------------------------------------------------------------------- |
| `code`     | Completes `code` (VS Code CLI) options from `code --help` and `--profile` names from `~/Library/Application Support/Code/User/globalStorage/storage.json` (macOS) |
