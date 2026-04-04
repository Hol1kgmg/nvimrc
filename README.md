# nvimrc
nvim-dotfiles

# Prerequisites

- neovim, ripgrep, fd, tree-sitter（nixpkgs または Homebrew でインストール）
- nixd（Nix LSP、nixpkgs でインストール）

# Set up

```
cd ~/.config
git clone https://github.com/Hol1kgmg/nvimrc.git nvim
```

初回起動時に lazy.nvim がプラグインを自動インストールし、続けて mason が LSP サーバーを自動インストールします。
