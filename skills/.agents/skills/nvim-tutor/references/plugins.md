# Plugin Details & Workflows

---

## fzf-lua (Fuzzy Finder)

fzf-lua replaces Telescope. It uses a C/Go backend for faster filtering.

**Finding files:**
- `<leader>pf` — all files (untracked included)
- `<leader>pF` — all files + hidden dotfiles
- `<C-p>` — only git-tracked files (fastest for project navigation)

**Searching content:**
- `<leader>ps` — live grep across project
- `<leader>pw` — grep exact word under cursor
- `<leader>pW` — grep WORD (whitespace-delimited)

**In fzf popup:**
- `<Enter>` — open
- `<C-v>` — open in vertical split
- `<C-x>` — open in horizontal split
- `<C-t>` — open in new tab
- Preview is on the right side (60% backdrop, 85% window size)

---

## Harpoon (File Bookmarks)

Harpoon keeps a short per-project list of "pinned" files you switch between constantly. Think of slots 1-4 as bookmarks you set once and jump to dozens of times.

**Workflow:**
1. Open a file you'll use heavily
2. `<leader>ha` — add it to harpoon
3. `<C-e>` — see/reorder the list
4. `<C-h>/<C-j>/<C-k>/<C-l>` — instant jump to slots 1/2/3/4

The list is saved per project root. Reorder in the harpoon menu by moving lines.

**When to use harpoon vs fzf:**
- fzf (`<C-p>`) — to find/open a file you don't visit often
- Harpoon slots — for the 3-4 files you're actively editing

---

## LSP (Language Servers via nvim-lspconfig + Mason)

**Installed language servers** (auto-configured by mason-lspconfig):
- JavaScript/TypeScript: `ts_ls` (with inlay hints)
- Python: `pyright` + `ruff`
- Go: `gopls` (with staticcheck, gofumpt, all hints)
- Rust: `rust_analyzer`
- C/C++: `clangd` (with background indexing, clang-tidy)
- Java: `jdtls` (separate plugin, Java 25 from SDKMAN, Lombok)
- Lua: `lua_ls` (nvim config aware)
- HTML/CSS: `html`, `cssls`, `tailwindcss`, `emmet_ls`
- YAML: `yamlls` (GitHub Actions + docker-compose schemas)
- Bash: `bashls`
- JSON: `jsonls`
- TOML: `taplo`
- Markdown: `marksman`
- Docker: `dockerls`, `docker_compose_language_service`

**Key LSP workflows:**

*Go to definition and back:*
- `gd` — jump to definition
- `<C-o>` — jump back (standard nvim jump list)

*Find all usages:*
- `gr` — show references in fzf

*Rename a symbol across the project:*
- `<leader>lr` — rename (fills in current name, type new one, Enter)

*Format on demand:*
- `<leader>lf` — format current file via LSP

*Diagnostics:*
- `[d` / `]d` — navigate between errors/warnings
- `<leader>ld` — float with full diagnostic message
- `<leader>pd` — see all diagnostics in fzf

---

## nvim-cmp (Autocompletion)

Completion sources in priority order: **Copilot** → **LSP** → **Buffer** → **Path**

Labels in the menu:
- `[COPILOT]` — GitHub Copilot suggestion
- `[LSP]` — from language server
- `[Buffer]` — from open buffers
- `[Path]` — file paths

Ghost text from Copilot is disabled (Copilot integrates via nvim-cmp instead). To accept a Copilot suggestion, use `<C-y>` or `<CR>` when it's selected in the cmp menu.

---

## CodeCompanion (AI Assistant)

Primary adapter is **Claude** (claude_code). Inline completions use **Copilot**.

**Chat workflow:**
1. `<leader>ac` — open/toggle chat panel
2. Type naturally; CodeCompanion knows the project via CLAUDE.md and VectorCode
3. Visually select code first, then `<leader>ac` to include it in context

**Inline edit workflow:**
1. Visually select code (or just position cursor)
2. `<leader>ai` — describe the change you want
3. Review and accept/reject the diff

**Slash commands in chat:**
- `/pattern` — "what design pattern fits this code?"
- `/arch` — SOLID principles review
- `/explain` — detailed code explanation
- `/debug` — debugging advisor

**Context sources** (loaded automatically):
- `CLAUDE.md` in project root
- `~/.claude/CLAUDE.md` (global rules)
- VectorCode index (codebase semantic search)
- Chat history (10 days, auto-loaded)

**Actions palette** (`<leader>ap`): quick access to all CodeCompanion actions without the chat interface.

---

## Fugitive (Git)

| Workflow | Steps |
|---|---|
| Review changes | `<leader>gS` → use `=` to inline diff, `s`/`u` to stage/unstage |
| Commit | `<leader>gS` → stage hunks → `:G commit` |
| Push | In status buffer: `<leader>p` |
| Blame a file | `<leader>gB` |
| View log | `<leader>gL` |
| Browse commits in fzf | `<leader>gc` |

In Fugitive status, common actions:
- `s` — stage file/hunk
- `u` — unstage
- `=` — toggle inline diff
- `dv` — diff split (vertical)
- `cc` — create commit
- `ca` — amend commit
- `q` — close

---

## nvim-dap (Debugger)

**Starting a debug session:**
1. Set breakpoints: `<leader>Db` on the lines you care about
2. `<leader>Dc` — start/continue (picks the right config for the filetype)
3. UI opens automatically

**During a session:**
- `<leader>Di` — step into function call
- `<leader>Do` — step over (next line)
- `<leader>DO` — step out of current function
- `<leader>Dr` — open REPL to inspect variables
- `<leader>Du` — toggle the UI manually
- `<leader>Dt` — stop/terminate session

**Java debugging:** Configured via jdtls. Use `<leader>jtm` / `<leader>jtc` to run/debug tests.

---

## Undotree

`<leader>u` — opens a panel on the right showing the full undo history as a tree (not a linear list). This lets you navigate to any past state, even after undoing and making different changes.

Undo history persists across sessions (stored in `~/.vim/undodir`).

---

## Treesitter

Syntax highlighting, folding (disabled by default), and textobjects all come from Treesitter. Parsers are auto-installed for: JS/TS, HTML, CSS, JSON, YAML, Python, Java, Go, Rust, C/C++, Lua, Bash, Markdown, Dockerfile, SQL.

Folding is available but you need to enable it manually:
```
:set foldmethod=expr
:set foldexpr=nvim_treesitter#foldexpr()
```

---

## Lualine (Status Bar)

The status bar shows (left to right):
- Mode → Branch + git diff → Filename + diagnostics
- Encoding → File format → Filetype → Progress → Cursor position

One statusline shared across all splits (not per-window).

---

## Catppuccin (Theme)

Flavor: **Mocha** (darkest variant), transparent background.
Comments and conditionals are italic.

To switch flavors temporarily: `:colorscheme catppuccin-latte` (or `frappe`, `macchiato`, `mocha`).

---

## Mason (Package Manager for LSP/DAP/Linters)

- `<leader>cm` — open Mason UI
- Inside Mason: `i` to install, `X` to uninstall, `u` to update
- Mason manages: LSP servers, DAP adapters, linters, formatters

---

## VectorCode (Codebase Indexing)

VectorCode provides semantic search of your codebase and is used by CodeCompanion for context. Requires `uv tool install vectorcode` CLI.

To index a project: run `vectorcode vectorize` in the project root from the terminal. After indexing, CodeCompanion automatically has broader codebase awareness.
