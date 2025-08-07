# My Neovim Configuration

Welcome to my Neovim config!

I switched to neovim a few years back, after working with vanilla vim for over
20 years.  I started out with
[https://github.com/nvim-lua/kickstart.nvim](kickstart.nvim), but have modified
the configuration since then.

This is a **work in progress**, heavily customized and frequently tweaked. Like
many devs’ personal setups, it suffers a bit from the classic **"cobbler’s
children have no shoes"** problem — I focus so much on working *in* it, I don’t
always keep it clean, documented, or well-structured.

That said, it's functional, fast, and tries to follow best practices, as I
understand them.

Features:

- [Neovim](https://neovim.io/) (targeting 0.10.x - the version Debian testing/unstable uses)
- [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- And more...

---

## Warning

This is a living setup. Things might break. Things might not make sense. I've
probably made a few mistakes.  There may be remnants of old configs, unused
plugins, or half-done ideas. If you're poking around, you're doing so at your
own risk.

I also have pinned some of the plugins to the latest release that works with my
version of neovim (v0.10.4).

---

## Goals

- Cleanly separated plugin specs and configuration
- Lazy-loaded everything where possible
- Minimal startup time
- Language-aware editing (Treesitter, LSP, DAP)
- A cohesive terminal + editing experience
- AI support (Using Avante currently)

---

## Setup

```
git clone <repo-url> <local-dest>
ln -s <local-dest> ~/.config/nvim
```

---

## Acknowledgements

Big shout out to [https://github.com/nvim-lua/kickstart.nvim](kickstart.nvim).

This configuration started out as a clone of their project.  But over time, it
has been modified to fit more closely to my needs.

If you want a working version of a config file that is up to date with the
latest versions of neovim, check out kickstart.nvim.

And of course, thanks to the neovim project itself, as well as the wonderful
community that has created plugins, provided support, and done so much.

## License

This configuration is licensed under the terms described in the
[LICENSE.md](./LICENSE.md) file.
