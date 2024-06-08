# patana.nvim

A minimalistic Neovim theme inspired in [Patana Tufillo](https://31minutos.fandom.com/wiki/Patana_Tufillo) from 31 Minutos.

> [!NOTE]
> The design philosophy of this theme is the following:
> - Mainly monochrome, with color for literals (`literal`) and errors (`error`)
> - Things that require my attention should be in *bold* typeface
> - Things that don't require my attention should be in *italic* typeface
> - UI stuff that require attention should be highlighted with accent color
> - Visual and search will have a "highlighter" style background (`visual`)
> - Diff status also colored, but it should be subtle.

> [!IMPORTANT]
> This is a theme in its infancy, expect breaking changes, bugs and
> inconsistencies.

## Showcase

Barebones Neovim config

`cvigilv` Neovim config

## Features

- Up-to-date to the latest Neovim 0.10 features
- Basic LSP and Tree-sitter support
- Support from the following plugins:
  - `gitsigns.nvim`
  - `quickscope.vim`
  - `whichkey.nvim`
  - `oil.nvim`

## Installation

Install `patana.nvim` with your preferred package manager:

<details open>
  <summary>lazy.nvim</summary>

```lua
{
  'cvigilv/patana.nvim',
  opts = {},
}
```

</details>

<details>
  <summary>Packer</summary>

```lua
require("packer").startup(function()
	use({
		"cvigilv/patana.nvim",
		config = function()
			require("patana").setup()
		end,
	})
end)
```

</details>

<details>
  <summary>Paq</summary>

```lua
require("paq")({
	{ "cvigilv/patana.nvim" },
})
```

</details>

<details>
  <summary>vim-plug</summary>

```vim
Plug 'cvigilv/patana.nvim'
```

</details>

<details>
  <summary>dein</summary>

```vim
call dein#add('cvigilv/patana.nvim')
```

</details>

<details>
  <summary>Pathogen</summary>

```sh
git clone --depth=1 https://github.com/cvigilv/patana.nvim.git ~/.vim/bundle/
```

</details>

<details>
  <summary>Neovim native package</summary>

```sh
git clone --depth=1 https://github.com/cvigilv/patana.nvim.git \
  "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/patana/start/patana.nvim
```

</details>

> [!NOTE]
> To make use of the latest version of the plug-in you must configure your favorite package
> manager to point to the `develop` branch. But beware, you must expect new functionality, bugs
> and breaking changes from time to time.

## Roadmap

This is my personal theme, that is **very opinionated and intended to be used
mainly in `bg=light` mode**. Therefore, the roadmap will reflect mainly the things
I need to have up and running for a comfortable use. Said that, if you use the
theme and want to add specific highlight groups for plugins I will be more than
willing of merging those changes in order to make this theme as feature complete
as possible.

- [ ] Support for specific languages
  - [ ] Julia
  - [ ] Python
  - [ ] Bash
  - [ ] Markdown
  - [ ] Typst
- [ ] Cover some plugins with proper highlight groups
- [ ] Compartmentalize theme so colors can be used in other plugins
