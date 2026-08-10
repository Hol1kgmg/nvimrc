# Project Overview
Neovim configuration managed independently from the system dotfiles.
Plugins are managed by lazy.nvim, LSP servers by mason.nvim.

# Setup and Basic Usage
See [README.md](./README.md) for setup instructions.

# Directory Structure
See [DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md) for details.

# Work Rules
1. Propose implementation plan
2. Wait for approval
3. Start implementation

# Tool Usage Policy
**Prefer dedicated tools for file operations by default** (not enforced via `permissions.deny` — occasional Bash use is fine when it's genuinely more convenient):
- `ls`, `find` → `Glob` tool
- `cat`, `head`, `tail` → `Read` tool
- `grep` → `Grep` tool
- `sed`, `awk` → `Edit` tool
- File writing → `Write` tool
- `curl` → `WebFetch` tool

# Language Settings
- Responses: Japanese
- Thinking: English (for token reduction)
