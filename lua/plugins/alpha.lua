-- ダッシュボード
-- Docs: https://github.com/goolord/alpha-nvim
return {
  "goolord/alpha-nvim",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ASCIIアート読み込み
    local ascii_art_path = vim.fn.stdpath("config") .. "/AA-dashboard.txt"
    if vim.fn.filereadable(ascii_art_path) == 1 then
      dashboard.section.header.val = vim.fn.readfile(ascii_art_path)
    else
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
    end

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼  Find file", ":lua require('fff').find_files()<CR>"),
      dashboard.button("n", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󰋚  Recent files", ":lua Snacks.picker.recent()<CR>"),
      dashboard.button("g", "󱎸  Find text", ":lua Snacks.picker.grep()<CR>"),
      dashboard.button("c", "󱁻  Configuration", ":lua require('oil').open_float(vim.fn.stdpath('config'))<CR>"),
      dashboard.button("u", "󰚰  Update plugins", ":Lazy sync <CR>"),
      dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
    }

    local augroup = vim.api.nvim_create_augroup("AlphaConfig", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "alpha",
      callback = function()
        vim.opt_local.showtabline = 0
        vim.schedule(function()
          require("mini.clue").ensure_buf_triggers()
        end)
      end,
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
      group = augroup,
      callback = function()
        if vim.bo.filetype ~= "alpha" then
          vim.opt.showtabline = 2
        end
      end,
    })

    -- 空の無名バッファに入った瞬間にダッシュボードへ切り替える
    -- （Lazy同期後・最後バッファ削除後など、あらゆるケースで「*」バッファの代わりに表示）
    vim.api.nvim_create_autocmd("BufEnter", {
      group = augroup,
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.fn.expand("%") == ""
          and vim.bo.buftype == ""
          and vim.bo.modified == false
          and vim.fn.line("$") == 1
          and vim.fn.getline(1) == ""
        then
          require("alpha").start(false)
          -- alpha描画完了後に空バッファを削除（先に削除するとalphaと競合する）
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype ~= "alpha" then
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end)
        end
      end,
    })

    local function footer()
      local total_plugins = require("lazy").stats().count
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local version = vim.version()
      local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
    end

    dashboard.section.footer.val = footer()
    dashboard.section.header.opts.hl = "Type"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.section.footer.opts.hl = "Comment"

    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
