# ============================================================
# Makefile for .manulasker.dotfiles
# Uses GNU Stow to symlink configs into $HOME
# ============================================================

DOTFILES_DIR := $(HOME)/Documents/personal/.manulasker.dotfiles
STOW_FLAGS   := --dir=$(DOTFILES_DIR) --target=$(HOME) --verbose
BACKUP_DIR   := $(HOME)/.dotfiles-backups

# ============================================================
# List of packages — ONLY ADD HERE when you have a new one
# ============================================================
# Remove all sway, mako, swappy, waybar, xdg-desktop-portal for now
# Just install bash, alacritty, tmux, nvim
PACKAGES := bash alacritty tmux nvim skills

# ============================================================
.PHONY: all help stow unstow force stow-all unstow-all force-all \
        $(PACKAGES) $(addprefix unstow-,$(PACKAGES)) $(addprefix force-,$(PACKAGES)) \
        list-backups clean-backups
# ============================================================

all: help

# ============================================================
# help
# ============================================================
help:
	@echo ""
	@echo "========================================"
	@echo "  .manulasker.dotfiles"
	@echo "========================================"
	@echo ""
	@echo "By package name:"
	@$(foreach pkg,$(PACKAGES), \
		echo "  make $(pkg)          → stow $(pkg)"; \
		echo "  make unstow-$(pkg)   → unstow $(pkg)"; \
		echo "  make force-$(pkg)    → force replace $(pkg) (backup created)"; \
	)
	@echo ""
	@echo "By argument:"
	@echo "  make stow   pkg=<name>  → stow any package"
	@echo "  make unstow pkg=<name>  → unstow any package"
	@echo "  make force  pkg=<name>  → force replace any package (backup created)"
	@echo ""
	@echo "Bulk:"
	@echo "  make stow-all           → stow all packages"
	@echo "  make unstow-all         → unstow all packages"
	@echo "  make force-all          → force replace all packages"
	@echo ""
	@echo "Backups:"
	@echo "  make list-backups       → list all backups"
	@echo "  make clean-backups      → delete all backups"
	@echo ""
	@echo "Backups location: $(BACKUP_DIR)"
	@echo "Packages: $(PACKAGES)"
	@echo ""

# ============================================================
# _validate: internal — checks pkg argument is set
# ============================================================
_validate:
	@[ "$(pkg)" ] || { echo "❌ Error: specify a package with pkg=<name>"; \
		echo "   Available: $(PACKAGES)"; exit 1; }

# ============================================================
# _backup_and_remove: internal
# Backs up real files (not symlinks) before removing them
# Backup path: ~/.dotfiles-backups/<pkg>/<timestamp>/<original_path>
# This represents the state of your HOME before dotfiles were installed
# ============================================================
_backup_and_remove:
	@TIMESTAMP=$$(date +%Y%m%d_%H%M%S); \
	BACKUP_PATH=$(BACKUP_DIR)/$(pkg)/$$TIMESTAMP; \
	BACKED_UP=0; \
	find $(DOTFILES_DIR)/$(pkg) -type f | while read src; do \
		dest="$(HOME)/$${src#$(DOTFILES_DIR)/$(pkg)/}"; \
		if [ -f "$$dest" ] && [ ! -L "$$dest" ]; then \
			backup_dest="$$BACKUP_PATH/$${dest#$(HOME)/}"; \
			mkdir -p "$$(dirname $$backup_dest)"; \
			cp "$$dest" "$$backup_dest"; \
			echo "  📦 backed up: $$dest"; \
			echo "       → $$backup_dest"; \
			rm "$$dest"; \
			BACKED_UP=1; \
		fi; \
	done; \
	if [ "$$BACKED_UP" = "0" ]; then \
		echo "  ℹ No real files found to backup."; \
	fi

# ============================================================
# stow: symlink package into $HOME
# Usage: make stow pkg=sway
# ============================================================
stow: _validate
	@echo "→ Stowing $(pkg)..."
	@stow $(STOW_FLAGS) --restow $(pkg)
	@echo "✓ Done. $(pkg) is now symlinked."

# ============================================================
# unstow: remove symlinks from $HOME
# Usage: make unstow pkg=sway
# ============================================================
unstow: _validate
	@echo "→ Unstowing $(pkg)..."
	@stow $(STOW_FLAGS) --delete $(pkg)
	@echo "✓ Done. $(pkg) symlinks removed."

# ============================================================
# force: backup real files to HOME, then re-stow
# Usage: make force pkg=sway
# ============================================================
force: _validate _backup_and_remove
	@echo "→ Force stowing $(pkg)..."
	@stow $(STOW_FLAGS) --delete $(pkg) 2>/dev/null || true
	@stow $(STOW_FLAGS) --restow $(pkg)
	@echo "✓ Done. $(pkg) force stowed."

# ============================================================
# Pattern rules — by package name
# ============================================================
$(PACKAGES):
	@$(MAKE) stow pkg=$@

$(addprefix unstow-,$(PACKAGES)):
	@$(MAKE) unstow pkg=$(subst unstow-,,$@)

$(addprefix force-,$(PACKAGES)):
	@$(MAKE) force pkg=$(subst force-,,$@)

# ============================================================
# Bulk targets
# ============================================================
stow-all: $(PACKAGES)
	@echo "✓ All packages stowed."

unstow-all: $(addprefix unstow-,$(PACKAGES))
	@echo "✓ All packages unstowed."

force-all: $(addprefix force-,$(PACKAGES))
	@echo "✓ All packages force stowed."

# ============================================================
# Backup management
# ============================================================
list-backups:
	@echo ""
	@echo "📦 Backups in $(BACKUP_DIR):"
	@echo ""
	@if [ -d "$(BACKUP_DIR)" ]; then \
		find $(BACKUP_DIR) -type f | sort | while read f; do \
			echo "  $$f"; \
		done; \
	else \
		echo "  No backups found."; \
	fi
	@echo ""

clean-backups:
	@echo "→ Cleaning all backups in $(BACKUP_DIR)..."
	@rm -rf $(BACKUP_DIR)
	@echo "✓ Done. All backups removed."
