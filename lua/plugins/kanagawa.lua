-- カラースキーム
return {
  "rebelot/kanagawa.nvim",
  priority = 1000, -- カラースキームは最優先で読み込む
  config = function()
    require("kanagawa").setup({
      compile = false, -- コンパイル機能を無効化（高速化）
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false, -- 非アクティブウィンドウを暗くしない
      terminalColors = true,
      colors = {},
      overrides = function(_colors)
        return {}
      end,
    })
    -- カラースキームを適用
    vim.cmd.colorscheme("kanagawa-wave")
  end,
}
