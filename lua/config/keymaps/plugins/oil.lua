-- oil.nvim バッファ内キーマップ
-- plugins/oil.lua から参照される

local M = {}

-- oil.setup({ keymaps = ... }) に渡すテーブル
M.keymaps = {
  ["g?"] = { "actions.show_help", mode = "n" },
  ["."] = { "actions.toggle_hidden", mode = "n" },
  ["L"] = { "actions.select", mode = "n" },
  ["H"] = { "actions.parent", mode = "n" },
  ["<Tab>"] = { "actions.select", mode = "n" },
  ["<S-Tab>"] = { "actions.parent", mode = "n" },
  ["<C-t>"] = { "actions.select", opts = { tab = true } },
  ["<C-p>"] = { "actions.preview", mode = "n" },
  ["q"] = { "actions.close", mode = "n" },
  ["<C-r>"] = "actions.refresh",
  ["pwd"] = { "actions.open_cwd", mode = "n" },
  ["cd"] = { "actions.cd", mode = "n" },
  ["tcd"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
}

-- バッファ固有のキーマップ設定（autocmd用）
M.setup_buffer_keymaps = function(bufnr)
  vim.keymap.set("n", "J", "10j", { buffer = bufnr, desc = "10j 移動" })
  vim.keymap.set("n", "K", "10k", { buffer = bufnr, desc = "10k 移動" })

  -- カーソル下のエントリのパスをコピー（oilバッファは仮想パスのため専用実装が必要）
  vim.keymap.set("n", "<leader>y", function()
    local oil = require("oil")
    local entry = oil.get_cursor_entry()
    if not entry then
      vim.notify("No entry under cursor", vim.log.levels.WARN)
      return
    end
    local dir = oil.get_current_dir(bufnr)
    if not dir then
      vim.notify("Not a local directory", vim.log.levels.WARN)
      return
    end
    local file_path = dir .. entry.name
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]
    local relative_path
    if git_root and vim.v.shell_error == 0 then
      relative_path = file_path:sub(#git_root + 2) -- +2 は "/" の分
    else
      relative_path = file_path
    end
    vim.fn.setreg("+", relative_path)
    vim.notify("Copy: " .. relative_path)
  end, { buffer = bufnr, desc = "copy file path", silent = true })
end

return M
