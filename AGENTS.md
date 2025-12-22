# Repository Guidelines

## Project Structure & Module Organization

Root directories mirror the apps they configure (`nvim/`, `tmux/`, `ghostty/`); keep new dotfiles inside the matching folder and use the existing `dot-` prefix so GNU Stow and Home Manager link them cleanly. Nix sources sit at the root: `flake.nix` defines hosts, `configuration.nix` sets system packages, and `home.nix` manages user state. Bootstrap scripts (`setup.sh`, `setup-mac.sh`) plus helpers in `scripts/dot-local` install prerequisites and place binaries under `~/.local/bin`.

## Build, Test, and Development Commands

- `./setup-mac.sh`: interactive macOS bootstrap that installs Nix/Homebrew, prompts for the host, then applies the matched darwin + Home Manager profiles.
- `bash setup.sh`: cross-platform installer that prepares package managers, stows configured apps, and rebuilds the `bat` cache.
- `nix flake check`: validates flake evaluation; pair with `nix ... darwin -- switch --flake .#<host>` or `home-manager ... -- switch --flake .#<user>` to preview activation without rerunning bootstrap.

## Coding Style & Naming Conventions

- Match existing indentation: 2 spaces in Nix attrsets, 4 spaces inside shell functions, tabs avoided.
- Keep filenames descriptive with `dot-` prefixes and mirror upstream layout (use `dot-config/<app>` or `dot-local/bin` when files end up in `$HOME`).
- Format Nix with `nixfmt-rfc-style`, lint shell helpers with `shellcheck`, and prefer lower-case, hyphenated host labels (`jons-mac-mini`).

## Testing Guidelines

- Run `stow --simulate --dotfiles <dir>` to confirm new symlink targets before committing; follow with a real stow once the plan looks clean.
- After Nix edits, execute `nix flake check` and the relevant `nix ... darwin -- switch --flake .#<host>` or `home-manager ... -- switch --flake .#<user>` on a non-production machine.
- Manually launch critical apps (Neovim, Kitty, tmux) after activation and note any manual steps in the directory README.

## Commit & Pull Request Guidelines

- Use focused commits with short, imperative subjects (`add ghostty theme`, `update mac brew apps`) and mention the touched host or tool when useful.
- Avoid mixing macOS-only tweaks with Linux-specific updates; separate commits keep activation rollbacks simple.
- PRs should summarize the change, list target hosts, record manual verification, and attach screenshots for visible tweaks; link issues or TODOs when relevant.

## Security & Configuration Tips

Keep secrets, tokens, and machine-specific overrides out of version control; prefer environment variables or `.gitignore` entries. Document any command requiring `sudo` and review new Homebrew/MAS additions for licensing expectations.
