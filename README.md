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

# Directory Structure

See [DIRECTORY_STRUCTURE.md](./DIRECTORY_STRUCTURE.md) for details.

# Configuration Policy

- **モジュール分割**: 機能ごとにファイルを分割し、保守性を向上
- **カテゴリ別キーマップ**: 操作種別ごとにキーマップを整理
- **プラグイン設定の分離**: UI、エディタ、ナビゲーション、AIなど用途別に分類
- **カスタムコマンド**: 診断やLSP管理のための独自コマンドを実装
