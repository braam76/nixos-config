# Shared theme

The source of truth is **`theme-generator/themes/vague.json`**, using the complete
[upstream Vague palette](https://github.com/vague-theme/vague/blob/main/palette.json),
including ANSI bright/dim and diff colors, plus shared semantic roles.

Read **[theme-generator/README.md](theme-generator/README.md)** for the Python/Jinja
environment, service setup, template syntax, app coverage and reload limitations.

## How it works

```text
JSON palette + semantic roles
            ↓
      Jinja templates
            ↓
   native files in home/
            ↓ Stow links
      applications
```

The user service watches JSON/templates and renders changed files. Supported
apps reload automatically. Apps without a safe live reload read the new colors
on restart; the generator never kills your editors or desktop applications.
Edit templates rather than generated files. Layout/config files not owned by a
template remain directly editable.

Neovim uses the Vague plugin for highlight coverage. The shared JSON supplies its
syntax and UI colors, diff backgrounds, and terminal ANSI palette. Transparency
remains enabled; menus and active status lines retain opaque surfaces.

VS Code remains excluded to preserve its newer local configuration. Pi uses its
terminal-adaptive `system` theme, including Pi's own contrast adjustments.

## Scope

Generated themes cover Alacritty, Neovim, Emacs, btop, tmux, Yazi and file previews,
Mango, Fuzzel, Mako, Walker, Waybar, Starship, Fish/Zsh, GTK 2/3/4 and KDE/Qt.

Firefox, Helium and LibreOffice inherit system colors where their selected UI
backend supports them. Browser profiles, webpages, documents, icons, fixed
Plasma SVG assets, the bootloader and SDDM are not forcibly recolored. Shared
system decorations may also affect VS Code even though its settings are untouched.
Fonts, color management and app-specific shading can still affect perception;
sharing a palette does not make different rendering engines pixel-identical.

## Switching an existing checkout

The generated theme filenames now use `vague` (`Vague.colors` for KDE). Re-run
Stow after rendering to replace old deployment links and link the new files:

```sh
theme-render
stow --restow --target="$HOME" home
```

Restart Neovim once to install/load `vague-theme/vague.nvim`; its palette watcher
handles subsequent edits. Restart other apps or relogin where live reload is not
supported. VS Code's independently selected theme is intentionally unchanged.
