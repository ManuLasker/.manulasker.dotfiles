---
name: nvim-tutor
description: Tutor for Emanuel's specific Neovim configuration. Use this skill whenever the user asks how to do something in Neovim/nvim, asks about a keybinding, wants to navigate code, use a plugin, or understand any feature of their editor. Also trigger for questions like "how do I find a file", "what's the shortcut for X", "how do I use harpoon/fzf/LSP/CodeCompanion/fugitive/treesitter", "how do I debug in nvim", "how do I format code", "how do I jump to definition". Always use this skill for any nvim-related question — it knows the exact config.
version: 1.0.0
---

# Neovim Tutor — Emanuel's Config

This skill knows Emanuel's exact Neovim setup and answers questions about it with specific keybindings and workflows, not generic Neovim advice.

## Mental Model

- **Leader key**: `<Space>` — the root of almost every custom mapping
- **Config location**: `~/Documents/personal/.manulasker.dotfiles/nvim/.config/nvim/`
- **Plugin manager**: lazy.nvim (`:Lazy` to open UI)
- **Language servers**: managed by Mason (`:Mason` or `<leader>cm`)
- **Fuzzy finder**: fzf-lua (NOT Telescope)
- **AI assistant**: CodeCompanion (Claude primary, Copilot inline)

## Core Philosophy

This config is keyboard-first with no mouse, no system clipboard by default (use `<leader>y` explicitly), and no swap/backup files. Everything is oriented around speed: fast file switching via Harpoon, fast search via fzf-lua, and direct LSP integration without extra abstractions.

## The Most Common Operations (Quick Reference)

| What you want to do | Key |
|---|---|
| Open file explorer (netrw) | `<leader>pv` |
| Find any file | `<leader>pf` |
| Find git-tracked file | `<C-p>` |
| Live grep | `<leader>ps` |
| Search word under cursor | `<leader>pw` |
| Switch buffers | `<leader>pb` |
| Add file to harpoon | `<leader>ha` |
| Open harpoon menu | `<C-e>` |
| Jump to harpoon slot 1-4 | `<C-h>` `<C-j>` `<C-k>` `<C-l>` |
| Go to definition | `gd` |
| Hover docs | `K` |
| Code actions | `<leader>la` |
| Rename symbol | `<leader>lr` |
| Format file | `<leader>lf` |
| Toggle AI chat (CodeCompanion) | `<leader>ac` |
| Inline AI edit | `<leader>ai` |
| Toggle undotree | `<leader>u` |
| Git status (Fugitive) | `<leader>gS` |
| Toggle debugger UI | `<leader>Du` |
| Toggle breakpoint | `<leader>Db` |
| Open Mason | `<leader>cm` |

## Navigation & Motions

**Scrolling (always re-centers cursor):**
- `<C-d>` — half page down, centered
- `<C-u>` — half page up, centered
- `n` / `N` — next/prev search match, centered

**Search/Replace:**
- `<leader>s` — interactive replace for word under cursor (case-sensitive)
- `<leader>*` — replace all instances globally (no confirm)
- `<leader>&` — replace with confirm prompt

**Treesitter textobject motions** (works in normal, visual, and operator-pending modes):
- `]f` / `[f` — next/prev function start
- `]F` / `[F` — next/prev function end
- `]C` / `[C` — next/prev class

**Textobject selections** (use after `v`, `d`, `c`, `y`, etc.):
- `af` / `if` — around/inside function
- `ac` / `ic` — around/inside class
- `aa` / `ia` — around/inside parameter
- `ai` / `ii` — around/inside conditional
- `al` / `il` — around/inside loop

**Parameter swapping:**
- `<leader>na` — swap current parameter with next
- `<leader>pa` — swap current parameter with previous

## Clipboard & Registers

System clipboard is NOT automatic. To yank to system clipboard:
- `<leader>y` — yank selection (or current line in normal mode)
- `<leader>Y` — yank entire line to system clipboard
- `<leader>p` (in visual mode) — paste without losing current yank register
- `<leader>d` — delete without affecting yank register

## Windows & Buffers

**Buffer navigation:**
- `<S-l>` — next buffer
- `<S-h>` — prev buffer
- `<leader>bd` — delete current buffer

**Window resize mode** (press `<leader>r` then):
- `h` `j` `k` `l` — resize window
- `q` or `<Esc>` — exit resize mode

Splits open: horizontal → below, vertical → right.

## Quickfix & Location Lists

- `<leader>co` / `<leader>cc` — open/close quickfix
- `<leader>cn` / `<leader>cp` — next/prev quickfix item
- `<leader>Ln` / `<leader>Lp` — next/prev location list item

## Visual Mode Helpers

- `J` / `K` (in visual) — move selected lines down/up
- `<` / `>` — indent and reselect (stays in visual mode)

## Terminal Mode

- `<Esc><Esc>` (in terminal) — exit terminal mode back to normal

## Indentation Per Filetype

The config enforces specific indentation automatically:
- **2 spaces**: JS, TS, HTML, CSS, SCSS, JSON, YAML, TOML, Lua, Vue, Svelte, Ruby, Elixir
- **4 spaces**: Python, Java, Kotlin, C, C++, Rust, PHP, Swift
- **Tabs**: Go, Makefile

## Detailed References

For complete keymap tables and plugin-specific details, see:
- `references/keymaps.md` — full keymap reference by category
- `references/plugins.md` — plugin-by-plugin guide (fzf, harpoon, LSP, CodeCompanion, DAP, etc.)

When answering questions, always give the exact key from the config. If something isn't configured, say so explicitly rather than giving a generic nvim answer.
