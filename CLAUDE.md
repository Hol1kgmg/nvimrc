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
**Always use dedicated tools for file operations:**
- File reading → `Read` tool
- File search → `Glob` tool
- Content search → `Grep` tool
- File editing → `Edit` tool
- File writing → `Write` tool

# Language Settings
- Responses: Japanese
- Thinking: English (for token reduction)
