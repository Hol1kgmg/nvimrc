# ディレクトリ構造

```
nvimrc/
├── init.lua                 # エントリーポイント
├── lua/
│   ├── lazy-setup.lua       # lazy.nvimプラグインマネージャ設定
│   ├── config/              # 基本設定
│   │   ├── options.lua      # Neovim基本オプション
│   │   ├── lsp.lua          # LSP共通設定
│   │   ├── keymaps/         # キーマップ設定（カテゴリ別）
│   │   │   ├── init.lua          # キーマップ統合
│   │   │   ├── basic.lua         # 基本操作（移動、保存など）
│   │   │   ├── editing.lua       # 編集操作（コメント、囲み操作など）
│   │   │   ├── window.lua        # ウィンドウ・タブ操作
│   │   │   ├── lsp.lua           # LSP操作（定義ジャンプ、リネームなど）
│   │   │   ├── finder.lua        # ファイル検索（Telescope）
│   │   │   ├── ai.lua            # AI統合（Claude Code）
│   │   │   └── info.lua          # 情報表示（diagnostics、git）
│   │   └── custom-command/  # カスタムコマンド
│   │       ├── init.lua          # コマンド統合
│   │       ├── health-check.lua  # プラグイン診断コマンド
│   │       ├── lsp-info.lua      # LSP情報表示コマンド
│   │       └── lsp-restart.lua   # LSP再起動コマンド
│   └── plugins/             # プラグイン設定
│       ├── mason.lua        # LSPサーバー管理（mason.nvim）
│       ├── colorscheme.lua  # カラースキーム
│       ├── ui.lua           # UI関連
│       ├── editor.lua       # 編集機能
│       ├── navigation.lua   # ナビゲーション
│       └── ai.lua           # AI統合（claude-code-nvim）
└── snippets/                # LuaSnipスニペット定義
    ├── lua.lua
    ├── nix.lua
    ├── python.lua
    ├── typescript.lua
    └── markdown.lua
```
