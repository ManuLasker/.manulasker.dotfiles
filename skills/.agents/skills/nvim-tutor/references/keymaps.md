# Complete Keymap Reference

Leader key = `<Space>`

---

## File Navigation

| Key | Action |
|---|---|
| `<leader>pv` | Open netrw file explorer |
| `<leader>pf` | Find files (all, including untracked) |
| `<leader>pF` | Find files including hidden |
| `<C-p>` | Find git-tracked files only |
| `<leader>ps` | Live grep (search file contents) |
| `<leader>pw` | Grep current word under cursor |
| `<leader>pW` | Grep current WORD (broader match) |
| `<leader>pb` | List and switch buffers |
| `<leader>po` | Recent/old files |
| `<leader>pl` | Search lines in open buffers |
| `<leader>pr` | Resume last fzf search |

## Harpoon (Quick File Bookmarks)

| Key | Action |
|---|---|
| `<leader>ha` | Add current file to harpoon list |
| `<C-e>` | Toggle harpoon quick menu |
| `<C-h>` | Jump to harpoon slot 1 |
| `<C-j>` | Jump to harpoon slot 2 |
| `<C-k>` | Jump to harpoon slot 3 |
| `<C-l>` | Jump to harpoon slot 4 |
| `<leader>hP` | Previous harpoon file |
| `<leader>hN` | Next harpoon file |

Harpoon marks are per-project (saved to project root).

## Buffer & Window Management

| Key | Action |
|---|---|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>bd` | Delete/close current buffer |
| `<leader>r` | Enter resize mode (then h/j/k/l, q to exit) |

## LSP (Language Server)

These are available when a language server is attached.

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `gt` | Go to type definition |
| `K` | Show hover documentation |
| `<leader>lk` | Show signature help |
| `<leader>la` | Code actions |
| `<leader>lr` | Rename symbol |
| `<leader>lf` | Format document |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>ld` | Show diagnostic in float |
| `<leader>lq` | Load diagnostics into location list |
| `<leader>lwa` | Add workspace folder |
| `<leader>lwr` | Remove workspace folder |
| `<leader>lwl` | List workspace folders |
| `<leader>cm` | Open Mason (manage language servers) |

## Diagnostics & Search

| Key | Action |
|---|---|
| `<leader>pd` | Show all project diagnostics (fzf) |
| `<leader>ph` | Search help tags |
| `<leader>pk` | Search keymaps |
| `<leader>pc` | Search commands |
| `<leader>p:` | Command history |
| `<leader>p/` | Search history |

## Git (fzf-lua + Fugitive)

| Key | Action |
|---|---|
| `<leader>gS` | Open Fugitive git status |
| `<leader>gB` | Git blame current file |
| `<leader>gL` | Git log |
| `<leader>gc` | Browse git commits (fzf) |
| `<leader>gb` | Browse commits for current buffer (fzf) |

**In Fugitive status buffer:**
| Key | Action |
|---|---|
| `<leader>p` | Push |
| `<leader>P` | Pull with rebase |
| `<leader>t` | Push -u origin (set upstream) |

## Treesitter Textobjects

**Motion** (jump to next/prev):
| Key | Action |
|---|---|
| `]f` | Next function start |
| `[f` | Previous function start |
| `]F` | Next function end |
| `[F` | Previous function end |
| `]C` | Next class start |
| `[C` | Previous class start |

**Selection** (visual/operator mode — use with `v`, `d`, `c`, `y`):
| Key | Selects |
|---|---|
| `af` / `if` | Around/inside function |
| `ac` / `ic` | Around/inside class |
| `aa` / `ia` | Around/inside parameter/argument |
| `ai` / `ii` | Around/inside conditional |
| `al` / `il` | Around/inside loop |

**Swap parameters:**
| Key | Action |
|---|---|
| `<leader>na` | Swap current parameter with next |
| `<leader>pa` | Swap current parameter with previous |

## Debugger (nvim-dap)

| Key | Action |
|---|---|
| `<leader>Db` | Toggle breakpoint |
| `<leader>Dc` | Continue / start debugging |
| `<leader>Di` | Step into |
| `<leader>Do` | Step over |
| `<leader>DO` | Step out |
| `<leader>Dr` | Open debug REPL |
| `<leader>Du` | Toggle debugger UI |
| `<leader>Dt` | Terminate debug session |

The DAP UI opens/closes automatically with sessions.

## Undotree

| Key | Action |
|---|---|
| `<leader>u` | Toggle undotree panel |

Undo history persists across sessions (saved to `~/.vim/undodir`).

## CodeCompanion (AI Assistant)

| Key | Action |
|---|---|
| `<leader>ac` | Toggle AI chat window |
| `<leader>aa` | Open new AI chat |
| `<leader>ai` | Inline AI edit (visual selection or current line) |
| `<leader>ap` | Open actions palette |

**Custom slash commands in chat:**
- `/pattern` — design pattern suggestions
- `/arch` — architecture review (SOLID)
- `/explain` — explain selected code
- `/debug` — debugging advisor

## Completion (nvim-cmp)

| Key | Action |
|---|---|
| `<C-k>` / `<C-j>` | Previous/next completion item |
| `<C-b>` / `<C-f>` | Scroll docs up/down |
| `<CR>` | Confirm selection |
| `<C-y>` | Confirm and select |
| `<C-Space>` | Trigger completion manually |
| `<C-e>` | Abort completion |
| `<Tab>` / `<S-Tab>` | Cycle through items |

Completion priority: Copilot (1100) > LSP (1000) > Buffer (500) > Path (250)

## Quickfix & Location Lists

| Key | Action |
|---|---|
| `<leader>co` | Open quickfix list |
| `<leader>cc` | Close quickfix list |
| `<leader>cn` | Next quickfix item |
| `<leader>cp` | Previous quickfix item |
| `<leader>Ln` | Next location list item |
| `<leader>Lp` | Previous location list item |

## Search & Replace

| Key | Action |
|---|---|
| `<leader>s` | Replace word under cursor (interactive, case-sensitive) |
| `<leader>*` | Replace word under cursor everywhere (no confirm) |
| `<leader>&` | Replace word under cursor (with confirm prompt) |
| `<Esc>` | Clear search highlight |
| `n` / `N` | Next/prev match (re-centers screen) |

## Clipboard & Registers

| Key | Action |
|---|---|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank entire line to system clipboard |
| `<leader>p` (visual) | Paste without overwriting yank register |
| `<leader>d` | Delete without affecting yank register |

## Visual Mode

| Key | Action |
|---|---|
| `J` | Move selection down |
| `K` | Move selection up |
| `<` | Indent left (stays in visual) |
| `>` | Indent right (stays in visual) |

## Misc

| Key | Action |
|---|---|
| `J` (normal) | Join lines without moving cursor |
| `<C-d>` | Half page down (centered) |
| `<C-u>` | Half page up (centered) |
| `<C-c>` (insert) | Escape (safe alternative to Esc) |
| `Q` | Disabled (Ex mode removed) |
| `<leader>x` | chmod +x current file |
| `<leader>r` | Window resize mode |

## Java-Specific (jdtls)

| Key | Action |
|---|---|
| `<leader>jo` | Organize imports |
| `<leader>jv` | Extract variable |
| `<leader>jc` | Extract constant |
| `<leader>jm` (visual) | Extract method |
| `<leader>jtm` | Run nearest test method |
| `<leader>jtc` | Run test class |
